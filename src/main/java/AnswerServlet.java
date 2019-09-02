import dao.AnswerDao;
import dao.QuestionDao;
import models.Question;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

@WebServlet(urlPatterns = "/addAnswer")
public class AnswerServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        QuestionDao questionDao=new QuestionDao();
        ArrayList<Question> questionList = questionDao.getAll();
        HashMap<Integer,String> answers=new HashMap<Integer,String>();
        for(Question question:questionList){
            String answer=request.getParameter(question.getId()+"");
            answers.put(question.getId(),answer);
        }
        int userId=Integer.parseInt(request.getAttribute("userId").toString());
        AnswerDao answerDao=new AnswerDao();
        String addAnswer=answerDao.insertAnswer(userId,answers);
        if(addAnswer.equalsIgnoreCase("failed")){
            request.getRequestDispatcher("/WEB-INF/views/submissionFailed.jsp").forward(request,response);
        }else{
            request.getRequestDispatcher("/getResults").forward(request,response);
        }
    }


}
