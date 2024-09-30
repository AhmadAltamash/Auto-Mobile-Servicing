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

    <title>Customers</title>
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
        <main id="main">
             <div class="multiple-links" style="right:10.2%;">
                <a href="addPlans.jsp">Add Plans</a>
                <a href="addServices.jsp">Add Services</a>
                <a href="bookings.jsp" class="showBooking">Bookings</a>
                <a href="billing.jsp">Billing</a>
                <a href="Customers.jsp" class="activated">Customer's Details</a>
            </div>
            <div class="customerDets">
                 <div class="customer-details hideContent" id="details">
                    <div class="table-heading">
                        <h3>Customer's details</h3>
                        <div class="search-filter">
                            <input type="search" placeholder="Search Details">
                            <i class="ri-close-line"></i>
                        </div>
                    </div>
                    <section class="table-body">
                        <table>
                            <thead>
                                <tr>
                                    <th>Sr.No.</th>
                                    <th>Customer Id</th>
                                    <th>First Name</th>
                                    <th>Last Name</th>
                                    <th>Email</th>
                                    <th>Mobile No.</th>
                                    <th>Vehicle Name</th>
                                    <th>Vehicle Type</th>
                                    <th>Vehicle No.</th>
                                    <th>Vehicle Model</th>
                                    <th>Address</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                int sr=0;
                                stmt=con.createStatement();
                                rs=stmt.executeQuery("select * from register order by rid desc");
                                while(rs.next()){
                                    sr++;
                                %>
                                <tr>
                                    <td><%= sr %></td>
                                    <td><%= rs.getInt("rid") %></td>
                                    <td><%= rs.getString("f_name") %></td>
                                    <td><%= rs.getString("l_name") %></td>
                                    <td><%= rs.getString("email") %></td>
                                    <td><%= rs.getString("mob") %></td>
                                    <td><%= rs.getString("vehicle_name") %></td>
                                    <td><%= rs.getString("vehicle_type") %></td>
                                    <td><%= rs.getString("vehicle_num") %></td>
                                    <td><%= rs.getString("vehicle_model") %></td>
                                    <td><%= rs.getString("address") %></td>
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
    <script type="module" src="../JS/Welcome.js"></script>
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

        function search(){
        let details = document.querySelector(".search-filter input");
        let icon = document.querySelector(".search-filter i");
        const tableRows = document.querySelectorAll("tbody tr");

        icon.style.display = "none";

        details.addEventListener('input', searchTable)
        function searchTable(){
            tableRows.forEach((row, i)=>{
                icon.style.display = "block";
                let tableData = row.textContent.toLowerCase(), searchData = details.value.toLowerCase();

                row.classList.toggle('hide', tableData.indexOf(searchData)<0)
                row.style.setProperty('--delay', i/25 + 's')
                if(tableData.indexOf(searchData)>0)
                {
                    icon.addEventListener("click",()=>{
                        details.value = "";
                        row.classList.remove('hide')
                        icon.style.display = "none"
                    })
                }
            })
            document.querySelectorAll("tbody tr:not(.hide)").forEach((visibleRows, i)=>{
                visibleRows.style.backgroundColor = (i % 2 == 0) ? '#f6f6f6a4': 'rgba(255, 255, 255, 0.782)';
            })
        }
        }   

        profile()
        search()
    </script>
</body>
</html>