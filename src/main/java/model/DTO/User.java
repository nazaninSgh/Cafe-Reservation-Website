package model.DTO;


public class User {
    private int id;
    private String name;
    private String lastname;
    private String password;
    private String email;
    private String salt;
    private String imagePath;
    private String imageName;

    private String bio;


    public User(){

    }
    public User(String name, String lastname, String password, String email) {
        this.name = name;
        this.lastname = lastname;
        this.password = password;
        this.email = email;
    }

    public User(String name, String lastname, String password, String email, String bio) {
        this.name = name;
        this.lastname = lastname;
        this.password = password;
        this.email = email;
        if(bio!=null)this.bio = bio;else this.bio=" ";
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSalt() {
        return salt;
    }

    public void setSalt(String salt) {
        this.salt = salt;
    }

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }

    public String getImageName() {
        return imageName;
    }

    public void setImageName(String imageName) {
        this.imageName = imageName;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getBio() {return bio;}

    public void setBio(String bio) {this.bio = bio;}


}