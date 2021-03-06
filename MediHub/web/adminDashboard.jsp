<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.medihub.patient.*"%>

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
          <link rel="stylesheet" type="text/css" href="./public/css/Dashboard_Admin.css" media="screen" />
          <!--<link rel="stylesheet" type="text/css" href="./public/css/patient_modal.css" media="screen" /> -->
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
                              <img src="./public/images/p3.jpg" alt="hello">
                              <div class="main_greeting">
                                   <h1>Hello <%=username%></h1>
                                   <p>Welcome</p>
                              </div>
                         </div>

                         <!-- change the main cards css fragments to change number of cards Available -->
                         <div class="main_cards">
                              
                             <div class="card">
                                   <i class="fa fa-user-o fa-2x text-lightblue"></i>
                                   <div class="card_inner">
                                        <p class="text-primary-p">Pending Reviews</p>
                                        <span class="font-bold text-title">2</span>
                                   </div>
                              </div>
                             
                              <div class="card">
                                   <i class="fa fa-bell fa-2x text-green"></i>
                                   <div class="card_inner">
                                        <p class="text-primary-p">Notifications</p>
                                        <span class="font-bold text-title">2</span>
                                   </div>
                              </div>
                             
                             

                         </div>
                         
                 
                         <div class="charts">

                             <!--######################-->
                                <!--left table section starting-->
                             <!--######################-->
                              <div class="charts_left">
                                   <!-- <div class=""> -->
                                        <div class="charts_left_title">
                                             <div>
                                                  <h1>Pending Appointments</h1>
                                                  <!-- <p>Something</p> -->
                                             </div>
                                             <i class="fa fa-suitcase"></i>
                                        </div>
                                   
                                        <!--pending appointments starts-->
                                        <!--checking for availability-->
                                        <%
                                             if(request.getAttribute("appointments")!=null){
                                                  List<Channelling> table = (ArrayList<Channelling>)request.getAttribute("appointments");
                                                  if(table.size()>0){
                                        %>
                                        <!--js array-->
                                        <script>
                                             var id = [];
                                             var hospital = [];
                                             var doctor = [];
                                             var appointmentNo = [];
                                             var date = [];
                                             var time = [];
                                             var description = [];
                                             var paymentMethod = [];
                                             var paymentAmount = [];
                                             var paidAmount = [];
                                             var paymentDescription = [];
                                             var paymentStatus = [];
                                             var size =<%= table.size() %>;
                                        </script>
                                        <!--js array end-->

                                   <!-- limit the results to 5 in db query... view more option will lead to all resutls -->
                                        <div class="charts_table_div">
                                             <table class="charts_table">
                                                  <thead>
                                                       <tr>
                                                            <th>#</th>
                                                            <th>Hospital</th>
                                                            <th>Doctor</th>
                                                            <th>Date / Time</th>
                                                            <th>App #</th>
                                                            <th>View</th>
                                                       </tr>
                                                  </thead>
                                                  <tbody>
                                                       <% 
                                                           int cc = 0;
                                                           for(Channelling row : table) { 
                                                                cc++;
                                                                if (cc>5){
                                                                    break;
                                                                }
                                                       %>
                                                       <tr>
                                                            <td><%= row.id %></td>
                                                            <td><%= row.hospital %></td>
                                                            <td><%= row.doctor %></td>
                                                            <td><%= row.date %><br><%= row.start_time %></td>
                                                            <td><%= row.appointmentNo %></td>
                                                            <td><button id="popUp" onclick="popup('<%= table.indexOf(row) %>');" index="<%= table.indexOf(row) %>"><i class="fa fa-eye"></i></button></td>
                                                       </tr>
                                                       
                                                       <script>
                                                            id[<%= table.indexOf(row) %>]                   =<%= row.getId() %>;
                                                            hospital[<%= table.indexOf(row) %>]             ="<%= row.hospital %>";
                                                            doctor[<%= table.indexOf(row) %>]               ="<%= row.doctor %>";
                                                            appointmentNo[<%= table.indexOf(row) %>]        =<%= row.appointmentNo %>;
                                                            date[<%= table.indexOf(row) %>]                 ="<%= row.date %>";
                                                            time[<%= table.indexOf(row) %>]                 ="<%= row.start_time %>";
                                                            description[<%= table.indexOf(row) %>]          ="<%= row.description %>";
                                                            paymentMethod[<%= table.indexOf(row) %>]        ="<%= row.payment_method %>";
                                                            paymentAmount[<%= table.indexOf(row) %>]        =<%= row.payment_amount %>;
                                                            paidAmount[<%= table.indexOf(row) %>]           =<%= row.paid_amount %>;
                                                            paymentDescription[<%= table.indexOf(row) %>]   ="<%= row.payment_description %>";
                                                            paymentStatus[<%= table.indexOf(row) %>]        =<%= row.payment_status %>;        
                                                        </script>
                                
                                
                                                        <%}%>
                                                        
                                                        <% if(table.size()>5) {%>
                                                        <tr>
                                                            <td colspan="6"><a href="#">View More...</a></td>
                                                        </tr>
                                                        <%}%>
                                                  </tbody>
                                             </table>
                                        </div>
                                              
                                        <!--when there is no pending appointments-->
                                                  <%
                                                       }
                                                       else
                                                       {
                                                  %>
                                                  <div class="buttons">
                                                      No pending Appointments !
                                                      <a href="channelling"><button class="button-success" type=""><b>Make New Appointment</b></button></a>    
                                                  </div>
                                                  <%
                                                       }}
                                                  %>


                                    <!--</div>--> 
                              </div>
                             <!--######################-->
                                <!--left table section ending-->
                             <!--######################-->
                                                  
                                                  
                                                  
                                                  
                              <!--######################-->
                                <!--right table section starting-->
                             <!--######################-->
                              <div class="charts_right">

                                   <div class="charts_right_title">
                                        <div>
                                             <h1>Pending Orders</h1>
                                             <!-- <p>Something</p> -->
                                        </div>
                                        <i class="fa fa-usd"></i>
                                   </div>

                                   <!-- limit the results to 5 in db query... view more option will lead to all resutls -->
                                   <div class="charts_table_div">
                                        <table class="charts_table">
                                             <thead>
                                                  <tr>
                                                       <th>#</th>
                                                       <th>Pharmacy</th>
                                                       <th>Doctor</th>
                                                       <th>Date / Time</th>
                                                       <th>App #</th>
                                                       <th>Action</th>
                                                  </tr>
                                             </thead>
                                             <tbody>
                                                  <tr>
                                                       <td>1</td>
                                                       <td>Hospital 1</td>
                                                       <td>Doctor 1</td>
                                                       <td>2020-12-12<br>08:00:00</td>
                                                       <td>11</td>
                                                       <td><button><i class="fa fa-eye"></i></button><button><i class="fa fa-edit"></i></button></td>
                                                  </tr>
                                                  <tr>
                                                       <td>1</td>
                                                       <td>Hospital 1</td>
                                                       <td>Doctor 1</td>
                                                       <td>2020-12-12<br>08:00:00</td>
                                                       <td>11</td>
                                                       <td><button><i class="fa fa-eye"></i></button><button><i class="fa fa-edit"></i></button></td>
                                                  </tr>
                                                  
                                                  <tr>
                                                       <td>1</td>
                                                       <td>Hospital 1</td>
                                                       <td>Doctor 1</td>
                                                       <td>2020-12-12<br>08:00:00</td>
                                                       <td>11</td>
                                                       <td><button><i class="fa fa-eye"></i></button><button><i class="fa fa-edit"></i></button></td>
                                                  </tr>
                                                  <tr>
                                                       <td colspan="6"><a href="#">View More...</a></td>
                                                  </tr>
                                             </tbody>
                                        </table>
                                   </div>

                              </div>
                             <!--######################-->
                                <!--right table section ending-->
                             <!--######################-->

                         </div>


                    </div>
                                                  
                    <!--######################-->
                        <!--container ending-->
                    <!--######################-->

               </main>

                <!--######################-->
                <!--sidebar starting-->
                <!--######################-->
               
                <jsp:include page="./public/includes/adminSidebar.jsp"/>
                
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


               //    #########################
               //    modal script start
               //    #########################

               var modal = document.getElementById("modalBox");

               // Get the button that opens the modal
               var btn = document.getElementById("popUp");

               // Get the <span> element that closes the modal
               var span = document.getElementsByClassName("close")[0];

               //modal print btn
               var print = document.getElementById("print");

               // When the user clicks on the button, open the modal
               //    btn.onclick = function() 
               function popup(indexId) {
               modal.style.display = "block";
               //        var index=btn.getAttribute("index");
               var index = indexId;

               document.getElementById("modal_id").innerHTML = id[index];
               document.getElementById("modal_date_time").innerHTML = date[index] + " " + time[index];
               document.getElementById("modal_hospital").innerHTML = hospital[index];
               document.getElementById("modal_description").innerHTML = description[index];
               document.getElementById("modal_doctor").innerHTML = doctor[index];
               document.getElementById("modal_appointmet_no").innerHTML = appointmentNo[index];
               document.getElementById("modal_Payment_method").innerHTML = paymentMethod[index];
               document.getElementById("modal_payment_amount").innerHTML = paymentAmount[index];
               document.getElementById("modal_payment_description").innerHTML = paymentDescription[index];

               var status = "";
               var colour = "";

               if (paymentStatus[index] != "") {
                    status = "Paid";
                    colour = "green";
               }
               else {
                    status = "Not Paid";
                    colour = "red";
               }
               document.getElementById("modal_payment_status").style.color = colour;
               document.getElementById("modal_payment_status").innerHTML = status;

               }

               // When the user clicks on <span> (x), close the modal
               span.onclick = function () {
               modal.style.display = "none";

               document.getElementById("modal_id").innerHTML = "**";
               document.getElementById("modal_date_time").innerHTML = "**";
               document.getElementById("modal_hospital").innerHTML = "**";
               document.getElementById("modal_description").innerHTML = "**";
               document.getElementById("modal_doctor").innerHTML = "**";
               document.getElementById("modal_appointmet_no").innerHTML = "**";
               document.getElementById("modal_Payment_method").innerHTML = "**";
               document.getElementById("modal_payment_amount").innerHTML = "**";
               document.getElementById("modal_payment_description").innerHTML = "**";
               document.getElementById("modal_payment_status").innerHTML = "**";


               }

               // When the user clicks anywhere outside of the modal, close it
               window.onclick = function (event) {
               if (event.target == modal) {
                    modal.style.display = "none";

                    document.getElementById("modal_id").innerHTML = "**";
                    document.getElementById("modal_date_time").innerHTML = "**";
                    document.getElementById("modal_hospital").innerHTML = "**";
                    document.getElementById("modal_description").innerHTML = "**";
                    document.getElementById("modal_doctor").innerHTML = "**";
                    document.getElementById("modal_appointmet_no").innerHTML = "**";
                    document.getElementById("modal_Payment_method").innerHTML = "**";
                    document.getElementById("modal_payment_amount").innerHTML = "**";
                    document.getElementById("modal_payment_description").innerHTML = "**";
                    document.getElementById("modal_payment_status").innerHTML = "**";
               }
               }

               //when printing
               print.onclick = function () {
                   
                    print.style.display = "none";
                    $("#modalCloseIcon").hide();
                    var win = window.open();
                    var printContent = $("#printPart").html();

                    $(win.document.body).html(printContent);
                    win.print();
                    print.style.display = "block";
                    $("#modalCloseIcon").show();
               }

               //    #########################
               //    modal script end
               //    #########################



          </script>

     </body>
</html>