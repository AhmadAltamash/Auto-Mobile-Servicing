<%@page import="java.sql.*" %>
<%@include file="../JSP/connect.jsp" %>
<%
   String fullname=(String)session.getAttribute("full_name");
    if (fullname !=null){
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
    <title>
        Managing Plans
    </title>
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
                <a href="profile.jsp">Edit Profile</a>
                <a href="addPlans.jsp">Add Plans</a>
                <a href="addServices.jsp">Add Services</a>
                <a href="bookings.jsp" class="showBooking">Bookings</a>
                <a href="billing.jsp">Billing</a>
                <a href="Customers.jsp">Customer's Details</a>
                <a href="#" class="activated">Plans Management</a>
            </div>

            <div id="BookingTable">
                
                <div class="customer-details">
                    <div class="table-heading">
                        <h3>Managing Plans</h3>
                    </div>
                    <section class="table-body">
                        <table>
                            <thead>
                                <tr>
                                    <th>Sr.No.</th>
                                    <th>Plan Id</th>
                                    <th>Customer Id</th>
                                    <th>Customer Name</th>
                                    <th>Plan Name</th>
                                    <th>Plan Price</th>
                                    <th>Purchased On</th>
                                    <th>Validity Till</th>
                                    <th>Status</th>
                                    <th>Remove</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                int sr1=0;
                                stmt=con.createStatement();
                                rs=stmt.executeQuery("SELECT * from customers_plan ORDER BY cpsr DESC");
                                while(rs.next()){
                                    sr1++;
                                %>
                                <tr>
                                    <td><%= sr1 %></td>
                                    <td><%= rs.getString("cpid") %></td>
                                    <td><%= rs.getString("cust_id") %></td>
                                    <td><%= rs.getString("cust_name") %></td>
                                    <td><%= rs.getString("plan_name") %></td>
                                    <td><%= rs.getString("price") %></td>
                                    <td><%= rs.getString("valid_from") %></td>
                                    <td><%= rs.getString("valid_to") %></td>
                                    <td>
                                        <% if(rs.getInt("status") == 1) {%>
                                        <a href='../JSP/action.jsp?cpid=<%= rs.getInt("cpid") %>&custid=<%= rs.getInt("cust_id") %>&action=expireSubscribedPlan'><button class='activeButton'>Active</button></a>
                                        <% }else if(rs.getInt("status") == 2) {%>
                                        <button class='expireButton'>Expired</button></a>
                                        <% } %>
                                    </td>
                                    <td>
                                        <% if(rs.getInt("status") == 2) {%>
                                        <a href='../JSP/action.jsp?cpid=<%= rs.getInt("cpid") %>&custid=<%= rs.getInt("cust_id") %>&action=deleteSubscribedPlan'><button class='deleteButton'>Remove</button></a>
                                        <% } %>
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
        response.sendRedirect("../index.jsp");
    }
%>