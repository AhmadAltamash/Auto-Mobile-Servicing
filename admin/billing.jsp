<%@page import="java.sql.*" %>
<%@include file="../JSP/connect.jsp" %>
<%
   String fullname=(String)session.getAttribute("full_name");
    if (fullname !=null){
      stmt= con.createStatement();
      rs=stmt.executeQuery("select *from counter");
      rs.next();
      int billno=rs.getInt("billno")+1;
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
    <title>
        Bookings
    </title>
</head>

<body>
<nav>
            <a href="index.html" class="logo"><img src="../Media//Red_Car_Tire_Transportation_Free_Logo-removebg.png" alt=""></a>
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
        
        <div class="multiple-links" style="top:5%; height:20em;">
            <a href="addPlans.jsp">Add Plans</a>
            <a href="addServices.jsp">Add Services</a>
            <a href="bookings.jsp" class="showBooking">Bookings</a>
            <a href="billing.jsp" class="activated">Billing</a>
            <a href="servicesHistory.jsp">Services History</a>
        </div>

        <div class="billGenerate">
            <div class="container-register">
                  <form class="form" action="../JSP/action.jsp">
                      <input type="hidden" name="action" value="invoice">
                      <p class="title">Generate Bill </p>
                      
                      <div class="flex">
                          
                          <label>
                              <input required="" placeholder="" type="text"class="input" name="billNo" value="<%= billno %>">
                              <span>Bill No</span>
                          </label>
                          <label>
                              <input required="" placeholder="" type="text"class="input" name="custId">
                              <span>Customer Id</span>
                          </label>
                      </div>  
                      
                      <label>
                          <input required="" placeholder="" type="text" class="input"name="currDate">
                          <span>Bill Date</span>
                      </label> 

                      <label>
                          <input required="" placeholder="" type="text" class="input"name="sname">
                          <span>Service Name</span>
                      </label> 
                      <label>
                          <input required="" placeholder="" type="text" class="input"name="scharge">
                          <span>Service Charge</span>
                      </label>

                      <div class="btn-bill">    
                        <button class="submit" type="submit" value="submit">Submit</button>
                        <a href="../JSP/action.jsp?billno=<%= billno %>&action=newbill" class="submit">New Bill</a>
                      </div>
                      
                  </form>
            </div>
        </div>

        <div id="invoiceTable">
                <div class="customer-details">
                    <div class="table-heading">
                        <h3>Bookings</h3>
                    </div>
                    <section class="table-body">
                        <table>
                            <thead>
                                <tr>
                                    <th>Sr.No.</th>
                                    <th>Customer Id</th>
                                    <th>Customer Name</th>
                                    <th>Contact No.</th>
                                    <th>Service Name</th>
                                    <th>Service Price</th>
                                    <th>Date of Booking</th>
                                    <th>Status</th>
                                    <th>Servicing</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                int sr1=0;
                                stmt=con.createStatement();
                                rs=stmt.executeQuery("SELECT * from booking where service_status = 3 OR service_status = 5 ORDER BY booking_id DESC");
                                while(rs.next()){
                                    sr1++;
                                %>
                                <tr>
                                    <td><%= sr1 %></td>
                                    <td><%= rs.getString("cust_id") %></td>
                                    <td><%= rs.getString("cust_name") %></td>
                                    <td><%= rs.getString("contact") %></td>
                                    <td><%= rs.getString("serv_name") %></td>
                                    <td><%= rs.getString("serv_price") %></td>
                                    <td><%= rs.getString("date_of_booking") %></td>
                                    <td>
                                    <%
                                    if (rs.getInt("service_status") == 1) {
                                        out.println("<span class='booked'>Booked</span>");
                                    } else if (rs.getInt("service_status") == 2) {
                                        out.println("<span class='checked-in'>Checked-In</span>");
                                    } else if (rs.getInt("service_status") == 3) {
                                        out.println("<span class='checked-out'>Services Done</span>");
                                    } else if (rs.getInt("service_status") == 4) {
                                        out.println("<span class='cancelled'>Cancelled</span>");
                                    } else if (rs.getInt("service_status") == 5) {
                                        out.println("<span class='checked-out'>Completed</span>");
                                    }
                                    %>
                                    </td>
                                    <td>
                                        <% if(rs.getInt("service_status") == 1) {%>
                                        <a href='../JSP/action.jsp?id=<%= rs.getInt("booking_id") %>&action=editstatus1'><button class='btn-chk-in'>Check-In</button></a>
                                        <% }else if(rs.getInt("service_status") == 2) {%>
                                        <a href='../JSP/action.jsp?id=<%= rs.getInt("booking_id") %>&action=editstatus2'><button class='btn-chk-in'>Check-Out</button></a>
                                        <% }else if(rs.getInt("service_status") == 3) {%>
                                        <a href='../JSP/action.jsp?id=<%= rs.getInt("booking_id") %>&action=generateInvoice'><button class='btn-chk-in'>Generate Invoice</button></a>
                                        <% }else if(rs.getInt("service_status") == 5) {%>
                                        <a><button class='btn-chk-in'>Invoice Generated</button></a>
                                        <% }%>
                                    </td>
                                </tr> 
                                <%
                                }
                                %>
                            </tbody>
                        </table>
                    </section>
                </div>
        </div>

        <div id="bills">
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
                                    <th>Customer Id</th>
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
                                rs=stmt.executeQuery("SELECT * from billing ORDER BY billsr DESC");
                                while(rs.next()){
                                    sr++;
                                %>
                                <tr>
                                    <td><%= sr %></td>
                                    <td><%= rs.getString("billno") %></td>
                                    <td><%= rs.getString("cust_id") %></td>
                                    <td><%= rs.getString("serv_name") %></td>
                                    <td><%= rs.getString("serv_charge") %></td>
                                    <td><%= rs.getString("billdate") %></td>
                                    <td><a href='../JSP/action.jsp'>
                                    <button class='btn-chk-in'>Download Invoice</button></a></td>
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
    else
    {
        response.sendRedirect("index.jsp");
    }
%>