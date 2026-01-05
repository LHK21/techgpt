<%-- 
    Document   : Header
    Created on : 4 May 2024, 11:19:52 pm
    Author     : Jackl
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <style>
        header {
            background-color: #2a9df4;
            padding: 10px;
            color: #ffffff;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        header a {
            color: #ffffff;
            text-decoration: none;
            margin-left: 20px;
            font-weight: bold;
            border-right: 2px solid white; 
            padding-right: 10px; 
            transition: color 0.3s, font-size 0.3s;
        }
        header a:last-child {
            border-right: none; 
        }
        header a:hover {
            color: #1d5ebf; /* Darken color */
            font-size: 110%; /* Increase font size */
        }
        .logo img {
            height: 50px;
            width: auto;
        }
        .cart-icon {
            margin-right: 20px;
            font-size: 24px;
        }
        .cart-icon img {
            height: 30px;
            width: auto;
        }
#searchForm {
    display: flex;
}

#searchInput {
    padding: 8px;
    border: 1px solid #ccc;
    border-radius: 5px;
    flex: 1;
}

#searchButton {
    padding: 8px 16px;
    background-color: #2a9df4;
    color: white;
    border: none;
    border-radius: 5px;
    margin-left: 10px;
    cursor: pointer;
}

#searchButton:hover {
    background-color: #1e7cb7;
}
    </style>
</head>
<body>
    <header>
        <div class="cart-icon">
            <a href="Profile.jsp">
                <img src="user.png" alt="User">
                 <%
              if(session.getAttribute("username")!=null)
              {
             %>
             <p><%= session.getAttribute("username") %></p>
            <%}
             %>
            </a>
        </div>
        <div class="logo">
            <a href="Main.jsp">
                <img src="logo.png" alt="Logo">
            </a>
        </div>
        <p><%= getServletContext().getInitParameter("CompanyName") %></p>
        <nav>
            <a href="About.jsp">About Us</a>
             <%
              if(session.getAttribute("username")==null)
              {
             %>
             <a href="CustLog.jsp">Login</a>
            <%}
             %>
            <a href="InitializeProductAndCategory">Products</a>
            <a href="CartView.jsp">Cart</a>
             <%
              if(session.getAttribute("userType")!=null&&session.getAttribute("userType").equals("manager"))
              {
             %>
             <a href="Report.jsp">Report</a>
             <%}
            
              if(session.getAttribute("username")!= null)
              {
             %>
             <a href="ConfirmLogout.jsp">Logout</a>
            <%}
             %>
        </nav>
<form action="SortProduct" method="post" id="searchForm">
    <input type="text" name="ProductName" id="searchInput" placeholder="Search products...">
    <button type="submit" id="searchButton">Search</button>
    <input type="hidden" id="location" name="location" value="search" placeholder="Product Name">
</form>
    </header>
</body>
</html>
