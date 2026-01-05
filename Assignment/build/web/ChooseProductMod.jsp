<%-- 
    Document   : ChooseProductMod
    Created on : Apr 29, 2024, 8:55:36 PM
    Author     : Loo Hong Kheng
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modify Product</title>
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
            <input type="hidden" id="location" name="location" value="modify" placeholder="Product Name" required>
        </form>
        <%
                }
else{
            if(request.getParameter("mod")==null&&request.getParameter("chosen")!=null)
            { 
        %>
            
             <h1>Select an option to modify </h1>
             <div class="selection">
             <button onclick="location.href='ProductMod.jsp?mod=1'">Product Name</button>
             <button onclick="location.href='ProductMod.jsp?mod=2'">Product Price</button>
             <button onclick="location.href='ProductMod.jsp?mod=3'">Product Description</button>
             <button onclick="location.href='ProductMod.jsp?mod=4'">Picture</button>
             <button onclick="location.href='ProductMod.jsp?mod=5'">Product discount</button>
             <button onclick="location.href='ProductMod.jsp?mod=6'">Category</button>
             </div>
            <%
                }
}
            %>
            <footer>
        <jsp:include page="Footer.jsp" />
        </footer>
    </body>
</html>
