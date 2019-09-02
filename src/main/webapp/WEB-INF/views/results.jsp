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
            int[] optionCount = new int[4];
            int max=Integer.MIN_VALUE;
            optionCount[0]=answerDao.getAnswerCount(id,question.getOptionOne());
            if(optionCount[0]>max)
                max=optionCount[0];
            optionCount[1]=answerDao.getAnswerCount(id,question.getOptionTwo());
            if(optionCount[1]>max)
                max=optionCount[1];
            optionCount[2]=answerDao.getAnswerCount(id,question.getOptionThree());
            if(optionCount[2]>max)
                max=optionCount[2];
            optionCount[3]=answerDao.getAnswerCount(id,question.getOptionFour());
            if(optionCount[3]>max)
                max=optionCount[3];
            int[] optionPercent= new int[4];
            optionPercent[0] = (optionCount[0]*100/numberOfAnswers);
            optionPercent[1] = (optionCount[1]*100/numberOfAnswers);
            optionPercent[2] = (optionCount[2]*100/numberOfAnswers);
            optionPercent[3] = (optionCount[3]*100/numberOfAnswers);
    %>
    <label><b>Q.<%=question.getFullQuestion()%></b></label>
    <div>
        <label>Total answers:<%=answerDao.getAnswerCount(id)%></label>
    </div>
    <div>
        <label <%if(optionCount[0]==max){%> style="color:#19aea5"<%}%>><b><i>A.</i></b><%=question.getOptionOne()%>:<%=optionCount[0]%></label>
        <label <%if(optionCount[1]==max){%> style="color:#19aea5" <%}%>><b><i>B.</i></b><%=question.getOptionTwo()%>:<%=optionCount[1]%></label>
        <label <%if(optionCount[2]==max){%> style="color:#19aea5" <%}%>><b><i>C.</i></b><%=question.getOptionThree()%>:<%=optionCount[2]%></label>
        <label <%if(optionCount[3]==max){%> style="color:#19aea5" <%}%>><b><i>D.</i></b><%=question.getOptionFour()%>:<%=optionCount[3]%></label>
    </div>
    <div class="question">
        <div class="chart">
            <%if(optionPercent[0]!=0){%>
            <div class="option" style="grid-row-start:<%=100-optionPercent[0]+1%>;grid-row-end:101;grid-column: 1"><label>A&#x0028;<%=optionPercent[0]%>&#x0025;&#x0029;</label></div>
            <%}%>
            <%if(optionPercent[1]!=0){%>
            <div class="option" style="grid-row-start:<%=100-optionPercent[1]+1%>;grid-row-end:101;grid-column: 2"><label>B&#x0028;<%=optionPercent[1]%>&#x0025;&#x0029;</label></div>
            <%}%>
            <%if(optionPercent[2]!=0){%>
            <div class="option" style="grid-row-start:<%=100-optionPercent[2]+1%>;grid-row-end:101;grid-column: 3"><label>C&#x0028;<%=optionPercent[2]%>&#x0025;&#x0029;</label></div>
            <%}%>
            <%if(optionPercent[3]!=0){%>
            <div class="option" style="grid-row-start:<%=100-optionPercent[3]+1%>;grid-row-end:101;grid-column: 4"><label>D&#x0028;<%=optionPercent[3]%>&#x0025;&#x0029;</label></div>
            <%}%>
        </div>
    </div>
    <%}%>
</ul>
</body>
</html>
