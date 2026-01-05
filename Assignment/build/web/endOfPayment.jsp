<%-- 
    Document   : endOfPayment
    Created on : 6 May 2024, 8:30:57 pm
    Author     : savas
--%>

<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Payment Success</title>
    </head>
    <body>
        <header><jsp:include page="Header.jsp" /></header>
        <% Date arriveDate = (Date)session.getAttribute("arriveDate");%>
        <h1>Payment is Successful!</h1>
        <h1>Thanks for shopping with us</h1>
        <h1>The product you order will be arriving at <%= arriveDate%></h1>
        <button type="button" onclick="location.href='Main.jsp'">Click here to return to homepage</button>  
        <footer>
        <jsp:include page="Footer.jsp" />
    </footer>
    </body>
</html>
