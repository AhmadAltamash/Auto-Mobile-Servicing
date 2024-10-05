<%@page import="java.sql.*" %>
<%@include file="../JSP/connect.jsp" %>
<%
    String fullname=(String)session.getAttribute("full_name");
    if (fullname !=null){
    int billno = Integer.parseInt(request.getParameter("billno"));
    int custId = Integer.parseInt(request.getParameter("custID"));
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
    <link rel="stylesheet" href="../CSS/invoice.css">
    <title>
        Invoice & Bills
    </title>
    <script>
        function printDiv(divId) {
        var printContents = document.getElementById(divId).innerHTML;
        var originalContents = document.body.innerHTML;

        document.body.innerHTML = printContents;

        window.print();

        document.body.innerHTML = originalContents;
        }
    </script>
</head>

<body>

    <main id="invoiceMain">
        <div id="bill">

            <div class="invoiceHeading">
                <img src="../Media/invoiceLogo.png"/>
                <h1>INVOICE</h1>
            </div>
            
            <div class="details">
                <%
                stmt=con.createStatement();
                rs=stmt.executeQuery("select * from register where rid='"+custId+"'");
                rs.next();
                %>
                <div class="addressDets">
                    <h4>Billed To</h4>
                    <p><% out.print(rs.getString("f_name")+" "+rs.getString("l_name"));%></p>
                    <p>Mobile No. <% out.print(rs.getString("mob"));%></p>
                    <p class="address"><% out.print(rs.getString("address"));%></p>
                </div>

                <div class="infoDate">
                    <p>Bill No. <% out.print(billno);%></p>
                    <%
                        stmt=con.createStatement();
                        rs=stmt.executeQuery("SELECT billdate from billing where cust_id='"+custId+"' and billno='"+billno+"'");
                        rs.next();
                    %>
                    <p>Date: <% out.print(rs.getString("billdate"));%></p>
                </div>
            </div>

            <div class="services">
                <div class="customer-details">
                    <section class="table-body">
                        <table>
                            <thead>
                                <tr>
                                    <th>Sr.No.</th>
                                    <th>Service Name</th>
                                    <th>Service Price</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                int sr=0;
                                int totalbillamt=0;
                                stmt=con.createStatement();
                                rs=stmt.executeQuery("SELECT * from billing where cust_id='"+custId+"' and billno='"+billno+"'  ORDER BY billsr DESC");
                                while(rs.next()){
                                    sr++;
                                    totalbillamt+=rs.getInt("serv_charge");
                                %>
                                <tr>
                                    <td><%= sr %></td>
                                    <td><%= rs.getString("serv_name") %></td>
                                    <td><%= rs.getInt("serv_charge") %></td>
                                </tr> 
                                <%
                                }
                                %>
                                <tr>
                                    <td colspan="2" align="right">Total Rs.</td>
                                    <td><%= totalbillamt %></td>
                                </tr>
                            </tbody>
                        </table>
                    </section>
                </div>
            </div>

            <div class="invoiceFooter">
                <div>
                    <h2>Thank You!</h2>
                    <h3>Contact Us Regarding any issue</h3>
                    <p>Mail: work.torquemaster@gmail.com</p>
                    <p>Mobile No: +91 98768 98768</p>
                </div>
                <div>
                    <h4>Owner's Name</h4>
                    <p>Garage Address: Patna, Bihar</p>
                </div>
            </div>

        </div>

        <button class="Btn" name="btn" type="button" onclick='printDiv("bill")'>
        <svg class="svgIcon" viewBox="0 0 384 512" height="1em" xmlns="http://www.w3.org/2000/svg"><path d="M169.4 470.6c12.5 12.5 32.8 12.5 45.3 0l160-160c12.5-12.5 12.5-32.8 0-45.3s-32.8-12.5-45.3 0L224 370.8 224 64c0-17.7-14.3-32-32-32s-32 14.3-32 32l0 306.7L54.6 265.4c-12.5-12.5-32.8-12.5-45.3 0s-12.5 32.8 0 45.3l160 160z"></path></svg>
        <span class="icon2"></span>
        <span class="tooltip">Print or Download</span>
        </button>
    </main>

    <!-- Script -->
    <script src="../JS/user.js"></script>
</body> 
</html>

<%
    }
    else
    {
        response.sendRedirect("../index.jsp");
    }
%>