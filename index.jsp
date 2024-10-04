<!DOCTYPE html>
<%@include file="./JSP/connect.jsp" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@300..700&display=swap" rel="stylesheet">
    <link rel="shortcut icon" href="./Media/favicon.png" type="image/x-icon">
    <link href="https://cdn.jsdelivr.net/npm/remixicon@4.3.0/fonts/remixicon.css" rel="stylesheet">
    <link rel="stylesheet" href="./CSS/style.css">
    <title>TorqueMaster Garage - A place where we ensure your vehicles value</title>
</head>
<body>
        <nav>
            <a href="index.jsp" class="logo"><img src="./Media//Red_Car_Tire_Transportation_Free_Logo-removebg.png" alt=""></a>
        </nav>
        <div class="parent-nav">            
            <div class="nav-content">
                <a href="index.jsp" class="activated">home</a>
                <a href="#servicess">services</a>
                <a href="#about-us">about us</a>
                <a href="./JSP/login_register.jsp">register/login</a>
                <a href="#page4">Contact us</a>
                <a href="./admin/index.jsp">Admin Login</a>
            </div>
            <span class="icons">
                <i class="ri-menu-fold-line menu"></i>
                <i class="ri-close-fill close"></i>
            </span>
        </div>

        <main id="main">
            <div id="page1">
                <div class="slider">
                    <div class="list">
                        <div class="item"><img src="./Media/Black Bold Automobile Cover.png" alt=""></div>
                        <div class="item">
                            <img src="./Media/banner-image1.webp" alt="">
                            <div class="banner-content">
                                <h2>Better Technical Analysis</h2>
                            </div>
                        </div>
                        <div class="item">
                            <img src="./Media/banner-image2.jpg" alt="">
                            <div class="banner-content">
                                <h2>Analytical Paperworks</h2>
                            </div>
                        </div>
                        <div class="item">
                            <img src="./Media/banner-image3.jpg" alt="">
                            <div class="banner-content">
                                <h2>Optimized Services</h2>
                            </div>
                        </div>
                        <div class="item">
                            <img src="./Media/banner-image4.jpg" alt="">
                            <div class="banner-content">
                                <h2>Well Experienced Wokrers</h2>
                            </div>
                        </div>
                    </div>

                    <div class="buttons">
                        <button id="prev"> < </button>
                        <button id="next"> > </button>
                    </div>
            
                    <ul class="dots">
                        <li class="active"></li>
                        <li></li>
                        <li></li>
                        <li></li>
                        <li></li>
                    </ul>
                </div>

            </div>

            <div id="page2">
                
                    <h1 id="servicess">Services</h1>
                <div class="row">
                    <%
                    stmt=con.createStatement();
                    rs=stmt.executeQuery("select * from services_plans limit 5");
                    while(rs.next()){
                    %>

                    <div class="card">
                        <div class="card-details">
                            <p class="text-title"><%= rs.getString("serv_name") %></p>
                            <p class="text-body">Price <%= rs.getInt("serv_charge") %></p>
                            <p>Discount <%= rs.getInt("discount") %>%</p>
                            <p>Total Price <%= rs.getInt("total") %></p>
                        </div>
                        <a href='./JSP/bookService.jsp?bid=<%= rs.getInt("sid") %>'><button class="card-button">Book Now</button></a>
                    </div>
                    <%
                    }
                    %>
                    <a href="./JSP/home_Services.jsp">See More...</a>
                </div> 

                    <h1 id="planns">Plans</h1>
                <div class="row">
                    <%
                    stmt = con.createStatement();
                    rs = stmt.executeQuery("select * from plans");
                    int count = 1; // Counter to give unique classes or IDs to cards
                    while (rs.next()) {
                    %>

                    <div class="card_box card-<%= count %>"> <!-- Adding unique class based on the counter -->
                        <span></span>
                        <div class="card-details">
                            <p class="text-body">Price <%= rs.getInt("plan_charge") %></p>
                            <p>Discount <%= rs.getInt("discount") %>%</p>
                            <p>Total Price <%= rs.getInt("total") %></p>
                        </div>
                        <a style="text-decoration:none" href='./JSP/Plans.jsp'><button class="button-pro"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 36 24"><path d="m18 0 8 12 10-8-4 20H4L0 4l10 8 8-12z"></path></svg>Read More</button></a>
                    </div>

                    <%
                    count++; // Increment the counter for the next card
                    }
                    %>
                <a href="./JSP/Plans.jsp">See Details...</a>
                </div>

                 
            </div>


            <div id="page3">
                <div class="about-img">
                    <img src="./Media/about.png" alt="">
                </div>
               <div id="about-us">
                    <h1>About Us</h1>
                    <p>At TorqueMasters Garage, we are driven by a passion for automobiles and a commitment to delivering exceptional service. With years of experience under the hood, our team of expert mechanics and technicians takes pride in providing top-notch automotive care, ensuring your vehicle runs smoothly and safely.</p>
                    <p>Located in Patna, TorqueMasters Garage is a trusted name in the community, known for our integrity, precision, and dedication to customer satisfaction. Whether you're here for routine maintenance, complex repairs, or performance upgrades, we have the skills and expertise to meet your needs.</p>
                    <p>Our state-of-the-art facility is equipped with the latest tools and technology, allowing us to diagnose and fix issues quickly and efficiently. We believe in transparent communication and will always keep you informed about your vehicle's condition and the services it requires.</p>
                    <p>At TorqueMasters Garage, your vehicle is more than just a mode of transportation—it's an extension of your lifestyle. That's why we treat every car as if it were our own, ensuring that every job is done right the first time.</p>
                    <p>Join the TorqueMasters family and experience the difference. Whether you're a car enthusiast or simply need reliable service, we're here to help you keep your vehicle in peak condition.</p>
                </div>
            </div>


            <div id="page4">
                <div id="contact-inner">
                    <h2>Contact Us</h2>
                    <span>
                        <a href="tel:+917488438343">
                            <i class="ri-phone-fill"></i> +91 748-843-8343
                        </a>
                    </span>
                    <span>
                        <a href="https://www.torquemaster.com" target="_blank">
                            <i class="ri-global-line"></i> www.torquemaster.com
                        </a>
                    </span>
                    <span>
                        <a href="mailto:mail.torquemaster@gmail.com">
                            <i class="ri-mail-fill"></i> mail.torquemaster@gmail.com
                        </a>
                    </span>
                    <span>
                        <a href="https://www.google.com/maps/place/Patna,+Bihar" target="_blank">
                            <i class="ri-map-pin-2-fill"></i> Patna, Bihar
                        </a>
                    </span>
                </div>

                <div class="contact-img">
                        <img src="./Media/contact.png" alt="">
                </div>
                    
            </div>

            <div class="logo-sliding" style="--width:15em">
                <h1>We work with</h1>
                <div class="list-sliding">
                    <div class="items" style="--position: 1"><img src="./Media/Logos/audi.png"></div>
                    <div class="items" style="--position: 2"><img src="./Media/Logos/chevrolet.png"></div>
                    <div class="items" style="--position: 3"><img src="./Media/Logos/hero.png"></div>
                    <div class="items" style="--position: 4"><img src="./Media/Logos/honda.png"></div>
                    <div class="items" style="--position: 5"><img src="./Media/Logos/hyundai.png"></div>
                    <div class="items" style="--position: 6"><img src="./Media/Logos/mahindra.png"></div>
                    <div class="items" style="--position: 7"><img src="./Media/Logos/suzuki.png"></div>
                    <div class="items" style="--position: 8"><img src="./Media/Logos/tata.png"></div>
                    <div class="items" style="--position: 9"><img src="./Media/Logos/toyota.png"></div>
                    <div class="items" style="--position: 10"><img src="./Media/Logos/yamaha.png"></div>
                    <div class="items" style="--position: 11"><img src="./Media/Logos/tvs.png"></div>
                </div>
            </div>

            <footer>
                <div class="left-footer">
                    <div class="title">
                        <h4>TorqueMaster Garage</h4>
                    </div>

                    <div class="review">
                        <h3>Reviews or Service Enquiries</h3>
                        <form class="form" action="./JSP/action.jsp">
                            <input type="hidden" name="action" value="review">

                            <input type="email" name="email" class="input-email" placeholder="Enter Your Email">

                            <input type="text" name="message" class="input-text" placeholder="Comment Here...">
                            <button type="submit" class="btn">Send</button>
                        </form>
                    </div>
                </div>

                <div class="right-footer">
                    <div class="content-right-footer">
                        <p>We also,</p>
                        <p>Buy and Sell Cars</p>
                        <p>Motorparts Are Also Availaible</p>
                        <span><p>You can reach out to us by</p><i class="ri-arrow-down-line"></i></span>
                        <span><i class="ri-mail-fill"></i> mail.torquemaster@gmail.com</span>
                    </div>

                    <div class="social-links">
                        <div class="social">
                            <a href="#"><i class="ri-instagram-line"></i></a>
                            <a href="#"><i class="ri-github-fill"></i></a>
                            <a href="#"><i class="ri-linkedin-box-fill"></i></a>
                        </div>
                    </div>
                </div>
            </footer>

        </main>

    <!-- Script -->
    <script src="./JS/script.js"></script>
</body>
</html>