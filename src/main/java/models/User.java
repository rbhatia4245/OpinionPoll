package models;

public class User {
    public int id;
    public String name;
    public String email;

    public void setId(int id) {
        this.id = id;
    }

    public int getId() {
        return id;
    }

    public String getName(){
        return this.name;
    }

    public String getEmail() {
        return email;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setEmail(String email){
        this.email=email;
    }
}
