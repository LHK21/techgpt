<%-- 
    Document   : Report.jsp
    Created on : May 5, 2024, 5:24:57 PM
    Author     : Loo Hong Kheng
--%>

<%@page import="entity.Orderdetails"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Report page</title>
    </head>
    <body>
         <%
         if(session.getAttribute("userType")==null||!(session.getAttribute("userType").equals("manager")))
            {
            response.sendRedirect("AccessRestricted.jsp");
        }
        if(session.getAttribute("username")==null)
        {
        response.sendRedirect("CustLog.jsp");
        }
         if(session.getAttribute("AllProduct")==null)
        {
        response.sendRedirect("InitializeProductAndCategory?report=1");
        }
        %>
        <header><%@ include file="Header.jsp" %></header> 
        <h1>Report page</h1>
            <p>Please select an option</p>
            <button onclick="location.href='ReportServlet?choice=1'">Top product sold</button>
            <button onclick="location.href='selectYearOrMonth.jsp'">Top product sold by year or month</button>
        <footer>
        <jsp:include page="Footer.jsp" />
        </footer>
    </body>
</html>
