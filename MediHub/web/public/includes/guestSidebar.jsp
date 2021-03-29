                            
<%-- 
    Document   : patientSidebar
    Created on : Dec 20, 2020, 11:54:31 PM
    Author     : tharshan
--%>

                <div id="sidebar">

                    <div class="sidebar_title">
                         <div class="sidebar_img">
                              <img src="./public/images/onlylogo.png" alt="sidebar">
                              <h1>Medihub</h1>
                         </div>
                         <i class="fa fa-times" id="sidebarIcon" onclick="closeSidebar()"></i>
                    </div>

                    <div class="sidebar_menu">
                         <!-- this will be enabled in mobile view and disabled in pc -->
                         <div id="nav_option_sidebar" class="nav_option_sidebar">

                              <h2>Menu</h2>

                              <div class="sidebar_link ${pageContext.request.requestURI eq '/MediHub/' ? 'active_menu_link' : ''}">
                                   <i class="fa fa-home"></i>
                                   <a href="/MediHub">Home</a>
                              </div>
     
                              <div class="sidebar_link ${pageContext.request.requestURI eq '/MediHub/EmergencyServices.jsp' ? 'active_menu_link' : ''}">
                                   <i class="fa fa-ambulance"></i>
                                   <a href="EmergencyServices.jsp">Emergency Services</a>
                              </div>
                              
                              <div class="sidebar_link ${pageContext.request.requestURI eq '/MediHub/contactUs.jsp' ? 'active_menu_link' : ''}">
                                   <i class="fa fa-phone"></i>
                                   <a href="contactUs.jsp">Contact Us</a>
                              </div>
                              
                              <div class="sidebar_link ${pageContext.request.requestURI eq '/MediHub/About.jsp' ? 'active_menu_link' : ''}">
                                   <i class="fa fa-binoculars"></i>
                                   <a href="About.jsp">About Us</a>
                              </div>

                         </div>
                         

                         <h2>Reviews</h2>

                         <div class="sidebar_link ${pageContext.request.requestURI eq '/MediHub/BrowseDoctorReviewsGuest.jsp' ? 'active_menu_link' : ''}">
                              <i class="fa fa-stethoscope"></i>
                              <a href="BrowseDoctorReviewsGuest?search=1">Doctors</a>
                         </div>

                         <div class="sidebar_link ${pageContext.request.requestURI eq '/MediHub/BrowseHospitalReviewsGuest.jsp' ? 'active_menu_link' : ''}">
                              <i class="fa fa-hospital-o"></i>
                              <a href="BrowseHospitalReviewsGuest?search=1">Hospitals</a>
                         </div>

                         <div class="sidebar_link ${pageContext.request.requestURI eq '/MediHub/BrowsePharmacyReviewsGuest.jsp' ? 'active_menu_link' : ''}">
                              <i class="fa fa-medkit"></i>
                              <a href="BrowsePharmacyReviewsGuest?search=1">Pharmacies</a>
                         </div>
                              

                         <div class="sidebar_login">
                              <i class="fa fa-user"></i>
                              <a href="login.jsp">Login</a>
                         </div>

                    </div>

               </div>
                              