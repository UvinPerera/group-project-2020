<%-- 
    Document   : forgetpwdnavbar.jsp
    Created on : Mar 21, 2021, 11:47:36 PM
    Author     : Ifra
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
                 
               </nav>
