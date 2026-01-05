<%-- 
    Document   : DisplayCategory
    Created on : Apr 21, 2024, 6:13:45 PM
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
        <title>Product page</title>
        <style>
            .productList
            {
                display: flex;
                flex-wrap: wrap;
                width: 100%;
                justify-content: left;
                align-items: center;
                margin: 50px;
            }
            .container
            {
                width: 20%;
                margin: 50px 50px 25px 50px;
                box-sizing: border-box;
                float: left;
                text-align: center;
                border-radius: 20px;
                border-color: black;
                background-color: grey;
            }
            .container a 
            {
                text-decoration: none;
                font-family: sans-serif;
                font-size: 16px;
                color: black
            }
            .container a:visited
            {
                color: black
            }
            image
            {
                display: block;
            }
            
        </style>
    </head>
    <body>
        <header><%@ include file="Header.jsp" %></header>  
        <%
            if(session.getAttribute("userType")!=null&&session.getAttribute("userType").equals("manager"))
            { //Display based on user role 
        %>
        <button onclick="location.href='InsertCategory.jsp'">Insert Category</button>
        <button onclick="location.href='DeleteCategory.jsp'">Delete Category</button>
        <button onclick="location.href='InsertProduct.jsp'">Insert Product</button>
        <button onclick="location.href='ChooseProductMod.jsp'">Modify Product</button>
        <button onclick="location.href='DeleteProduct.jsp'">Delete Product</button>
        <%
            }
        %>
         <%
            if(session.getAttribute("userType")!=null&&session.getAttribute("userType").equals("staff"))
            {
        %>
        <button onclick="location.href='InsertCategory.jsp'">Insert Category</button>
        <button onclick="location.href='InsertProduct.jsp'">Insert Product</button>
        <button onclick="location.href='ChooseProductMod.jsp'">Modify Product</button>
        <%
            }
        %>
        <%@include file="DisplayCategory.jsp" %> 
        <div class="productList">
            <%
                List<Inventory> product = (List<Inventory>)session.getAttribute("Product");
                try{//Display if no product is found 
                if(product.size()==0)
                {
                out.println("                             The product does not exist");
                }
                else//Display Product
                {for(int i=0;i<product.size();i++)
                {   BigDecimal price = product.get(i).getPrice();
                    BigDecimal discount = product.get(i).getDiscount();
                    BigDecimal displayPrice = price.subtract(discount);
                %>
                <div class="container">
                    <a href="ProductDetail.jsp?tag=<%=product.get(i).getInvenid()%>">
                    <image src="data:image/jpeg;base64,<%=product.get(i).getPicture()%>" width="100px" height="100px" alt="picture">
                    <h4><%=product.get(i).getInvenid()%>:<%=product.get(i).getName()%></h4>
                    <p>RM<%=displayPrice%></p>
                    <p>Click for more details</p>
                    </a>
                </div>
                 <% }}
                }catch(FileNotFoundException ex)
                {
                }
                
               %>
               
        </div>
        <footer>
        <jsp:include page="Footer.jsp" />
        </footer>
    </body>
</html>
