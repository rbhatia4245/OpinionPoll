package dao;

import com.mysql.cj.x.protobuf.MysqlxPrepare;
import models.Answer;
import models.User;
import utilities.Dbconnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class AnswerDao {

    public String insertAnswer(int userId, HashMap<Integer,String> answers){
        Dbconnection dbconnection=new Dbconnection();
        Connection conn=dbconnection.getConnection();
        String result="";
        for(Map.Entry<Integer,String> entry:answers.entrySet()){
            int questionId = entry.getKey();
            String answer=entry.getValue();
            try {
                PreparedStatement dltStmt = conn.prepareStatement("Delete from answers where user_id="+userId+" AND question_id="+questionId);
                int t = dltStmt.executeUpdate();
                PreparedStatement stmt = conn.prepareStatement("Insert into answers values(NULL,?,?,?)");
                stmt.setInt(1, userId);
                stmt.setInt(2, questionId);
                stmt.setString(3, answer);
                int res=stmt.executeUpdate();
                if(res==0)
                    result="failed";
                else
                    result="success";
            } catch(SQLException e){
                e.printStackTrace();
            } catch(Exception e){
                e.printStackTrace();
            }
        }
        return result;
    }
     public int getAnswerCount(int questionId){
        Dbconnection dbconnection = new Dbconnection();
        Connection conn = dbconnection.getConnection();
        try{
            PreparedStatement stmt = conn.prepareStatement("Select Count(question_id) As total from answers where question_id="+questionId+" AND answer IS NOT NULL");
            ResultSet rs = stmt.executeQuery();
            if(rs.next()){
                return rs.getInt("total");
            }
        }catch (SQLException e){
            e.printStackTrace();
        } catch (Exception e){
            e.printStackTrace();
        }
        return 0;
     }

     public int getAnswerCount(int questionId, String option){
         Dbconnection dbconnection = new Dbconnection();
         Connection conn = dbconnection.getConnection();
         try{
             PreparedStatement stmt = conn.prepareStatement("Select Count(question_id) As total from answers where question_id="+questionId+" AND answer='"+option+"'");
             ResultSet rs = stmt.executeQuery();
             if(rs.next()){
                 return rs.getInt("total");
             }
         }catch (SQLException e){
             e.printStackTrace();
         } catch (Exception e){
             e.printStackTrace();
         }
         return 0;
     }
}
