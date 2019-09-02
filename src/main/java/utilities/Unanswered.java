package utilities;

import dao.AnswerDao;
import dao.QuestionDao;
import models.Answer;
import models.Question;
import models.User;

import java.util.ArrayList;
import java.util.List;

public class Unanswered {
   /* public ArrayList<Question> getUnansweredQuestions(User user){
        QuestionDao questionDao=new QuestionDao();
        AnswerDao answerDao = new AnswerDao();
        ArrayList<Question> allQuestion = questionDao.getAll();
        //ArrayList<Answer> userAnswers = answerDao.getUserAnswers(user);
        ArrayList<Integer> qId= new ArrayList<Integer>();
        for(Question q:allQuestion){
            qId.add(q.getId());
        }
        for(Answer answer:userAnswers){
            int questionId=answer.getQuestionId();
            if(qId.contains(questionId)){
                allQuestion.remove(qId.indexOf(questionId));
                qId.remove(questionId);
            }
        }
        return allQuestion;
    }*/
}
