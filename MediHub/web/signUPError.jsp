<!DOCTYPE html>
<%@page import="com.medihub.location.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<html lang="en-US">

<head>
  <title> MediHub </title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <link rel="icon" href="./public/images/onlylogo.png" type="image/icon type"> <!--Header icon-->
  <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@500&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Spartan:wght@600&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" type="text/css" href="./public/css/signup.css" media="screen" />
  <script
  src="https://code.jquery.com/jquery-3.5.1.min.js"
  integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
  crossorigin="anonymous"></script>
</head>


  <body>
    <style media="screen">
        body{
          background-image:url('./public/images/bgimg.png');
          background-repeat: no-repeat;
          background-attachment: fixed;
          background-size: cover;

        }
    </style>

    <!--Navigation bar -->
    <div style="background-color:#2b3030;" id="sidebarPlace"></div>
    <div class="navbar" id="navbar">
      <ul>
        <li><button class="styled" type="button" onclick="window.location.href='login.jsp'"> SIGN IN </button></li>
        <li><a href="About.jsp" id="end">About</a></li>
      <li><a href="contactUs.jsp">Contact</a></li>
      <li><a href="EmergencyServices.jsp">Emergency Services</a></li>
      <li><a href="/MediHub">Home</a></li>
        <li id="logo"><img src="./public/images/onlylogo.png" width="15.5%"></li>
      </ul>
    </div>

    
   
    <div class="regform"><h1><br>Registration Form</h1><br></div>
   <div class="main">
     <form class="" action="registration" method="post" id="regform">

       <div id="name">
         <br>
         <h2 class="name">Name</h2>
         <input class="firstname" type="text" name="first_name" id="firstname" placeholder="First Name">
         <!-- <label class="firstlable">first name</label> -->
         <input class="lastname" type="text" name="last_name" id="lastname" placeholder="Last Name">
         <!-- <label class="lastlable">last name</label> -->
       </div>
         <div class="danger" id="firstNameError">
          <div class="alert-message alert-message-danger" >
                <h4>First and Last name cant empty and must contain only letters</h4>
          </div>
         </div>

       <h2 class="name" >Display Name</h2>
       <input class="input" type="text" name="display_name" id="displayName" placeholder="Display Name">
       <div class="danger" id="displayNameError">
          <div class="alert-message alert-message-danger" >
                <h4>Display name cant empty and must contain only letters</h4>
          </div>
       </div>

       <h2 class="name">NIC No</h2>
       <input class="input" type="text" name="nic_no" id="nic" placeholder="NIC number">
       <div class="danger" id="nicError">
          <div class="alert-message alert-message-danger" >
                <h4>National Identity Card Number cant empty</h4>
          </div>
       </div>

       <h2 class="name">Date of Birth</h2>
       <input class="input" type="date" name="dob" id="dob" placeholder="DOB">
       <div class="danger" id="dobError">
          <div class="alert-message alert-message-danger" >
                <h4>Date of Birth cant empty</h4>
          </div>
       </div>
       
       <h2 class="name">Gender</h2>
       <select class="input option" name="gender" id="gender">
         <option disabled="disabled" selected="selected">--Choose Option--</option>
         <option value="M">Male</option>
         <option value="F">Female</option>
         <option value="N">Not preferred to say</option>
       </select>
       <div class="danger" id="genderError">
          <div class="alert-message alert-message-danger" >
                <h4>Gender cant be empty</h4>
          </div>
       </div>
             
        <h2 class="name">Email</h2>
       <input class="input" type="email" name="email" id="email" placeholder="Email">
       <div class="danger" id="emailError">
          <div class="alert-message alert-message-danger" >
                <h4>Enter a valid email address</h4>
          </div>
       </div>
       
       <h2 class="name">Address 1</h2>
       <input class="input" type="text" name="address_1" id="address1" placeholder="Address 1">
       <div class="danger" id="addressError">
          <div class="alert-message alert-message-danger" >
                <h4>Address 01 can't be empty</h4>
          </div>
       </div>

       <h2 class="name">Address 2</h2>
       <input class="input" type="text" name="address_2" id="address2" placeholder="Address 2">

        <h2 class="name">District</h2>
        <select class="input option" name="district" id="district">
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
        <div class="danger" id="districtError">
          <div class="alert-message alert-message-danger" >
                <h4>Select a valid District </h4>
          </div>
        </div>
        
        <h2 class="name">City</h2>
        <select class="input option" name='city' id="city" class="filter_dropdown">
         <option value='' selected>--Choose Option--</option>

        </select>
        <div class="danger" id="cityError">
          <div class="alert-message alert-message-danger" >
                <h4>City can't be empty</h4>
          </div>
        </div>
       
