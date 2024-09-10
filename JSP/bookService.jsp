<%@page import="java.sql.*" %>
<%@include file="connect.jsp" %>
<%
    String firstname=(String)session.getAttribute("f_name");
    String Cid=(String)session.getAttribute("rid");
    if (firstname !=null){
        int sidFetch=Integer.parseInt(request.getParameter("bid"));
        int ridFetch=Integer.parseInt(Cid);
        stmt=con.createStatement();
        rs=stmt.executeQuery("select * from services_plans where sid='"+sidFetch+"'");
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
        Book For A Service
    </title>
</head>

<body>
<nav>
            <a href="index.html" class="logo"><img src="../Media//Red_Car_Tire_Transportation_Free_Logo-removebg.png" alt=""></a>
        </nav>
        <div class="parent-nav">            
            <div class="nav-content">
                <a href="welcomeuser.jsp">home</a>
                <a href="bookService.jsp" class="activated">bookings</a>
                <a href="billing.jsp">Billing</a>
            </div>
            <span class="icons">
                <i class="ri-menu-fold-line menu"></i>
                <i class="ri-close-fill close"></i>
            </span>
        </div>

    <main class="main">
            <div id="parent">
                <div class="bookServices container-register">

                    <form class="form" method="post" action="../JSP/action.jsp">
                    <input type="hidden" name="action" value="bookservice">
                    <p class="title">Book For A Service</p>
                   
                    <div class="flex">
                        <label>
                            <input required="" placeholder="" type="text" class="input" name="sid" value='<% out.println(rs.getString("sid"));%>' readonly >
                            <span style="top:30px;font-size: 0.7em;font-weight: 600;color: green;">Service Id</span>
                        </label>


                        <label>
                            <input required="" placeholder="" type="text" class="input" name="rid"  readonly value='<% out.println(Cid);%>' >
                            <span style="top:30px;font-size: 0.7em;font-weight: 600;color: green;">Customer Id</span>
                        </label>
                    </div>  

                    <label>
                        <input required="" class="input" name="sname" type="text" readonly value='<% out.println(rs.getString("serv_name"));%>'>
                        <span style="top:30px;font-size: 0.7em;font-weight: 600;color: green;">Service Name</span>
                    </label>

                    <label>
                        <input required="" class="input" name="sprice" type="text" readonly value='<% out.println(rs.getString("total"));%>'>
                        <span style="top:30px;font-size: 0.7em;font-weight: 600;color: green;">Price</span>
                    </label>

                    <label>
                        <input required="" class="input" name="date" type="date" id="dateInput">
                        <span style="top:30px;font-size: 0.7em;font-weight: 600;color: green;">Booking Date</span>
                    </label>

                    <label>
                        <input type="text" id="dayOutput" name="day" readonly class="input"/>
                        <span class="daySpan">Booking Day</span>
                    </label>

                    
                    <label>
                        <select name="time" id="time" class="selectOption">
                            <option value="">--When You're Coming to see us--</option>
                            <option value="09:00:00">09:00:00 A.M.</option>
                            <option value="10:00:00">10:00:00 A.M.</option>
                            <option value="11:00:00">11:00:00 A.M.</option>
                            <option value="12:00:00">12:00:00 P.M.</option>
                            <option value="01:00:00">01:00:00 P.M.</option>
                            <option value="02:00:00">02:00:00 P.M.</option>
                            <option value="03:00:00">03:00:00 P.M.</option>
                        </select>
                    </label>

                    <label>
                        <input type="text" id="currentTime" name="currentTime" class="input" readonly/>
                        <span style="top:30px;font-size: 0.7em;font-weight: 600;color: green;">Time Of Booking</span>
                    </label>

                    
                    <button class="submit" type="submit">Book</button>
                    
                    </form>
                </div>
            </div>
    </main>
        <%
       if(request.getParameter("msg")!= null)
       {
        out.println("<p>"+ request.getParameter("msg")+"</p>");
       }
       %>

    <!-- Script -->
    <script src="../JS/bookService.js"></script>
</body> 
</html>

<%
    }
    else
    {
        response.sendRedirect("login_register.jsp");
    }
%>