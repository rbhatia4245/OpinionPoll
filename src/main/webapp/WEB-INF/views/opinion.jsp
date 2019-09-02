<%--
  Created by IntelliJ IDEA.
  User: rishi
  Date: 31-Aug-19
  Time: 12:22 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="dao.QuestionDao" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import="models.Question" %>
<style><%@include file="/WEB-INF/views/results.css"%></style>
<html>
<head>
    <title>Opinion Poll</title>
</head>
<body>
<form method="post" action="/getUser">
    <ul>
        <% QuestionDao questionDao = new QuestionDao();
            ArrayList<Question> questionList = questionDao.getAll();
            for(Question question:questionList) {
            int id=question.getId();
         %>
            <li>
                <label><%=question.getFullQuestion()%></label>
                <label><input type="radio" name="<%=id%>" value="<%=question.getOptionOne()%>"><%=question.getOptionOne()%></label>
                <label><input type="radio" name="<%=id%>" value="<%=question.getOptionTwo()%>"><%=question.getOptionTwo()%></label>
                <label><input type="radio" name="<%=id%>" value="<%=question.getOptionThree()%>"><%=question.getOptionThree()%></label>
                <label><input type="radio" name="<%=id%>" value="<%=question.getOptionFour()%>"><%=question.getOptionFour()%></label>
            </li>
        <%}%>
    </ul>
    <label>Enter name: <input type="text" name="name" required></label>
    <label>Enter email:<input type="email" name="email" required></label>
    <input type="submit">
</form>
</body>
</html>
