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
.social-media-container {
    display: flex;
    align-items: center;
}

.social-media {
    display: flex;
    gap: 10px;
}

.social-media img {
    height: 30px;
    width: auto;
}

    </style>
</head>
<body>
<footer>
    <p><%= getServletContext().getInitParameter("Copyright") %></p>
    <div class="social-media-container">
        <div class="social-media-container">
    <h3 style="margin-right: 10px;">Social Media:</h3>
    <div class="social-media">
        <p><%= getServletContext().getInitParameter("Email") %></p>
        <a href="https://www.facebook.com/"><img src="https://store-images.s-microsoft.com/image/apps.37935.9007199266245907.b029bd80-381a-4869-854f-bac6f359c5c9.91f8693c-c75b-4050-a796-63e1314d18c9" alt="Facebook"></a>
        <a href="https://www.linkedin.com/"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS2Wb7G67EcR44qT3KQLlLzI1Fna_L2lPXfTI1sx8_z2w&s" alt="LinkedIn"></a>
        <a href="https://www.instagram.com/"><img src="https://cdn.pixabay.com/photo/2021/06/15/12/14/instagram-6338393_1280.png" alt="Instagram"></a>
    </div>
</div>

    </div>
    <a href="About.jsp" class="about-us">About Us</a>
    <div class="map">
        <h3>Find Us Now!</h3>
        <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d15934.15124864288!2d101.7265571!3d3.2152552!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31cc3843bfb6a031%3A0x2dc5e067aae3ab84!2sTunku%20Abdul%20Rahman%20University%20of%20Management%20and%20Technology%20(TAR%20UMT)!5e0!3m2!1sen!2smy!4v1714837600341!5m2!1sen!2smy" width="100%" height="100%" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
    </div>
</footer>

</body>
</html>
