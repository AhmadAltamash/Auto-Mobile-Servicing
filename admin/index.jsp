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
    <link rel="stylesheet" href="../CSS/login-register.css">
    <title>
        TorqueMaster Garage — A place where we ensure your vehicles value
    </title>
</head>

<body>
<nav>
            <a href="index.html" class="logo"><img src="../Media//Red_Car_Tire_Transportation_Free_Logo-removebg.png" alt=""></a>
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

        <div id="parent">
            <div class="container-login">
                <div class="heading">Log In to your account</div>
                <form class="form" action="../JSP/action.jsp">
                <input type="hidden" name="action" value="login-admin">
                    
                    <div class="input-field">
                        <input required="" autocomplete="off" type="mobile" name="mobile" id="mobile" />
                        <label for="mobile">Mobile No.</label>
                    </div>
                    <div class="input-field" id="password-container">
                        <input required="" autocomplete="off" type="password" name="password" id="password"/>
                        <label for="username">Password</label>
                        <i class="ri-eye-fill open"></i>
                        <i class="ri-eye-off-fill close2"></i>
                    </div>
    
                    <div class="btn-container">
                        <button class="btn" type="submit">Log In</button>
                    </div>
                </form>
            </div>


    </main>


    <!-- Script -->
    <script src="../JS/admin.js"></script>
</body>

</html>