<%-- 
    Document   : DisplayCategory
    Created on : Apr 21, 2024, 4:53:45 PM
    Author     : Loo Hong Kheng
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List" %>
<%@page import="entity.Category" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>
            .categoryList
            {
                width: 100px;
                position: fixed;
                z-index: 1;
                top: 0;
                left: 0;
                padding-top: 90px;
            }
            .categoryList a
            {
                background-color: greenyellow;
                color: black;
                display: block;
                padding: 10px;
                text-decoration: none;
            }
        </style>
    </head>
    <body>
        <div class="categoryList">
            <a href="SortProduct?tag=all">All Product</a>
            <br>   
        <% 
            List<Category> list = (List<Category>) session.getAttribute("Category");
           for(int i=0; i< list.size();i++)
           { 
           %>
           <a href="SortProduct?tag=<%=list.get(i).getCatid()%>"><%out.println(list.get(i).getName()); %></a>
           <br>
         <%}
         %>
       </div>
       
    </body>
</html>
