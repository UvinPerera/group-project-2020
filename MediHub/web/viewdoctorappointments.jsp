<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.medihub.doctor.*"%>
<%@page import="com.medihub.db.DbConfig"%>

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
          <link rel="stylesheet" type="text/css" href="./public/css/managePharmacy.css" media="screen" />
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
                        <div class="main_title">
                             <div class="main_greeting">
                                 <h3>View Appointments</h3>
                             </div>
                        </div> 
                        <form class="" action="managePharmacy" method="GET" id="submitForm">
                             <input type="hidden" name="searching" value=""/>
                        <div class="main_cards">

                            

                                 <div class="card">
                                      <i class="fa fa-medkit fa-2x text-green"></i>
                                      <div class="card_inner_profile">
                                           <p class="text-primary-p">Search</p>
                                               
                                               <select name='search' class="text-secondary-p search_select" style="width: 100%" id="search">
                                                   <option value='Action' selected><a href="">All</a></option>
                                                   <option value='Action'><a href="#">Hospital</a></option>
                                                   <option value='Action'><a href="#">Date</a></option>
                                                   
                                               </select>
                                      </div>
                                 </div>

                                 <div class="card">
                                      <i class="fa fa-filter fa-2x text-lightblue"></i>
                                      <div class="card_inner_profile">
                                          <p class="text-primary-p">Value</p>
                                            <input type="text" class="filter_text textt" style="width: 100%" >
                                      </div>
                                 </div>
               
                                 <div class="buttons">
                                   <button class="button-success" type="submit"><b>Search</b></button>
                                   <button class="button" type="reset" id="clear" style="background: red"><b>Reset</b></button>
                                 </div>


                            </div>
                              </form>
                                               
                        <hr>
                        <!--######################-->
                        <!--create button-->
                        <!--######################-->
                        
                        
                        <div class="charts">
                          
                            <div class="charts_table_div">
                                        <table class="charts_table">
                                       
                                        <!--js array-->
                                        
                                             <thead>
                                                  <tr>
                                                        <th>#</th>
                                                       <th>Hospital</th>
                                                       <th>Date</th>
                                                       <th>Start Time</th>
                                                       <th>End Time</th>
                                                       <th>Max patients</th>
                                                       <th>Current patients</th>
                                                       <th>Fee</th>
                                     
                                                       
                                                      
                                                  </tr>
                                             </thead>
                                             <tbody>
                                                
                                             <%
                                                     
                                                     if(request.getAttribute("appointments")!=null){
                                                     List <DoctorAvailability> da = (ArrayList<DoctorAvailability>)request.getAttribute("appointments");
                                                     
                                                     for(int i =0;i<da.size();i++){
                                                 %>
                                                  <tr id="" value="">
                                                 
                                                      <td><%=da.get(i).id %></td>
                                                      <td><%=da.get(i).hospitalName %></td>
                                                       <td><%=da.get(i).date %></td>
                                                       <td><%=da.get(i).startTime %></td>
                                                       <td><%=da.get(i).endTime %></td>
                                                       <td><%=da.get(i).maxCount %></td>
                                                       <td><%=da.get(i).count %></td>
                                                       <td><%=da.get(i).payment %></td>
                                                        
                                                       
                                                       
                                                  </tr>
                                                  <%}} else{%><tr><td colspan="6">No upcoming appointments</td></tr><%}%>
                                                  
                                             </tbody>
                                        </table>
                                   </div>

                              </div>
                        </div>                            
                    <!--######################-->
                        <!--container ending-->
                    <!--######################-->

               </main>

                <!--######################-->
                <!--sidebar starting-->
                <!--######################-->
               
                <jsp:include page="./public/includes/doctorSidebar.jsp"/>
                
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
              
              $("[id^=docDel_]").click(function(){
                  
                  var docId = $(this).attr("docId");
                  var r = confirm("Do you want to unlink Doctor with id "+docId+" ?");
                  
                  if(r === true){
                      
                      
                  }
              });
          </script>

     </body>
</html>