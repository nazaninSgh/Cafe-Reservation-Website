package model.DAO;

import model.DTO.MenuItem;
import model.DTO.Reply;

import java.sql.*;
import java.util.ArrayList;

/**
 * Created by nazanin on 7/12/2019.
 */
public class ReplyDAO {
    private Connection connection;
    private ArrayList<Reply> records=new ArrayList<>();

    public ReplyDAO(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection= DriverManager.getConnection("jdbc:mysql://localhost/reservation?useUnicode=true&characterEncoding=UTF-8","root","");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void insertReply(Reply reply){
        try {
            PreparedStatement statement=connection.prepareStatement
                    ("INSERT INTO reply (uid,rid,body) VALUES (?,?,?)");
            statement.setInt(1,reply.getUid());
            statement.setInt(2,reply.getRid());
            statement.setString(3,reply.getBody());
            statement.execute();
        } catch (SQLException e) {
            System.out.println("not inserted");
            e.printStackTrace();
        }
    }
    public ArrayList<Reply> selectItems(int id){
        try {
            PreparedStatement statement=connection.prepareStatement("SELECT * FROM reply WHERE rid=?");
            statement.setInt(1,id);
            ResultSet set=statement.executeQuery();
            while (set.next()){
                Reply reply = new Reply();
                reply.setId(set.getInt("id"));
                reply.setUid(set.getInt("uid"));
                reply.setRid(set.getInt("rid"));
                reply.setBody(set.getString("body"));
                records.add(reply);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return records;
    }
}
