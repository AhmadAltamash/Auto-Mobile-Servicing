<!DOCTYPE html>
<%@include file="connect.jsp" %> 
<html lang="en">
<%
    String firstname=(String)session.getAttribute("f_name");
    String Cid=(String)session.getAttribute("rid");
    if (firstname !=null){
        String planname=(String)session.getAttribute("plan_name");
        if(planname != null){
            String planid=(String)session.getAttribute("pid");
        }
%>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@300..700&display=swap" rel="stylesheet"/>
    <link rel="shortcut icon" href="../Media/favicon.png" type="image/x-icon" />
    <link href="https://cdn.jsdelivr.net/npm/remixicon@4.3.0/fonts/remixicon.css" rel="stylesheet"/>
    <link rel="stylesheet" href="../CSS/plan.css">
    <link rel="stylesheet" href="../CSS/user.css">
    <title>
        Plans
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

        <main>
            <div class="multiple-links">
                <a href="users.jsp">Edit Profile</a>
                <a href="Services.jsp">Services</a>
                <a href="myBookings.jsp">My Bookings</a>
                <a href="#" class="activated">Plan Member</a>
                <a href="bill.jsp">Billing</a>
            </div>
        
            <%-- Subscribed Plan --%>
            <div class="planSubscribed">
            <h1 class="headPlan">Subscribed Plan</h1>
            <%
                stmt = con.createStatement();
                rs = stmt.executeQuery("SELECT * FROM customers_plan WHERE cust_id = '" + Cid + "'");

                if (rs.next()) { 
                    int planId = rs.getInt("cpid");

                    if (planId == 1 || planId == 2 || planId == 3) {
                        String planName = rs.getString("plan_name");
                        String validFrom = rs.getString("valid_from");
                        String validTo = rs.getString("valid_to");
            %>
                        <p class="plansPara">You have subscribed to the plan: <strong><%= planName %></strong></p>
                        <p class="plansPara">Which is valid from: <strong><%= validFrom %></strong> to <strong><%= validTo %></strong></p>
                        <p class="plansPara">You Can Avail The Facility Of the Plan</p>
            
            <div class="plans-card">
            <div class="gold">
                <span class="plan-heading">
                    <h1>Membership Plan</h1>
                    <p>for Torque Master Garage</p>
                </span>
                <div class="plan-content">
                    <h2>Gold</h2>
                    <span>
                        <p>Rs.</p>
                        <%

                            stmt = con.createStatement();
                            rs = stmt.executeQuery("SELECT * FROM plans");

                            int rowIndex = 0;
                            while (rs.next()) {
                                rowIndex++;
                                if (rowIndex == 2) {
                                    
                                    %>
                                    <p><%= rs.getInt("plan_charge") %></p>
                                    <%
                                    break;
                                }
                            }
                        %>
                        <p>/year</p>
                    </span>
                    <p>charges may vary after discount</p>
                </div>

                <div class="details">
                    <div class="list-details">
                        <ul>
                            <h4>Two-Wheeler</h4>
                            <li>Free oil change (twice a year)</li>
                            <li>15% off on all repairs</li>
                            <li>Free brake and clutch inspection</li>
                            <li>Free tire rotation</li>
                            <li>Priority service</li>
                        </ul>
                        <ul>
                            <h4>Four-Wheeler</h4>
                            <li>Free oil change (twice a year)</li>
                            <li>15% off on all repairs</li>
                            <li>Free brake and clutch inspection</li>
                            <li>Free tire rotation</li>
                            <li>Priority service</li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="silver">
                    <span class="plan-heading">
                        <h1>Membership Plan</h1>
                        <p>for Torque Master Garage</p>
                    </span>
                    <div class="plan-content">
                    <h2>Silver</h2>
                    <span>
                        <p>Rs.</p>
                        <%

                            stmt = con.createStatement();
                            rs = stmt.executeQuery("SELECT * FROM plans");

                            int rowIndexx = 0;
                            while (rs.next()) {
                                rowIndexx++;
                                if (rowIndexx == 1) {
                                    
                                    %>
                                    <p><%= rs.getInt("plan_charge") %></p>
                                    <%
                                    break;
                                }
                            }
                        %>
                        <p>/year</p>
                    </span>
                    <p>charges may vary after discount</p>
                </div>

                <div class="details">
                    <div class="list-details">
                        <ul>
                            <h4>Two-Wheeler</h4>
                            <li>Free oil change (once a year)</li>
                            <li>10% off on minor repairs (brakes, chain adjustment)</li>
                            <li>Free tire pressure check</li>
                            <li>Complimentary vehicle inspection</li>
                        </ul>
                        <ul>
                            <h4>Four-Wheeler</h4>
                            <li>Free oil change (once a year)</li>
                            <li>10% off on minor repairs (brakes, tyres alignment)</li>
                            <li>Free tire pressure check</li>
                            <li>Complimentary vehicle inspection</li>
                        </ul>
                    </div>
                </div>
            </div>
            
            <div class="platinum">
                <span class="plan-heading">
                    <h1>Membership Plan</h1>
                    <p>for Torque Master Garage</p>
                </span>
                <div class="plan-content">
                    <h2>Platinum</h2>
                    <span>
                        <p>Rs.</p>
                        <%

                            stmt = con.createStatement();
                            rs = stmt.executeQuery("SELECT * FROM plans");

                            int rowIndexxx = 0;
                            while (rs.next()) {
                                rowIndexxx++;
                                if (rowIndexxx == 3) {
                                    
                                    %>
                                    <p><%= rs.getInt("plan_charge") %></p>
                                    <%
                                    break;
                                }
                            }
                        %>
                        <p>/year</p>
                    </span>
                    <p>charges may vary after discount</p>
                </div>

                <div class="details">
                    <div class="list-details">
                        <ul>
                            <h4>Two-Wheeler</h4>
                            <li>Free oil change (quarterly)</li>
                            <li>20% off on all repairs</li>
                            <li>Free brake, clutch, and suspension inspection</li>
                            <li>Free tire rotation and replacement (once a year)</li>
                            <li>Roadside assistance</li>
                            <li>Complimentary annual detailing</li>
                        </ul>
                        <ul>
                            <h4>Four-Wheeler</h4>
                            <li>Free oil change (quarterly)</li>
                            <li>20% off on all repairs</li>
                            <li>Free brake, clutch, and suspension inspection</li>
                            <li>Free tire rotation and replacement (once a year)</li>
                            <li>Roadside assistance</li>
                            <li>Complimentary annual detailing</li>
                        </ul>
                    </div>
                </div>
            </div>
            </div>

            <%
                    } else {
            %>
                        <p class="plansPara">You Haven't Subscribed To Any Plan Yet.</p>
                        <p class="plansPara">Purchase Now! For Awesome Deals and Discounts</p>
            <%
                    }
                } else {
            %>
                <p class="plansPara">You Haven't Subscribed To Any Plan Yet.</p>
                <p class="plansPara">Purchase Now! For Awesome Deals and Discounts</p>
            
            <div class="plans-card">
            <div class="gold">
                <span class="plan-heading">
                    <h1>Membership Plan</h1>
                    <p>for Torque Master Garage</p>
                </span>
                <div class="plan-content">
                    <h2>Gold</h2>
                    <span>
                        <p>Rs.</p>
                        <%

                            stmt = con.createStatement();
                            rs = stmt.executeQuery("SELECT * FROM plans");

                            int rowIndex = 0;
                            while (rs.next()) {
                                rowIndex++;
                                if (rowIndex == 2) {
                                    
                                    %>
                                    <p><%= rs.getInt("plan_charge") %></p>
                                    <%
                                    break;
                                }
                            }
                        %>
                        <p>/year</p>
                    </span>
                    <p>charges may vary after discount</p>
                </div>

                <div class="details">
                    <div class="list-details">
                        <ul>
                            <h4>Two-Wheeler</h4>
                            <li>Free oil change (twice a year)</li>
                            <li>15% off on all repairs</li>
                            <li>Free brake and clutch inspection</li>
                            <li>Free tire rotation</li>
                            <li>Priority service</li>
                        </ul>
                        <ul>
                            <h4>Four-Wheeler</h4>
                            <li>Free oil change (twice a year)</li>
                            <li>15% off on all repairs</li>
                            <li>Free brake and clutch inspection</li>
                            <li>Free tire rotation</li>
                            <li>Priority service</li>
                        </ul>
                    </div>
                    <a style="text-decoration:none" href='planPurchase.jsp?bid=<%= rs.getInt("pid") %>'><button class="button-pro"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 36 24"><path d="m18 0 8 12 10-8-4 20H4L0 4l10 8 8-12z"></path></svg>Unlock Pro</button></a>
                </div>
            </div>
            <div class="silver">
                    <span class="plan-heading">
                        <h1>Membership Plan</h1>
                        <p>for Torque Master Garage</p>
                    </span>
                    <div class="plan-content">
                    <h2>Silver</h2>
                    <span>
                        <p>Rs.</p>
                        <%

                            stmt = con.createStatement();
                            rs = stmt.executeQuery("SELECT * FROM plans");

                            int rowIndexx = 0;
                            while (rs.next()) {
                                rowIndexx++;
                                if (rowIndexx == 1) {
                                    
                                    %>
                                    <p><%= rs.getInt("plan_charge") %></p>
                                    <%
                                    break;
                                }
                            }
                        %>
                        <p>/year</p>
                    </span>
                    <p>charges may vary after discount</p>
                </div>

                <div class="details">
                    <div class="list-details">
                        <ul>
                            <h4>Two-Wheeler</h4>
                            <li>Free oil change (once a year)</li>
                            <li>10% off on minor repairs (brakes, chain adjustment)</li>
                            <li>Free tire pressure check</li>
                            <li>Complimentary vehicle inspection</li>
                        </ul>
                        <ul>
                            <h4>Four-Wheeler</h4>
                            <li>Free oil change (once a year)</li>
                            <li>10% off on minor repairs (brakes, tyres alignment)</li>
                            <li>Free tire pressure check</li>
                            <li>Complimentary vehicle inspection</li>
                        </ul>
                    </div>
                    <a style="text-decoration:none" href='planPurchase.jsp?bid=<%= rs.getInt("pid") %>'><button class="button-pro"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 36 24"><path d="m18 0 8 12 10-8-4 20H4L0 4l10 8 8-12z"></path></svg>Unlock Pro</button></a>
                </div>
            </div>
            
            <div class="platinum">
                <span class="plan-heading">
                    <h1>Membership Plan</h1>
                    <p>for Torque Master Garage</p>
                </span>
                <div class="plan-content">
                    <h2>Platinum</h2>
                    <span>
                        <p>Rs.</p>
                        <%

                            stmt = con.createStatement();
                            rs = stmt.executeQuery("SELECT * FROM plans");

                            int rowIndexxx = 0;
                            while (rs.next()) {
                                rowIndexxx++;
                                if (rowIndexxx == 3) {
                                    
                                    %>
                                    <p><%= rs.getInt("plan_charge") %></p>
                                    <%
                                    break;
                                }
                            }
                        %>
                        <p>/year</p>
                    </span>
                    <p>charges may vary after discount</p>
                </div>

                <div class="details">
                    <div class="list-details">
                        <ul>
                            <h4>Two-Wheeler</h4>
                            <li>Free oil change (quarterly)</li>
                            <li>20% off on all repairs</li>
                            <li>Free brake, clutch, and suspension inspection</li>
                            <li>Free tire rotation and replacement (once a year)</li>
                            <li>Roadside assistance</li>
                            <li>Complimentary annual detailing</li>
                        </ul>
                        <ul>
                            <h4>Four-Wheeler</h4>
                            <li>Free oil change (quarterly)</li>
                            <li>20% off on all repairs</li>
                            <li>Free brake, clutch, and suspension inspection</li>
                            <li>Free tire rotation and replacement (once a year)</li>
                            <li>Roadside assistance</li>
                            <li>Complimentary annual detailing</li>
                        </ul>
                    </div>
                    <a style="text-decoration:none" href='planPurchase.jsp?bid=<%= rs.getInt("pid") %>'><button class="button-pro"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 36 24"><path d="m18 0 8 12 10-8-4 20H4L0 4l10 8 8-12z"></path></svg>Unlock Pro</button></a>
                </div>
            </div>
            </div> 

            <%
                }
            %>
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
        response.sendRedirect("login_register.jsp");
    }
%>