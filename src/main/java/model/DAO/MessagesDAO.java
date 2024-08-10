package model.DAO;

import model.DTO.Message;

import java.sql.*;
import java.util.ArrayList;

/**
 * Created by nazanin on 5/17/2019.
 */
public class MessagesDAO {
    private Connection connection;
    private ArrayList<Message> records=new ArrayList<>();

    public MessagesDAO(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection= DriverManager.getConnection("jdbc:mysql://localhost/reservation?useUnicode=true&characterEncoding=UTF-8","root","");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void insertMessage(Message message){
        try {
            PreparedStatement statement=connection.prepareStatement
                    ("INSERT INTO messages (author,body,sub,date,is_read) VALUES (?,?,?,?,?)");
            statement.setString(1,message.getAuthor());
            statement.setString(2,message.getBody());
            statement.setString(3,message.getSubject());
            statement.setString(4,message.getDate());
            statement.setInt(5,message.isRead()?1:0);
            statement.execute();
        } catch (SQLException e) {
            System.out.println("not inserted");
            e.printStackTrace();
        }
    }
    public ArrayList<Message> selectInbox(String email){
        try {
            PreparedStatement statement=connection.prepareStatement("SELECT * FROM messages WHERE author<>?");
            statement.setString(1,email);
            ResultSet set=statement.executeQuery();
            while (set.next()){
                Message message = new Message();
                message.setId(set.getInt("id"));
                message.setAuthor(set.getString("author"));
                message.setBody(set.getString("body"));
                message.setSubject(set.getString("sub"));
                message.setDate(set.getString("date"));
                message.setRead(set.getInt("is_read")==1?true:false);
                records.add(message);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return records;
    }

    public Message getMessage(int id){
        Message message = new Message();
        try {
            PreparedStatement statement=connection.prepareStatement("SELECT * FROM messages WHERE id=?");
            statement.setInt(1,id);
            ResultSet set=statement.executeQuery();
            if (set.next()){
                message.setAuthor(set.getString("author"));
                message.setBody(set.getString("body"));
                message.setSubject(set.getString("sub"));
                message.setDate(set.getString("date"));
                message.setRead(set.getInt("is_read")==1?true:false);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return message;
    }
//    public ArrayList<Message> selectSent(String email){
//        try {
//            PreparedStatement statement=connection.prepareStatement("SELECT * FROM messages WHERE author=?");
//            statement.setString(1,email);
//            ResultSet set=statement.executeQuery();
//            while (set.next()){
//                MenuItem menuItem = new MenuItem();
//                menuItem.setId(set.getInt("id"));
//                menuItem.setName(set.getString("name"));
//                menuItem.setCafe_id(set.getInt("cafe_id"));
//                menuItem.setIngredients(set.getString("ingredients"));
//                menuItem.setPrice(set.getString("price"));
//                records.add(menuItem);
//            }
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//        return records;
//    }
}
