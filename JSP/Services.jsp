<!DOCTYPE html>
<%@include file="connect.jsp" %>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@300..700&display=swap" rel="stylesheet"/>
    <link rel="shortcut icon" href="../Media/favicon.png" type="image/x-icon" />
    <link href="https://cdn.jsdelivr.net/npm/remixicon@4.3.0/fonts/remixicon.css" rel="stylesheet"/>
    <link rel="stylesheet" href="../CSS/style.css">
    <link rel="stylesheet" href="../CSS/login-register.css">
    <link rel="stylesheet" href="../CSS/user.css">
    <title>
        Services
    </title>
</head>

<body>
        <nav>
            <a href="../index.jsp" class="logo"><img src="../Media//Red_Car_Tire_Transportation_Free_Logo-removebg.png" alt=""></a>
        </nav>
        <div class="parent-nav">            
            <div class="nav-content">
                <a href="welcomeuser.jsp">home</a>
                <a class="more" href="#">More</a>
                <a href="logout.jsp" target="_self">Logout</a>
            </div>
            <span class="icons">
                <i class="ri-menu-fold-line menu"></i>
                <i class="ri-close-fill close"></i>
            </span>
        </div>

    <main class="main">
            <div class="multiple-links">
                <a href="users.jsp">Edit Profile</a>
                <a href="#" class="activated">Services</a>
                <a href="myBookings.jsp">My Bookings</a>
                <a href="planSubscribed.jsp">Plan Member</a>
                <a href="bill.jsp">Billing</a>
            </div>
        <div id="parent-row">
            <h1 id="servicess">Services</h1>
                <div class="row">
                    <%
                        stmt=con.createStatement();
                        rs=stmt.executeQuery("select * from services_plans");
                        while(rs.next()){
                    %>

                    <div class="card">
                        <div class="card-details">
                            <p class="text-title"><%= rs.getString("serv_name") %></p>
                            <p class="text-body">Price <%= rs.getInt("serv_charge") %></p>
                            <p>Discount <%= rs.getInt("discount") %>%</p>
                            <p>Total Price <%= rs.getInt("total") %></p>
                        </div>
                        <a href='bookService.jsp?bid=<%= rs.getInt("sid") %>'><button class="card-button">Book Now</button></a>
                    </div>
                    <%
                    }   
                    %>
                </div> 
        </div>

    </main>


    <!-- Script -->
    <script src="../JS/user.js"></script>
    <script>
        function profile(){
        let showMore = document.querySelector(".nav-content .more");
        let links = document.querySelector(".multiple-links");

        showMore.addEventListener("mouseover", () => {
            links.style.display = "flex";
        });

        links.addEventListener("mouseleave", () => {
            links.style.display = "none";
        });
    }
    profile()
    </script>
</body>

</html>