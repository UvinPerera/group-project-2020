<%-- 
    Document   : navbar
    Created on : Dec 20, 2020, 11:47:44 PM
    Author     : tharshan
--%>

                <nav class="navbar">
                    <div class="nav_icon" onclick="toggleSidebar()">
                         <i class="fa fa-bars"></i>
                    </div>
                    <div class="navbar_left">
                        <a class="${pageContext.request.requestURI eq '/MediHub/' ? 'active_link' : ''}" href="/MediHub">Home</a>
                        <a class="${pageContext.request.requestURI eq '/MediHub/' ? 'active_link' : ''}" href="EmergencyServices.jsp">Emergency services</a>
                        <a class="${pageContext.request.requestURI eq '/MediHub/' ? 'active_link' : ''}" href="contactUs.jsp">Contact Us</a>
                        <a class="${pageContext.request.requestURI eq '/MediHub/' ? 'active_link' : ''}" href="About.jsp">About Us</a>
                         <!-- <a class="active_link" href="#">User Space</a> -->
                    </div>
                    <div class="navbar_right">
                         <!-- <a href="#">
                              <i class="fa fa-search"></i>
                         </a>
                         <a href="#">
                              <i class="fa fa-clock-o"></i>
                         </a> -->
                         <a href="#">
                              <img src="./public/images/p3.jpg" alt="avatar">
                         </a>
                    </div>
               </nav>
