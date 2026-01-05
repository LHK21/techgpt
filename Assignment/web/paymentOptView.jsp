<%-- 
    Document   : payment
    Created on : 6 May 2024, 7:42:34 pm
    Author     : savas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Payment</title>
    </head>
    <body>
        <header><jsp:include page="Header.jsp" /></header>
        <h1>Payment</h1>
        Select payment option:<br>
        <form action="paymentView.jsp">
        <input type="radio" id="cash" name="paymentOpt" value="CASH">
        <label for="cash">Cash</label>

        <input type="radio" id="card" name="paymentOpt" value="CARD">
        <label for="cash">Debit/Credit Card</label>
        <%
            double grandTotal = (Double) session.getAttribute("grandAmount");
        %>
        <p>
        Total to pay : RM <%=grandTotal%>
        </p>
        <input type="submit" value="Proceed with payment">
        </form>
        <footer>
        <jsp:include page="Footer.jsp" />
    </footer>
    </body>
</html>
