<%-- 
    Document   : createHospital
    Created on : Mar 19, 2021, 10:27:17 AM
    Author     : Ifra
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.medihub.doctor.*"%>
<%@page import="com.medihub.admin.*"%>
<%@page import="com.medihub.location.*"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
          <link rel="stylesheet" type="text/css" href="./public/css/admin_new_css.css" media="screen" />
          <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

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
                    <!-- the content tag anything to do with the dashboard -->
                    
                    <!--######################-->
                        <!--container starting-->
                     <!--######################-->
                    <div class="main_container">

                         <div class="main_title">
                             <!--<img src="./public/images/p3.jpg" alt="hello">-->
                              <div class="main_greeting">
                                  <h1>Hello <%=username%></h1>
                                   <p>Create a new doctor </p>
                              </div>
                         </div>
                         
                          <!-- change the main cards css fragments to change number of cards Available -->
                          <form action="createdoctor" method="POST" id="">
                            <div class="main_cards">
       
                              <div class="card">
                                  <i class="fa fa-stethoscope fa-2x text-lightblue"></i>
                                   <div class="card_inner_profile">
                                        <p class="text-primary-p">First Name</p>
                                        <input class="data" type="text" name="first_name" id="firstname" placeholder="First Name">
                                        <div class="alert-danger" id="firstNameError">
                                            * First name can't be empty and must contain only letters
                                        </div>
                                   </div>
                              </div>

                              <div class="card">
                                  <i class="fa fa-stethoscope fa-2x text-lightblue"></i>
                                   <div class="card_inner_profile">
                                        <p class="text-primary-p">Last Name</p>
                                        <input class="data" type="text" name="last_name" id="lastname" placeholder="Last Name">
                                        <div class="alert-danger" id="lastNameError">
                                            * Last name can't be empty and must contain only letters
                                        </div>
                                   </div>
                              </div>

                              <div class="card">
                                   <i class="fa fa-stethoscope fa-2x text-lightblue"></i>
                                   <div class="card_inner_profile">
                                        <p class="text-primary-p">Display Name</p>
                                        <input class="data" type="text" name="display_name" id="displayName" placeholder="Display Name">
                                        <div class="alert-danger" id="displayNameError">
                                            * Display name can't be empty and must contain only alphanumeric
                                        </div>
                                   </div>
                              </div>
                               <div class="card">
                                  <i class="fa fa-stethoscope fa-2x text-lightblue"></i>
                                   <div class="card_inner_profile">
                                        <p class="text-primary-p">SLMC</p>
                                        <input class="data" type="text" name="slmc_no" id="slmc" placeholder="SLMC number">
                                        <div class="alert-danger" id="slmcError">
                                             * SLMC Number can't be empty
                                        </div>
                                  </div>
                              </div>
                              <div class="card">
                                  <i class="fa fa-stethoscope fa-2x text-lightblue"></i>
                                   <div class="card_inner_profile">
                                        <p class="text-primary-p">Date Of Birth</p>
                                        <input class="data" type="date" name="dob" id="dob" placeholder="DOB">
                                        <div class="alert-danger" id="DOBError">
                                            * Date of birth can't be empty and must contain only letters
                                        </div>
                                   </div>
                              </div>  
                              <div class="card">
                                  <i class="fa fa-stethoscope fa-2x text-lightblue"></i>
                                   <div class="card_inner_profile">
                                        <p class="text-primary-p">Email</p>
                                        <input class="data" type="text" name="email" id="email" placeholder="Email">
                                        <div class="alert-danger" id="EmailError">
                                            * Email can't be empty and must contain only letters
                                        </div>
                                   </div>
                              </div>         

                              <div class="card">
                                  <i class="fa fa-stethoscope fa-2x text-lightblue"></i>
                                   <div class="card_inner_profile">
                                        <p class="text-primary-p">NIC</p>
                                        <input class="data" type="text" name="nic_no" id="nic" placeholder="NIC number">
                                        <div class="alert-danger" id="nicError">
                                             * National Identity Card Number can't be empty
                                        </div>
                                  </div>
                              </div>
                              <div class="card">
                                  <i class="fa fa-stethoscope fa-2x text-lightblue"></i>
                                   <div class="card_inner_profile">
                                        <p class="text-primary-p">Address 1</p>
                                        <input class="data" type="text" name="address_1" id="address1" placeholder="Address 1">
                                        <div class="alert-danger" id="addressError">
                                            * Address 1 can't be empty
                                        </div>
                                   </div>
                              </div>
                              <div class="card">
                                  <i class="fa fa-stethoscope fa-2x text-lightblue"></i>
                                   <div class="card_inner_profile">
                                        <p class="text-primary-p">Address 2</p>
                                        <input class="data" type="text" name="address_2" id="address2" placeholder="Address 2">
                                       <!-- <div class="alert-danger" id="addressError">
                                            * Address 2 can't be empty
                                        </div>-->
                                   </div>
                              </div>
                               <div class="card">
                                  <i class="fa fa-stethoscope fa-2x text-lightblue"></i>
                                   <div class="card_inner_profile">
                                        <p class="text-primary-p">District</p>
                                        <select class="data" name="district" id="district">
                                       <option disabled="disabled" selected="selected">--Choose Option--</option>
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
                                        <div class="alert-danger" id="districtError">
                                            * Select valid district
                                        </div>
                                   </div>
                              </div>

                              <div class="card">
                                  <i class="fa fa-stethoscope fa-2x text-lightblue"></i>
                                   <div class="card_inner_profile">
                                        <p class="text-primary-p">City</p>
                                        <select class="data" name="city" id="city">
                                        <option value='' selected>--Choose Option--</option>

                                        </select>
                                        <div class="alert-danger" id="cityError">
                                            * Select valid city
                                        </div>
                                   </div>
                              </div>
                              <div class="card">
                                  <i class="fa fa-stethoscope fa-2x text-lightblue"></i>
                                   <div class="card_inner_profile">
                                        <p class="text-primary-p">Gender</p>
                                        <select class="input option" name="gender" id="gender">
                                          <option disabled="disabled" selected="selected">--Choose Option--</option>
                                          <option value="M">Male</option>
                                          <option value="F">Female</option>
                                          <option value="N">Not preferred to say</option>
                                        </select>
                                        <div class="alert-danger" id="displayNameError">
                                            * Gender can't be empty and must contain only letters
                                        </div>
                                   </div>
                              </div>
                              <div class="card">
                                  <i class="fa fa-stethoscope fa-2x text-lightblue"></i>
                                   <div class="card_inner_profile">
                                        <p class="text-primary-p">Mobile Number</p>
                                        <input class="data" type="text" name="mobile_number" id="mobilenumber" placeholder="Mobile Number">
                                        <div class="alert-danger" id="mobileNumberError">
                                            * Mobile number can't be empty and must contain only letters
                                        </div>
                                   </div>
                              </div>
                              <div class="card">
                                  <i class="fa fa-stethoscope fa-2x text-lightblue"></i>
                                   <div class="card_inner_profile">
                                        <p class="text-primary-p">Land Number</p>
                                        <input class="data" type="text" name="land_number" id="landnumber" placeholder="Land Number">
                                        <div class="alert-danger" id="landNumberError">
                                            * Land number can't be empty and must contain only letters
                                        </div>
                                   </div>
                              </div>

                              <div class="card">
                                  <i class="fa fa-stethoscope fa-2x text-lightblue"></i>
                                     <div class="card_inner_profile">
                                        <p class="text-primary-p">Password</p>
                                        <input class="data" type="password" name="password" id="password" placeholder="Password">
                                        <div id="errorMsg"></div>
                                            <div class="alert-danger" id="passwordError">
                                                  * Password Must Contain a Uppercase Letter, Lowercase Letter, Number, and 6-20 Characters.
                                           </div>
                                    </div>                                  
                               </div>
                               <div class="card">
                                  <i class="fa fa-stethoscope fa-2x text-lightblue"></i>
                                     <div class="card_inner_profile">
                                        <p class="text-primary-p">Confirm Password</p>
                                        <input class="input" type="password" name="confirm_passsword" id="password2" placeholder="Confirm Password">
                                        <div id="errorMsg"></div>
                                            <div class="alert-danger" id="passwordError">
                                                  * Password did not match.
                                           </div>
                                    </div>                                  
                               </div>
  
                              </div>
                              <div class="buttons">
                                <button class="button" type="clear" id="clear" style="background: red"><b>Clear</b></button>
                                <button class="button-success" type="submit"><b>Submit</b></button>     
                              </div>
                                                       
                              
                          </form>
                    </div>
               </main>
               
              
                <!--######################-->
                <!--sidebar starting-->
                <!--######################-->
               
                <jsp:include page="./public/includes/adminSidebar.jsp"/>
                
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
 <!--
    
    
   

  <div class="record">
    <div class="label">Description</div>
    <input class="data" type="text" name="description" id="description" placeholder="Description">
  </div>
