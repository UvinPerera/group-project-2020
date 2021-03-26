<%@page import="com.medihub.doctor.DoctorAvailability"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>


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
          <link rel="stylesheet" type="text/css" href="./public/css/new_dash_hos.css" media="screen" />
          <link rel="stylesheet" type="text/css" href="./public/css/patient_modal.css" media="screen" />
          <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
     </head>

     <body>

      <% String username="";
      username= session.getAttribute("username").toString();
      String absolutePath ="";
       
               try{
                    absolutePath = request.getAttribute("absolutePath").toString(); 
               }
               catch(NullPointerException ex){
                   absolutePath ="";
               }
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
                             <%if(absolutePath.isEmpty()){%>
                              <img src="./public/images/user.png" alt="hello">
                              <%}else{%>
                              <img src="./public/storage/pp/<%=absolutePath%>" alt="hello">
                              <%}%>
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
                                        <p class="text-primary-p">Upcoming Appointments</p>
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
                              
                             <!--######################-->
                                <!--left table section ending-->
                             <!--######################-->
                                                  
                                                  
                                                  
                                                  
                              <!--######################-->
                                <!--right table section starting-->
                             <!--######################-->
                              <div class="charts_right">

                                   <div class="charts_right_title">
                                        <div>
                                             <h1>Upcoming Appointments</h1>
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
                                                       <th>Doctor Name</th>
                                                       <th>Start Time</th>
                                                       <th>End Time</th>
                                                       <th>Max patients</th>
                                                       <th>Current patients</th>
                                                       <th>Action</th>
                                                  </tr>
                                             </thead>
                                             <tbody>
                                                 <%
                                                     if(request.getAttribute("doctoravailability")!=null){
                                                         
                                                     List <DoctorAvailability> apList = (ArrayList<DoctorAvailability>)request.getAttribute("doctoravailability");
                                                     int maxCount=5;
                                                     if(apList.size()<maxCount) maxCount = apList.size();
                                                     
                                                     for(int i =0;i<maxCount;i++){
                                                 
                                                 %>
                                                  <tr>
                                                       <td><%=apList.get(i).id %></td>
                                                       <td><%=apList.get(i).doctorName %></td>
                                                       <td><%=apList.get(i).date %><br><%=apList.get(i).startTime %></td>
                                                       <td><%=apList.get(i).date %><br><%=apList.get(i).endTime %></td>
                                                       <td><%=apList.get(i).maxCount %></td>
                                                       <td><%=apList.get(i).count %></td>
                                                       <td><button><i class="fa fa-eye"></i></button><button><i class="fa fa-edit"></i></button></td>
                                                  </tr>
                                                  <%}}%>
                                                  <tr>
                                                       <td colspan="6"><a href="manageappointments">View More...</a></td>
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
               
                <jsp:include page="./public/includes/hospitalSidebar.jsp"/>
                
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