<%@page import="java.sql.*" %>

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


    <title>TorqueMaster Garage - A place where we ensure your vehicles value</title>
</head>
<body>
        <nav>
            <a href="../index.html" class="logo"><img src="../Media//Red_Car_Tire_Transportation_Free_Logo-removebg.png" alt=""></a>
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

    <%@include file="../JSP/connect.jsp" %>
        <main>
            <div class="multiple-links" style="top:17%; height:20em;">
                <a href="addPlans.jsp" class="activated">Add Plans</a>
                <a href="addServices.jsp">Add Services</a>
                <a href="bookings.jsp" class="showBooking">Bookings</a>
                <a href="billing.jsp">Billing</a>
                <a href="servicesHistory.jsp">Services History</a>
            </div>

            <div class="addPage">

                <div class="customer-details">
                    <div class="table-heading">
                        <h3>Plan Details</h3>
                        <div class="search-filter">
                            <input type="search" placeholder="Search Details">
                            <i class="ri-close-line"></i>
                        </div>
                    </div>
                    <section class="table-body">
                        <table>
                            <thead>
                                <tr>
                                    <th>Plan ID</th>
                                    <th>Plan Name</th>
                                    <th>Plan Charge</th>
                                    <th>Valid-From-Date</th>
                                    <th>Valid-To-Date</th>
                                    <th>Discount</th>
                                    <th>Total</th>
                                    <th>Edit</th>
                                    <th><button class="addPlans">Add</button></th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                int sr=0;
                                stmt=con.createStatement();
                                rs=stmt.executeQuery("select * from plans order by pid desc");
                                while(rs.next()){
                                    sr++;
                                %>
                                <tr>
                                    <td><%= sr %></td>
                                    <td><%= rs.getString("plan_name") %></td>
                                    <td><%= rs.getString("plan_charge") %></td>
                                    <td><%= rs.getString("valid_from_date") %></td>
                                    <td><%= rs.getString("valid_to_date") %></td>
                                    <td><%= rs.getString("discount") %></td>
                                    <td><%= rs.getString("total") %></td>
                                    <td>
                                    <a style="text-decoration:none" href='editPlans.jsp?pid=<%= rs.getInt("pid") %>&action=editplan' onclick="return(confirm('Are you sure to Edit?'))"><button class="edit-button">
                                    <svg class="svg-icon" fill="none" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg"><g stroke="#a649da" stroke-linecap="round" stroke-width="2"><path d="m20 20h-16"></path><path clip-rule="evenodd" d="m14.5858 4.41422c.781-.78105 2.0474-.78105 2.8284 0 .7811.78105.7811 2.04738 0 2.82843l-8.28322 8.28325-3.03046.202.20203-3.0304z" fill-rule="evenodd"></path></g></svg>
                                    <span class="lable">Edit</span>
                                    </button></a>
                                    </td>
                                </tr> 
                                <%
                                }
                                %>
                            </tbody>
                        </table>
                    </section>
                </div>

                <div class="addPlansForm">

                    <form class="form" action="../JSP/action.jsp">
                    <input type="hidden" name="action" value="addplans">
                    <p class="title">Add Plans </p>
                    
                    <div class="flex">
                        <label>
                            <input required="" placeholder="" type="text" class="input" name="pname">
                            <span>Plan Name</span>
                        </label>

                        <label>
                            <input required="" placeholder="" type="text" class="input" name="pcharge" id="charge">
                            <span>Plan Charge</span>
                        </label>
                    </div>  

                    <label>
                        <input required="" placeholder="none" type="date" class="input" name="valid_date">
                        <span style="top:30px;font-size: 0.7em;font-weight: 600;color: green;">Valid From Date</span>
                    </label>
                    <label>
                        <input required="" placeholder="" type="date" class="input" name="to_date" >
                        <span style="top:30px;font-size: 0.7em;font-weight: 600;color: green;">Valid To Date</span>
                    </label>
                    
                    <label>
                        <input required="" placeholder="" type="text" class="input" name="disc" id="disc">
                        <span>Discount</span>
                    </label>
                    <label>
                        <input required="" placeholder="" type="text" class="input" name="total" id="total">
                        <span>Total</span>
                    </label>
                    
                    <button class="submit" type="submit" value="add">Add</button>
                    
                    </form>

                </div>

            </div>
            
        </main>
       
    <!-- Script -->
    <script type="module" src="../JS/plans.js"></script>
</body>
</html>