<%-- 
    Document   : AccountNotFound
    Created on : May 6, 2024, 6:20:34 PM
    Author     : Loo Hong Kheng
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Account not found</title>
    </head>
    <body>
        <header><%@ include file="Header.jsp" %></header> 
        <h1>Error there are no Account of the Account ID or Account username</h1>
        <button onclick="location.href='EditAccount.jsp'">Back</button>
        <footer>
        <jsp:include page="Footer.jsp" />
        </footer>
    </body>
</html>
