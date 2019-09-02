package dao;

import com.mysql.cj.x.protobuf.MysqlxPrepare;
import models.User;
import utilities.Dbconnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDao {

    public int getUserId(User user){
        Dbconnection dbconnection=new Dbconnection();
        Connection conn= dbconnection.getConnection();
        String email=user.getEmail();
        int id=-1;
        try {
            PreparedStatement stmt = conn.prepareStatement("Select * from user where email='" + email + "'");
            ResultSet resultSet=stmt.executeQuery();
            if(!resultSet.next()){
                String addResult=this.addUser(user);
                if(addResult.equalsIgnoreCase("success"))
                return getUserId(user);
            }else{
                id=resultSet.getInt("id");
            }
        }catch(SQLException e){
            e.printStackTrace();
        }catch(Exception e){
            e.printStackTrace();
        }
        return id;
    }

    public String addUser(User user){
        Dbconnection dbconnection=new Dbconnection();
        Connection conn=dbconnection.getConnection();
        String name=user.getName();
        String email=user.getEmail();
        String query="Insert into user values (NULL,?,?)";
        try{
            PreparedStatement stmt=conn.prepareStatement(query);
            stmt.setString(1,name);
            stmt.setString(2,email);
            int res=stmt.executeUpdate();
            if(res!=0){
                return "success";
            }

        } catch (SQLException e){
            e.printStackTrace();
        } catch (Exception e){
            e.printStackTrace();
        }
        return "failed";
    }
}
