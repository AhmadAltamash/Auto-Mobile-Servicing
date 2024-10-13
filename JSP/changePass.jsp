<!DOCTYPE html>
<html lang="en">
<%
    String mobile=(String)session.getAttribute("mob");
    if (mobile !=null){
%>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@300..700&display=swap" rel="stylesheet" />
    <link rel="shortcut icon" href="../Media/favicon.png" type="image/x-icon" />
    <link href="https://cdn.jsdelivr.net/npm/remixicon@4.3.0/fonts/remixicon.css" rel="stylesheet" />
    <link rel="stylesheet" href="../CSS/style.css">
    <link rel="stylesheet" href="../CSS/login-register.css">
    <link rel="stylesheet" href="../CSS/HomePageResponsive.css">
    <title>
       Change Password
    </title>

</head>

<body>

        <nav>
            <a href="../index.jsp" class="logo"><img src="../Media//Red_Car_Tire_Transportation_Free_Logo-removebg.png" alt=""></a>
        </nav>
    <div class="parent-nav">            
        <div class="nav-content">
            <a href="../index.jsp">home</a>
            <a href="./login_register.jsp" target="_self">register/login</a>
        </div>
        <span class="icons">
            <i class="ri-menu-fold-line menu"></i>
            <i class="ri-close-fill close"></i>
        </span>
    </div>

    <main class="main">

        <div id="parent">
            <div class="container-login">
                <div class="container-login-child">
                    <div class="heading">Change Your Password</div>
                    <form class="form" action="action.jsp">
                    <input type="hidden" name="action" value="changePassword">
                        
                        <div class="input-field">
                            <input required="" autocomplete="off" type="text" name="mobile" id="mobile" readonly value='<%= mobile%>' style="outline: none;border: solid 1px #0034de;" />
                            <label for="mobile" style="transform: translateY(-51%)translateX(-10px) scale(0.8);background-color: #fff;padding: 0px 5px;color: #0034de;font-weight: bold;letter-spacing: 1px;border: none;border-radius: 100px;">Mobile No.</label>
                        </div>

                        <div class="input-field">
                            <input required="" autocomplete="off" type="password"/>
                            <label for="query">Set New Password</label>
                        </div>

                        <div class="input-field">
                            <input required="" autocomplete="off" type="text" name="password" id="password" />
                            <label for="query">Re-type New Password</label>
                        </div>
                        
                        <div class="btn-container">
                            <button class="btn" type="submit">Change</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </main>

    <!-- Script -->
    <script src="../JS/user.js"></script>
</body>
</html>
<%
    }
else{
    response.sendRedirect("forgotPass.jsp");
}
%>