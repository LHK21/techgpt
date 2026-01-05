<%-- 
    Document   : ConfirmProduct
    Created on : Apr 24, 2024, 7:09:57 PM
    Author     : Loo Hong Kheng
--%>

<%@page import="entity.Inventory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Confirm Product</title>
    </head>
    <body>
        <header><%@ include file="Header.jsp" %></header> 
        <h1>Inputted Product details</h1>
        <%
            if(session.getAttribute("userType")==null||(!(session.getAttribute("userType").equals("manager"))&&!(session.getAttribute("userType").equals("staff"))))
            {
            response.sendRedirect("AccessRestricted.jsp");
        }
         Inventory confirmInven= (Inventory)session.getAttribute("newProduct");  
         %>
         <div>
             <p>Product Name: <%= confirmInven.getName()%></p>
             <p>Product Price: RM<%= confirmInven.getPrice()%></p>
             <p>Product Description: <%= confirmInven.getDescription()%></p>
             <p>Product Picture:<image src="data:image/jpeg;base64,<%=confirmInven.getPicture()%>" width="200px" height="200px" alt="picture"></p>
             <p>Product Discount: RM<%= confirmInven.getDiscount()%></p>
             <p>Product Category: <%= confirmInven.getCatid().getName()%></p>
         </div>
         <br/>
        <p>You have inputed the above details.Would you like to continue?</p>
        <form method="post" action="ProductInserted">
        <input type="submit" value="Continue">
        <input type="submit" value="Back" formaction="InsertProduct.jsp">
        </form>
        <footer>
        <jsp:include page="Footer.jsp" />
        </footer>
    </body>
</html>
