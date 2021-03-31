<%-- 
    Document   : adminSidebar
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

                         <h2>Services</h2>

                         <div class="sidebar_link ${pageContext.request.requestURI eq '/MediHub/managePatients.jsp' ? 'active_menu_link' : ''}">
                              <i class="fa fa-wheelchair"></i>
                              <a href="readpatient">Manage Patients</a>
                         </div>

                         <div class="sidebar_link ${pageContext.request.requestURI eq '/MediHub/manageDoctors.jsp' ? 'active_menu_link' : ''}">
                              <i class="fa fa-stethoscope"></i>
                              <a href="readdoctor">Manage Doctors</a>
                         </div>

                         <div class="sidebar_link ${pageContext.request.requestURI eq '/MediHub/managePharamcy.jsp' ? 'active_menu_link' : ''}">
                              <i class="fa fa-medkit"></i>
                              <a href="readpharmacy">Manage Pharmacies</a>
                         </div>

                         <div class="sidebar_link ${pageContext.request.requestURI eq '/MediHub/manageHospital.jsp' ? 'active_menu_link' : ''}">
                              <i class="fa fa-hospital-o"></i>
                              <a href="readhospital">Manage Hospitals</a>
                         </div> 

                         <h2>Reviews</h2>
                         
                         <div class="sidebar_link ${pageContext.request.requestURI eq '/MediHub/doctorReviewsAdmin.jsp' ? 'active_menu_link' : ''}">
                              <i class="fa fa-stethoscope"></i>
                              <a href="BrowseDoctorReviewsAdmin">Doctors</a>
                         </div>

                         <div class="sidebar_link ${pageContext.request.requestURI eq '/MediHub/hospitalReviewsAdmin.jsp' ? 'active_menu_link' : ''}">
                              <i class="fa fa-hospital-o"></i>
                              <a href="BrowseHospitalReviewsAdmin">Hospitals</a>
                         </div>

                         <div class="sidebar_link ${pageContext.request.requestURI eq '/MediHub/pharmacyReviewsAdmin.jsp' ? 'active_menu_link' : ''}">
                              <i class="fa fa-medkit"></i>
                              <a href="BrowsePharmacyReviewsAdmin">Pharmacies</a>
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

                        <div class="sidebar_link ${pageContext.request.requestURI eq '/MediHub/changePassword.jsp' ? 'active_menu_link' : ''}">
                              <i class="fa fa-user-secret"></i>
                              <a href="changepasswordadmin">Change Password</a>
                         </div>

                         <div class="sidebar_logout">
                              <i class="fa fa-user-times"></i>
                              <a href="logout">Logout</a>
                         </div>

                    </div>

               </div>