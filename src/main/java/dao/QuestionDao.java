package dao;

import models.Question;
import utilities.Dbconnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class QuestionDao {
    public ArrayList<Question> getAll(){
        Dbconnection dbconnection = new Dbconnection();
        Connection conn=dbconnection.getConnection();
        ArrayList<Question> result=new ArrayList<Question>();
        try{
            PreparedStatement stmt=conn.prepareStatement("Select * from questions");
            ResultSet rs=stmt.executeQuery();
            while(rs.next()){
                Question temp=new Question();
                temp.setId(rs.getInt("id"));
                temp.setFullQuestion(rs.getString("question"));
                temp.setOptionOne(rs.getString("A"));
                temp.setOptionTwo(rs.getString("B"));
                temp.setOptionThree(rs.getString("C"));
                temp.setOptionFour(rs.getString("D"));
                result.add(temp);
            }
        } catch(SQLException e){
            e.printStackTrace();
        } catch(Exception e){
            e.printStackTrace();
        }
        return result;
    }
}
