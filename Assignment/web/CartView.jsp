<%-- 
    Document   : CartView
    Created on : 18 Apr 2024, 7:47:43 pm
    Author     : savas
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="Products.Product"%>
<%@page import="Sales.Order"%>
<%@page import="Sales.Cart"%>
<%@page import="Sales.CartServlet"%>
<%@ page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart</title>
    </head>
    <style>
        th, td {
            padding : 10px;

        }
    </style>

    <body>
        <header><%@ include file="Header.jsp" %></header> 
        <h1>Cart</h1>

        <%
             if(session.getAttribute("username")==null)
        {
        response.sendRedirect("CustLog.jsp");
    }
        %>

        <table>
            <tr>
                <th>Name</th>
                <th>Product ID</th>
                <th>Quantity</th>
                <th>Amount (RM)</th>
                <th>Total Amount (RM)</th>
            </tr>

            <%
            if(session.getAttribute("cart")!=null)
            {
            int index = 0;
            double grandAmount = 0;
            double totalAmount;
            double amount;
            double tax=0.05;
            double salesTax;
            double deliveryCharge=0;
            session.setAttribute("index", index);
            Cart cart = (Cart)session.getAttribute("cart");
        
            //System.out.println("Cart item no. : " + cart.getOrder().getProducts().size());
            //print each cart item
            for(index = 0; index < cart.getOrder().getProducts().size(); index++){
                BigDecimal price = cart.getOrder().getProducts().get(index).getPrice();
                BigDecimal discount = cart.getOrder().getProducts().get(index).getDiscount();
                BigDecimal displayPrice = price.subtract(discount);
                session.setAttribute("index", index);
                amount = displayPrice.doubleValue();
                totalAmount = (displayPrice.doubleValue() * 
                            cart.getOrder().getQuantities().get(index));
                grandAmount += totalAmount;
                if(grandAmount >=200)
                {deliveryCharge=0;}
                else
                {deliveryCharge=25;}
                        
            %>


            <tr>

                <td><%= cart.getOrder().getProducts().get(index).getName()%></td>
                <td><%= cart.getOrder().getProducts().get(index).getInvenid()%></td>

                <%
                if(cart.getOrder().getQuantities().get(index) > 0){
                %>

                <td><%=cart.getOrder().getQuantities().get(index)%>
                    <form action="CartServlet" method="Post">
                        <input type="hidden" name = "nonZeroQuantity" value="true">
                        <input type="hidden" name = "index" value="${index}">
                        <input type="submit" name = "quantityChange" value="+">
                        <input type="submit" name = "quantityChange" value="-">
                    </form>
                </td>
                <td><%= amount%></td>
                <td><%= totalAmount%></td>
                <%
                }else{
                %>

                <td>Remove item from cart?
                    <form action="CartServlet" method="Post">
                        <input type="hidden" name = "nonZeroQuantity" value="false">
                        <input type="hidden" name = "index" value="${index}">
                        <input type="submit" name = "toRemove" value="Yes">
                        <input type="submit" name = "toRemove" value="No">
                    </form>
                </td>
                <td></td>
                <td></td>


                <%
                }
                %>

            </tr>


            <% 
                //request.setAttribute("totalAmount", totalAmount);
                }
                DecimalFormat df = new DecimalFormat("#.00"); 
                salesTax = grandAmount*tax;
                grandAmount=grandAmount+salesTax+deliveryCharge;
                session.setAttribute("grandAmount", grandAmount);
            %>
            <tr>
                <td><b>Sales tax(5%)</b>:RM<%= df.format(salesTax) %></td>
                <td><b>Delivery Charge</b>:RM<%=deliveryCharge%></td>
            </tr>
            <tr>
                <td><b>Grand Total :<b></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td><b>RM <%=grandAmount%><b></td>

                                        </tr>
                                        </table>



                                        <form action="paymentOptView.jsp">
                                            <input type="submit" value="Proceed to Payment" />
                                        </form>
                                        <%}
                                        else
                                        {
                                        %>
                                        <div>
                                            <h2>
                                                There are no Products in cart at the moment
                                            </h2>
                                        <%}
                                        %>
                                        </div>
 <footer>
        <jsp:include page="Footer.jsp" />
</footer>
                                        </body>
                                        
                                        </html>
