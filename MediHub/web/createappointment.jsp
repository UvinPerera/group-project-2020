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
          <link rel="stylesheet" type="text/css" href="./public/css/new_dash_hos.css" media="screen" />
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
                                   <h1>Hello //=username</h1>
                                   <p>Profile</p>
                              </div>
                         </div>-->

                         <!-- change the main cards css fragments to change number of cards Available -->
                         <form class="" action="createappointment" method="POST" id="submitForm">
                            <input type="hidden" name="search" value="1"/>
                            <div class="main_cards">

                                 <div class="card">
                                      <i class="fa fa-stethoscope fa-2x text-red"></i>
                                      <div class="card_inner_profile">
                                           <p class="text-primary-p">Doctor Name</p>
                                           <!--<p class="text-secondary-p doctor_select"><input placeholder="Search Doctor" type="text" name="doctor" id="doctor" maxlength="10" class="" value="#getdoctor"/></p>-->
                                           
                                           <select class="text-secondary-p doctor_select" style="width: 100%" name="doctor" id="doctor" required>
                                               <option value="" disabled>Search Doctor</option>
                                               <%
                                                   if(request.getAttribute("doctors")!=null){
                                                     
                                                       List<Doctor> doc = (ArrayList<Doctor>)request.getAttribute("doctors");
                                                   for(int i=0;i<doc.size();i++){
                                               %>
                                                <option value="<%=doc.get(i).id %>"><%=doc.get(i).doctorName %></option>
                                               <%}}%>
                                           </select>
                                      </div>
                                 </div>

                                 

                                 

                                 <div class="card">
                                      <i class="fa fa-calendar fa-2x text-yellow"></i>
                                      <div class="card_inner_profile">
                                           <p class="text-primary-p">Date</p>
                                           <p class="text-secondary-p"><input type="date" name="date" id="date" class="form-control text" style="width: 100%" value="" required/></p>
                                      </div>
                                 </div>
                                
                                <div class="card">
                                      <i class="fa fa-clock-o fa-2x text-green"></i>
                                      <div class="card_inner_profile">
                                           <p class="text-primary-p">Start Time</p>
                                           <p class="text-secondary-p"><input type="time" name="sTime" id="sTime" class="form-control text" style="width: 100%" required/></p>
                                      </div>
                                 </div>
                                
                                <div class="card">
                                      <i class="fa fa-clock-o fa-2x text-red"></i>
                                      <div class="card_inner_profile">
                                           <p class="text-primary-p">End Time</p>
                                           <p class="text-secondary-p"><input type="time" name="eTime" id="eTime" class="form-control text" style="width: 100%" value="" required=""/></p>
                                      </div>
                                 </div>
                                
                                <div class="card">
                                      <i class="fa fa-user fa-2x text-yellow"></i>
                                      <div class="card_inner_profile">
                                           <p class="text-primary-p">Maximum Patients</p>
                                           <p class="text-secondary-p"><input type="number" name="maxCount" id="maxCount" class="form-control text" style="width: 100%" value="" required=""/></p>
                                      </div>
                                 </div>
                                
                                <div class="card">
                                      <i class="fa fa-money fa-2x text-green"></i>
                                      <div class="card_inner_profile">
                                           <p class="text-primary-p">Doctor Fee</p>
                                           <p class="text-secondary-p"><input type="number" step="0.01" name="fee" id="fee" class="form-control text" style="width: 100%" value="" required=""/></p>
                                      </div>
                                 </div>
                                
                                <div></div>
                                <div></div>
                                
                                 <div class="buttons">
                                   <button class="button" type="reset" id="clear"><b>Reset</b></button>
                                   <button class="button-success" type="submit"><b>Create Appointment</b></button>     
                                 </div>

                                 <div></div>
                                 <div></div>
                                 <div></div>

                            </div>
                         </form>
                                               
                        
                         
                        <div class="">

                             <!--######################-->
                                <!--left table section starting-->
                             <!--######################-->
                              
                             <!--######################-->
                                <!--left table section ending-->
                             <!--######################-->
                             
                        </div>
                        
                    </div>

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
          

          <!--<script>
              
                $(document).ready( function () {
                    
                    //select2
                    $('.hospital_select').select2({
                        placeholder: "Select Hospital",
                        allowClear: true
                    }).val("#gethospital").trigger("change");
                    $('.specialisation_select').select2({
                        placeholder: "Select Specialisation",
                        allowClear: true
                    }).val("#getspecialization").trigger("change");
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
                    }).val("#getDoctor").trigger("change");
        
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
                var getDateJs="#getDate";
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
          -->