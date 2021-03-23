<%-- 
    Document   : pharmacySidebar
    Created on : Mar 19, 2021, 4:56:07 PM
    Author     : Yash
--%>

 <div id="sidebar">

                    <div class="sidebar_title">
                         <div class="sidebar_img">
                              <img src="./public/images/onlylogo.png" alt="sidebar">
                              
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
                         <!-- add "active_menu_link" to class to make it active -->
                         <div class="sidebar_link ${pageContext.request.requestURI eq '/MediHub/patientDashboard.jsp' ? 'active_menu_link' : ''}">
                              <i class="fa fa-dashboard"></i>
                              <a href="pharmacy">Dashboard</a>
                         </div>

                         <h2>Orders</h2>

                         <div class="sidebar_link ${pageContext.request.requestURI eq '/MediHub/.jsp' ? 'active_menu_link' : ''}">
                              <i class="fa fa-bullseye"></i>
                              <a href="#">Track Orders</a>
                         </div>

                        

                         <h2>Report</h2>

                         <div class="sidebar_link ${pageContext.request.requestURI eq '/MediHub/trackOrder(phar).jsp' ? 'active_menu_link' : ''}">
                              <i class="fa fa-dropbox"></i>
                              <a href="trackpatientorder">Pharmacy Orders</a>
                         </div>
                         
                         
                         <h2>Pharmacy</h2>

                          <div class="sidebar_link ${pageContext.request.requestURI eq '/MediHub/viewpharmacy.jsp' ? 'active_menu_link' : ''}">
                              <i class="fa fa-user-circle"></i>
                              <a href="pharmacyview">View Pharmacy</a>
                         </div>

                         <div class="sidebar_link ${pageContext.request.requestURI eq '/MediHub/.jsp' ? 'active_menu_link' : ''}">
                              <i class="fa fa-user-circle-o"></i>
                              <a href="#">Edit Pharmacy</a>
                         </div>

                         <h2>User</h2>

                         <div class="sidebar_link ${pageContext.request.requestURI eq '/MediHub/viewpharmacist.jsp' ? 'active_menu_link' : ''}">
                              <i class="fa fa-user-circle"></i>
                              <a href="pharmacistview">View Profile</a>
                         </div>

                         <div class="sidebar_link ${pageContext.request.requestURI eq '/MediHub/editpharmacist.jsp' ? 'active_menu_link' : ''}">
                              <i class="fa fa-user-circle-o"></i>
                              <a href="editpharmacist">Edit Profile</a>
                         </div>

                         <div class="sidebar_link ${pageContext.request.requestURI eq '/MediHub/changePasswordPharmacy.jsp' ? 'active_menu_link' : ''}">
                              <i class="fa fa-user-secret"></i>
                              <a href="changepasswordpharmacy">Change Password</a>
                         </div>

                         <div class="sidebar_logout">
                              <i class="fa fa-user-times"></i>
                              <a href="logout">Logout</a>
                         </div>

                    </div>

               </div>
