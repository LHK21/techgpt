<%-- 
    Document   : selectYearOrMonth
    Created on : May 6, 2024, 11:24:59 PM
    Author     : Loo Hong Kheng
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Select year or month</title>
    </head>
    <body>
        <jsp:include page="Header.jsp" />
        <button onclick="location.href='Report.jsp'">Back</button>
        <%
            if(session.getAttribute("userType")==null||!(session.getAttribute("userType").equals("manager")))
            {
            response.sendRedirect("AccessRestricted.jsp");
        }
            if(request.getParameter("choice")==null)
            {
        %>
        <button onclick="location.href='selectYearOrMonth.jsp?choice=1'">chooseByYear</button>
        <button onclick="location.href='selectYearOrMonth.jsp?choice=2'">chooseByMonthandYear</button>
        <%}
else{
if(Integer.parseInt(request.getParameter("choice"))==1)
{
       %>
       <form method="get" action="ReportServlet">
           <input type="text" name="year"  required>
           <input type="submit">
           <input type="hidden" value="2" name="choice">
       </form>
       <%
           }
else if(Integer.parseInt(request.getParameter("choice"))==2)
{
       %>
       <form method="get" action="ReportServlet">
        <select name="month">
        <option value="0">January</option>
        <option value="1">February</option>
        <option value="2">March</option>
        <option value="3">April</option>
        <option value="4">May</option>
        <option value="5">June</option>
        <option value="6">July</option>
        <option value="7">August</option>
        <option value="8">September</option>
        <option value="9">October</option>
        <option value="10">November</option>
        <option value="11">December</option>
      </select>
      <input type="text" name="year"  required>
      <input type="submit">
        <input type="hidden" value="3" name="choice">
       </form>
       <%}
else if(Integer.parseInt(request.getParameter("choice"))==3)
{

%>
<input type="date" name="date"  required>
<input type="submit">
<input type="hidden" value="4" name="choice">
<%}
else{
    out.println("Invalid Choice");
}}%>
<jsp:include page="Footer.jsp" />
    </body>
</html>
