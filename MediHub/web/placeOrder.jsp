<%-- 
    Document   : place_order
    Created on : Mar 20, 2021, 7:13:40 PM
    Author     : Yash
--%>

<%@page import="com.medihub.prescription.Prescription"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.medihub.patient.*"%>
<%@page import="com.medihub.pharmacy.*"%> 
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
                   <h3 style="padding-left: 5%;padding-top:2%;">Place Pharmacy Order</h3>
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
                         <form action="submitorder" method="post" enctype="multipart/form-data">
<!--                         <form class="" action="channelling" method="GET" id="submitForm">-->
<!--                             <input type="hidden" name="search" value="1"/>-->
                            <div class="main_cards">

                                 <div class="card">
                                      <i class="fa fa-map-marker fa-2x text-red"></i>
                                      <div class="card_inner_profile">
                                           <p class="text-primary-p">Select District</p>
                                          <select name='district' id="district">
                                                <option value='' selected>Select District</option>
                                                <%
                                                           if(request.getAttribute("districts")!=null){
                                                               List<District> table = (ArrayList<District>)request.getAttribute("districts");
                                                               if(table.size()>0){
                                                                   for(District row : table) { %>
                                                                       <option value='<%= row.id %>'><%= row.nameEn %></option>
                                                       <%
                                                               }}}
                                                       %>

                                       </select>
                                               
                                      </div>
                                 </div>

                                <div class="card">
                                      <i class="fa fa-map-marker fa-2x text-red"></i>
                                      <div class="card_inner_profile">
                                           <p class="text-primary-p">Select City</p>
                                                    <select name='city' id="city" class="filter_dropdown">
                                                        <option value='' selected>Select City</option>

                                                    </select>
                                                                                  
                                      </div>
                                 </div>


                               

                                 <div class="card">
                                      <i class="fa fa-medkit fa-2x text-yellow"></i>
                                      <div class="card_inner_profile">
                                            <p class="text-primary-p">Select Pharmacy</p>
                                            <select name='pharmacy' id="pharmacy" class="filter_dropdown">
                                                <option value='' selected>Select pharmacy</option>

                                             </select>
                                          
                                      </div></div>
                                      
                                 <div class="card">
                                      <i class="fa fa-calendar fa-2x text-yellow"></i>
                                      <div class="card_inner_profile">
                                            <p class="text-primary-p">Expected Delivery Date</p>
                                            <p class="text-secondary-p"><input type="date" name="date" id="date" class="form-control text" style="width: 100%" value="" required></p>
                                          
                                      </div></div>
                                                       
                                <div class="card">
                                      <i class="fa fa-file-image-o fa-2x text-blue"></i>
                                      <div class="card_inner_profile">
                                           <p class="text-primary-p">Check the box if you wish to upload a prescription manually.</p>
                                           <p class="text-secondary-p"><input class="input" type="checkbox" name="" id="prescription" ></p>
                                      </div>
                                </div>
                                 
                                <div class="card" id="filepath">
                                      <i class="fa fa-file-image-o fa-2x text-blue"></i>
                                      <div class="card_inner_profile">
                                           <p class="text-primary-p">Prescription</p>
                                           <p class="text-secondary-p"><input class="input" type="file" name="file_path"  placeholder="Select Image"></p>
                                      </div>
                                </div>
                                                       
                                 <div class="card" id="doctorPrescriptions">
                                      <i class="fa fa-medkit fa-2x text-yellow"></i>
                                      <div class="card_inner_profile">
                                            <p class="text-primary-p">Select Doctor Prescriptions</p>
                                           
                                            <select name='doctorPrescriptions'  class="filter_dropdown">
                                                 <option selected disabled="">Choose Prescription</option>
                                                <%if(request.getAttribute("prescriptions")!=null){
                                                List<Prescription> p = (ArrayList<Prescription>)request.getAttribute("prescriptions");
                                                for(Prescription row:p){
                                                %>
                                                <option value='<%=row.id %>'>Prescription of DR.<%=row.docName %>(<%=row.date %>)</option>
                                                <%}}%>
                                             </select>
                                          
                                      </div></div>
                                      
                                 
                                <div class="card">
                                      <i class="fa fa-comment-o fa-2x text-blue"></i>
                                      <div class="card_inner_profile">
                                           <p class="text-primary-p">Additional Comments</p>
                                           <p class="text-secondary-p"><input class="input" type="text" name="description" id="email" placeholder="Enter description"></p>
                                      </div>
                                 </div>
                                                      
                                 <div class="buttons">
                                     <button class="button" id="id" type="button" onclick="window.location.href='patient';"><b>Cancel</b></button>
                                    <button class="button" type="reset" id="clear"><b>Clear</b></button>
                                 
                                   <button class="button-success" type="submit"><b>Place Order</b></button>     
                                 </div>

                                 

                         </form>
                                               
                        <br>
                         
                        
                        
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
<script>
    
    //date selection limiting
    function validDate(){
        var today = new Date().toISOString().split('T')[0];
        var nextWeekDate = new Date(new Date().getTime() + 7 * 24 * 60 * 60 * 1000).toISOString().split('T')[0];
        document.getElementsByName("date")[0].setAttribute('min', today);
        document.getElementsByName("date")[0].setAttribute('max', nextWeekDate);
    }
    
//    $('#date').click(function(){
//        validDate();
//    });
    
//    onchange district
    $('#district').change(function(){
        var districtId=$(this).find(':selected').val();
        $('#doctorAvailability').html("<tr><td class=\"Row\" colspan=\"5\">Select Filters</td></tr>");
        
        $.ajax({
            url: "getcityasstring",
            type: "get", //send it through get method
            data: { 
              stage: "district", 
              district: districtId
            },
            success: function(response) {
              //populate city data
//              alert(response);
              $('#city').html("<option>Select City</option>"+response);
            },
            error: function(xhr) {
                alert("CityByDistrict Error");
            }
          });

    });
    
//    onchange city
    $('#city').change(function(){
        var cityId=$(this).find(':selected').val();
        $('#doctorAvailability').html("<tr><td class=\"Row\" colspan=\"5\">Select Filters</td></tr>");
        
        $.ajax({
            url: "getpharmacybycityasstring",
            type: "get", //send it through get method
            data: { 
              stage: "city", 
              city: cityId
            },
            success: function(response) {
              //populate city data
//              alert(response);
              $('#pharmacy').html("<option>Select Pharmacy</option>"+response);
            },
            error: function(xhr) {
                alert("PharmacyByCity Error");
            }
          });

    });
    

    
 
//    });
    
</script>
<script>
     $("#filepath").hide();
     $("#doctorPrescriptions").show();
             var toggle=1;
           
            
            $("#prescription").click(function(){
                toggle=toggle+1;
               
                if(toggle%2===0){
                    $("#filepath").show();
                    $("#doctorPrescriptions").hide();
                    
                }else {
                    
                     $("#filepath").hide();
                     $("#doctorPrescriptions").show();
                }
                toggle = toggle%2;
            });
</script>