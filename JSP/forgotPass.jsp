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
    <link rel="stylesheet" href="../CSS/HomePageResponsive.css">
    <title>
        Forgot Password? Answer the query for changing the password
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
                    <div class="heading">Forgot Password?</div>
                    <form class="form" action="action.jsp">
                    <input type="hidden" name="action" value="validateQuery">
                        
                        <div class="input-field">
                            <input required="" autocomplete="off" type="mobile" name="mobile" id="mobile" />
                            <label for="mobile">Mobile No.</label>
                        </div>
                        
                        <div class="input-field">
                            <input required="" autocomplete="off" type="text" name="query" id="query" />
                            <label for="query">What is your Nickname?</label>
                        </div>
                        
                        <div class="btn-container">
                            <button class="btn" type="submit">Submit</button>
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