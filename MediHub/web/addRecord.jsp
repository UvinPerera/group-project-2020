<%-- 
    Document   : addRecord
    Created on : Mar 28, 2021, 3:27:29 PM
    Author     : Yash
--%>

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
          <link rel="stylesheet" type="text/css" href="./public/css/medicalRecords.css" media="screen" />
          <link rel="stylesheet" type="text/css" href="./public/css/patient_modal.css" media="screen" />
          <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
     </head>

     <body>

          <% 
               String username="";
               username= session.getAttribute("username").toString();
          %>
        <div class="container">  
           <jsp:include page="./public/includes/navbar.jsp"/>
           <main>

              <h3 style="padding-left: 5%;padding-top:2%;">Add new Medical Record</h3>
              <div class="main_container">
                  <form action="addrecord" method="post" enctype="multipart/form-data">
                      <div class="main_cards">
                          
                        <div class="card">
                                      <i class="fa fa-medkit fa-2x text-yellow"></i>
                                      <div class="card_inner_profile">
                                            <p class="text-primary-p">Name of Medical Record</p>
                                             <p class="text-secondary-p"><input class="input" type="text" name="recordName" id="email" placeholder="Enter Name"></p>
                                         
                                      </div>
                                      
                        </div>
                      
                        <div class="card">
                                      <i class="fa fa-file-image-o fa-2x text-blue"></i>
                                      <div class="card_inner_profile">
                                           <p class="text-primary-p">Medical Record</p>
                                           <p class="text-secondary-p"><input class="input" type="file" name="file_path" id="filepath" placeholder="Select File"></p>
                                      </div>
                        </div>
                          
                         <div class="card">
                                      <i class="fa fa-medkit fa-2x text-yellow"></i>
                                      <div class="card_inner_profile">
                                            <p class="text-primary-p">Description</p>
                                             <p class="text-secondary-p"><input class="input" type="text" name="description" id="email" placeholder="Write a Description"></p>
                                         
                                      </div>
                                      
                        </div>
                          
                         <br><br>
                         <div class="buttons">
                                <button class="button" id="id" type="button" onclick="window.location.href='viewmedicalrecords';"><b>Cancel</b></button>
                                <button class="button" type="reset" id="clear"><b>Clear</b></button>
                                 
                                <button class="button-success" type="submit"><b>Store Record</b></button>     
                           </div>
                        </div>
                  </form>
              </div>
              
               </main>

         
               
                <jsp:include page="./public/includes/patientSidebar.jsp"/>
             
          </div>
                                    
                       
            <jsp:include page="./public/includes/footer.jsp"/>
            
                 
          <script src="./public/js/new_script.js"></script>
          

          
     </body>
</html>