<!--
  <div class="record">
    <div class="label">Status</div>
    <input class="data" type="text" name="status" id="status" placeholder="Status">
  </div>

  <div class="buttons">
      <br>
      <button class="button" type="reset"><b>Clear</b></button>
      <button class="button" type="submit"><b>Submit</b></button>
    <!--  <button class="button" onclick="window.location.href='readpharmacy'"><b>Cancel</b></button>
   </div>
    </form>
   

  </div>
</div> -->



<script>
    
        $("#firstNameError").hide();
        $("#lastNameError").hide();
        $("#displayNameError").hide();
        $("#nicError").hide();
        $("#dobError").hide();
        $("#genderError").hide();
        $("#emailError").hide();
        $("#addressError").hide();
        $("#cityError").hide();
        $("#districtError").hide();
//        $("#zipError").hide();
        $("#numberError").hide();
        $("#passwordError").hide();
        $("#password2Error").hide();
        $("#typeError").hide();
        
        $("#createpharmacy").on('submit',function(e){
            
            //to always refresh when submitting (hide and show only relevant)
            $("#firstNameError").hide();
            $("#displayNameError").hide();
            $("#nicError").hide();
            $("#dobError").hide();
            $("#genderError").hide();
            $("#emailError").hide();
            $("#addressError").hide();
            $("#cityError").hide();
            $("#districtError").hide();
    //        $("#zipError").hide();
            $("#numberError").hide();
            $("#passwordError").hide();
            $("#password2Error").hide();
            $("#typeError").hide();
            
            var x=0;
               if(($("#firstname").val()=="")||($("#firstname").val().match(/^[A-Za-z]*$/)== null)||($("#lastname").val()=="")||($("#lastname").val().match(/^[A-Za-z]*$/)== null)){
                $("#firstNameError").show();
                x=1;
                
            }
            if(($("#displayName").val()=="")||($("#displayName").val().match(/^[A-Za-z]*$/)== null)){
                $("#displayNameError").show();
                x=1;
                
            }
            if($("#nic").val()==""){
                $("#nicError").show();
                x=1;
            }
            if($("#dob").val()==""){
                $("#dobError").show();
                x=1;
            }
            if($("#gender").val()==""){
                $("#genderError").show();
                x=1;
            }
             if ($("#email").val().trim().match(/^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{1,5}|[0-9]{1,3})(\]?)$/) == null){
                $("#emailError").show();
                x=1;
             }
              if($("#address1").val()==""){
                $("#addressError").show();
                x=1;
            }
            if($("#city").val()==""){
                $("#cityError").show();
                x=1;
            }
            if($("#district").val()==""){
                $("#districtError").show();
                x=1;
            }
