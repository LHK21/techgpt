<%-- 
    Document   : ConfirmLogout
    Created on : May 7, 2024, 10:17:25 AM
    Author     : Loo Hong Kheng
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Confirm Logout</title>
    </head>
    
    <body>
        <header><jsp:include page="Header.jsp" /></header>
        <h1>Are you sure you want to logout</h1>
        <form method="post"  action="Logout">
            <input type="submit" value="confirm">
            <input type="submit" value="back" formaction="Main.jsp">
        </form>
        <footer>
        <jsp:include page="Footer.jsp" />
        </footer>
    </body>
</html>
