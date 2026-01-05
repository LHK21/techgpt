<%-- 
    Document   : ConfirmCategory
    Created on : Apr 22, 2024, 4:20:34 PM
    Author     : Loo Hong Kheng
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Confirm Category</title>
    </head>
    <body>
        <header><%@ include file="Header.jsp" %></header>  
        <%
            if(session.getAttribute("userType")==null||(!(session.getAttribute("userType").equals("manager"))&&!(session.getAttribute("userType").equals("staff"))))
            {
            response.sendRedirect("AccessRestricted.jsp");
        }
            String name=request.getParameter("categoryName");
        %>
        
        <h1>Inputed Category Details</h1>
        Name: <%= name%>
        <br/> 
        <p>You have inputed the above details.Would you like to continue?</p>
        <form method="post" action="CategoryInserted">
        <input type="submit" value="Continue">
        <input type="submit" value="Back" formaction="InsertCategory.jsp">
        <input type="hidden" value=<%= name%> name="categoryName">
        </form>
        <footer>
        <jsp:include page="Footer.jsp" />
        </footer>
    </body>
</html>
