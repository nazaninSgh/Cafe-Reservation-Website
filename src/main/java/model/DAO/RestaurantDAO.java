package model.DAO;

import model.DTO.Restaurant;

import java.sql.*;
import java.util.ArrayList;

/**
 * Created by nazanin on 3/30/2019.
 */
public class RestaurantDAO {

    private Connection connection;
    private ArrayList<Restaurant> records=new ArrayList<Restaurant>();

    public RestaurantDAO(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection= DriverManager.getConnection("jdbc:mysql://localhost/reservation?useUnicode=true&characterEncoding=UTF-8","root","");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void insertRestaurant(Restaurant restaurant){
        try {
            PreparedStatement statement=connection.prepareStatement
                    ("INSERT INTO restaurants (name,address,email,description,capacity,free)  VALUES (?,?,?,?,?,?)");
            statement.setString(1,restaurant.getName());
            statement.setString(2,restaurant.getAddress());
            statement.setString(3,restaurant.getEmail());
            statement.setString(4,restaurant.getDescription());
            statement.setInt(5,restaurant.getCapacity());
            statement.setInt(6,restaurant.getCapacity());
            statement.execute();
        } catch (SQLException e) {
            System.out.println("not inserted");
            e.printStackTrace();
        }
    }
    public int selectCafeId(String email){
        int id = 0;
        try {
            PreparedStatement statement=connection.prepareStatement("SELECT ID FROM restaurants WHERE email=?");
            statement.setString(1,email);
            ResultSet set=statement.executeQuery();
            if(set.next()){
                id = set.getInt("id");
            }
        } catch (SQLException e) {
            System.out.println("could not select");
        }
        return id;
    }

    public Restaurant selectRestaurantsById(int id){
        Restaurant restaurant = new Restaurant();
        try {
            PreparedStatement statement=connection.prepareStatement("SELECT * FROM restaurants WHERE ID=?");
            statement.setInt(1,id);
            ResultSet set=statement.executeQuery();
            if(set.next()){
                restaurant.setId(set.getInt("id"));
                restaurant.setName(set.getString("name"));
                restaurant.setAddress(set.getString("address"));
                restaurant.setEmail(set.getString("email"));
                restaurant.setDescription(set.getString("description"));
                restaurant.setCapacity(set.getInt("capacity"));
            }
        } catch (SQLException e) {
            System.out.println("could not select");
        }
        return restaurant;
    }

    public ArrayList<Restaurant> selectRestaurants(){
        try {
            PreparedStatement statement=connection.prepareStatement("SELECT * FROM restaurants");
            ResultSet set=statement.executeQuery();
            while (set.next()){
                Restaurant restaurant = new Restaurant();
                restaurant.setId(set.getInt("id"));
                restaurant.setName(set.getString("name"));
                restaurant.setAddress(set.getString("address"));
                restaurant.setEmail(set.getString("email"));
                restaurant.setDescription(set.getString("description"));
                restaurant.setCapacity(set.getInt("capacity"));
                records.add(restaurant);
            }

        } catch (SQLException e) {
            System.out.println("could not select");
        }
        return records;
    }

    public ArrayList<Restaurant> selectHighRatedRestaurants(){
        try {
            PreparedStatement statement=connection.prepareStatement("SELECT restaurants.id,restaurants.name,restaurants.email,restaurants.address,AVG(quality_level) AS rate FROM reviews INNER JOIN restaurants ON reviews.cafe_id = restaurants.id GROUP BY reviews.cafe_id ORDER BY rate DESC ");
            ResultSet set=statement.executeQuery();
            while (set.next()){
                Restaurant restaurant = new Restaurant();
                restaurant.setId(set.getInt("id"));
                restaurant.setName(set.getString("name"));
                restaurant.setAddress(set.getString("address"));
                restaurant.setEmail(set.getString("email"));
                records.add(restaurant);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return records;
    }

    public void updateFreeCapacity(){

    }
    public ArrayList<Restaurant> nameSearch(String name){
        ArrayList<Restaurant> restaurants=new ArrayList<Restaurant>();
        try {
            PreparedStatement statement=connection.prepareStatement("SELECT * FROM restaurants WHERE name LIKE ?");
            statement.setString(1,"%"+name+"%");
            ResultSet set=statement.executeQuery();
            while (set.next()){
                Restaurant restaurant = new Restaurant();
                restaurant.setId(set.getInt("id"));
                restaurant.setName(set.getString("name"));
                restaurant.setAddress(set.getString("address"));
                restaurant.setEmail(set.getString("email"));
                restaurant.setDescription(set.getString("description"));
                restaurant.setCapacity(set.getInt("capacity"));
                restaurants.add(restaurant);
                System.out.println("   pedaaa   ");
                int i=0;
            }

        } catch (SQLException e) {
            System.out.println("could not select");
        }
        return restaurants;
    }
}
