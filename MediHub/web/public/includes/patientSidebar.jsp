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
                         <!-- add "active_menu_link" to class to make it active -->
                         <div class="sidebar_link ${pageContext.request.requestURI eq '/MediHub/patientDashboard.jsp' ? 'active_menu_link' : ''}">
                              <i class="fa fa-dashboard"></i>
                              <a href="patient">Dashboard</a>
                         </div>

                         <h2>Alerts</h2>

                         <div class="sidebar_link ${pageContext.request.requestURI eq '/MediHub/.jsp' ? 'active_menu_link' : ''}">
                              <i class="fa fa-bullseye"></i>
                              <a href="#">Reminders</a>
                         </div>

                         <h2>Services</h2>

                         <div class="sidebar_link ${pageContext.request.requestURI eq '/MediHub/channelling.jsp' ? 'active_menu_link' : ''}">
                              <i class="fa fa-hand-pointer-o"></i>
                              <a href="channelling?search=0&doctor=&hospital=&specialisation=&date=">E-Channelling</a>
                         </div>

                         <div class="sidebar_link ${pageContext.request.requestURI eq '/MediHub/placeOrder.jsp' ? 'active_menu_link' : ''}">
                              <i class="fa fa-bookmark"></i>
                              <a href="patientorders">Medicine Order</a>
                         </div>

                         <div class="sidebar_link ${pageContext.request.requestURI eq '/MediHub/medicalRecords.jsp' ? 'active_menu_link' : ''}">
                              <i class="fa fa-file-archive-o"></i>
                              <a href="medicalRecords.jsp">Medical Records</a>
                         </div>

                         <div class="sidebar_link ${pageContext.request.requestURI eq '/MediHub/reviewDoctor.jsp' ? 'active_menu_link' : ''}">
                              <i class="fa fa-stethoscope"></i>
                              <a href="ReviewDoctor.jsp">Doctors</a>
                         </div>

                         <div class="sidebar_link ${pageContext.request.requestURI eq '/MediHub/ReviewHospital.jsp' ? 'active_menu_link' : ''}">
                              <i class="fa fa-hospital-o"></i>
                              <a href="ReviewHospital.jsp">Hospitals</a>
                         </div>

                         <div class="sidebar_link ${pageContext.request.requestURI eq '/MediHub/reviewPharmacy.jsp' ? 'active_menu_link' : ''}">
                              <i class="fa fa-medkit"></i>
                              <a href="ReviewPharmacy.jsp">Pharmacies</a>
                         </div>

                         <h2>Report</h2>

                         <div class="sidebar_link ${pageContext.request.requestURI eq '/MediHub/.jsp' ? 'active_menu_link' : ''}">
                              <i class="fa fa-address-book"></i>
                              <a href="#">Channelling</a>
                         </div>

                         <div class="sidebar_link ${pageContext.request.requestURI eq '/MediHub/trackOrder(pat).jsp' ? 'active_menu_link' : ''}">
                              <i class="fa fa-dropbox"></i>
                              <a href="trackOrder(pat).jsp">Pharmacy Orders</a>
                         </div>

                         <h2>User</h2>

                         <div class="sidebar_link ${pageContext.request.requestURI eq '/MediHub/viewpatient.jsp' ? 'active_menu_link' : ''}">
                              <i class="fa fa-user-circle"></i>
                              <a href="patientview">View Profile</a>
                         </div>

                         <div class="sidebar_link ${pageContext.request.requestURI eq '/MediHub/editPatient.jsp' ? 'active_menu_link' : ''}">
                              <i class="fa fa-user-circle-o"></i>
                              <a href="editpatient">Edit Profile</a>
                         </div>

                         <div class="sidebar_link ${pageContext.request.requestURI eq '/MediHub/changePassword.jsp' ? 'active_menu_link' : ''}">
                              <i class="fa fa-user-secret"></i>
                              <a href="changepassword">Change Password</a>
                         </div>

                         <div class="sidebar_logout">
                              <i class="fa fa-user-times"></i>
                              <a href="logout">Logout</a>
                         </div>

                    </div>

               </div>