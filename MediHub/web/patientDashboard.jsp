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
          <link rel="stylesheet" type="text/css" href="./public/css/new_dash.css" media="screen" />
          <link rel="stylesheet" type="text/css" href="./public/css/patient_modal.css" media="screen" />
          <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
     </head>

     <body>

          <% 
               String username="";
               String absolutePath ="";
               username= session.getAttribute("username").toString();
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
                                        <p class="text-primary-p">Pending Appointments</p>
                                        <span class="font-bold text-title">
                                        <%
                                             if(request.getAttribute("cappointments")!=null){
                                                 out.print(request.getAttribute("cappointments"));
                                             }
                                             else{
                                                 out.print("-");
                                             }
                                        %>
                                        </span>
                                   </div>
                              </div>

                              <div class="card">
                                   <i class="fa fa-calendar fa-2x text-red"></i>
                                   <div class="card_inner">
                                        <p class="text-primary-p">Pending Orders</p>
                                        <span class="font-bold text-title">
                                        <%
                                             if(request.getAttribute("corders")!=null){
                                                 out.print(request.getAttribute("corders"));
                                             }
                                             else{
                                                 out.print("-");
                                             }
                                        %>
                                        </span>
                                   </div>
                              </div>

                              <div class="card">
                                   <i class="fa fa-book fa-2x text-yellow"></i>
                                   <div class="card_inner">
                                        <p class="text-primary-p">Reminders</p>
                                        <span class="font-bold text-title">
                                            <%
                                             if(request.getAttribute("creminders")!=null){
                                                 out.print(request.getAttribute("creminders"));
                                             }
                                             else{
                                                 out.print("-");
                                             }
                                            %>
                                        </span>
                                   </div>
                              </div>

                              <div class="card">
                                   <i class="fa fa-bell fa-2x text-green"></i>
                                   <div class="card_inner">
                                        <p class="text-primary-p">Notifications</p>
                                        <span class="font-bold text-title">
                                        <%
                                             if(request.getAttribute("cnotifications")!=null){
                                                 out.print(request.getAttribute("cnotifications"));
                                             }
                                             else{
                                                 out.print("-");
                                             }
                                        %>
                                        </span>
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
                                             <!--<i class="fa fa-suitcase"></i>-->
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

                                   <!-- limit the results to 5 in db query... view more option will lead to all results -->
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
                                
                                
                                                        <% } %>
                                                        
                                                        <% if(table.size()>5) {%>
                                                        <tr>
                                                            <td colspan="6"><a href="channellingRecords">View More...</a></td>
                                                        </tr>
                                                        <% } %>
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
                                                        }
                                                        } else
                                                       {
                                                  %>
                                                  <div class="buttons">
                                                      No pending Appointments !
                                                      <a href="channelling"><button class="button-success" type=""><b>Make New Appointment</b></button></a>    
                                                  </div>
                                                  <%
                                                       }
                                                  %>


                                    <!--</div>--> 
                              </div>
                             <!--######################-->
                                <!--left table section ending-->
                             <!--######################-->
                             
                                                  
                                                  
                              <!--######################-->
                                <!--right table section starting-->
                             <!--######################-->
                              <div class="charts_left">

                                   <div class="charts_left_title">
                                        <div>
                                             <h1>Pending Orders</h1>
                                             <!-- <p>Something</p> -->
                                        </div>
                                        <!--<i class="fa fa-usd"></i>-->
                                   </div>
                                  
                                   
                             <%
                  
                                ArrayList array = new ArrayList();
                                ArrayList a2 = new ArrayList();
                                int size = 0;

                                if(request.getAttribute("orders")!=null){
                                    array=(ArrayList)request.getAttribute("orders");
                                     size= array.size();
                             %>
                                                  
                             <script>
                                        var iid = [];
                                        var ppharmacyId = [];
                                        var ppharmacyName= [];
                                        var ddatetime = [];
                                        var oorderStatus = [];
                                        var ffilepath= [];
                                        var ddescription = [];
                                        var aabsolutepath = [];
                                        var ffinalId;
                          </script>

                                   <!-- limit the results to 5 in db query... view more option will lead to all resutls -->
                                   <div class="charts_table_div">
                                        <table class="charts_table">
                                             <thead>
                                                  <tr>
                                                        <th class="">ID</th>
                                                        <!--<th class="">Pharmacy ID</th>-->
                                                        <th class="">Pharmacy Name</th>
                                                        <th class="">Delivery Date</th>
                                                        <!--<th class="">Status</th>-->
                                                        <th class="">Actions</th>
                                                  </tr>
                                             </thead>
                                             <tbody>
                                                 <%
                                                        int cc=0;
                                                     for(int i=0; i<size; i++){
                                                                cc++;
                                                                if (cc>5){
                                                                    break;
                                                                }
                                                    a2 =(ArrayList) array.get(i);%>
                                                  <tr>
                                                    <td class="Row"><%=a2.get(0)%></td>
                                                    <!--<td class="Row"><%=a2.get(1)%></td>-->
                                                    <td class="Row"><%=a2.get(2)%></td>
                                                    <td class="Row"><%=a2.get(3)%></td>
                                                    <!--<td class="Row"><%=a2.get(4)%></td>-->
                                                    <td>
                                                      <!--<ul class="actions">-->
                                                          <button  class="btn" onclick="ppopup('<%=i%>');"><center><i class="fa fa-eye"></i></<center></button>
                                                          <a href="editorderupdate?orderid=<%=a2.get(0)%>"><button class="btn"><i class="fa fa-edit"></i></button></a> 
                                                          <a><button class="btn" onclick="confirmdelete('<%=i%>');"><i class="fa fa-trash"></i></button></a>
                                                      <!--</ul>-->  
                                                    </td>
                                                    <script>
                                                                        iid[<%=i%>]                   ="<%=a2.get(0)%>"; 
                                                                        ppharmacyId[<%=i%>]           ="<%=a2.get(1)%>"; 
                                                                        ppharmacyName[<%=i%>]         ="<%=a2.get(2)%>";
                                                                        ddatetime[<%=i%>]             ="<%=a2.get(3)%>";
                                                                        oorderStatus[<%=i%>]          ="<%=a2.get(4)%>";
                                                                        ffilepath[<%=i%>]             ="<%=a2.get(5)%>";
                                                                        ddescription[<%=i%>]          ="<%=a2.get(6)%>"; 
                                                                        aabsolutepath[<%=i%>]          ="<%=a2.get(7)%>"; 
                                                      </script>
                                                  </tr>
                                                   <% } %>
                                                  
                                                  <% if(size>5) { %>
                                                        <tr>
                                                            <td colspan="6"><a href="channellingRecords">View More...</a></td>
                                                        </tr>
                                                        <% } %>
                                             </tbody>
                                        </table>
                                   </div>
                                                   
                                                   <%
                                                       }
                                                       else
                                                       {
                                                  %>
                                                  <div class="buttons">
                                                      No pending Orders !
                                                      <a href="patientorders"><button class="button-success" type=""><b>Make New Order</b></button></a>    
                                                  </div>
                                                  <%
                                                       }
                                                  %>

                              </div>
                             <!--######################-->
                                <!--right table section ending-->
                             <!--######################-->

                         </div>


                         <!-- Modal starts -->
                         
                         
                         
                         <!--modal for appointments-->
                         
                         
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
                         
                         <!--appoint modal end-->
                         
                         
                         <!--order modal-->
                         
                         <div id="mmodalBox" class="modal">

                        <div id="pprintPart" class="modal-content">
                            <span class="close">&times;  &nbsp;&nbsp;</span>
                            <h3 style="text-align: center;">Order Details</h3>
                            <center>
                            <table style="border:none; text-align: left;">

                                <tr>
                                    <td> Order ID : </td>
                                    <td id="mmodal_id"> ** </td>
                                    <td> Delivery Date / Time : </td>
                                    <td id="mmodal_date_time"> ** </td>
                                </tr>

                                <tr>
                                    <td> Pharmacy ID : </td>
                                    <td id="mmodal_pharmacyId"> ** </td>
                                    <td> Pharmacy Name : </td>
                                    <td id="mmodal_pharmacyName"> ** </td>
                                </tr>

                                <tr>
                                    <td> Order Status : </td>
                                    <td id="mmodal_orderStatus"> ** </td>
                                    <td> Patient Order Description : </td>
                                    <td id="mmodal_description"> ** </td>

                                </tr>

                               <tr>
                                    <td colspan="2" ><button class="style"> <a href="#" id="displayPrescription" onclick="displayPrescriptionFun();" target="_blank">Click to View Prescription</a> </button></td> 
                                    <td colspan="2" ><button class="style"><a href="#" id="downloadPrescription" download="#" onclick="downloadPrescriptionFun();" target="_blank">Click to Download Prescription</a></button></td>


                                </tr>


                                <tr>
                                    <td colspan="4" style="text-align: center;"><tt>THIS IS A DIGITAL COPY</tt></td>
                                </tr>
                                <tr>
                                    <td colspan="4" style="text-align: center;"><tt>* # M E D H U B # *</tt></td>
                                </tr>
                                <tr>
                                    <td colspan="4" style="text-align: center;"><button id="pprint" class="btn"><i class="fa fa-envelope"> Print </i></button>
                                    </td>
                                </tr>

                            </table></center>

                        </div>

                         </div>
                         
                         <!--order modal end-->
                         
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
               //    
               //    
               //    #########################
               //    appoint modal script start
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

               if (paymentStatus[index] == 1) {
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
               //    appoint modal script end
               //    #########################
               //    
               //    
               //    #########################
               //    order modal script start
               //    #########################
               
                var mmodal = document.getElementById("mmodalBox");

                // Get the button that opens the modal
                var bbtn = document.getElementById("ppopUp");

                // Get the <span> element that closes the modal
                var sspan = document.getElementsByClassName("close")[1];

                //modal print btn
                var pprint = document.getElementById("pprint");



                // When the user clicks on the button, open the modal
                //    btn.onclick = function() 
                function ppopup(indexId) {
                    mmodal.style.display = "block";

                    var index=indexId;
                     finalId =index; 
                    document.getElementById("mmodal_id").innerHTML = iid[index];
                    document.getElementById("mmodal_pharmacyId").innerHTML = ppharmacyId[index];
                    document.getElementById("mmodal_pharmacyName").innerHTML = ppharmacyName[index];
                    document.getElementById("mmodal_date_time").innerHTML = ddatetime[index];
                    document.getElementById("mmodal_description").innerHTML = ddescription[index];
                    document.getElementById("mmodal_orderStatus").innerHTML = oorderStatus[index];
                    document.getElementById("mmodal_filePath").innerHTML = ffilepath[index];


                }
                    function displayPrescriptionFun(){
                        if(filepath[finalId]==="Doctor Prescription"){
                             document.getElementById("displayPrescription").href = absolutepath[finalId];
                        }
                        else{
                        document.getElementById("displayPrescription").href = "public/storage/pres/"+absolutepath[finalId];

                    }

                }
                    function downloadPrescriptionFun(){

                        document.getElementById("downloadPrescription").download = filepath[finalId];;


                }
                // When the user clicks on <span> (x), close the modal
                sspan.onclick = function () {
                    mmodal.style.display = "none";
                }

                // When the user clicks anywhere outside of the modal, close it
                window.onclick = function (event) {
                    if (event.target == modal) {
                        mmodal.style.display = "none";
                    }
                }

                //when printing
                pprint.onclick = function () {
                    pprint.style.display = "none";
                    var win = window.open();
                    var printContent = $("#pprintPart").html();

                    $(win.document.body).html(printContent);
                    win.print();
                    pprint.style.display = "block";
                }

                    function confirmdelete(index) {

                    var del = confirm("Are you sure you want delete this order permenently ?");



                    if (del == true){
                        if((orderStatus[index]==="Completed")||(orderStatus[index]==="Cancelled")){
                        var orderId = index+1;
                        window.location.href="deletepatientorder?orderid="+orderId;

                    }
                    else{
                        alert("You cannot delete an order which is not completed nor cancelled.")
                    }


                }}
               
               //    #########################
               //    order modal script end
               //    #########################
               //    
               //    #########################
               //    modal script end
               //    #########################



          </script>

     </body>
</html>