//            if($("#zip").val().match(/^[0-9]{5}$/)==null){
//               $("#zipError").show();
//                x=1;
//            }
            
            if(($("#mobile").val()=="")||($("#mobile").val().match(/^[0-9]{10}$/)==null)||($("#land").val().match(/^[0-9]{10}$/)==null)){
//            if(($("#mobile").val()=="")||($("#mobile").val().match(/^[0-9]{10}$/)==null)||(($("#land").val().match(/^[0-9]{10}$/)==null) && ($("#land").val()==""))){
              $("#numberError").show();
                x=1;
            }
           
            
            if ($("#password").val().match(/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z0-9\S]{6,20}$/) == null) {
                $("#passwordError").show();
                x=1;
               
            }
            if ($("#password").val()!==$("#password2").val()) {
               $("#password2Error").show();
                x=1;
            }
            if($("#type").val()==""){
               $("#typeError").show();
                x=1;
            }
            if(x==1){
                return false;
            }
        })
        
        
        
//    onchange district
    $('#district').change(function(){
        var districtId=$(this).find(':selected').val();
        
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
              $('#city').html("<option disabled>--Choose Option--</option>"+response);
            },
            error: function(xhr) {
                alert("CityByDistrict Error");
            }
          });

    });
</script>

</body>
</html>>
