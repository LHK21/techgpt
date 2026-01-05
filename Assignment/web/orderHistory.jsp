<%@page import="entity.Orderdetails"%>
<%@page import="entity.Inventory"%>
<!-- asus -->

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entity.Orders, java.util.*"%>
<jsp:include page="GetOrdersServlet"/>
<% List<Orders> orderList = (List<Orders>) session.getAttribute("orderList");%>
<% List<Inventory> inventoryList = (List<Inventory>) session.getAttribute("AllProduct");%>
<% List<Orderdetails> orderDetailList = (List<Orderdetails>) session.getAttribute("allOrderDetail");%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order History</title>
    </head>
    <body>
        <header>
    <jsp:include page="Header.jsp" />
</header>
        <h1>Order History</h1>
        <button onclick="location.href='Profile.jsp'">Back</button>
        <table border="1">
            <thead>
            <tr>
                <th>Order ID</th>
                <th>Date</th>
                <th>Item</th>
                <th>Quantity</th>
            </tr>
            </thead>
            <%
                for(int i=0;i<orderDetailList.size();i++){
                    for(int y=0;y<orderList.size();y++)
                    { if(orderDetailList.get(i).getOrderdetailsPK().getOrderid().equals(orderList.get(y).getOrderid())&&orderList.get(y).getAccountid().getAccountid().equals(session.getAttribute("accountId")))
                        {for(int z=0;z<inventoryList.size();z++) 
                        {
                            if(orderDetailList.get(i).getOrderdetailsPK().getInvenid().equals(inventoryList.get(z).getInvenid()))
                            {
            %>
            <tbody>
            <tr>
                <td><%= orderList.get(y).getOrderid() %></td>
                <td><%= orderList.get(y).getDate() %></td>
                <td><%= orderDetailList.get(i).getInventory().getName() %></td>
                <td><%= orderDetailList.get(i).getQuantity() %></td>
            </tr>
            </tbody>
            <% }
        }
        }
}
        }   %>
        </table>
        <footer>
        <jsp:include page="Footer.jsp" />
    </footer>
    </body>
</html>
