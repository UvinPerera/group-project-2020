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
               int getHospital=0;
               int getSpecialisation=0;
               String getDate="";
               int getLimit=0;

               username= session.getAttribute("username").toString();
                     
               if (request.getParameter("doctor")!=null && request.getParameter("doctor")!="") {
                    getDoctor=request.getParameter("doctor");
               }
                     
               if (request.getParameter("hospital")!=null && request.getParameter("hospital")!="") {
                    getHospital=Integer.parseInt(request.getParameter("hospital"));
               }
                     
               if (request.getParameter("specialisation")!=null && request.getParameter("specialisation")!="") {
                    getSpecialisation=Integer.parseInt(request.getParameter("specialisation"));
               }
                     
               if (request.getParameter("date")!=null && request.getParameter("date")!="") {
                    getDate=request.getParameter("date");
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
                         <form class="" action="channelling" method="GET" id="submitForm">
                            <input type="hidden" name="search" value="1"/>
                            <div class="main_cards">

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
                                           <p class="text-primary-p">Date</p>
                                           <p class="text-secondary-p"><input type="date" name="date" id="date" class="form-control text" style="width: 100%" value=""/></p>
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
                                                  <h1>Appointments</h1>
                                                  <!-- <p>Something</p> -->
                                             </div>
                                             <!--<i class="fa fa-suitcase"></i>-->
                                        </div>
                                   
                                        <!--pending appointments starts-->
                                        <!--checking for availability-->
                                        <%
                                             if(request.getAttribute("availabilities")!=null){
                                                  List<DoctorAvailability> table = (ArrayList<DoctorAvailability>)request.getAttribute("availabilities");

                                                  if(table.size()>0){
                                        %>
                                        
                                        <div class="charts_table_div">
                                             <table id="avail" class="display charts_table" style="width:100%">
                                                  <thead>
                                                       <tr>
                                                            <th>Doctor</th>
                                                            <th>Hospital</th>
                                                            <th>Specialisation</th>
                                                            <th>Date</th>
                                                            <th>Time</th>
                                                            <th>#Appointment</th>
                                                            <th>Fee</th>
                                                            <th>Channel</th>
                                                       </tr>
                                                  </thead>
                                                  <tbody>
                                                       <% 
                                                           int cc = 0;
                                                           for(DoctorAvailability row : table) {
                                                               cc++;
                                                                if (cc>10){
                                                                    break;
                                                                }
                                                       %>
                                                       <tr>
                                                            <td><%= row.doctorName %></td>
                                                            <td><%= row.hospitalName %></td>
                                                            <td>
                                                                <%= row.doctorSpecialisation1Name %>
                                                                <br>
                                                                <%= row.doctorSpecialisation2Name %>
                                                            </td>
                                                            <td><%= row.date %></td>
                                                            <td><%= row.startTime %></td>
                                                            <td><%= row.count+1 %>
                                                            <td><%= row.payment %> LKR</td>
                                                            <td><button id="popUp" onclick="confirmChannelling(<%= row.id %>);"><i class="fa fa-hand-pointer-o"></i> Click to Proceed</button></td>
                                                       </tr>
                                
                                                        <%}%>
                                                        

                                                  </tbody>
                                                  
                                                  <tfoot>
                                                       <tr>
                                                            <th>Doctor</th>
                                                            <th>Hospital</th>
                                                            <th>Specialisation</th>
                                                            <th>Date</th>
                                                            <th>Time</th>
                                                            <th>#Appointment</th>
                                                            <th>Fee</th>
                                                            <th>Channel</th>
                                                       </tr>
                                                  </tfoot>
                                                  
                                             </table>
                                                        
                                                        <% if(table.size()>10 || getLimit>0) { %>
                                                        <div class="card">
                                                        <p style="text-align: center;">
                                                            <% if(getLimit>0) { %>
                                                                <a href="channelling?search=1&doctor=<%=getDoctor%>&hospital=<%if(getHospital==0){out.println("");}else{out.println(getHospital);}%>&specialisation=<%if(getSpecialisation==0){out.println("");}else{out.println(getSpecialisation);}%>&date=<%=getDate%>&limit=<%=getLimit-10%>">Prev</a>
                                                            <% } %>
                                                            &nbsp;
                                                            <% if(table.size()>10) { %>
                                                                <a href="channelling?search=1&doctor=<%=getDoctor%>&hospital=<%if(getHospital==0){out.println("");}else{out.println(getHospital);}%>&specialisation=<%if(getSpecialisation==0){out.println("");}else{out.println(getSpecialisation);}%>&date=<%=getDate%>&limit=<%=getLimit+10%>">Next</a>
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
                                                  No Appointments Available !
                                                  <%
                                                       }}
                                                       else{
                                                  %>
                                                  Search Doctor Availabilities !
                                                  <% } %>

                                    <!--</div>--> 
                              </div>
                             <!--######################-->
                                <!--left table section ending-->
                             <!--######################-->
                             
                        </div>
                        
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
                        order: [[0, 'asc'], [1, 'asc']],
                        rowGroup: {
                            dataSrc: [ 0, 1 ]
                        },
                        columnDefs: [ {
                            targets: [ 0, 1 ],
                            visible: false
                        } ]
                    } );
                } );

                //date selection limiting
                function validDate(){
                    var today = new Date().toISOString().split('T')[0];
                    var nextWeekDate = new Date(new Date().getTime() + 7 * 24 * 60 * 60 * 1000).toISOString().split('T')[0];
                    document.getElementsByName("date")[0].setAttribute('min', today);
                    document.getElementsByName("date")[0].setAttribute('max', nextWeekDate);
                }
                
                //initialising date
                var getDateJs="<%= getDate %>";
                if(getDateJs==""){
                    document.getElementById('date').value = new Date().toISOString().substr(0, 10);
                }else{
                    document.getElementById('date').value = getDateJs;
                }
                $('#date').click(function(){
                    validDate();
                });
                
                //confirm channeling
                function confirmChannelling(doctorAvailabilityId){

                    $.ajax({
                        url: "confirmchannelling",
                        type: "get", //send it through get method
                        data: { 
                          doctorAvailabilityId: doctorAvailabilityId, 
                          check: "0"
                        },
                        success: function(response) {
                          //check dulpication
            //              alert(response);
                          if(response==1)
                          {
                              var c = confirm("Another channelling found for same doctor availability !\nAre you sure want to channel for another person?");
                              if(c==true)
                              {
                                  window.location.href="confirmchannelling?doctorAvailabilityId="+doctorAvailabilityId;
                              }
                              else
                              {
                                  alert("You Cancelled the channelling ! ");
                              }
                          }
                          else
                          {
                                window.location.href="confirmchannelling?check=1&doctorAvailabilityId="+doctorAvailabilityId;
                          }
                        },
                        error: function(xhr) {
                            alert("Error");
                        }
                      });

                };
              
          </script>
          
     </body>
</html>