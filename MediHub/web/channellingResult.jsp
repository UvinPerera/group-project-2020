<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.medihub.patient.Channelling"%>
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
                                   <p>Channelling Result</p>
                              </div>
                         </div>
                        
                        <%
                            if(request.getAttribute("channelling")!=null){
                            Channelling c = (Channelling)request.getAttribute("channelling");
                        %>
                    
                        <input type="hidden" name="id" value="<%= c.id%>"/>

                         <!-- change the main cards css fragments to change number of cards Available -->
                         <div class="main_cards" id="printPart">

                              <div class=""></div>
                              
                              <div class="card">
                                   <div class="card_inner_profile">
                                        <p class="text-primary-p">Hospital</p>
                                        <p class="text-secondary-p"><%=c.hospital %></p>
                                   </div>
                              </div>

                              <div class="card">
                                   <div class="card_inner_profile">
                                        <p class="text-primary-p">Doctor</p>
                                        <p class="text-secondary-p"><%= c.doctor %></p>
                                   </div>
                              </div>
                                   
                              <div class=""></div>
                              <div class=""></div>

                              <div class="card">
                                   <div class="card_inner_profile">
                                        <p class="text-primary-p">Date</p>
                                        <p class="text-secondary-p"><%= c.date %></p>
                                   </div>
                              </div>

                              <div class="card">
                                   <div class="card_inner_profile">
                                        <p class="text-primary-p">Time</p>
                                        <p class="text-secondary-p"><%= c.start_time %></p>
                                   </div>
                              </div>

                              <div class=""></div>
                              <div class=""></div>
                               
                              <div class="card">
                                   <div class="card_inner_profile">
                                        <p class="text-primary-p">#Appointment</p>
                                        <p class="text-secondary-p"><%=c.appointmentNo %></p>
                                        <div class="alert-danger" id="appointmentAlert">
                                            * Subject to change if delayed
                                        </div>
                                   </div>
                              </div>
                             
                              <% // if(request.getAttribute("check")!=null){ %>
                              <div class="card">
                                   <div class="card_inner_profile">
                                        <p class="text-primary-p">Description</p>
                                        <p class="text-secondary-p"><%=c.description %></p>
                                   </div>
                              </div>
                              <% // } %>
                              
                              <div class=""></div>
                              <div class=""></div>

                              <div class="card">
                                   <div class="card_inner_profile">
                                        <p class="text-primary-p">Payment Amount</p>
                                        <p class="text-secondary-p"><%=c.payment_amount %></p>
                                   </div>
                              </div>

                              <div class="card">
                                   <div class="card_inner_profile">
                                        <p class="text-primary-p">Payment Status</p>
                                        <p class="text-secondary-p" style='color: <% if(c.payment_method!=null){out.print("green");}else{out.print("red");} %>;'><% if(c.payment_method!=null){out.print("Paid");}else{out.print("Not Paid");} %></p>
                                   </div>
                              </div>
                                   
                              <div class=""></div>
                              <div class=""></div>
                                            
                              <div class="buttons" style="align-self:center;margin: auto;display: block;">
                                 <button class="button" type="" id="print"><b><i class="fa fa-envelope"> Print </i></b></button>
                              </div>
                              
                              <div class="buttons" style="align-self:center;margin: auto;display: block;">
                                  <button class="button-success" id="final" onclick='window.location.href="patient";'><b>OK</b></button>     
                              </div>
                                                 
                              <div class=""></div>
                                            
                         
                            <% } else { %>
                                <div class="alert-danger" id="appointmentAlert">
                                    Channelling Failed
                                </div>
                                <div class="buttons">
                                     <button class="button-success" id="final" onclick='window.location.href="patient";'><b>OK</b></button>     
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
          
          <script>
              
              var print = document.getElementById("print");
              //when printing
               print.onclick = function () {
                   
                    print.style.display = "none";
                    $("#final").hide();
                    var win = window.open();
                    var printContent = $("#printPart").html();

                    $(win.document.body).html(printContent);
                    win.print();
                    print.style.display = "block";
                    $("#final").show();
               }
          </script>
          
     </body>
</html>