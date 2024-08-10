package model.DAO;

import model.DTO.Reservation;
import model.DTO.Restaurant;

import java.sql.*;
import java.util.ArrayList;

/**
 * Created by nazanin on 3/31/2019.
 */
public class ReservationDAO {
    private Connection connection;
   // private ArrayList<Restaurant> records=new ArrayList<Restaurant>();

    public ReservationDAO(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection= DriverManager.getConnection("jdbc:mysql://localhost/reservation?useUnicode=true&characterEncoding=UTF-8","root","");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public int insertReservation(Reservation reservation){
        int row=-1;
        try {
            PreparedStatement statement=connection.prepareStatement
                    ("INSERT INTO reservations (customer_id,cafe_id,num_of_people,date)  VALUES (?,?,?,?)");
            statement.setInt(1,reservation.getCustomerId());
            statement.setInt(2,reservation.getCafeId());
            statement.setInt(3,reservation.getNumOfPeople());
            statement.setString(4,reservation.getDate());
            row = statement.executeUpdate();
          //  row = statement.execute();
        } catch (SQLException e) {
            System.out.println("not inserted");
            e.printStackTrace();
        }
        return row;
    }
    public boolean alreadyReserved(String date,int cafe_id){
        try {
            PreparedStatement statement=connection.prepareStatement("SELECT id FROM reservations WHERE DATE=? AND CAFE_ID=?");
            statement.setString(1,date);
            statement.setInt(2,cafe_id);
            ResultSet set=statement.executeQuery();
            if(set.next()){
                System.out.println("inaha");
                return true;
            }
        } catch (SQLException e) {
            System.out.println("could not select");
        }
        return false;
    }

    public String getCafeNameById(int id){

        try {
            PreparedStatement statement=connection.prepareStatement("SELECT name FROM restaurants WHERE ID=?");
            statement.setInt(1,id);
            ResultSet set=statement.executeQuery();
            if(set.next()){
                return set.getString("name");
            }
        } catch (SQLException e) {
            System.out.println("could not select");
        }
        return "";
    }

}
