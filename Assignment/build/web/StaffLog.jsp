<%-- 
    Document   : StaffLog
    Created on : 5 May 2024, 12:09:43 am
    Author     : Jackl
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        form {
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin-bottom: 5px;
        }
        input[type="text"],
        input[type="email"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        button {
            padding: 10px 20px;
            background-color: #2a9df4;
            color: #ffffff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        button[type="submit"] {
            background-color: #4CAF50;
        }
        .navigation-buttons {
            position: absolute;
            top: 10px;
            right: 10px;
        }
    </style>
</head>

<header><jsp:include page="Header.jsp" /></header>
<body>
    <h1>Staff Registration and Login</h1>
    

            <div class="navigation-buttons">
        <button onclick="redirectToCust()">Customer</button>
        <button onclick="redirectToManager()">Manager</button>
    </div>
    
    <form id="loginForm" action="LoginServlet" method="post">
        <label for="loginUsername">Username:</label>
        <input type="text" id="loginUsername" name="username" required><br>
        
        <label for="loginPassword">Password:</label>
        <input type="password" id="loginPassword" name="password" required><br>
        
        <input type="hidden" name="userType" value="staff"> 
        <button type="submit">Login as Staff</button>
    </form>
        
    <script>
        function toggleForms() {
            var toggleButton = document.getElementById("toggleButton");
            var registerForm = document.getElementById("registerForm");
            var loginForm = document.getElementById("loginForm");
            
            if (toggleButton.textContent.includes("Login")) {
                toggleButton.textContent = "Don't have an account? Register here.";
                registerForm.style.display = "none";
                loginForm.style.display = "block";
            } else {
                toggleButton.textContent = "Already have an account? Login here.";
                registerForm.style.display = "block";
                loginForm.style.display = "none";
            }
        }
        toggleForms();
        
        function redirectToManager() {
            window.location.href = "ManaLog.jsp";
        }
        
        function redirectToCust() {
            window.location.href = "CustLog.jsp";
        }
    </script>
</body>
<footer>
        <jsp:include page="Footer.jsp" />
    </footer>
</html>