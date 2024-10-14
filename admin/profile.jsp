<%@page import="java.sql.*" %>
<%@include file="../JSP/connect.jsp"%>
<%!
    int Aid_edit;
    String address, pincode, mobile;
%>
<%
    String fullname=(String)session.getAttribute("full_name");
    if (fullname !=null){

    String Aid=(String)session.getAttribute("admin_id");
    
    Aid_edit = Integer.parseInt(Aid);
    stmt=con.createStatement();
    rs=stmt.executeQuery("select * from admin_rgstr where admin_id='"+Aid_edit+"'");
    rs.next();
    if(rs.getString("mobile") != null){
        mobile=rs.getString("mobile");
    } 
    else{
        mobile="";
    }
    if(rs.getString("address") != null){
        address=rs.getString("address");
    } 
    else{
        address="";
    }
    if(rs.getString("pincode") != null){
        pincode=rs.getString("pincode");
    } 
    else{
        pincode="";
    }

%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@300..700&display=swap" rel="stylesheet" />
    <link rel="shortcut icon" href="../Media/favicon.png" type="image/x-icon" />
    <link href="https://cdn.jsdelivr.net/npm/remixicon@4.3.0/fonts/remixicon.css" rel="stylesheet" />
    <link rel="stylesheet" href="../CSS/style.css">
    <link rel="stylesheet" href="../CSS/admin.css">
    <link rel="stylesheet" href="../CSS/AdminResponsive.css">
    <title>Profile</title>
</head>

<body>
        <nav>
            <a href="../index.jsp" class="logo"><img src="../Media//Red_Car_Tire_Transportation_Free_Logo-removebg.png" alt=""></a>
        </nav>
        <div class="parent-nav">            
            <div class="nav-content">
                <a href="welcomeadmin.jsp">home</a>
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
                <a href="#" class="activated">Edit Profile</a>
                <a href="addPlans.jsp">Add Plans</a>
                <a href="addServices.jsp">Add Services</a>
                <a href="bookings.jsp" class="showBooking">Bookings</a>
                <a href="billing.jsp">Billing</a>
                <a href="Customers.jsp">Customer's Details</a>
                <a href="planManagement.jsp">Plans Management</a>
            </div>

        <div id="adminProfile">
            <div class="container-register profileForm">
                <form class="form" action="../JSP/action.jsp">
                    <input type="hidden" name="action" value="editAdminProfile">
                    <p class="title">Edit Your Profile </p>
                    
                    <div class="flex">
                    <label>
                        <input required="" placeholder="" type="text" readonly class="input" name="aid" value= '<% out.println(rs.getInt("admin_id"));%>'>
                        <span style="top:30px;font-size: 0.7em;font-weight: 600;color: green;">Admin ID</span>
                    </label> 
                    
                    <label>
                        <input required="" placeholder="" type="text" class="input" readonly name="fname" value="<% out.println(rs.getString("full_name"));%>">
                        <span style="top:30px;font-size: 0.7em;font-weight: 600;color: green;">Full Name</span>
                    </label>
                    </div>

                    <label>
                        <input required="" placeholder="" type="email" class="input" name="email" value="<% out.println(rs.getString("email"));%>">
                        <span>Email</span>
                    </label> 

                    <label>
                        <input required="" placeholder="" type="text" class="input" name="mobile" value="<%= mobile%>">
                        <span>Mobile No.</span>
                    </label>
          
                    <label>
                        <input required="" placeholder="" type="text" class="input" name="address" value="<%= address %>">
                        <span>Address</span>
                    </label>

                    <label>
                        <input required="" placeholder="" type="text" class="input" name="pincode" value="<%= pincode %>">
                        <span>Pincode</span>
                    </label>     
                    
                    <button class="submit" type="submit" value="submit">Submit</button>
                </form>
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
<%
}
else{
    response.sendRedirect("../index.jsp");
}
%>