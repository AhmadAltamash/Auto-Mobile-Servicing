<%@page import="java.sql.*" %>
<%@include file="connect.jsp" %>
<%
    String firstname=(String)session.getAttribute("f_name");
    String Cid=(String)session.getAttribute("rid");
    if (firstname !=null){
       
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
        Invoice & Bills
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
                <a href="bill.jsp">Billing</a>
            </div>
            <span class="icons">
                <i class="ri-menu-fold-line menu"></i>
                <i class="ri-close-fill close"></i>
            </span>
        </div>

    <main class="main">
            <div id="parent">
                
                <div class="customer-details">
                    <div class="table-heading">
                        <h3>Bookings</h3>
                    </div>
                    <section class="table-body">
                        <table>
                            <thead>
                                <tr>
                                    <th>Sr.No.</th>
                                    <th>Bill No.</th>
                                    <th>Service Name</th>
                                    <th>Service Price</th>
                                    <th>Date of Booking</th>
                                    <th>Invoice</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                int sr=0;
                                stmt=con.createStatement();
                                rs=stmt.executeQuery("SELECT * from billing where cust_id='"+Cid+"' ORDER BY billsr DESC");
                                while(rs.next()){
                                    sr++;
                                %>
                                <tr>
                                    <td><%= sr %></td>
                                    <td><%= rs.getString("billno") %></td>
                                    <td><%= rs.getString("serv_name") %></td>
                                    <td><%= rs.getString("serv_charge") %></td>
                                    <td><%= rs.getString("billdate") %></td>
                                    <td><a href='invoice.jsp?billno=<%= rs.getInt("billno") %>'><button class='btn-chk-in'>Download Invoice</button></a></td>
                                </tr> 
                                <%
                                }
                                %>
                            </tbody>
                        </table>
                    </section>
                </div>

            </div>
    </main>

    <!-- Script -->
    <script src="../JS/user.js"></script>
</body> 
</html>

<%
    }
    else
    {
        response.sendRedirect("login_register.jsp");
    }
%>