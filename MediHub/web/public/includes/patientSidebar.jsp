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
                         
                         <div class="sidebar_link ${pageContext.request.requestURI eq '/MediHub/userNotifications.jsp' ? 'active_menu_link' : ''}">
                              <i class="fa fa-bell"></i>
                              <a href="userNotifications">Notifications</a>
                              &nbsp;&nbsp;
                              <i class="fa fa-envelope text-red" id="notit"></i>
                              <b class="text-primary-p text-red" id="noti"></b>
                                  
                                  <% 
                                    String uu;
                                  if(session.getAttribute("userid")!=null)  {
                                  uu= session.getAttribute("userid").toString(); 
               
                                    %>
                              
                              <script>
                                  $("#notit").hide();
                                  $("#noti").hide();
                                  $.get("getNotificationCountUser?idd=<%=uu%>",function(data,status){
                                     if(data!==0 && data!=="" && data!=="0") {
                                     $("#noti").html(data);
                                     $("#notit").show();
                                     $("#noti").show();
//                                     alert(data);
                                     }});
                                  
                              </script>
                              
                              <% } %>
                                  
                         </div>
                              
                         <div class="sidebar_link ${pageContext.request.requestURI eq '/MediHub/medicalRemindersPatient.jsp' ? 'active_menu_link' : ''}">
                              <i class="fa fa-bullseye"></i>
                              <a href="MedicalRemindersPatient">Reminders</a>
                         </div>


                         <h2>Services</h2>

                         <div class="sidebar_link ${pageContext.request.requestURI eq '/MediHub/channelling.jsp' ? 'active_menu_link' : ''}">
                              <i class="fa fa-hand-pointer-o"></i>
                              <a href="channelling?search=0&doctor=&hospital=&specialisation=&date=&limit=">E-Channelling</a>
                         </div>

                         <div class="sidebar_link ${pageContext.request.requestURI eq '/MediHub/placeOrder.jsp' ? 'active_menu_link' : ''}">
                              <i class="fa fa-bookmark"></i>
                              <a href="patientorders">Medicine Order</a>
                         </div>

                         <div class="sidebar_link ${pageContext.request.requestURI eq '/MediHub/medicalRecords.jsp' ? 'active_menu_link' : ''}">
                              <i class="fa fa-file-archive-o"></i>
                              <a href="viewmedicalrecords">Medical Records</a>
                         </div>

                         <div class="sidebar_link ${pageContext.request.requestURI eq '/MediHub/browseDoctor.jsp' ? 'active_menu_link' : ''}">
                              <i class="fa fa-stethoscope"></i>
                              <a href="BrowseDoctor">Doctors</a>
                         </div>

                         <div class="sidebar_link ${pageContext.request.requestURI eq '/MediHub/browseHospital.jsp' ? 'active_menu_link' : ''}">
                              <i class="fa fa-hospital-o"></i>
                              <a href="BrowseHospital">Hospitals</a>
                         </div>

                         <div class="sidebar_link ${pageContext.request.requestURI eq '/MediHub/browsePharmacy.jsp' ? 'active_menu_link' : ''}">
                              <i class="fa fa-medkit"></i>
                              <a href="BrowsePharmacy">Pharmacies</a>
                         </div>

                         <h2>Report</h2>

                         <div class="sidebar_link ${pageContext.request.requestURI eq '/MediHub/channellingRecords.jsp' ? 'active_menu_link' : ''}">
                              <i class="fa fa-address-book"></i>
                              <a href="channellingRecords">Channelling</a>
                         </div>

                         <div class="sidebar_link ${pageContext.request.requestURI eq '/MediHub/trackOrder(pat).jsp' ? 'active_menu_link' : ''}">
                              <i class="fa fa-dropbox"></i>
                              <a href="TrackOrders?search=0">Pharmacy Orders</a>
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
                              