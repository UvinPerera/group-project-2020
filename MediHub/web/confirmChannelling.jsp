<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.medihub.doctor.*"%>
<%@page import="com.medihub.payment.*"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<!doctype html>
<html>

     <head>
          <meta charset=utf-8>
          <meta name="viewport" content="width=device-width, initial-scale=1.0">
          <title>MediHub</title>
          <link rel="icon" href="./public/images/onlylogo.png" type="image/icon type"> <!--Header icon-->
          <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@500&display=swap" rel="stylesheet">
          <link href="https://fonts.googleapis.com/css2?family=Spartan:wght@600&display=swap" rel="stylesheet">
          <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
          <link rel="stylesheet" type="text/css" href="./public/css/new_dash.css" media="screen" />
          <link rel="stylesheet" type="text/css" href="./public/css/patient_modal.css" media="screen" />
          <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
     </head>

     <body>

          <% 
               String username="";
               username= session.getAttribute("username").toString();
          %>

          <div class="container">
              <!--######################-->
                 <!--navbar starting-->
              <!--######################-->
              
              <jsp:include page="./public/includes/navbar.jsp"/>
              
              <!--######################-->
                 <!--navbar ending-->
              <!--######################-->

               <main>
                    <!-- the content tag anything to do with the dashboard -->
                    
                    <!--######################-->
                        <!--container starting-->
                     <!--######################-->
                    <div class="main_container">

                         <div class="main_title">
                             <!--<img src="./public/images/p3.jpg" alt="hello">-->
                              <div class="main_greeting">
                                   <h1>Hello <%=username%></h1>
                                   <p>Channelling Confirmation</p>
                              </div>
                         </div>
                        
                        <%
                    if(request.getAttribute("doctorAvalability")!=null){
                        DoctorAvailability da = (DoctorAvailability)request.getAttribute("doctorAvalability");
                    %>
                    
                    <form action="submitchannelling" method="post">
                        <input type="hidden" name="id" value="<%= da.id%>"/>

                         <!-- change the main cards css fragments to change number of cards Available -->
                         <div class="main_cards">

                              <div class=""></div>
                              
                              <div class="card">
                                   <div class="card_inner_profile">
                                        <p class="text-primary-p">Hospital</p>
                                        <p class="text-secondary-p"><%=da.hospitalName %></p>
                                   </div>
                              </div>

                              <div class="card">
                                   <div class="card_inner_profile">
                                        <p class="text-primary-p">Doctor</p>
                                        <p class="text-secondary-p"><%= da.doctorName %></p>
                                   </div>
                              </div>
                                   
                              <div class=""></div>
                              <div class=""></div>

                              <div class="card">
                                   <div class="card_inner_profile">
                                        <p class="text-primary-p">Date</p>
                                        <p class="text-secondary-p"><%= da.date %></p>
                                   </div>
                              </div>

                              <div class="card">
                                   <div class="card_inner_profile">
                                        <p class="text-primary-p">Time</p>
                                        <p class="text-secondary-p"><%= da.startTime %></p>
                                   </div>
                              </div>

                              <div class=""></div>
                              <div class=""></div>
                               
                              <div class="card">
                                   <div class="card_inner_profile">
                                        <p class="text-primary-p">#Appointment</p>
                                        <p class="text-secondary-p"><%=da.count+1 %></p>
                                        <div class="alert-danger" id="appointmentAlert">
                                            * Subject to change if delayed
                                        </div>
                                   </div>
                              </div>
                             
                              <% // if(request.getAttribute("check")!=null){ %>
                              <div class="card">
                                   <div class="card_inner_profile">
                                        <p class="text-primary-p">Patient Name</p>
                                        <p class="text-secondary-p"><input type="text" name="description" id="description" class="selectpatient" required="required"/></p>
                                   </div>
                              </div>
                              <% // } %>
                              
                              <div class=""></div>
                              <div class=""></div>

                              <div class="card">
                                        <div class="card_inner_profile">
                                             <p class="text-primary-p">Payment Method</p>
                                             <p class="text-secondary-p">
                                                 <select name='payment_method' id="payment_method" class="selectpayment">
                                                     <option disabled="disabled" value='' selected>Select Payment</option>
                                                         <%
                                                             if(request.getAttribute("payments")!=null){
                                                                 List<Payment> table = (ArrayList<Payment>)request.getAttribute("payments");
                                                                 if(table.size()>0){
                                                                     for(Payment row : table) { %>
                                                                         <option value='<%= row.id %>'><%= row.name %></option>
                                                         <%
                                                             }}}
                                                             else
                                                             {
                                                         %>
                                                         <option value='1' selected>Cash</option>
                                                         <% } %>
                                                 </select>
                                             </p>
                                        </div>
                                   </div>

                                    <div class="buttons" style="align-self:center;margin: auto;display: block;">
                                       <button class="button" type="reset" id="clear"><b>Reset</b></button>
                                       <button class="button-success" type="submit"><b>Accept</b></button>     
                                    </div>

                                    <div class=""></div>
                              
                              </div>
                                            
                    </form>
                         
                        <% } else { %>
                            <div class="alert-danger" id="appointmentAlert">
                                Channelling cannot be proceeded !
                            </div>
                        <% } %>
                        
                    </div>

               </main>

                <!--######################-->
                <!--sidebar starting-->
                <!--######################-->
               
                <jsp:include page="./public/includes/patientSidebar.jsp"/>
                
                <!--######################-->
                <!--sidebar ending-->
                <!--######################-->
          </div>
            
            <!--######################-->
            <!--footer starting-->
            <!--######################-->                                      
                       
            <jsp:include page="./public/includes/footer.jsp"/>
            
            <!--######################-->
            <!--footer ending-->
            <!--######################-->
            
            
            
          <script src="./public/js/new_script.js"></script>
          
     </body>
</html>