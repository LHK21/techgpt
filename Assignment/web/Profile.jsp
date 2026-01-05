<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <style>
        table {
            border-collapse: collapse;
            width: 50%;
            margin: 20px auto;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
    </style>
</head>

<header>
    <jsp:include page="Header.jsp" />
</header>

<body>
    <%
        if(session.getAttribute("username")==null)
        {
        response.sendRedirect("CustLog.jsp");
        }
        else{
        String role =(String) session.getAttribute("userType");
    %>
    <button onclick="location.href='orderHistory.jsp'">Order History</button>
        <%
        if(role.equals("staff")||role.equals("customer"))
        {
    %>
    <button onclick="location.href='EditAccount.jsp'">edit Account Password</button>
    <%
        }
        if(role.equals("manager"))
{
    %>
    <button onclick="location.href='userManagement.jsp'">view all accounts</button>
    <button onclick="location.href='registerServlet'">Add new staff</button>
    <%
        }}
    %>
    <h1>Account Information:</h1>
    <table>
        <c:if test="${not empty sessionScope.username}">
            <tr>
                <th>Attribute</th>
                <th>Details</th>
            </tr>
                    <tr>
                        <td>Username</td>
                        <td><%= session.getAttribute("username") %></td>
                    </tr>
                    <tr>
                        <td>Email</td>
                        <td><%= session.getAttribute("email") %></td>
                    </tr>
                    <tr>
                        <td>Phone Number</td>
                        <td><%= session.getAttribute("phoneNumber") %></td>
                    </tr>
                    <tr>
                        <td>Real Name</td>
                        <td><%= session.getAttribute("name") %></td>
                    </tr>
        </c:if>
    </table>
    
    
</body>

<footer>
    <jsp:include page="Footer.jsp" />
</footer>
</html>