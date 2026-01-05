<%-- 
    Document   : verifyRegister
    Created on : May 6, 2024, 9:34:45 PM
    Author     : Loo Hong Kheng
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Verify register</title>
    </head>
    <body>
        <%
            String name = request.getParameter("fullName");
            String username = request.getParameter("username");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String phoneNumber = request.getParameter("phoneNumber");
            String role = request.getParameter("role");  
        %>
        <h1>You have inputed the following continue?</h1>
        <form  method="post" action="registerServlet">
            <p>
                Name:<%= name%>
            </p>
            <p>
                Username:<%= username%>
            </p>
            <p>
                Email:<%= email%>
            </p>
            <p>
                Phone Number<%= phoneNumber%>
            </p>
            <input type="submit">
            <input type="submit" formaction="CustLog.jsp" value="Back">
            <input type="hidden" name="fullName" value=<%= name%>>
            <input type="hidden" name="username" value=<%= username%>>
            <input type="hidden" name="email" value=<%= email%>>
            <input type="hidden" name="password" value=<%= password%>>
            <input type="hidden" name="phoneNumber" value=<%= phoneNumber%>>
            <input type="hidden" name="role" value=<%= role%>>
        </form>
    </body>
</html>
