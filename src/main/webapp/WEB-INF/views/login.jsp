<%--
  Created by IntelliJ IDEA.
  User: rishi
  Date: 30-Aug-19
  Time: 3:35 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style><%@include file="/WEB-INF/views/results.css"%></style>
<html>
<head>
    <title>Opinion Poll</title>
</head>
<body>
    <form method="get" action="/getUser">
        <label>
            Hi Welcome to the Polling Station. Please Enter Your Name and Email
        </label>
            <div>
            <label>
                Full Name<input type="text" name="name" placeholder="Michael Scott" required>
            </label>
            </div>
            <div>
            <label>Email<input type="email" name="email" placeholder="abc@efg.com" required></label>
            </div>
            <input type="submit" value="submit">
    </form>
</body>
</html>
