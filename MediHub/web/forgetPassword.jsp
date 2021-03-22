<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<!doctype html>

<%
    int status;
    try{
    status = Integer.parseInt(request.getParameter("status"));
    }catch(NumberFormatException e){
        status=0;
    }

%>
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
                         <form class="" action="passreset" method="POST" id="updateForm">
                         <div class="main_cards" id="">

                              <div class="card">
                                  <div class="main_greeting">
                                      <%if(status!=1){%>
                                      <center><i class="fa fa-lock" style="font-size: 100px; color: #2e4a66;"></i></center>
                                      <h1><center>FORGET PASSWORD?</center></h1>
                                      
                                      <div class="paragraph"><center>Enter your email address and reset your password.</center></div>
                                      
                                      <br><br>
                                      <center><input class="data" type="email" name="email" id="email" placeholder="Email address" value=""></center>
                                      <div class="alert-danger" id="emailError">
                                            * Email can't be empty and must contain only letters
                                      </div>
                                      <br><br>
                                      <div class="buttons">
                                          <center><button class="button" type="submit"><b>Next</b></button></center>   
                                     </div>
                                      <%}else{%>
                                      <div class="card">
                                  <div class="main_greeting">
                                      <h1><center>EMAIL SENT</center></h1>
                                      <br>
                                      <center><i class="fa fa-check-circle" style="font-size: 100px; color: #2e4a66;"></i></center>
                             
                                      <div class="paragraph"><center>Check your Email for Password Reset Code</center></div>
                                      <br><br>
                                      <div class="buttons">
                                          <center><a href="login.jsp" class=""><button class="button" type="button"><b>LOGIN</b></button></a></center>   
                                     </div>
                                   </div>
                              </div>
                                      <%}%>
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