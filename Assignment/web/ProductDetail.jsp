<%-- 
    Document   : ProductDetail
    Created on : Apr 22, 2024, 2:41:19 PM
    Author     : Loo Hong Kheng
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List" %>
<%@page import="entity.Inventory" %>
<%@page import="java.io.*" %>
<%@page import="java.math.BigDecimal" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Details</title>
        <style>
            .productDetail
            {
                margin-top: 50px;
                align-items: center;
                text-align: center;
                box-sizing: border-box;
                border-radius: 20px;
                border-color: black;
                background-color: grey;
            }
            h4
            {
                font-size: 26px;
            }
            p{
                font-size: 22px;
            }
            button
            {
                height: 40px;
                width:80px;
                margin-top: 40px;
            }
        </style>
    </head>
    <body>
          <%
             if(session.getAttribute("username")==null)
        {
        response.sendRedirect("CustLog.jsp");
    }
        %>
        <header><%@ include file="Header.jsp" %></header> 
        <%
          String InvenID=request.getParameter("tag"); 
          List<Inventory> product = (List<Inventory>)session.getAttribute("AllProduct");
          for(int i=0;i<product.size();i++)
          { 
            if(product.get(i).getInvenid().equals(InvenID))
            {
                BigDecimal price = product.get(i).getPrice();
                BigDecimal discount = product.get(i).getDiscount();
                BigDecimal displayPrice = price.subtract(discount);
                session.setAttribute("currentProduct", product.get(i));
        %>
        <button onclick="location.href='SortProduct?tag=all'">Back</button>
        <div class="productDetail">
            <image src="data:image/jpeg;base64,<%=product.get(i).getPicture()%>" width="200px" height="200px" alt="picture">
                 <h4><%=product.get(i).getInvenid()%>:<%=product.get(i).getName()%></h4>
                 <p>RM<%=product.get(i).getPrice()%></p>
                 <p>Discount available:RM<%=product.get(i).getDiscount()%></p>
                 <p>After Discount:RM<%=displayPrice%></p>
                 <p>Descriptions<br><%=product.get(i).getDescription()%></p>
                 <button onclick="location.href='addToCart'">Add to cart</button>
            </div>
         <%
             }}
         %>
         <footer>
        <jsp:include page="Footer.jsp" />
        </footer>
    </body>
</html>
