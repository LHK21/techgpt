<%-- 
    Document   : EditAccount
    Created on : May 6, 2024, 5:22:37 PM
    Author     : Loo Hong Kheng
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Account</title>
    </head>
    <body>
        <header><%@ include file="Header.jsp" %></header>  
        <button onclick="location.href='Profile.jsp'">Back</button>
        <h1>Enter Password </h1>
        <form method="post" action="ModAccount">
            <input type="text" name="password" id="password" placeholder="password">
            <input type="submit">
            <input type="reset">
        </form>
  
        <footer>
        <jsp:include page="Footer.jsp" />
        </footer>
    </body>
</html>
