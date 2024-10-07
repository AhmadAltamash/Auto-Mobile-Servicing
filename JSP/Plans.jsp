<!DOCTYPE html>
<%@include file="connect.jsp" %> 
<html lang="en">
<%
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
    <link rel="stylesheet" href="../CSS/login-register.css">
    <link rel="stylesheet" href="../CSS/plan.css">
    <title>
        Membership Plan Details
    </title>
</head>

<body>
        <nav>
            <a href="../index.jsp" class="logo"><img src="../Media//Red_Car_Tire_Transportation_Free_Logo-removebg.png" alt=""></a>
        </nav>
        <div class="parent-nav">            
            <div class="nav-content">
                <a href="../index.jsp">home</a>
            </div>
            <span class="icons">
                <i class="ri-menu-fold-line menu"></i>
                <i class="ri-close-fill close"></i>
            </span>
        </div>

    <main class="main">
        
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

    </main>


    <!-- Script -->
    <script src="../JS/user.js"></script>
</body>

</html>