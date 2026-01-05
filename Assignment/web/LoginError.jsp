<%-- 
    Document   : LoginError
    Created on : May 6, 2024, 3:33:00 PM
    Author     : Loo Hong Kheng
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Error</title>
    </head>
    <body>
        <header><jsp:include page="Header.jsp" /></header>
        <h1>Error wrong password or username</h1>
        <% String type = (String) session.getAttribute("userType");
        if(type.equals("customer"))
        {
        %>
        <button onclick="location.href='CustLog.jsp'">Back to Login</button>
        <%}
          else if(type.equals("staff"))
        {
        %>
        <button onclick="location.href='StaffLog.jsp'">Back to Login</button>
        <%} 
             else
        {
        %>
        <button onclick="location.href='ManaLog.jsp'">Back to Login</button>
        <%}%>
        <footer>
        <jsp:include page="Footer.jsp" />
    </footer>
    </body>
</html>
