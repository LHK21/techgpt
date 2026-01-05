<%-- 
    Document   : userManagement
    Created on : 6 May 2024, 3:22:07 AM
    Author     : Asus
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entity.Account,java.util.*"%>
<jsp:include page="StaffServlet"/>
<% List<Account> accountList = (List<Account>) session.getAttribute("accountList");
if(session.getAttribute("userType")==null||!(session.getAttribute("userType").equals("manager")))
            {
            response.sendRedirect("AccessRestricted.jsp");
        }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manager Page</title>
    </head>
    <body>
        <header><%@ include file="Header.jsp" %></header> 
        <button onclick="location.href='Profile.jsp'">Back</button>
        <h1>User Management Page</h1><br>
        <h2>Account Table</h2>
        <table border="1">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th> 
                    <th>Email</th>
                    <th>Phone Number</th>
                    <th>Username</th>
                    <th>Password</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <%
                    for(int i = 0; i < accountList.size(); i++){
                    Account account = accountList.get(i);
                %>

                <tr>
            <form method="post" action="saveServlet">
            <td><input name="id" value="<%=account.getAccountid()%>"></td>
            <td><input name="name" value="<%=account.getName() %>"></td>
            <td><input name="email" value="<%=account.getEmail()%>"></td>
            <td><input name="phone" value="<%=account.getPhonenumber()%>"></td>
            <td><input name="username" value="<%=account.getUsername() %>"></td>
            <td><input name="password" value="<%=account.getPassword()%>"></td>
            <td><input type="submit" value="Save"></form><form method="post" action="DeleteServlet"><input name="id" value="<%=account.getAccountid()%>" hidden><input type="submit" value="Delete"></form></td>
            
        </tr>
        <% }%>
    </tbody>
</table>
<footer>
    <jsp:include page="Footer.jsp" />
</footer>
</body>
</html>
