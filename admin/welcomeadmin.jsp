<%@page import="java.sql.*" %>
<%
    String fullname=(String)session.getAttribute("full_name");
    if (fullname !=null){
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@300..700&display=swap" rel="stylesheet">
    <link rel="shortcut icon" href="../Media/favicon.png" type="image/x-icon">
    <link href="https://cdn.jsdelivr.net/npm/remixicon@4.3.0/fonts/remixicon.css" rel="stylesheet">
    <link rel="stylesheet" href="../CSS/style.css">
    <link rel="stylesheet" href="../CSS/admin.css">
    <link rel="stylesheet" href="../CSS/AdminResponsive.css">


    <title>TorqueMaster Garage - A place where we ensure your vehicles value</title>
</head>
<body>
        <nav>
            <a href="../index.jsp" class="logo"><img src="../Media/Red_Car_Tire_Transportation_Free_Logo-removebg.png" alt=""></a>
        </nav>
        <div class="parent-nav">            
            <div class="nav-content">
                <a href="welcomeadmin.jsp" class="activated">home</a>
                <a class="more" href="#">More</a>
                <a href="logout.jsp" target="_self">Logout</a>
            </div>
            <span class="icons">
                <i class="ri-menu-fold-line menu"></i>
                <i class="ri-close-fill close"></i>
            </span>
        </div>

        <video autoplay loop muted src="../Media/video.mp4"></video>

    <%@include file="../JSP/connect.jsp" %>
        <main>
            <div class="multiple-links">
                <a href="profile.jsp">Edit Profile</a>
                <a href="addPlans.jsp">Add Plans</a>
                <a href="addServices.jsp">Add Services</a>
                <a href="bookings.jsp" class="showBooking">Bookings</a>
                <a href="billing.jsp">Billing</a>
                <a href="Customers.jsp">Customer's Details</a>
                <a href="planManagement.jsp">Plans Management</a>
            </div>
            <div class="page1">
                <div class="heading">
                    <h1>Welcome To</h1>
                    <h1>TorqueMaster Garage<h1>
                    <h2>Mr<span>. </span><%= fullname %></h2>
                </div>
            </div>            
        </main>
       
    <!-- Script -->
    <script type="module" src="../JS/Welcome.js"></script>
</body>
</html>

<%
}
else{
    response.sendRedirect("../index.jsp");
}
%>