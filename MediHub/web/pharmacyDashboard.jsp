<%-- 
    Document   : pharmacyDashboard
    Created on : Mar 18, 2021, 7:46:33 PM
    Author     : Yash
--%>
<!--<!doctype html>
<html>
<head>
  <meta charset=utf-8>
  <title>MediHub</title>
  <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@500&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Spartan:wght@600&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" type="text/css" href="./public/css/Dashboard_Pharmacy.css" media="screen" />
</head>
<body>
  <div class="navbar" id="navbar">
      <ul>
        <li><button class="style" type="button" onclick="window.location.href='logout';"> Log out </button></li>
        <li><a href="About.jsp" id="end">About</a></li>
      <li><a href="contactUs.jsp">Contact</a></li>
      <li><a href="EmergencyServices.jsp">Emergency Services</a></li>
      <li><a href="/MediHub">Home</a></li>
        <li id="logo"><img src="./public/images/onlylogo.png" width="15.5%"></li>
      </ul>
    </div>
   
 <div class="container">
      <div class="profile">
          <img src="./public/images/p3.jpg" id="profile">
          <h2 style="text-align:center; margin-bottom:25px;"></h2><br>
          <div><center>
            <a href="pharmacyview" class="btn">View Profile</a>
            <br><br><br>
            <a href="editpharmacy" class="btn">Edit Profile</a>
            <br><br><br>
            <a href="" class="btn deactivate">Deactivate</a>
              </center>
          </div>
          
        </div>

        <div class="contentBox">
              <div class="tab">
                <button class="tablinks" onclick="openTab(event, 'Services')" id="defaultOpen">Your Services</button>
                <button class="tablinks" onclick="openTab(event, 'Appointments')">Upcoming Notifications</button>
               
        </div>    
        <div id="Services" class="tabcontent">
          
            <div class="serviceTile">
              <center><button class="styled" type="button" onclick="window.location.href='trackpatientorder'">Track Orders</button></center>
          
          </div>
        </div>
            <div id="Appointments" class="tabcontent"> There are no upcoming notifications yet..</div>
      </div>

        
      </div>
</body>
<br><br>
<center>
  <footer>
    <div class="row4">
      <div class="column4">
        <div class="footerText">
          <br>ABOUT <br><br>
          MediHub is a mainly a patient portal providing users eaiser access to all medical services. <br>MediHub also
          provides different doctors, hospitals and pharmacies interact with the patients directly in order to provide
          them with the best experience in accessing medical<br> services.<br>
        </div>
      </div>
      <div class="column4"><br>
        <div class="footerText"> 
          <br><br>
          <a href="#" class="fa fa-facebook"></a>
          <a href="#" class="fa fa-twitter"></a>
          <a href="#" class="fa fa-google"></a>
          <a href="#" class="fa fa-instagram"></a>
        </div>
      </div>
    </div> 
    <br>
    <div class="footerText">
      All rights Reserved @MediHub2020
    </div>
    <br><br>
  </footer>
</center>

</html>
<script>
       document.getElementById("defaultOpen").click();
    
    function openTab(evt, tabName) {
        var i, tabcontent, tablinks;

        // Get all elements with class="tabcontent" and hide them
        tabcontent = document.getElementsByClassName("tabcontent");
        for (i = 0; i < tabcontent.length; i++) {
          tabcontent[i].style.display = "none";
        }

        // Get all elements with class="tablinks" and remove the class "active"
        tablinks = document.getElementsByClassName("tablinks");
        for (i = 0; i < tablinks.length; i++) {
          tablinks[i].className = tablinks[i].className.replace(" active", "");
        }

        // Show the current tab, and add an "active" class to the button that opened the tab
        document.getElementById(tabName).style.display = "block";
        evt.currentTarget.className += " active";
}
</script>-->
   
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.medihub.pharmacy.*"%>

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
                 <!--start of navbar-->
              
              <jsp:include page="./public/includes/navbar.jsp"/>
             
                 <!--end of navbar-->
            
               <main>
                    <!--start of main container-->
                    
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
                                   <i class="fa fa-calendar fa-2x text-red"></i>
                                   <div class="card_inner">
                                        <p class="text-primary-p">Pending Orders</p>
                                        <span class="font-bold text-title">2</span>
                                   </div>
                              </div>

                           
                              <div class="card">
                                   <i class="fa fa-bell fa-2x text-green"></i>
                                   <div class="card_inner">
                                        <p class="text-primary-p">Upcoming Orders</p>
                                        <span class="font-bold text-title">2</span>
                                   </div>
                              </div>

                         </div>

                         <div class="charts">

                               <div class="charts_left">                                   
                                        <div class="charts_left_title">
                                             <div>
                                                  <h1>Pending Orders</h1>
                                                  
                                             </div>
                                             
                                        </div>
                                   
                                        <!--pending orders starts-->
                                        
                                        <%
                                             if(request.getAttribute("orders")!=null){
                                                  List<Orders> table = (ArrayList<Orders>)request.getAttribute("orders");
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
                                        <!--<i class="fa fa-usd"></i>-->
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


                         <!-- Modal starts -->
                         <div id="modalBox" class="modal">

                              <!-- Modal content -->
                              <div id="printPart" class="modal-content">
                                   <span id="modalCloseIcon" class="close">&times;</span>
                                   <h3 style="text-align: center;">Appointment Details</h3>
                                   <table style="border:none; text-align: left;">

                                        <tr>
                                             <td> Channelling ID : </td>
                                             <td id="modal_id"> ** </td>
                                             <td> Date / Time : </td>
                                             <td id="modal_date_time"> ** </td>
                                        </tr>

                                        <tr>
                                             <td> Hospital : </td>
                                             <td id="modal_hospital"> ** </td>
                                             <td> Description : </td>
                                             <td id="modal_description"> ** </td>
                                        </tr>

                                        <tr>
                                             <td> Doctor : </td>
                                             <td id="modal_doctor"> ** </td>
                                             <td> Appointment No : </td>
                                             <td id="modal_appointmet_no"> ** </td>
                                        </tr>

                                        <tr>
                                             <td> Payment Method : </td>
                                             <td id="modal_Payment_method"> ** </td>
                                             <td> Payment Amount : </td>
                                             <td id="modal_payment_amount"> ** </td>
                                        </tr>

                                        <tr>
                                             <td> Payment Description : </td>
                                             <td id="modal_payment_description"> ** </td>
                                             <td> Payment Status : </td>
                                             <td id="modal_payment_status"> ** </td>
                                        </tr>

                                        <tr>
                                             <td colspan="4" style="text-align: center;"><tt>THIS IS A DIGITAL COPY</tt></td>
                                        </tr>
                                        <tr>
                                             <td colspan="4" style="text-align: center;"><tt>* # M E D H U B # *</tt></td>
                                        </tr>
                                        <tr>
                                             <td colspan="4"><button id="print" class="btn"><i class="fa fa-envelope"> Print </i></button>
                                             </td>
                                        </tr>

                                   </table>

                              </div>
                         </div>
                         <!--Modal content ends-->

                    </div>
                                                  
                    <!--######################-->
                        <!--container ending-->
                    <!--######################-->

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