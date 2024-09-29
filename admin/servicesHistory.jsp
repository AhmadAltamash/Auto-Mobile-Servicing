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
                        <h3>Services History</h3>
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
                                int sr=0;
                                stmt=con.createStatement();
                                rs=stmt.executeQuery("select * from services_history order by sid desc");
                                while(rs.next()){
                                    sr++;
                                %>
                                <tr>
                                    <td><%= sr %></td>
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

            
            
        </main>
       
    <!-- Script -->
    <script type="module" src="../JS/service.js"></script>
</body>
</html>