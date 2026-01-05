<%-- 
    Document   : InsertCategory
    Created on : Apr 22, 2024, 4:07:26 PM
    Author     : Loo Hong Kheng
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert Category</title>
        <style>
            button
            {
                height: 40px;
                width:80px;
                margin-top: 80px;
            }
        </style>
    </head>
    <body>
        <%
            if(session.getAttribute("userType")==null||(!(session.getAttribute("userType").equals("manager"))&&!(session.getAttribute("userType").equals("staff"))))
            {
            response.sendRedirect("AccessRestricted.jsp");
        }
        %>
        <header><%@ include file="Header.jsp" %></header>  
        <h1>Insert Category</h1>
         <button onclick="location.href='SortProduct?tag=all'">Back</button>
        <div>
        <form method="post" action="ConfirmCategory.jsp">
            <label for="categoryName">CategoryName*</label>
            <input type="text" id="categoryName" name="categoryName" placeholder="Category Name" required>
            <br>
            <input type="submit">
            <input type="reset">
        </form>
        </div>
         <footer>
        <jsp:include page="Footer.jsp" />
        </footer>
    </body>
</html>
