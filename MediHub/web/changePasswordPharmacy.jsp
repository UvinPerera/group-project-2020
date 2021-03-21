<%-- 
    Document   : changePasswordPharmacy
    Created on : Mar 21, 2021, 10:56:09 AM
    Author     : Yash
--%>
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
               int userType = Integer.parseInt(session.getAttribute("usertype").toString());
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
                             <!--<img src="./public/images/p3.jpg" alt="hello">-->
                              <div class="main_greeting">
                                   <h1>Hello <%=username%></h1>
                                   <p>Change Password</p>
                              </div>
                         </div>
                                   <%if(request.getAttribute("alert")!=null) { %>
                                   <div class="message">
                                       <%if(request.getAttribute("alert").toString().equalsIgnoreCase("success")) { %>
                                            <p class="" style="background: green; color: white;"><%=request.getAttribute("message").toString()%></p>
                                       <% } %>
                                       <%if(request.getAttribute("alert").toString().equalsIgnoreCase("error")) { %>
                                            <p class="" style="background: red; color: white;"><%=request.getAttribute("message").toString()%></p>
                                       <% } %>
                                   </div>
                                   <% } %>
                         <!-- change the main cards css fragments to change number of cards Available -->
                         <form class="" action="changepasswordupdatepharmacy" method="POST" id="updateForm">
                         <div class="main_cards" id="">

                              <div class="card">
                                   <div class="card_inner_profile">
                                        <p class="text-primary-p">Current Password</p>
                                        <input class="data" type="password" name="current_password" id="current_password" placeholder="Current Password" value="">
                                        <div class="alert-danger" id="currentPasswordError">
                                            * Password Must Contain a Uppercase Letter, Lowercase Letter, Number, and 6-20 Characters
                                        </div>
                                   </div>
                              </div>

                              <div class=""></div>
                              <div class=""></div>
                              <div class=""></div>
                                                             
                              <div class="card">
                                   <div class="card_inner_profile">
                                        <p class="text-primary-p">New Password</p>
                                        <input class="data" type="password" name="new_password" id="new_password" placeholder="New Password" value="">
                                        <div class="alert-danger" id="newPasswordError">
                                            * Password Must Contain a Uppercase Letter, Lowercase Letter, Number, and 6-20 Characters
                                        </div>
                                   </div>
                              </div>
                              
                              <div class=""></div>
                              <div class=""></div>
                              <div class=""></div>

                              <div class="card">
                                   <div class="card_inner_profile">
                                        <p class="text-primary-p">Confirm New Password</p>
                                        <input class="data" type="password" name="new_password_confirmation" id="new_password_confirmation" placeholder="Confirm New Password" value="">
                                        <div class="alert-danger" id="newPasswordConfirmationError">
                                            * Password Must Contain a Uppercase Letter, Lowercase Letter, Number, and 6-20 Characters
                                        </div>
                                        <div class="alert-danger" id="passwordMatchError">
                                            * Passwords Must Match Each Other
                                        </div>
                                   </div>
                              </div>

                                   
                              <div class=""></div>
                              <div class=""></div>
                              <div class=""></div>
                                            
                              <div class="buttons">
                                <button class="button" type="reset" id="clear"><b>Reset</b></button>
                                <button class="button-success" type="submit"><b>Update</b></button>     
                              </div>
                        
                              <div class=""></div>
                              <div class=""></div>
                              <div class=""></div>
                         </div>
                         </form>
                    </div>

               </main>

              <jsp:include page="./public/includes/pharmacySidebar.jsp"/>
             
          </div>
            
                                                 
                       
            <jsp:include page="./public/includes/footer.jsp"/>
          
            
          <script src="./public/js/new_script.js"></script>
          
          <script>
              
            $("#currentPasswordError").hide();
            $("#newPasswordError").hide();
            $("#newPasswordConfirmationError").hide();
            $("#passwordMatchError").hide();

            $("#updateForm").on('submit',function(e){
//                event.preventDefault();
                //to always refresh when submitting (hide and show only relevant)
                $("#currentPasswordError").hide();
                $("#newPasswordError").hide();
                $("#newPasswordConfirmationError").hide();
                $("#passwordMatchError").hide();

                var x=0;
                
                if ($("#current_password").val().match(/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z0-9\S]{6,20}$/) == null) {
                    
                    $("#currentPasswordError").show();
                    x=1;
               
                }
                
                if ($("#new_password").val().match(/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z0-9\S]{6,20}$/) == null) {
                    
                    $("#newPasswordError").show();
                    x=1;
               
                }
                
                if ($("#new_password_confirmation").val().match(/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z0-9\S]{6,20}$/) == null) {
                    
                    $("#newPasswordConfirmationError").show();
                    x=1;
               
                }
                
                if ($("#new_password_confirmation").val()!=$("#new_password").val()) {
                    
                    $("#passwordMatchError").show();
                    x=1;
               
                }

                if(x==1){
                    return false;
                }
                else if(x==0){
                    return true;
                }
            })
              
          </script>
          
     </body>
</html>