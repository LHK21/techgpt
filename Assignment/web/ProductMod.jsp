<%-- 
    Document   : ProductMod
    Created on : Apr 29, 2024, 9:42:09 PM
    Author     : Loo Hong Kheng
--%>

<%@page import="java.util.List"%>
<%@page import="entity.Category"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Modification</title>
    </head>
    <body>
        <header><%@ include file="Header.jsp" %></header> 
        <button onclick="location.href='ChooseProductMod.jsp?chosen=1'">Back</button>
        <%
            if(session.getAttribute("userType")==null||!(session.getAttribute("userType").equals("manager")))
            {
            response.sendRedirect("AccessRestricted.jsp");
        }
            int chosen = Integer.parseInt(request.getParameter("mod"));
            if(chosen==1){
        %>
        <form method="get" action="ValidateProductInformation">
            <input type="text" name="name" id="name" placeholder="ProductName">
            <input type="submit">
            <input type="reset">
        </form>
        <%}
            else if(chosen==2){
        %>
        <form method="get" action="ValidateProductInformation">
            RM<input type="text" name="price" id="price" placeholder="0.0">
            <input type="submit">
            <input type="reset">
        </form>
        <%
            } else if(chosen==3){
        %>
        <form method="get" action="ValidateProductInformation">
            <input type="text" name="description" id="description" placeholder="ProductDescription">
            <input type="submit">
            <input type="reset">
        </form>
        <%
            } else if(chosen==4){
        %>
        <form method="get" action="ValidateProductInformation">
            <input type="file" accept="image/jpeg" id="picture" name="picture"  required>
            <input type="submit">
            <input type="reset">
        </form>
       <%
           } else if(chosen==5){
        %>
        <form method="get" action="ValidateProductInformation">
            RM<input type="text" name="discount" id="discount" placeholder="0.0">
            <input type="submit">
            <input type="reset">
        </form>
       <%
           }else{
        %>
        <form method="get" action="ValidateProductInformation">
             <select name="category" id="category">
                <% List<Category> catList = (List<Category>) session.getAttribute("Category");
                   for(int i=0;i<catList.size();i++)
                   { 
                %>
                <option value=<%=catList.get(i).getCatid() %>><%=catList.get(i).getName()%> </option>
                <%}

                %>
            </select>
            <input type="submit">
            <input type="reset">
        </form>
        <%
           }
        %>
        <footer>
        <jsp:include page="Footer.jsp" />
        </footer>
    </body>
</html>
