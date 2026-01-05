<%-- 
    Document   : Main
    Created on : 6 May 2024, 7:31:00 am
    Author     : Jackl
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <style>
        .line {
    width: 100%;
    border-top: 1px solid #333; /* Adjust color and thickness as needed */
}
</style>
    
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    
<header><jsp:include page="Header.jsp" /></header>
    <body>
        <img src="shop.png" alt="Image Description" usemap="#imageMap" width="2402px" height="1554px">
    <map name="imageMap">
    <area shape="rect" coords="1473, 1209, 1746, 1330" href="InitializeProductAndCategory">
    </map>

       <div class="line"></div>
    </body>
    <footer>
        <jsp:include page="Footer.jsp" />
    </footer>
</html>
