<%@page import="java.sql.*" %>
<%@include file="../JSP/connect.jsp" %>
<%!
    int sid_edit;
%>
<%
    sid_edit=Integer.parseInt(request.getParameter("sid"));
    stmt=con.createStatement();
    rs=stmt.executeQuery("select * from services_plans where sid='"+sid_edit+"'");
    rs.next();
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
        Edit Services
    </title>
</head>

<body>
        <nav>
            <a href="../index.jsp" class="logo"><img src="../Media//Red_Car_Tire_Transportation_Free_Logo-removebg.png" alt=""></a>
        </nav>
        <div class="parent-nav">            
            <div class="nav-content">
                <a href="../index.html">home</a>
                <a href="index.jsp" target="_blank" class="activated">Admin Login</a>
            </div>
            <span class="icons">
                <i class="ri-menu-fold-line menu"></i>
                <i class="ri-close-fill close"></i>
            </span>
        </div>

    <main class="main">

        <div id="Edit">
                <div class="editServices container-register">

                    <form class="form" method="post" action="../JSP/action.jsp">
                    <input type="hidden" name="action" value="editservice">
                    <p class="title">Edit Services</p>
                    
                    <label>
                        <input required="" placeholder="" type="text" readonly class="input" name="sid" id="sid" value= '<% out.println(rs.getInt("sid"));%>'> 
                    </label>

                    <div class="flex">
                        <label>
                            <input required="" placeholder="" type="text" class="input" name="sname" value="<% out.println(rs.getString("serv_name"));%>">
                            <span>Service Name</span>
                        </label>

                        <label>
                            <input required="" placeholder="" type="text" class="input" name="scharge" id="charge" value="<% out.println(rs.getString("serv_charge"));%>">
                            <span>Service Charge</span>
                        </label>
                    </div>  

                    <label>
                        <input required="" placeholder="" type="text" class="input" name="disc" id="disc" value="<% out.println(rs.getString("discount"));%>">
                        <span>Discount</span>
                    </label>
                    <label>
                        <input required="" placeholder="" type="text" class="input" name="total" id="total" value="<% out.println(rs.getString("total"));%>">
                        <span>Total</span>
                    </label>
                    
                    <button class="submit" type="submit" value="add">Edit</button>
                    
                    </form>
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
    <script>
        function cal(){
        let charge = document.querySelector("#charge");
        let discount = document.querySelector("#disc");
        let total = document.querySelector("#total");

        charge.addEventListener("input", calculateTotal);
        discount.addEventListener("input", calculateTotal);

        function calculateTotal() {
        let chargeValue = parseFloat(charge.value);
        let discountValue = parseFloat(discount.value);

        if (!isNaN(chargeValue) && !isNaN(discountValue)) {
            total.value = chargeValue - (chargeValue * (discountValue / 100));
        } else {
            total.value = "";
        }
        }
        }
        cal()
    </script>
</body>

</html>