<!--        <h2 class="name">Zip Code</h2>
       <input class="input" type="text" name="zip_code" id="zip" placeholder="Zip code">
       <div class="danger" id="zipError">
          <div class="alert-message alert-message-danger" >
                <h4>Enter a valid zip code </h4>
          </div>
       </div>-->

       <h2 class="name">Contact No</h2>
       <input class="mobile" type="text" name="mobile" id="mobile" placeholder="Mobile number">
       <label class="mobilelable">mobile</label>
       <input class="landline" type="text" name="land_line" id="land" placeholder="Land number">
       <label class="landlinelable">Land line</label>
       <div class="danger" id="numberError">
          <div class="alert-message alert-message-danger" >
                <h4>Enter a valid Land Line and Mobile Number </h4>
          </div>
       </div>



       <h2 class="name">Password</h2>
       <input class="input" type="password" name="password" id="password" placeholder="Password">
       <div id="errorMsg"></div>
       <div class="danger" id="passwordError">
          <div class="alert-message alert-message-danger" >
                <h4>Password Must Contain a Uppercase Letter, Lowercase Letter, Number, and 6-20 Characters.</h4>
          </div>
       </div>

       <h2 class="name">Confirm Password</h2>
       <input class="input" type="password" name="confirm_passsword" id="password2" placeholder="Confirm Password">
        <div id="errorMsg"></div>
       <div class="danger" id="password2Error">
          <div class="alert-message alert-message-danger" >
                <h4>Passwords don't match</h4>
          </div>
       </div>

       <h2 class="name">Register as</h2>
       <select class="input option" name="type" id="type">
         <option disabled="disabled" selected="selected">--Choose Option--</option>
         <option value="0">Administrator</option>
         <option value="1">Patient</option>
         <option value="2">Doctor</option>
         <option value="3">Hospital Admin</option>
         <option value="4">Pharmacy Admin</option>
       </select>
       <div id="errorMsg"></div>
       <div class="danger" id="typeError">
          <div class="alert-message alert-message-danger" >
                <h4>Select a valid user type</h4>
          </div>
       </div>


       <div>
           <br><br>
         <div class="button-container">
             <button class="button" id="id" onclick="window.location.href='/MediHub';"><b>Cancel</b></button>
             <button class="button" type="reset" id="clear"><b>Clear</b></button>
            
            <button class="button" type="submit"><b>Submit</b></button>
         
         </div>
       </div>
       <br><br><br><br>
     </form>
   </div>
    <div class="empty"></div>
    <!--Footer-->

    <footer>
      <center>
      <div class="footerRow">
        <div class="footerColumn">
          <div class="footerText">
            <br>ABOUT <br><br>
            MediHub is a mainly a patient portal providing users eaiser access to all medical services. <br>MediHub also
            provides different doctors, hospitals and pharmacies interact with the patients directly in order to provide
            them with the best experience in accessing medical services<br>
          </div>
        </div>
        <div class="footerColumn"><br>
          <div class="footerText">
            <br><br>
            <a href="#" class="a fa fa-facebook"></a>
            <a href="#" class="a fa fa-twitter"></a>
            <a href="#" class="a fa fa-google"></a>
            <a href="#" class="a fa fa-instagram"></a>
          </div>
        </div>
      </div>
      <br>
      <div class="footerText">
        All rights Reserved @MediHub2020
      </div>
      <br><br>
    </center>
    </footer>
    <script>
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
        
        $("#regform").on('submit',function(e){
            
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
</html>
