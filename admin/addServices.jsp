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
    <link rel="stylesheet" href="../CSS/login-register.css">

    <title>TorqueMaster Garage - A place where we ensure your vehicles value</title>
</head>
<body>
        <nav>
            <a href="../index.html" class="logo"><img src="../Media//Red_Car_Tire_Transportation_Free_Logo-removebg.png" alt=""></a>
        </nav>
        <div class="parent-nav">            
            <div class="nav-content">
                <a href="welcomeadmin.jsp">home</a>
                <a href="addServices.jsp" class="activated">Add Services</a>
                <a href="addPlans.jsp">Add Plans</a>
                <a href="#history" class="history">Services History</a>
                <a href="logout.jsp" target="_self">Logout</a>
            </div>
            <span class="icons">
                <i class="ri-menu-fold-line menu"></i>
                <i class="ri-close-fill close"></i>
            </span>
        </div>

    <%@include file="../JSP/connect.jsp" %>
        <main>
            <div class="page1">

                <div class="customer-details">
                    <div class="table-heading">
                        <h3>Our Services</h3>
                        <div class="search-filter">
                            <input type="search" placeholder="Search Details">
                            <i class="ri-close-line"></i>
                        </div>
                    </div>
                    <section class="table-body">
                        <table>
                            <thead>
                                <tr>
                                    <th>Service ID</th>
                                    <th>Service Name</th>
                                    <th>Service Charge</th>
                                    <th>Discount</th>
                                    <th>Total</th>
                                    <th>Delete</th>
                                    <th>Edit</th>
                                    <th><button class="addPlans">Add</button></th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                int sr=0;
                                stmt=con.createStatement();
                                rs=stmt.executeQuery("select * from services_plans order by sid desc");
                                while(rs.next()){
                                    sr++;
                                %>
                                <tr>
                                    <td><%= sr %></td>
                                    <td><%= rs.getString("serv_name") %></td>
                                    <td><%= rs.getString("serv_charge") %></td>
                                    <td><%= rs.getString("discount") %></td>
                                    <td><%= rs.getString("total") %></td>
                                    <td>
                                    <a style="text-decoration:none" href='../JSP/action.jsp?sid=<%= rs.getInt("sid") %>&action=deleteservices' onclick="return(confirm('Are you sure to delete?'))"><button class="delete-button">
                                    <svg class="delete-svgIcon" viewBox="0 0 448 512">
                                    <path d="M135.2 17.7L128 32H32C14.3 32 0 46.3 0 64S14.3 96 32 96H416c17.7 0 32-14.3 32-32s-14.3-32-32-32H320l-7.2-14.3C307.4 6.8 296.3 0 284.2 0H163.8c-12.1 0-23.2 6.8-28.6 17.7zM416 128H32L53.2 467c1.6 25.3 22.6 45 47.9 45H346.9c25.3 0 46.3-19.7 47.9-45L416 128z"></path></svg></button></a>
                                    </td>
                                    <td>
                                    <a style="text-decoration:none" href='editServices.jsp?sid=<%= rs.getInt("sid") %>&action=editservice' onclick="return(confirm('Are you sure to Edit?'))"><button class="edit-button">
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


                <div class="addPlansForm container-register">

                    <form class="form" action="../JSP/action.jsp">
                    <input type="hidden" name="action" value="addservices">
                    <p class="title">Add Services </p>
                    
                    <div class="flex">
                        <label>
                            <input required="" placeholder="" type="text" class="input" name="sname">
                            <span>Service Name</span>
                        </label>

                        <label>
                            <input required="" placeholder="" type="text" class="input" name="scharge" id="charge">
                            <span>Service Charge</span>
                        </label>
                    </div>  

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

            <div class="page2"> 

                <div id="history">
                    <div class="customer-details">
                        <div class="table-heading">
                            <h3>Our Services</h3>
                            <div class="search-filter">
                                <input type="search" placeholder="Search Details">
                                <i class="ri-close-line"></i>
                            </div>
                        </div>
                        <section class="table-body">
                            <table>
                                <thead>
                                    <tr>
                                        <th>Service ID</th>
                                        <th>Service Name</th>
                                        <th>Service Charge</th>
                                        <th>Contact</th>
                                        <th>Location</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                    int sr1=0;
                                    stmt=con.createStatement();
                                    rs=stmt.executeQuery("select * from services_history order by sid desc");
                                    while(rs.next()){
                                        sr1++;
                                    %>
                                    <tr>
                                        <td><%= sr1 %></td>
                                        <td><%= rs.getString("serv_name") %></td>
                                        <td><%= rs.getString("serv_charge") %></td>
                                        <td><%= rs.getString("contact_person") %></td>
                                        <td><%= rs.getString("location") %></td>
                                    </tr> 
                                    <%
                                    }
                                    %>
                                </tbody>
                            </table>
                        </section>
                    </div>
                </div>

            </div>
            
        </main>
       
    <!-- Script -->
    <script type="module" src="../JS/service.js"></script>
</body>
</html>