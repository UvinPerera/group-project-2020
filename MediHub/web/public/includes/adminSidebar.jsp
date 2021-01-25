<%-- 
    Document   : patientSidebar
    Created on : Jan 11, 2021, 11:54:31 PM
    Author     : Ifra
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
                         <!-- add "active_menu_link" to class to make it active -->
                         <div class="sidebar_link ${pageContext.request.requestURI eq '/MediHub/adminDashboard.jsp' ? 'active_menu_link' : ''}">
                              <i class="fa fa-dashboard"></i>
                              <a href="admin">Dashboard</a>
                         </div>

                         <h2>Alerts</h2>

                         <div class="sidebar_link ${pageContext.request.requestURI eq '/MediHub/.jsp' ? 'active_menu_link' : ''}">
                              <i class="fa fa-bell"></i>
                              <a href="#">Notifications</a>
                         </div>

                         <h2>Services</h2>

                         <div class="sidebar_link ${pageContext.request.requestURI eq '/MediHub/managePatients.jsp' ? 'active_menu_link' : ''}">
                              <i class="fa fa-wheelchair"></i>
                              <a href="managePatients.jsp">Manage Patients</a>
                         </div>

                         <div class="sidebar_link ${pageContext.request.requestURI eq '/MediHub/manageDoctors.jsp' ? 'active_menu_link' : ''}">
                              <i class="fa fa-stethoscope"></i>
                              <a href="manageDoctors.jsp">Manage Doctors</a>
                         </div>

                         <div class="sidebar_link ${pageContext.request.requestURI eq '/MediHub/managePharamcy.jsp' ? 'active_menu_link' : ''}">
                              <i class="fa fa-medkit"></i>
                              <a href="managePharmacy.jsp">Manage Pharmacies</a>
                         </div>

                         <div class="sidebar_link ${pageContext.request.requestURI eq '/MediHub/manageHospital.jsp' ? 'active_menu_link' : ''}">
                              <i class="fa fa-hospital-o"></i>
                              <a href="manageHospital.jsp">Manage Hospitals</a>
                         </div>

                         <div class="sidebar_link ${pageContext.request.requestURI eq '/MediHub/manageReviews.jsp' ? 'active_menu_link' : ''}">
                              <i class="fa fa-reply-all"></i>
                              <a href="manageReviews.jsp">Manage Reviews</a>
                         </div>


                         <h2>User</h2>

                         <div class="sidebar_link ${pageContext.request.requestURI eq '/MediHub/viewadmin.jsp' ? 'active_menu_link' : ''}">
                              <i class="fa fa-user-circle"></i>
                              <a href="adminview">View Profile</a>
                         </div>

                         <div class="sidebar_link ${pageContext.request.requestURI eq '/MediHub/editadmin.jsp' ? 'active_menu_link' : ''}">
                              <i class="fa fa-user-circle-o"></i>
                              <a href="editadmin">Edit Profile</a>
                         </div>

                         <div class="sidebar_link ${pageContext.request.requestURI eq '/MediHub/.jsp' ? 'active_menu_link' : ''}">
                              <i class="fa fa-user-secret"></i>
                              <a href="#">Change Password</a>
                         </div>

                         <div class="sidebar_logout">
                              <i class="fa fa-user-times"></i>
                              <a href="logout">Logout</a>
                         </div>

                    </div>

               </div>