<%-- 
    Document   : InsertCategory
    Created on : Apr 22, 2024, 4:07:26 PM
    Author     : Loo Hong Kheng
--%>

<%@page import="java.util.List"%>
<%@page import="entity.Category" %>
<%@page import="entity.Inventory" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert Product</title>
        <style>
            button
            {
                height: 40px;
                width:50px;
                margin-top: 20px;
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
        <h1>Insert Product</h1>
         <button onclick="location.href='SortProduct?tag=all'">Back</button>
        <div>
        <form method="post" action="ValidateProductInformation">
            
            <p><label for="ProductName">Product Name*:</label>
            <input type="text" id="ProductName" name="ProductName" placeholder="Product Name" required></p>
            <br>
            <p><label for="ProductPrice">Product Price(RM)*:</label>
            <input type="text" id="ProductPrice" name="ProductPrice" placeholder="eg:20.00" required></p>
            <br>
           <p> <label for="ProductDescription">Product Description*:</label>
            <input type="text" id="ProductDescription" name="ProductDescription" placeholder="Product Description" required></p>
            <br>
           <p> <label for="ProductPicture">Product Picture*:</label>
            <input type="file" accept="image/jpeg" id="ProductPicture" name="ProductPicture"  required></p>
            <br>
          <p><label for="Discount">Any starting discount?(RM)*:</label>
            <input type="text" id="Discount" name="Discount" placeholder="0" required></p>
            <br>
            <p><label for="category">Category*</label>
            <select name="category" id="category">
                <% List<Category> catList = (List<Category>) session.getAttribute("Category");
                   for(int i=0;i<catList.size();i++)
                   { 
                %>
                <option value=<%=catList.get(i).getCatid() %>><%=catList.get(i).getName()%> </option>
                <%}

                %>
            </select></p>
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
