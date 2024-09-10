<%@page import="java.sql.*" %>
<%@include file="connect.jsp"%>
<%!
    int rid_edit;
    String vehicle_name, vehicle_type, vehicle_num, vehicle_model, address;
%>
<%
    String Cid=(String)session.getAttribute("rid");
    
    rid_edit = Integer.parseInt(Cid);
    stmt=con.createStatement();
    rs=stmt.executeQuery("select * from register where rid='"+rid_edit+"'");
    rs.next();
    if(rs.getString("vehicle_name") != null){
        vehicle_name=rs.getString("vehicle_name");
    } 
    else{
        vehicle_name="";
    }
    if(rs.getString("vehicle_type") != null){
        vehicle_type=rs.getString("vehicle_type");
    } 
    else{
        vehicle_type="";
    }
    if(rs.getString("vehicle_num") != null){
        vehicle_num=rs.getString("vehicle_num");
    } 
    else{
        vehicle_num="";
    }
    if(rs.getString("vehicle_model") != null){
        vehicle_model=rs.getString("vehicle_model");
    } 
    else{
        vehicle_model="";
    }
    if(rs.getString("address") != null){
        address=rs.getString("address");
    } 
    else{
        address="";
    }

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
    <link rel="stylesheet" href="../CSS/user.css">
    <title>Profile</title>
</head>

<body>
<nav>
            <a href="index.html" class="logo"><img src="../Media//Red_Car_Tire_Transportation_Free_Logo-removebg.png" alt=""></a>
        </nav>
        <div class="parent-nav">            
            <div class="nav-content">
                <a href="welcomeuser.jsp">Home</a>
                <a href="users.jsp" class="activated">Profile</a>
            </div>
            <span class="icons">
                <i class="ri-menu-fold-line menu"></i>
                <i class="ri-close-fill close"></i>
            </span>
        </div>

    <main class="main">

        <div id="parent">
            <div class="container-register profileForm">
                <form class="form" action="action.jsp">
                    <input type="hidden" name="action" value="editprofile">
                    <p class="title">Edit Your Profile </p>
                    
                    <label>
                        <input required="" placeholder="" type="text" readonly class="input" name="cid" value= '<% out.println(rs.getInt("rid"));%>'>
                        <span style="top:30px;font-size: 0.7em;font-weight: 600;color: green;">Customer ID</span>
                    </label> 
                    <div class="flex">
                        <label>
                            <input required="" placeholder="" type="text" class="input" name="fname" value="<% out.println(rs.getString("f_name"));%>">
                            <span>Firstname</span>
                        </label>

                        <label>
                            <input required="" placeholder="" type="text" class="input" name="lname" value="<% out.println(rs.getString("l_name"));%>">
                            <span>Lastname</span>
                        </label>
                    </div>  
                            
                    <div class="flex">
                    <label>
                        <input required="" placeholder="" type="email" class="input" name="email" value="<% out.println(rs.getString("email"));%>">
                        <span>Email</span>
                    </label> 

                    <label>
                        <input required="" placeholder="" type="text" class="input" name="mob" value="<% out.println(rs.getString("mob"));%>">
                        <span>Mobile No.</span>
                    </label>
                    </div>

                    <label>
                        <input required="" placeholder="" type="text" class="input" name="vname" value="<%= vehicle_name %>">
                        <span>Vehicle Name</span>
                    </label>
                    <label>
                        <select name="vtype" id="cars" class="selectOption" >
                            <option value="<%= vehicle_type %>">--Vehicle Type--</option>
                            <option value="Two Wheeler">Two Wheeler</option>
                            <option value="Four Wheeler">Four Wheeler</option>
                        </select>
                    </label>
                    <label>
                        <input required="" placeholder="" type="text" class="input" name="vnumber" value="<%= vehicle_num %>">
                        <span>Vehicle No. eg. BR01XX1234</span>
                    </label>
                    <label>
                        <input required="" placeholder="" type="text" class="input" name="vmodel" value="<%= vehicle_model %>">
                        <span>Vehicle Model eg. PUNCH/2019</span>
                    </label>
                    <label>
                        <input required="" placeholder="" type="text" class="input" name="address" value="<%= address %>">
                        <span>Address</span>
                    </label>   
                    
                    <button class="submit" type="submit" value="submit">Submit</button>
                </form>
            </div>
        </div>


    </main>
    <%-- <%
    }
    %> --%>
    <%
       if(request.getParameter("msg")!= null)
       {
            out.println("<p>"+ request.getParameter("msg")+"</p>");
       }
    %>

    <!-- Script -->
    <script src="../JS/user.js"></script>
</body>

</html>