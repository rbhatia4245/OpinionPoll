package utilities;
import java.sql.*;

public class Dbconnection {
    Connection conn=null;
    String url="jdbc:mysql://localhost:3306/opinion_poll";
    String username="root";
    String password ="admin";

    public Connection getConnection() {
        try {
            try{
                Class.forName("com.mysql.cj.jdbc.Driver");
            } catch (ClassNotFoundException e){
                e.printStackTrace();
            }
            conn = DriverManager.getConnection(url, username, password);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch(Exception e){
            e.printStackTrace();
        }
        return conn;
    }

}
