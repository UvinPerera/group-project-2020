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
                         
                         <h2>Alerts</h2>

                         <div class="sidebar_link ${pageContext.request.requestURI eq '/MediHub/userNotifications.jsp' ? 'active_menu_link' : ''}">
                              <i class="fa fa-bell"></i>
                              <a href="userNotifications">Admin Notifications</a>
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

                         <div class="sidebar_link ${pageContext.request.requestURI eq '/MediHub/serviceNotifications.jsp' ? 'active_menu_link' : ''}">
                              <i class="fa fa-bullseye"></i>
                              <a href="serviceNotifications">Pharmacy Notifications</a>
                              &nbsp;&nbsp;
                              <i class="fa fa-envelope text-red" id="nnotit"></i>
                              <b class="text-primary-p text-red" id="nnoti"></b>
                                  
                                  <% 
                                    String ut;
                                  if(session.getAttribute("usertype")!=null)  {
                                  ut= session.getAttribute("usertype").toString(); 
                                  
                                  if(session.getAttribute("userid")!=null)  {
                                  uu= session.getAttribute("userid").toString(); 
               
               
                                    %>
                              
                              <script>
                                  $("#nnotit").hide();
                                  $("#nnoti").hide();
                                  $.get("getNotificationCountService?idd=<%=uu%>&ut=<%=ut%>",function(data,status){
                                     if(data!==0 && data!=="" && data!=="0") {
                                     $("#nnoti").html(data);
                                     $("#nnotit").show();
                                     $("#nnoti").show();
//                                     alert(data);
                                     }});
                                  
                              </script>
                              
                              <% } } %>
                         </div>

                         <h2>Orders</h2>

                         <div class="sidebar_link ${pageContext.request.requestURI eq '/MediHub/trackOrder(phar).jsp' ? 'active_menu_link' : ''}">
                              <i class="fa fa-bullseye"></i>
                              <a href="trackpatientorder?search=0">Track Orders</a>
                         </div>

                        

                         
                         <h2>Pharmacy</h2>

                          <div class="sidebar_link ${pageContext.request.requestURI eq '/MediHub/viewpharmacy.jsp' ? 'active_menu_link' : ''}">
                              <i class="fa fa-user-circle"></i>
                              <a href="pharmacyview">View Pharmacy</a>
                         </div>

                         <div class="sidebar_link ${pageContext.request.requestURI eq '/MediHub/editpharmacy.jsp' ? 'active_menu_link' : ''}">
                              <i class="fa fa-user-circle-o"></i>
                              <a href="editpharmacy">Edit Pharmacy</a>
                         </div>

                         <h2>Reviews</h2>
                         
                         <div class="sidebar_link ${pageContext.request.requestURI eq '/MediHub/browseDoctor.jsp' ? 'active_menu_link' : ''}">
                              <i class="fa fa-stethoscope"></i>
                              <a href="BrowsePharmacyReviews?search=1&pharmacy=0">Reviews</a>
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
