package model.DAO;

import controller.security.PasswordUtils;
import model.DTO.User;

import java.sql.*;
import java.util.ArrayList;


public class UserDAO {

    private int count=0;
    private Connection connection;
    private ArrayList<User> records=new ArrayList<User>();

    public UserDAO(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection= DriverManager.getConnection("jdbc:mysql://localhost/reservation?useUnicode=true&characterEncoding=UTF-8","root","");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void insert(User users){
        try {
            PreparedStatement statement=connection.prepareStatement

                    ("INSERT INTO " +
                            "users (name,lastname,email,password,salt)" +
                            "  VALUES (?,?,?,?,?)");

            statement.setString(1,users.getName());
            statement.setString(2,users.getLastname());
            statement.setString(3,users.getEmail());
            statement.setString(4,users.getPassword());
            statement.setString(5,users.getSalt());
            statement.execute();
        } catch (SQLException e) {
            System.out.println("not inserted");
            e.printStackTrace();
        }
    }

    public void update(User user){
        try {
            PreparedStatement statement=connection.prepareStatement
                    ("UPDATE users SET name=?,lastname=?,email=?,image_path=?,filename=?,bio=? WHERE uid = ?");
            statement.setString(1,user.getName());
            statement.setString(2,user.getLastname());
            statement.setString(3,user.getEmail());
            statement.setString(4,user.getImagePath());
            statement.setString(5,user.getImageName());
            statement.setString(6,user.getBio());
            statement.setInt(7,user.getId());
            statement.execute();
        } catch (SQLException e) {
            System.out.println("couldn't update!!!");
            e.printStackTrace();
        }
    }


    public boolean emailExists(String email){
        try {
            PreparedStatement statement=connection.prepareStatement("SELECT * FROM users WHERE email=?");
            statement.setString(1,email);
            ResultSet set=statement.executeQuery();
            if (set.next()){
                return true;
            }
        } catch (SQLException e) {
            System.out.println("could not select");
        }
        return false;
    }

    public boolean loginCheck(String email,String userPass){
        try {
            PreparedStatement statement=connection.prepareStatement("SELECT * FROM users WHERE email=?");
            statement.setString(1,email);
            ResultSet set=statement.executeQuery();
            if (set.next()){
                String password = set.getString("password");
                String salt = set.getString("salt");
                boolean passwordMatch = PasswordUtils.verifyUserPassword(userPass, password, salt);

                if(passwordMatch)
                {
                    return true;
                }
            }
        } catch (SQLException e) {
            System.out.println("could not select");
        }
        return false;
    }

    public int getCustomerId(String email){
        int id=0;
        try {
            PreparedStatement statement=connection.prepareStatement("SELECT uid FROM users WHERE email=?");
            statement.setString(1,email);
            ResultSet set=statement.executeQuery();
            if (set.next()){
                id = set.getInt("uid");
            }
        } catch (SQLException e) {
            System.out.println("could not select");
        }
        return id;
    }

    public User getUserById(int id){
        User users=new User();
        try {
            PreparedStatement statement=connection.prepareStatement("SELECT * FROM users WHERE UID=?");
            statement.setInt(1,id);
            ResultSet set=statement.executeQuery();
            if (set.next()){
                users.setId(set.getInt("uid"));
                users.setName(set.getString("name"));
                users.setLastname(set.getString("lastname"));
                users.setEmail(set.getString("email"));
                users.setImageName(set.getString("filename"));
                users.setBio(set.getString("bio"));
            }
            System.out.println(count);
        } catch (SQLException e) {
            System.out.println("could not select");
        }
        return users;
    }

    public ArrayList<User> getRecords(){
        try {
            PreparedStatement statement=connection.prepareStatement("SELECT * FROM users");
            ResultSet set=statement.executeQuery();
            while (set.next()){
                User users=new User();
                count++;
                users.setName(set.getString("name"));
                users.setLastname(set.getString("lastname"));
                users.setEmail(set.getString("email"));
                records.add(users);
            }
            System.out.println(count);
        } catch (SQLException e) {
            System.out.println("could not select");
        }
        return records;
    }
    public int calculateFollowers(int uid){
        int followers=0;
        try{
            PreparedStatement statement=connection.prepareStatement("select COUNT(uid2) AS followers from followu where uid2=?");
            statement.setInt(1,uid);
            ResultSet set=statement.executeQuery();
            if (set.next()){
                followers = set.getInt("followers");
            }

        }catch (SQLException e){
            e.printStackTrace();
        }
        return followers;
    }
    public int calculateFollowing(int uid){
        int following=0;
        try{
            PreparedStatement statement=connection.prepareStatement("select COUNT(uid1) AS following from followu where uid1=?");
            statement.setInt(1,uid);
            ResultSet set=statement.executeQuery();
            if (set.next()){
                following = set.getInt("following");
            }

        }catch (SQLException e){
            e.printStackTrace();
        }
        return following;
    }
    public ArrayList<User> getFollowers(int uid){
        ArrayList<User> followers=new ArrayList<User>();
        try{
            PreparedStatement statement=connection.prepareStatement("select * from followu where uid2=?");
            statement.setInt(1,uid);
            ResultSet set=statement.executeQuery();
            while (set.next()){
                User user=getUserById(set.getInt("uid1") );
                followers.add(user);
            }

        }catch (SQLException e){
            e.printStackTrace();
        }
        return followers;
    }
    public ArrayList<User> getFollowing(int uid){
        ArrayList<User> following=new ArrayList<User>();
        try{
            PreparedStatement statement=connection.prepareStatement("select * from followu where uid1=?");
            statement.setInt(1,uid);
            ResultSet set=statement.executeQuery();
            while (set.next()){
                User user=getUserById(set.getInt("uid2") );
                following.add(user);
            }

        }catch (SQLException e){
            e.printStackTrace();
        }
        return following;
    }
    public boolean isFollowing(int id,int uid){
        boolean is=false;
        try{PreparedStatement statement=connection.prepareStatement("SELECT * FROM followu WHERE uid1 = ? and uid2=?");
            statement.setInt(1,uid);
            statement.setInt(2,id);
            ResultSet set=statement.executeQuery();
            if(set.next()){
                is=true;
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return is;
    }
    public void follow(int uid, int id){
        try {
            PreparedStatement statement=connection.prepareStatement
                    ("INSERT INTO followu (uid1, uid2)  VALUES (?,?)");
            statement.setInt(1,uid);
            statement.setInt(2,id);
            statement.execute();
        } catch (SQLException e) {
            System.out.println("not inserted");
            e.printStackTrace();
        }
    }
    public void unfollow(int uid, int id){
        try {
            PreparedStatement statement=connection.prepareStatement
                    ("DELETE FROM followu WHERE uid1=? and uid2=?");
            statement.setInt(1,uid);
            statement.setInt(2,id);
            statement.execute();
        } catch (SQLException e) {
            System.out.println("not inserted");
            e.printStackTrace();
        }
    }
    public ArrayList<User> nameSearch(String name){
        ArrayList<User> users=new ArrayList<User>();
        try {
            PreparedStatement statement=connection.prepareStatement("SELECT * FROM users WHERE name LIKE ? or lastname LIKE ?");
            statement.setString(1,"%"+name+"%");
            statement.setString(2,"%"+name+"%");
            ResultSet set=statement.executeQuery();
            while (set.next()){
                User user = new User();
                user.setId(set.getInt("uid"));
                user.setName(set.getString("name"));
                user.setLastname(set.getString("lastname"));
                user.setBio(set.getString("bio"));
                user.setEmail(set.getString("email"));
                user.setImagePath(set.getString("image_path"));
                user.setImageName(set.getString("filename"));
                user.setPassword(set.getString("password"));
                user.setSalt(set.getString("salt"));
                users.add(user);
                int i=0;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }
}