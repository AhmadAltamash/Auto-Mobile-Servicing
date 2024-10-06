<%@page import="java.sql.*" %>
<%@include file="connect.jsp" %>
<%
    String firstname=(String)session.getAttribute("f_name");
    String lastname=(String)session.getAttribute("l_name");
    String mobile=(String)session.getAttribute("mob");
    String Cid=(String)session.getAttribute("rid");
    if (firstname !=null){
        int sidFetch=Integer.parseInt(request.getParameter("bid"));
        stmt=con.createStatement();
        rs=stmt.executeQuery("select * from plans where pid='"+sidFetch+"'");
        rs.next();
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
    <link rel="stylesheet" href="../CSS/user.css">
    <title>
        Purchase a Plan
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
                <a href="Services.jsp">Services</a>
                <a href="myBookings.jsp">My Bookings</a>
                <a href="planSubscribed.jsp">Plan Member</a>
                <a href="bill.jsp">Billing</a>
            </div>
        <div id="parentBooking">
                <div class="bookServices container-register">

                    <form class="form" method="post" action="action.jsp">
                    <input type="hidden" name="action" value="purchasePlan">
                    <p class="title">Subscribe for Plan</p>
                   
                    <div class="flex">
                        <label>
                            <input required="" placeholder="" type="text" class="input" name="cpID" value='<% out.println(rs.getString("pid"));%>' readonly >
                            <span style="top:30px;font-size: 0.7em;font-weight: 600;color: green;">Plan Id</span>
                        </label>


                        <label>
                            <input required="" placeholder="" type="text" class="input" name="rid"  readonly value='<% out.println(Cid);%>' >
                            <span style="top:30px;font-size: 0.7em;font-weight: 600;color: green;">Customer Id</span>
                        </label>
                    </div>  

                    <label>
                        <input required="" class="input" name="cname" type="text" readonly value='<% out.println(firstname+" "+lastname);%>'>
                        <span style="top:30px;font-size: 0.7em;font-weight: 600;color: green;">Customer Name</span>
                    </label>
  
                    <label>
                        <input required="" class="input" name="planname" type="text" readonly value='<% out.println(rs.getString("plan_name"));%>'>
                        <span style="top:30px;font-size: 0.7em;font-weight: 600;color: green;">Plan Name</span>
                    </label>

                    <label>
                        <input required="" class="input" name="planprice" type="text" readonly value='<% out.println(rs.getString("total"));%>'>
                        <span style="top:30px;font-size: 0.7em;font-weight: 600;color: green;">Price</span>
                    </label>

                    <label>
                        <input required="" type="text" readonly class="input valDate" name="valid_date">
                        <span style="top:30px;font-size: 0.7em;font-weight: 600;color: green;">Valid From Date</span>
                    </label>

                    <label>
                        <input required="" type="text" readonly class="input toDate" name="to_date">
                        <span style="top:30px;font-size: 0.7em;font-weight: 600;color: green;">Valid To Date</span>
                    </label>
                    

                    
                    <button class="submit" type="submit" id="submit" style="cursor:pointer">Purchase</button>
                    
                    </form>
                </div>
        </div>

        <div class="notify" id="notification">
            <div class="check">
                <i class="ri-check-fill"></i>
            </div>
            <div class="msg">
                <p>Plan Purchasing Successfull</p>
                <p>Go To Plan Memebers</p>
            </div>
        </div>

    </main>

    <!-- Script -->
    <script src="../JS/planPurchase.js"></script>
    
</body> 
</html>

<%
    }
    else
    {
        response.sendRedirect("login_register.jsp");
    }
%>