<%-- 
    Document   : managePermissions
    Created on : Mar 29, 2021, 10:53:49 AM
    Author     : Yash
--%>


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
               

               username= session.getAttribute("username").toString();
               int search= Integer.parseInt(request.getAttribute("search").toString());   
               
               if (request.getParameter("doctor")!=null && request.getParameter("doctor")!="") {
                    getDoctor=request.getParameter("doctor");
               }
                     
        
               
          %>
          
          <div class="container">
              
             <jsp:include page="./public/includes/navbar.jsp"/>
             <main>
                
                 <div class="main_container">
                      <%
                         if(search==0){
                             
                     %>
                     <form class="" action="managePermissions" method="GET" id="submitForm">
                         <input type="hidden" name="search" value="1"/>
                         <h4>Select a doctor you wish to change record viewing permissions for</h4>
                            <div class="main_cards">
                                
                                 <div class="card">
                                      <i class="fa fa-stethoscope fa-2x text-red"></i>
                                      <div class="card_inner_profile">
                                           <p class="text-primary-p">Doctor Name</p>
                                           <select class="text-secondary-p doctor_select" style="width: 100%" name="doctor" id="doctor">
                                               <option value="" disabled>Search Doctor</option>
                                           </select>
                                      </div>
                                 </div>
                                           
                                <div></div><div></div><div></div>
                                 <div class="buttons">
                                   <button class="button" id="id" type="button" onclick="window.location.href='viewmedicalrecords';"><b>Cancel</b></button>
                                   <button class="button-success" type="submit"><b>Search</b></button>     
                                 </div>
                         
                         </div>   
                     </form>
                     <% } 
                         if(search==1){
                             int status= Integer.parseInt(request.getAttribute("status").toString());
                     %>
                     
                     
                         <form class="" action="updatePermissions" method="GET" id="submitForm">
                             <input type="hidden" name="doctorId" value="<%=getDoctor%>"/>
                          <%if(status==1){%>
                          <h4>You have enabled record viewing permissions for the selected doctor. Proceed to change! </h4>
                          <div class="main_cards">
                          <div class="card">
                                      <i class="fa fa-stethoscope fa-2x text-red"></i>
                                      <div class="card_inner_profile">
                                           <p class="text-primary-p">Disable Permissions</p>
                                           <select class="text-secondary-p" style="width: 100%" name="status" id="permissions">
                                               <option value="" disabled>Set record viewing permissions</option>
                                               <option value="0">Disable </option>
                                           </select>
                                      </div>
                           </div>
                            <% } else {  %>
                            <h4>You have not enabled record viewing permissions for the selected doctor. Proceed to change! </h4>
                            <div class="main_cards">
                            <div class="card">
                                      <i class="fa fa-stethoscope fa-2x text-red"></i>
                                      <div class="card_inner_profile">
                                           <p class="text-primary-p">Enable Permissions</p>
                                           <select class="text-secondary-p" style="width: 100%" name="status" id="permissions">
                                               <option value="" disabled>Set record viewing permissions</option>
                                               <option value="1">Enable </option>
                                           </select>
                                      </div>
                           </div>
                            <% }%>
                            <div class="card">
                                      <i class="fa fa-commenting fa-2x text-yellow"></i>
                                      <div class="card_inner_profile">
                                           <p class="text-primary-p">Additional Comments</p>
                                           <p class="text-secondary-p"><input type="text" name="description" id="description" ></p>
                                      </div>
                             </div>
                             <div class=""></div>
                             <div class=""></div>
                             
                             <div class="buttons">
                                   <button class="button" id="id" type="button" onclick="window.location.href='viewmedicalrecords';"><b>Cancel</b></button>
                                   <button class="button" type="reset" id="clear"><b>Reset</b></button>
                                   <button class="button-success" type="submit"><b>Submit</b></button>     
                             </div>
                            </div>
                         </form>
                     </div>
                     <%}%>
                     
                 
                        
             </main>
             <jsp:include page="./public/includes/patientSidebar.jsp"/>
          </div>
             
             <jsp:include page="./public/includes/footer.jsp"/>
             
             <script>
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
            </script>
            
               </body>
</html>