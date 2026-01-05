<%-- 
    Document   : AccessRestricted
    Created on : May 8, 2024, 4:40:08 PM
    Author     : Loo Hong Kheng
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Access restricted</title>
    </head>
    <body>
        <header><%@ include file="Header.jsp" %></header> 
        <h1>Error access restricted</h1>
        <button onclick="location.href='Main.jsp'">Back</button>
        <footer>
        <jsp:include page="Footer.jsp" />
        </footer>
    </body>
</html>
