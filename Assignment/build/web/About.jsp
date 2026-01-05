<%-- 
    Document   : About
    Created on : 6 May 2024, 5:57:50 am
    Author     : Jackl
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
body {
    font-family: 'Roboto', sans-serif;
    background-color: #f0f0f0;
    color: #333;
}
        .container {
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            width: 80%;
            margin: auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 10px;
            background-color: #f9f9f9;
            margin-top: 20px;
        }
        h2,h3 {
    font-family: 'Montserrat', sans-serif;
    color: #007bff;
            border-bottom: 1px solid #ccc;
            padding-bottom: 10px;
            margin-bottom: 20px;
        }
        p {
            margin: 10px 0;
        }
        ul li {
    transition: transform 0.3s;
}

ul li:hover {
    transform: scale(1.05);
}
img {
    border-radius: 8px;
}
    </style>
</head>

<header><jsp:include page="Header.jsp" /></header>
<body>
    <div class="container">
        <h2>About TechGPT: Your Ultimate Destination for Tech Gadgets</h2>
        <p>Welcome to TechGPT, your ultimate destination for cutting-edge technology gadgets! At TechGPT, we are passionate about bringing you the latest and most innovative tech products to enhance your digital lifestyle.</p>

        <h3>Our Story:</h3>
        <p>TechGPT was founded in the vibrant city of Setapak Kuala Lumpur by a team of tech enthusiasts who shared a common vision: to revolutionize the way people interact with technology. Inspired by the advancements in artificial intelligence and natural language processing, our founders envisioned a future where technology seamlessly integrates into every aspect of our lives. Driven by innovation and fueled by our relentless pursuit of excellence, TechGPT quickly gained recognition as a trusted name in the tech industry. Our commitment to quality, reliability, and customer satisfaction sets us apart in a competitive market.</p>

        <h3>Our Mission:</h3>
        <p>At TechGPT, our mission is simple yet profound: to empower individuals with the latest technology that enhances their productivity, creativity, and overall well-being. Whether you're a tech enthusiast, a professional, or an everyday user, we strive to provide you with innovative solutions that meet your unique needs and preferences.</p>

        <h3>Our Product Range:</h3>
        <p>Discover a world of possibilities with our diverse range of tech gadgets, including:</p>
        <ul>
            <li><strong>Smart Devices:</strong> From smartwatches and fitness trackers to smart home devices, we offer a comprehensive selection of connected gadgets to streamline your daily routines and elevate your lifestyle.</li>
            <li><strong>Cutting-edge Electronics:</strong> Explore the latest innovations in electronics, including smartphones, tablets, laptops, and gaming consoles, designed to keep you connected, entertained, and productive on the go.</li>
            <li><strong>Innovative Accessories:</strong> Enhance your tech experience with our collection of accessories, including wireless chargers, high-quality headphones, stylish phone cases, and more, carefully curated to complement your devices and reflect your personal style.</li>
        </ul>

        <h3>Our Commitment to Excellence:</h3>
        <p>At TechGPT, we are committed to delivering excellence in every aspect of our business. From product selection and quality assurance to customer service and support, we prioritize your satisfaction above all else. Our dedicated team of tech experts is always on hand to provide personalized recommendations, technical assistance, and after-sales support to ensure that your experience with TechGPT exceeds your expectations.</p>

        <h3>Join Us in Shaping the Future:</h3>
        <p>Join us on our journey as we continue to push the boundaries of innovation and shape the future of technology. Whether you're a seasoned tech enthusiast or a curious newcomer, TechGPT welcomes you to explore our world of possibilities and embark on an exciting adventure of discovery, creativity, and endless possibilities.</p>

        <p>Experience the future of technology with TechGPT – Where Innovation Meets Excellence!</p>
    </div>
</body>
<footer>
        <jsp:include page="Footer.jsp" />
</footer>
</html>
