<%-- 
    Document   : verificationCode
    Created on : Mar 22, 2021, 3:50:31 PM
    Author     : Ifra
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
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
          <link rel="stylesheet" type="text/css" href="./public/css/forgetpwd.css" media="screen">
          <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
     </head>
            <%String email = request.getAttribute("email").toString();%>
     <body>
         
          <div class="container">
              <!--######################-->
                 <!--navbar starting-->
              <!--######################-->
              
              <jsp:include page="./public/includes/forgetpwdnavbar.jsp"/>
              
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
                              
                         </div>
                                  
                         <!-- change the main cards css fragments to change number of cards Available -->
                         <form class="" action="passchange" method="POST" id="updateForm">
                         <div class="main_cards" id="">

                              <div class="card">
                                  <div class="main_greeting">
                                      <center><i class="fa fa-unlock-alt" style="font-size: 100px; color: #2e4a66;"></i></center>
                                      <h1><center>RESET YOUR PASSWORD</center></h1>
                                      
                                      <br><br>
                                      <center><input class="data" type="password" name="password" id="password" placeholder="Enter a new password" value=""></center>
                                      <div class="alert-danger" id="PasswordError">
                                            * Password Must Contain a Uppercase Letter, Lowercase Letter, Number, and 6-20 Characters
                                      </div>
                                      <br>
                                      <center><input class="data" type="password" name="confirmPassword" id="password2" placeholder="Confirm password" value=""></center>
                                      <div class="alert-danger" id="PasswordError">
                                            * Password did not match.
                                      </div>
                                      <br><br>
                                      <input type="hidden" name="email" value="<%=email%>">
                                      <div class="buttons">
                                       <center><a href="#" class=""><button class="button"><b>Submit</b></button></a></center>   
                                     </div>
                                   </div>
                              </div>
                                                             
                                                           
                                            
                              
                        
                         </div>
                         </form>
                    </div>

               </main>

                <!--######################-->
                <!--sidebar starting-->
                <!--use else if to assign correct sidebar-->
                <!--######################-->
              
               <jsp:include page="./public/includes/forgetpwdSidebar.jsp"/>
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