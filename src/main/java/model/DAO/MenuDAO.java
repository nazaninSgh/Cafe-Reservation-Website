package model.DAO;

import model.DTO.MenuItem;

import java.sql.*;
import java.util.ArrayList;

/**
 * Created by nazanin on 5/16/2019.
 */
public class MenuDAO {

    private Connection connection;
    private ArrayList<MenuItem> records=new ArrayList<>();

    public MenuDAO(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection= DriverManager.getConnection("jdbc:mysql://localhost/reservation?useUnicode=true&characterEncoding=UTF-8","root","");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void insertItem(MenuItem menuItem){
        try {
            PreparedStatement statement=connection.prepareStatement
                    ("INSERT INTO menu_item (cafe_id,name,ingredients,price) VALUES (?,?,?,?)");
            statement.setInt(1,menuItem.getCafe_id());
            statement.setString(2,menuItem.getName());
            statement.setString(3,menuItem.getIngredients());
            statement.setString(4,menuItem.getPrice());
            statement.execute();
        } catch (SQLException e) {
            System.out.println("not inserted");
            e.printStackTrace();
        }
    }
    public ArrayList<MenuItem> selectItems(int id){
        try {
            PreparedStatement statement=connection.prepareStatement("SELECT * FROM menu_item WHERE cafe_id=?");
            statement.setInt(1,id);
            ResultSet set=statement.executeQuery();
            while (set.next()){
                MenuItem menuItem = new MenuItem();
                menuItem.setId(set.getInt("id"));
                menuItem.setName(set.getString("name"));
                menuItem.setCafe_id(set.getInt("cafe_id"));
                menuItem.setIngredients(set.getString("ingredients"));
                menuItem.setPrice(set.getString("price"));
                records.add(menuItem);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return records;
    }
}
