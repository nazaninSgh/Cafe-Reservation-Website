package model.DTO;

/**
 * Created by nazanin on 3/31/2019.
 */
public class Reservation {

    private int id;
    private int customerId;
    private int cafeId;
    private String date;
    private int numOfPeople;

    public Reservation(){

    }

    public Reservation(int id, int customerId, String date, int numOfPeople) {
        this.id = id;
        this.customerId = customerId;
        this.date = date;
        this.numOfPeople = numOfPeople;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public int getNumOfPeople() {
        return numOfPeople;
    }

    public void setNumOfPeople(int numOfPeople) {
        this.numOfPeople = numOfPeople;
    }

    public int getCafeId() {
        return cafeId;
    }

    public void setCafeId(int cafeId) {
        this.cafeId = cafeId;
    }
}
