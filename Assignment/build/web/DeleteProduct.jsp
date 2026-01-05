<%-- 
    Document   : DeleteProduct
    Created on : May 1, 2024, 4:32:36 PM
    Author     : Loo Hong Kheng
--%>

<%@page import="java.util.List"%>
<%@page import="entity.Inventory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Product</title>
    </head>
    <body>
        <header><%@ include file="Header.jsp" %></header> 
         <button onclick="location.href='SortProduct?tag=all'">Back</button>
         <% 
            if(session.getAttribute("userType")==null||!(session.getAttribute("userType").equals("manager")))
            {
            response.sendRedirect("AccessRestricted.jsp");
        }
            if(request.getParameter("chosen")==null)
            {
        %>
        <h1>Please enter a product(Name or ID)</h1>
        <form method="post" action="SortProduct">
            <p><label for="ProductName">Product Name*:</label>
            <input type="text" id="ProductName" name="ProductName" placeholder="Product Name" required>
            <input type="submit">
            <input type="reset">
            </p>
            <input type="hidden" id="location" name="location" value="delete" placeholder="Product Name" required>
        </form>
         <%
          }
else{
        List<Inventory> selectedInvenList = (List<Inventory>) session.getAttribute("Product");
        Inventory selectedInven = selectedInvenList.get(0);
        session.setAttribute("deleteInven", selectedInven);
         %>
         <h1>Are you sure you want to delete <%=selectedInven.getInvenid()%>: <%= selectedInven.getName() %></h1>
         <form method="post" action="DeleteProduct">
            <input type="submit" value="Continue">
            <input type="submit" value="Back" formaction="DeleteProduct.jsp">
         </form>
          <%
          }
         %>
         <footer>
        <jsp:include page="Footer.jsp" />
        </footer>
    </body>
</html>
