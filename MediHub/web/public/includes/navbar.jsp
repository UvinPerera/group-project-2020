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
                              <img id="dp" src="./public/images/user.png" alt="avatar">
                         </a>
                    </div>
               </nav>

               <% 
                                    String userId;
                                  if(session.getAttribute("userid")!=null)  {
                                  userId= session.getAttribute("userid").toString(); 
               
               %>
                              
                              <!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>-->
                              <script>
                                  
                                  $.get("getdp?uId=<%=userId%>",function(data,status){
                                     if(data!=="") 
                                     $("#dp").attr("src","./public/storage/pp/"+data);
                                      
                                  })
                                  
                              </script>
                              
                              <% } %>