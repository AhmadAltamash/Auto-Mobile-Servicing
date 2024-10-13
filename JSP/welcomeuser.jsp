<%@page import="java.sql.*" %>
<%
    String firstname=(String)session.getAttribute("f_name");
    if (firstname !=null){
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
    <link rel="stylesheet" href="../CSS/user.css">
    <link rel="stylesheet" href="../CSS/HomePageResponsive.css">

    <title>TorqueMaster Garage - A place where we ensure your vehicles value</title>
</head>
<body>
        <nav>
            <a href="../index.jsp" class="logo"><img src="../Media//Red_Car_Tire_Transportation_Free_Logo-removebg.png" alt=""></a>
        </nav>
        <div class="parent-nav">            
            <div class="nav-content">
                <a href="welcomeuser.jsp" class="activated">home</a>
                <a class="more" href="#">More</a>
                <a href="logout.jsp" target="_self">Logout</a>
            </div>
            <span class="icons">
                <i class="ri-menu-fold-line menu"></i>
                <i class="ri-close-fill close"></i>
            </span>
        </div>

        <main>
            <div class="multiple-links">
                <a href="users.jsp">Edit Profile</a>
                <a href="Services.jsp">Services</a>
                <a href="myBookings.jsp">My Bookings</a>
                <a href="planSubscribed.jsp">Plan Member</a>
                <a href="bill.jsp">Billing</a>
            </div>

            <div id="slider" class="contentOneAction">

                <div class="heading">
                    <h1>Welcome <%= firstname %></h1>
                </div>

                <div id="dCanvas">
                </div>

                <div class="contentOne">
                    <h1>SF90 STRADALE</h1>

                    <div class="desc">
                        The Porsche 911 (pronounced Nine Eleven or in German: Neunelf) is a two-door 2+2 high performance rear-engined sports car introduced in September 1964 by Porsche AG of Stuttgart, Germany. It has a rear-mounted flat-six engine and originally a torsion bar suspension.
                    </div>
                </div>

                <div class="contentTwo">
                    <ul>
                        <li>
                            <span>V8</span>
                            <span>ENGINE</span>
                        </li>

                        <li>
                            <span>2.5 sec</span>
                            <span>0-100 KM/H</span>
                        </li>

                        <li>
                            <span>2120 kW</span>
                            <span>EDRIVE POWER</span>
                        </li>

                        <li>
                            <span>1000 cv</span>
                            <span>MAXIMUM POWER @ 7500 RPM</span>
                        </li>
                    </ul>
                </div>

                <button id="showMore">More</button>
            </div>
        </main>
       
    <!-- Script -->
    <script type="module" src="../JS/welcomeuser.js"></script>
</body>
</html>

<%
}
else{
    response.sendRedirect("../index.html");
}
%>