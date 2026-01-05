<%-- 
    Document   : paymentView
    Created on : 6 May 2024, 8:05:04 pm
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
        <%
            String paymentOpt = (String) request.getParameter("paymentOpt");

            if (paymentOpt.equals("CARD")) {
            String payType = "card";
            session.setAttribute("card", payType);
        %>
        
        Selected payment method : <%=paymentOpt%>

        <b>Enter Card Details : </b><br>
        <p>
        <label for="name">Name on card :</label>
        <input type="text" id="name" name="name" required><br>
        </p>
        <p>
        <label for="cardNum">Card number :</label>
        <input id="cardNum" type="tel" inputmode="numeric" pattern="[0-9\s]{13,19}" 
               autocomplete="cc-number" minlength="16" 
               placeholder="xxxx xxxx xxxx xxxx" required>
        </p>
        <p>
        <label for="cvv">CVV:</label>
        <input type="text" id="cvv" name="cvv" required
               pattern="[0-9]{3,4}" title="Enter a valid CVV (3 or 4 digits)" placeholder="1234">
        </p>
        <p>
        <label for="expiryDate">Expiry Date:</label>
        <input type="text" id="expiryDate" name="expiryDate" pattern="(0[1-9]|1[0-2])\/\d{4}" title="Please enter expiry date in MM/YYYY format." placeholder="MM/YYYY" required><br><br>
        </p>
        <%
            }
        %>
        
        <b>Address Details : </b><br>
        
        <%
            if (paymentOpt.equals("CASH")) {
        %>
        <p>
        <label for="name">Name :</label>
        <input type="text" id="name" name="name" required><br>
        </p>
        <% 
            } 
        %>
        <p>
        <label for="address">Address:</label>
        <input type="text" id="address" name="address" required><br><br>
        </p>
        <p>
        <label for="city">City:</label>
        <input type="text" id="city" name="city" required><br><br>
        </p>
        <p>
        <label for="zipCode">Zip Code:</label>
        <input type="text" id="zipCode" name="zipCode" pattern="\d{5}"  title="Please enter a 5 digit zip code" required><br><br><br>
        </p>
        <button type="button" onclick="location.href='OrderInsert'">Confirm Pay</button>  
<footer> <jsp:include page="Footer.jsp" /></footer>
    </body>
</html>
