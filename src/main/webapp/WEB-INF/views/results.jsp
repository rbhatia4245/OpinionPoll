<%@ page import="dao.QuestionDao" %>
<style><%@include file="/WEB-INF/views/results.css"%></style>
<%@ page import="models.Question" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dao.AnswerDao" %><%--
  Created by IntelliJ IDEA.
  User: rishi
  Date: 01-Sep-19
  Time: 2:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Opinion Poll</title>
</head>
<body>
<h1>Current Opinion Poll Results</h1>
<ul>
    <% QuestionDao questionDao = new QuestionDao();
        ArrayList<Question> questionList = questionDao.getAll();
        AnswerDao answerDao = new AnswerDao();
        for(Question question:questionList) {
            int id=question.getId();
            int numberOfAnswers=answerDao.getAnswerCount(id);
            int optionOneCount=answerDao.getAnswerCount(id,question.getOptionOne());
            int optionTwoCount=answerDao.getAnswerCount(id,question.getOptionTwo());
            int optionThreeCount=answerDao.getAnswerCount(id,question.getOptionThree());
            int optionFourCount=answerDao.getAnswerCount(id,question.getOptionFour());
            int optionOnePercent = (optionOneCount*100/numberOfAnswers);
            int optionTwoPercent = (optionTwoCount*100/numberOfAnswers);
            int optionThreePercent = (optionThreeCount*100/numberOfAnswers);
            int optionFourPercent = (optionFourCount*100/numberOfAnswers);
    %>
    <label><b>Q.<%=question.getFullQuestion()%></b></label>
    <div>
        <label>Total answers:<%=answerDao.getAnswerCount(id)%></label>
    </div>
    <div>
        <label><b><i>A.</i></b><%=question.getOptionOne()%>:<%=optionOneCount%></label>
        <label><b><i>B.</i></b><%=question.getOptionTwo()%>:<%=optionTwoCount%></label>
        <label><b><i>C.</i></b><%=question.getOptionThree()%>:<%=optionThreeCount%></label>
        <label><b><i>D.</i></b><%=question.getOptionFour()%>:<%=optionFourCount%></label>
    </div>
    <div class="question">
        <div class="chart">
            <%if(optionOnePercent!=0){%>
            <div class="option" style="grid-row-start:<%=100-optionOnePercent+1%>;grid-row-end:101;grid-column: 1"><label>A&#x0028;<%=optionOnePercent%>&#x0025;&#x0029;</label></div>
            <%}%>
            <%if(optionTwoPercent!=0){%>
            <div class="option" style="grid-row-start:<%=100-optionTwoPercent+1%>;grid-row-end:101;grid-column: 2"><label>B&#x0028;<%=optionTwoPercent%>&#x0025;&#x0029;</label></div>
            <%}%>
            <%if(optionThreePercent!=0){%>
            <div class="option" style="grid-row-start:<%=100-optionThreePercent+1%>;grid-row-end:101;grid-column: 3"><label>C&#x0028;<%=optionThreePercent%>&#x0025;&#x0029;</label></div>
            <%}%>
            <%if(optionFourPercent!=0){%>
            <div class="option" style="grid-row-start:<%=100-optionFourPercent+1%>;grid-row-end:101;grid-column: 4"><label>D&#x0028;<%=optionFourPercent%>&#x0025;&#x0029;</label></div>
            <%}%>
        </div>
    </div>
    <%}%>
</ul>
</body>
</html>
