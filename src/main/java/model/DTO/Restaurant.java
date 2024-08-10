package model.DTO;

import java.util.ArrayList;

/**
 * Created by nazanin on 3/30/2019.
 */
public class Restaurant {
    private int id;
    private int capacity;
    private String name;
    private String address;
    private String email;
    private String description;
    private ArrayList<CafeImage> image;

    public Restaurant(){

    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public ArrayList<CafeImage> getImage() {
        return image;
    }

    public void setImage(ArrayList<CafeImage> image) {
        this.image = image;
    }

    public int getCapacity() {
        return capacity;
    }

    public void setCapacity(int capacity) {
        this.capacity = capacity;
    }
}
