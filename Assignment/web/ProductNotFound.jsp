<%-- 
    Document   : ProductNotFound
    Created on : Apr 29, 2024, 9:39:11 PM
    Author     : Loo Hong Kheng
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product error</title>
    </head>
    <body>
        <header><%@ include file="Header.jsp" %></header> 
        <h1>Error there are no Product of the inventory ID or name</h1>
        <button onclick="location.href='InitializeProductAndCategory'">Back</button>
        <footer>
        <jsp:include page="Footer.jsp" />
        </footer>
    </body>
</html>
