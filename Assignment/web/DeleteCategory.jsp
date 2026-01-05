<%-- 
    Document   : DeleteCategory
    Created on : May 1, 2024, 5:41:26 PM
    Author     : Loo Hong Kheng
--%>

<%@page import="entity.Category"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Category</title>
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
        <h1>Please enter a category(Name or ID)</h1>
        <form method="post" action="DeleteCategory.jsp?chosen=1">
            <p><label for="CategoryName">Category Name*:</label>
            <input type="text" id="CategoryName" name="CategoryName" placeholder="Category Name" required>
            <input type="submit">
            <input type="reset">
            </p>
        </form>
         <%
          }
else{
        List<Category> selectedCatList = (List<Category>) session.getAttribute("Category");
        Category selectedCat=null;
        boolean found=false;
        for(int i=0;i<selectedCatList.size();i++)
        {
            if(request.getParameter("CategoryName").equals(selectedCatList.get(i).getName())||request.getParameter("CategoryName").equals(selectedCatList.get(i).getCatid()))
                {     
                    selectedCat = selectedCatList.get(i);
                    session.setAttribute("deleteCat", selectedCat);
                    found=true;
                }
        }
         %>
         <h1>Are you sure you want to delete <%=selectedCat.getCatid()%>: <%= selectedCat.getName() %></h1>
         <form method="post" action="DeleteCategory">
            <input type="submit" value="Continue">
            <input type="submit" value="Back" formaction="DeleteCategory.jsp">
         </form>
          <%
          }
         %>
         <footer>
        <jsp:include page="Footer.jsp" />
        </footer>
    </body>
</html>
