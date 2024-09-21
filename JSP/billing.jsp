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
    <link rel="stylesheet" href="../CSS/biling.css">
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
                <a href="billing.jsp" class="activated">Billing</a>
                <a href="bookService.jsp">bookings</a>
            </div>
            <span class="icons">
                <i class="ri-menu-fold-line menu"></i>
                <i class="ri-close-fill close"></i>
            </span>
        </div>

    <main class="main">
        

        <button class="btdownload">
        <span class="btdownload-content">Download </span>
        </button>
    
        <div class="invoice">
            <nav>
                <div class="logo">
                    <img src="../Media/invoiceLogo.png">
                </div>
                <h2>Invoice</h2>
            </nav>

            <div class="detailsAndDate">
                <%
                    stmt=con.createStatement();
                    rs=stmt.executeQuery("SELECT * from register where rid='"+Cid+"'");
                    rs.next();
                %>
                <div class="cust-address">
                    <h3>Billed To</h3>
                    <p><%= rs.getString("f_name") +" "+ rs.getString("l_name")%></p>
                    <p><%= rs.getString("address")%></p>
                </div>

                <%
                    stmt=con.createStatement();
                    rs=stmt.executeQuery("SELECT * from booking where cust_id='"+Cid+"'");
                    rs.next();
                    int serial=1;
                %>
                <div id="date">
                    <p>Invoice No. <%= serial++%></p>
                    <p>Date: <%= rs.getString("date_of_booking")%></p>
                </div>
            </div>

            <div class="billDetails">
                <table>
                    <thead>
                        <tr>
                            <th>Sr. No.</th>
                            <th>Services</th>
                            <th>Price</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            stmt = con.createStatement();
                            rs = stmt.executeQuery("SELECT * FROM booking WHERE cust_id='" + Cid + "' AND service_status = 3");

                            int serial2 = 1; 
                            while(rs.next()){
                        %>
                        <tr>
                            <td><%= serial2++ %></td>
                            <td><%= rs.getString("serv_name") %></td>
                            <td class="price"><%= rs.getString("serv_price") %></td>
                        </tr>
                        <% 
                            }
                        %>
                    </tbody>
                </table>

                <div class="total">
                    <p>Discount Applied 5%</p>
                    <label for="sum">Total</label>
                    <input name="sum" id="sum" type="text" readonly/>
                </div>
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
    <script src="../JS/billing.js"></script>
</body> 
</html>

<%
    }
    else
    {
        response.sendRedirect("login_register.jsp");
    }
%>