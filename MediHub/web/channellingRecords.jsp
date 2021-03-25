<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.medihub.patient.*"%>
<%@page import="com.medihub.doctor.*"%>
<%@page import="com.medihub.hospital.*"%>
<%@page import="com.medihub.location.*"%>

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
          <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.22/css/jquery.dataTables.css">
          <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/rowgroup/1.1.2/css/rowGroup.dataTables.min.css">
          <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
          <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
          <script type="text/javascript" src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.js"></script>
          <script type="text/javascript" src="https://cdn.datatables.net/rowgroup/1.1.2/js/dataTables.rowGroup.min.js"></script>
          <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
     </head>

     <body>

          <% 
               String username="";
               String getDoctor="";
               int getStatus=0;
               int getHospital=0;
               int getSpecialisation=0;
               String getStartDate="";
               String getEndDate="";
               int getLimit=0;

               username= session.getAttribute("username").toString();
                     
               if (request.getParameter("status")!=null && request.getParameter("status")!="") {
                    getStatus=Integer.parseInt(request.getParameter("status"));
               }
                     
               if (request.getParameter("doctor")!=null && request.getParameter("doctor")!="") {
                    getDoctor=request.getParameter("doctor");
               }
                     
               if (request.getParameter("hospital")!=null && request.getParameter("hospital")!="") {
                    getHospital=Integer.parseInt(request.getParameter("hospital"));
               }
                     
               if (request.getParameter("specialisation")!=null && request.getParameter("specialisation")!="") {
                    getSpecialisation=Integer.parseInt(request.getParameter("specialisation"));
               }
                     
               if (request.getParameter("start_date")!=null && request.getParameter("start_date")!="") {
                    getStartDate=request.getParameter("start_date");
               }
                     
               if (request.getParameter("end_date")!=null && request.getParameter("end_date")!="") {
                    getEndDate=request.getParameter("end_date");
               }
                     
               if (request.getParameter("limit")!=null && request.getParameter("limit")!="") {
                    getLimit=Integer.parseInt(request.getParameter("limit"));
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

<!--                         <div class="main_title">
                             <img src="./public/images/p3.jpg" alt="hello">
                              <div class="main_greeting">
                                   <h1>Hello <%//=username%></h1>
                                   <p>Profile</p>
                              </div>
                         </div>-->

                         <!-- change the main cards css fragments to change number of cards Available -->
                         <form class="" action="channellingRecords" method="GET" id="submitForm">
                             <input type="hidden" name="search" value="1"/>
                            <div class="main_cards">

                                 <div class="card">
                                      <i class="fa fa-binoculars fa-2x text-blue"></i>
                                      <div class="card_inner_profile">
                                           <p class="text-primary-p">Status</p>
                                           <!--<p class="text-secondary-p doctor_select"><input placeholder="Search Doctor" type="text" name="doctor" id="doctor" maxlength="10" class="" value="<%= getDoctor %>"/></p>-->
                                           
                                           <select class="text-secondary-p status_select" style="width: 100%" name="status" id="status">
                                               <option value="0" <% if(0==getStatus){out.print("selected");} %>>All</option>
                                               <option value="1" <% if(1==getStatus){out.print("selected");} %>>Pending</option>
                                               <option value="2" <% if(2==getStatus){out.print("selected");} %>>Finished</option>
                                               <option value="3" <% if(3==getStatus){out.print("selected");} %>>Cancelled</option>
                                           </select>
                                      </div>
                                 </div>

                                 <div class="card">
                                      <i class="fa fa-stethoscope fa-2x text-red"></i>
                                      <div class="card_inner_profile">
                                           <p class="text-primary-p">Doctor Name</p>
                                           <!--<p class="text-secondary-p doctor_select"><input placeholder="Search Doctor" type="text" name="doctor" id="doctor" maxlength="10" class="" value="<%= getDoctor %>"/></p>-->
                                           
                                           <select class="text-secondary-p doctor_select" style="width: 100%" name="doctor" id="doctor">
                                               <option value="" disabled>Search Doctor</option>
                                           </select>
                                      </div>
                                 </div>

                                 <div class="card">
                                      <i class="fa fa-hospital-o fa-2x text-green"></i>
                                      <div class="card_inner_profile">
                                           <p class="text-primary-p">Hospital</p>
                                           <p class="text-secondary-p">
                                               <!--<input placeholder="Search Hospital" list="hospitals" name="hospitalText" id="hospitalText" onkeyup="findList('hospitalText','hospital')">-->
                                               
                                               <select name='hospital' class="hospital_select" style="width: 100%" id="hospital">
                                                   <option value="">Select Hospital</option>
                                                    <%
                                                        if(request.getAttribute("hospitals")!=null){
                                                            List<Hospital> hosTable = (ArrayList<Hospital>)request.getAttribute("hospitals");
                                                            if(hosTable.size()>0){
                                                                for(Hospital hos : hosTable) { %>
                                                                    <option value='<%= hos.id %>' <% if(hos.id==getHospital){ out.print("selected");} %>><%= hos.displayName %></option>
                                                    <%
                                                            }}}
                                                    %>
                                               </select>
                                           </p>
                                      </div>
                                 </div>

                                 <div class="card">
                                      <i class="fa fa-filter fa-2x text-lightblue"></i>
                                      <div class="card_inner_profile">
                                           <p class="text-primary-p">Specialisation</p>
                                           <p class="text-secondary-p">
                                               <!--<input placeholder="Select Specialisation" list="specialisations" name="specialisationText" id="specialisationText" onkeyup="findList('specialisationText','specialisation')">-->
                                               
                                               <select name='specialisation' class="specialisation_select" style="width: 100%" id="specialisation">
                                                   <option value="">Select Specialisation</option>
                                                    <%
                                                        if(request.getAttribute("specialisations")!=null){
                                                            List<DoctorSpecialisation> specialTable = (ArrayList<DoctorSpecialisation>)request.getAttribute("specialisations");
                                                            if(specialTable.size()>0){
                                                                for(DoctorSpecialisation spl : specialTable) { %>
                                                                    <option value='<%= spl.id %>' <% if(spl.id==getSpecialisation){ out.print("selected");} %>><%= spl.name %></option>
                                                    <%
                                                            }}}else{out.print("<option>sfd</option>");}
                                                    %>
                                               </select>
                                           </p>
                                      </div>
                                 </div>
                                
                                 <div class="card">
                                      <i class="fa fa-calendar fa-2x text-yellow"></i>
                                      <div class="card_inner_profile">
                                           <p class="text-primary-p">Start Date</p>
                                           <p class="text-secondary-p"><input type="date" name="start_date" id="start_date" class="form-control text" style="width: 100%" value=""/></p>
                                      </div>
                                 </div>
                                
                                 <div class="card">
                                      <i class="fa fa-calendar fa-2x text-brown"></i>
                                      <div class="card_inner_profile">
                                           <p class="text-primary-p">End Date</p>
                                           <p class="text-secondary-p"><input type="date" name="end_date" id="end_date" class="form-control text" style="width: 100%" value=""/></p>
                                      </div>
                                 </div>

                                 <div class="buttons">
                                   <button class="button" type="reset" id="clear"><b>Reset</b></button>
                                   <button class="button-success" type="submit"><b>Search</b></button>     
                                 </div>

                                 <div></div>
                                 <div></div>
                                 <div></div>

                            </div>
                         </form>
                                               
                        <hr><br>
                         
                        <div class="">

                             <!--######################-->
                                <!--left table section starting-->
                             <!--######################-->
                              <div class="charts_left">
                                   <!-- <div class=""> -->
                                        <div class="charts_left_title">
                                             <div>
                                                  <h1>Records</h1>
                                                  <!-- <p>Something</p> -->
                                             </div>
                                             <!--<i class="fa fa-suitcase"></i>-->
                                        </div>
                                   
                                        <!--pending appointments starts-->
                                        <!--checking for availability-->
                                        <%
                                             if(request.getAttribute("records")!=null){
                                                  List<Channelling> table = (ArrayList<Channelling>)request.getAttribute("records");
                                                  if(table.size()>0){
                                        %>
                                        
                                        <!--js array-->
                                        <script>
                                             var id = [];
                                             var hospital = [];
                                             var doctor = [];
                                             var specialisation_1 = [];
                                             var specialisation_2 = [];
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
                                        
                                        <div class="charts_table_div">
                                             <table id="avail" class="display charts_table" style="width:100%">
                                                  <thead>
                                                       <tr>
                                                            <th>#</th>
                                                            <th>Doctor</th>
                                                            <th>Hospital</th>
                                                            <th>Specialisation</th>
                                                            <th>Date/Time</th>
                                                            <th>#Appointment</th>
                                                            <th>Description</th>
                                                            <th>Status</th>
                                                            <th>Action</th>
                                                       </tr>
                                                  </thead>
                                                  <tbody>
                                                       <% 
                                                           int cc = 0;
                                                           for(Channelling row : table) {
                                                               cc++;
                                                                if (cc>10){
                                                                    break;
                                                                }
                                                       %>
                                                       <tr>
                                                            <td><%= row.id %></td>
                                                            <td><%= row.doctor %></td>
                                                            <td><%= row.hospital %></td>
                                                            <td>
                                                                <%= row.specialisation_1 %>
                                                                <br>
                                                                <%= row.specialisation_2 %>
                                                            </td>
                                                            <td><%= row.date %><br><%= row.start_time %></td>
                                                            <td><%= row.appointmentNo %></td>
                                                            <td><%= row.description %></td>
                                                            <td>
                                                                <% if(row.status==1){out.print("Pending");}else if(row.status==2){out.print("Finished");}else if(row.status==0){out.print("Cancelled");} %>
                                                            </td>
                                                            <td><button id="popUp" onclick="popup('<%= table.indexOf(row) %>');" index="<%= table.indexOf(row) %>"><i class="fa fa-eye"></i></button></td>
                                                       </tr>
                                                       
                                                       <script>
                                                            id[<%= table.indexOf(row) %>]                   =<%= row.getId() %>;
                                                            hospital[<%= table.indexOf(row) %>]             ="<%= row.hospital %>";
                                                            doctor[<%= table.indexOf(row) %>]               ="<%= row.doctor %>";
                                                            specialisation_1[<%= table.indexOf(row) %>]     ="<%= row.specialisation_1 %>";
                                                            specialisation_2[<%= table.indexOf(row) %>]     ="<%= row.specialisation_2 %>";
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
                                                        

                                                  </tbody>
                                                  
                                                  <tfoot>
                                                       <tr>
                                                            <th>#</th>
                                                            <th>Doctor</th>
                                                            <th>Hospital</th>
                                                            <th>Specialisation</th>
                                                            <th>Date/Time</th>
                                                            <th>#Appointment</th>
                                                            <th>Description</th>
                                                            <th>Status</th>
                                                            <th>Action</th>
                                                       </tr>
                                                  </tfoot>
                                                  
                                             </table>
                                                        
                                                        <% if(table.size()>10 || getLimit>0) { %>
                                                        <div class="card">
                                                        <p style="text-align: center;">
                                                            <% if(getLimit>0) { %>
                                                                <a href="channelling?search=1&status=<%=getStatus%>&doctor=<%=getDoctor%>&hospital=<%if(getHospital==0){out.println("");}else{out.println(getHospital);}%>&specialisation=<%if(getSpecialisation==0){out.println("");}else{out.println(getSpecialisation);}%>&startDate=<%=getStartDate%>&endDate=<%=getEndDate%>&limit=<%=getLimit-10%>">Prev</a>
                                                            <% } %>
                                                            &nbsp;
                                                            <% if(table.size()>10) { %>
                                                                <a href="channelling?search=1&status=<%=getStatus%>&doctor=<%=getDoctor%>&hospital=<%if(getHospital==0){out.println("");}else{out.println(getHospital);}%>&specialisation=<%if(getSpecialisation==0){out.println("");}else{out.println(getSpecialisation);}%>&startDate=<%=getStartDate%>&endDate=<%=getEndDate%>&limit=<%=getLimit+10%>">Next</a>
                                                            <% } %>
                                                        </p>
                                                        </div>
                                                        <%}%>
                                                        
                                        </div>
                                              
                                        <!--when there is no pending appointments-->
                                                  <%
                                                       }
                                                       else
                                                       {
                                                  %>
                                                  No Records Available !
                                                  <%
                                                       }}
                                                       else{
                                                  %>
                                                  Search Records !
                                                  <% } %>

                                    <!--</div>--> 
                              </div>
                             <!--######################-->
                                <!--left table section ending-->
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
              
                $(document).ready( function () {
                    
                    //select2
                    $('.status_select').select2({
                        //placeholder: "Select Hospital",
                        allowClear: true
                    }).val("<%=getStatus%>").trigger("change");
                    
                    $('.hospital_select').select2({
                        placeholder: "Select Hospital",
                        allowClear: true
                    }).val("<%=getHospital%>").trigger("change");
                    
                    $('.specialisation_select').select2({
                        placeholder: "Select Specialisation",
                        allowClear: true
                    }).val("<%=getSpecialisation%>").trigger("change");
                    
                    $('.doctor_select').select2({
                        placeholder: "Select Doctor",
                        minimumInputLength: 2,
                        allowClear: true,
                        ajax: {
                            url: "getDoctors",
                            dataType: 'json',
                            type: "GET",
                            quietMillis: 50,
                            data: function (term) {
                            return {
                                q: term
                            };
                            },
                            processResults: function (data) {
                                return {
                                    results: $.map(data, function (item) {
                                        return {
                                            text: item.doctorName,
                                            id: item.id
                                        };
                                    })
                                };
                            },
                            cache: true
                        }
                    }).val("<%=getDoctor%>").trigger("change");
        
                    //data table
                    $('#avail').DataTable( {
//                        order: [[0, 'asc'], [1, 'asc']],
//                        rowGroup: {
//                            dataSrc: [ 0, 1 ]
//                        },
//                        columnDefs: [ {
//                            targets: [ 0, 1 ],
//                            visible: false
//                        } ]
                    } );
                

                //date selection limiting
                function validStartDate(){
                    var today = new Date().toISOString().split('T')[0];
                    var nextWeekDate = new Date(new Date().getTime() + 7 * 24 * 60 * 60 * 1000).toISOString().split('T')[0];
                    document.getElementsByName("start_date")[0].setAttribute('max', nextWeekDate);
//                    document.getElementsByName("end_date")[0].setAttribute('max', nextWeekDate);
                }
                function validEndDate(){
                    var today = new Date().toISOString().split('T')[0];
                    var nextWeekDate = new Date(new Date().getTime() + 7 * 24 * 60 * 60 * 1000).toISOString().split('T')[0];
//                    document.getElementsByName("start_date")[0].setAttribute('max', nextWeekDate);
                    document.getElementsByName("end_date")[0].setAttribute('max', nextWeekDate);
                }
                
                //initialising date
                var getStartDateJs="<%= getStartDate %>";
                var getEndDateJs="<%= getEndDate %>";
                
                if(getStartDateJs==""){
                    document.getElementById('start_date').value = new Date().toISOString().substr(0, 10);
                }else{
                    document.getElementById('start_date').value = getStartDateJs;
                }
                
                if(getEndDateJs==""){
                    document.getElementById('end_date').value = new Date(new Date().getTime() + 7 * 24 * 60 * 60 * 1000).toISOString().split('T')[0];
                }else{
                    document.getElementById('end_date').value = getEndDateJs;
                }
                
                $('#start_date').click(function(){
                    validStartDate();
                });
                
                $('#end_date').click(function(){
                    validEndDate();
                });
                
} );
                
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

               if (paymentStatus[index] = 1) {
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