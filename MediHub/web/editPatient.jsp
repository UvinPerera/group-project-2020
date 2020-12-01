<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.medihub.patient.*"%>
<%@page import="com.medihub.location.*"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<!doctype html>
<html>
<head>
  <meta charset=utf-8>
  <title>MediHub</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@500&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Spartan:wght@600&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" type="text/css" href="./public/css/editProfile.css" media="screen"/>
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>

</head>
<body>

  <div class="navbar" id="navbar">
      <ul>
        <li><button class="styled" type="button" onclick="window.location.href='logout';"> LOGOUT </button></li>
        <li><a href="About.jsp" id="end">About</a></li>
      <li><a href="contactUs.jsp">Contact</a></li>
      <li><a href="EmergencyServices.jsp">Emergency Services</a></li>
      <li><a href="/MediHub">Home</a></li>
        <li id="logo"><img src="./public/images/onlylogo.png" width="15.5%"></li>
      </ul>
  </div>
                        <%
                            if(request.getAttribute("districts")!=null){
                                Patient row = (Patient)request.getAttribute("profile");
                                
                                
                        %>

 <div class="contentContainer">
  <div class="profile">
      <img src="./public/images/p3.jpg" id="profile">
    <h2 style="text-align:center; margin-bottom:25px;"><%= row.displayName %></h2>
    <button class="button" id="profilePic"><b>Change Profile Picture</b></button>
  </div>

  <div class="information">
      <form class="" action="patientupdate" method="POST" id="updateForm">
    <h3 style="text-align:center;font-size: 35px;margin-bottom:40px;"> Profile information</h3>

    <div class="record">
    <div class="label">First Name </div>
    <input class="data" type="text" name="first_name" id="firstname" placeholder="First Name" value="<%= row.firstName %>">
    </div>
    <div class="danger" id="firstNameError">
          <div class="alert-message alert-message-danger" >
                <h4>First name cant empty and must contain only letters</h4>
          </div>
         </div>

  <div class="record">
    <div class="label">Last Name </div>
    <input class="data" type="text" name="last_name" id="lastname" placeholder="Last Name" value="<%= row.lastName %>">
  </div>
  <div class="danger" id="lastNameError">
          <div class="alert-message alert-message-danger" >
                <h4>Last name cant empty and must contain only letters</h4>
          </div>
         </div>

  <div class="record">
    <div class="label">Display Name </div>
    <input class="data" type="text" name="display_name" id="lastname" placeholder="Display Name" value="<%= row.displayName %>">
  </div>
  <div class="danger" id="displayNameError">
          <div class="alert-message alert-message-danger" >
                <h4>Display name cant empty and must contain only letters</h4>
          </div>
       </div>

  <div class="record">
    <div class="label">NIC No</div>
    <input class="data" type="text" name="nic_no" id="nic" placeholder="NIC number" value="<%= row.nic %>">
  </div>
  <div class="danger" id="nicError">
          <div class="alert-message alert-message-danger" >
                <h4>National Identity Card Number cant empty</h4>
          </div>
       </div>

  <div class="record">
    <div class="label">Date of Birth</div>
    <input class="data" type="date" name="dob" id="dob" placeholder="DOB" value="<%= row.dob %>">
  </div>
  <div class="danger" id="dobError">
          <div class="alert-message alert-message-danger" >
                <h4>Date of Birth cant empty</h4>
          </div>
       </div>

  <div class="record">
    <div class="label">Gender</div>
    <select class="data" name="gender" id="gender" style="height: 50px;">
        <option value="M" <% if(row.gender.equalsIgnoreCase("M")){out.print("Selected");}%>>Male</option>
        <option value="F" <% if(row.gender.equalsIgnoreCase("F")){out.print("Selected");}%>>Female</option>
        <option value="N" <% if(row.gender.equalsIgnoreCase("N")){out.print("Selected");}%>>Not preferred to say</option>
    </select>
  </div>
    <div class="danger" id="genderError">
          <div class="alert-message alert-message-danger" >
                <h4>Gender cant be empty</h4>
          </div>
       </div>

  <div class="record">
    <div class="label">Email</div>
    <input class="data" type="email" name="email" id="email" placeholder="Email" value="<%= row.email %>">
  </div>
  <div class="danger" id="emailError">
          <div class="alert-message alert-message-danger" >
                <h4>Enter a valid email address</h4>
          </div>
       </div>

  <div class="record">
    <div class="label">Address 1</div>
    <input class="data" type="text" name="address_1" id="address1" placeholder="Address 1" value="<%= row.address1 %>">
  </div>
  <div class="danger" id="addressError">
          <div class="alert-message alert-message-danger" >
                <h4>Address 1 can't be empty</h4>
          </div>
       </div>

  <div class="record">
    <div class="label">Address 2</div>
    <input class="data" type="text" name="address_2" id="address1" placeholder="Address 2" value="<%= row.address2 %>">
  </div>
  
  <div class="record">
    <div class="label">District</div>
    <select class="data" name="district" id="district" style="height: 50px;">
                         <%
                             if(request.getAttribute("districts")!=null){
                                 List<District> districts = (ArrayList<District>)request.getAttribute("districts");
                                 if(districts.size()>0){
                                     for(District district : districts) { %>
                                         <option value='<%= district.id %>' <% if(district.id==row.district){out.print("Selected");}%>><%= district.nameEn %></option>
                         <%
                                 }}}
                         %>

    </select>
  </div>
        <div class="danger" id="districtError">
         <div class="alert-message alert-message-danger" >
               <h4>Select a valid District </h4>
         </div>
        </div>

  <div class="record">
    <div class="label">City</div>
    <select class="data" name="city" id="city" style="height: 50px;">
                         <%
                             if(request.getAttribute("cities")!=null){
                                 List<City> cities = (ArrayList<City>)request.getAttribute("cities");
                                 if(cities.size()>0){
                                     for(City city : cities) { %>
                                         <option value='<%= city.id %>' <% if(city.id==row.city){out.print("Selected");}%>><%= city.nameEn %></option>
                         <%
                                 }}}
                         %>

    </select>
  </div>
   <div class="danger" id="cityError">
          <div class="alert-message alert-message-danger" >
                <h4>Select a valid City </h4>
          </div>
        </div>                      


<!--  <div class="record">
    <div class="label">Zip Code</div>
    <input class="data" type="text" name="zip_code" id="zip" placeholder="Zip code" value="">
  </div>-->

  <div class="record">
    <div class="label">Contact Number - Land</div>
    <input class="data" type="text" name="land_number" id="land_number" placeholder="Land number" value="<%= row.landNumber %>">
  </div>

  <div class="record">
    <div class="label">Contact Number - Mobile</div>
    <input class="data" type="text" name="mobile_number" id="mobile_number" placeholder="Mobile number" value="<%= row.mobileNumber %>">
  </div>
  
  <div class="danger" id="numberError">
          <div class="alert-message alert-message-danger" >
                <h4>Mobile Number cannot be empty and both numbers should be valid</h4>
          </div>
       </div>


  <div class="buttons">
      <br><br>
      <!--<button class="button" id="id" onclick="//window.location.href='/patientupdate';"><b>Done</b></button>-->
      <button class="button" type="reset" id="clear"><b>Reset</b></button>
      <button class="button" type="submit"><b>Update</b></button>
   </div>
      </form>
      <button class="button" onclick="window.location.href='patient';"><b>Cancel</b></button>
  </div>
</div>
<!--</div>-->


  <footer>
    <center>
    <div class="footerRow">
      <div class="footerColumn">
        <div class="footerText">
          </br>ABOUT </br></br>
          MediHub is a mainly a patient portal providing users eaiser access to all medical services. </br>MediHub also
          provides different doctors, hospitals and pharmacies interact with the patients directly in order to provide
          them with the best experience in accessing medical services</br>
        </div>
      </div>
      <div class="footerColumn"></br>
        <div class="footerText">
          </br></br>
          <a href="#" class="a fa fa-facebook"></a>
          <a href="#" class="a fa fa-twitter"></a>
          <a href="#" class="a fa fa-google"></a>
          <a href="#" class="a fa fa-instagram"></a>
        </div>
      </div>
    </div>
    </br>
    <div class="footerText">
      All rights Reserved @MediHub2020
    </div>
    </br></br>

    <script>
        
        document.getElementById("dob").value = "<%= row.dob %>";
        
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
        
        $("#updateForm").on('submit',function(e){
            //to always refresh when submitting (hide and show only relevant)
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
            
            var x=0;
               if(($("#firstname").val()=="")||($("#firstname").val().match(/^[A-Za-z]*$/)== null)){
                $("#firstNameError").show();
                x=1;
                
            }
               if(($("#lastname").val()=="")||($("#lastname").val().match(/^[A-Za-z]*$/)== null)){
                $("#lastNameError").show();
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
            
//            if(($("#mobile_number").val()=="")||($("#mobile").val().match(/^[0-9]{10}$/)==null)||($("#land").val().match(/^[0-9]{10}$/)==null)){
            if(($("#mobile_number").val()=="")||($("#mobile_number").val().match(/^[0-9]{10}$/)==null)||(($("#land_number").val().match(/^[0-9]{10}$/)==null) && ($("#land_number").val()==""))){
              $("#numberError").show();
                x=1;
            }
//           
//            
//            if ($("#password").val().match(/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z0-9\S]{6,20}$/) == null) {
//                $("#passwordError").show();
//                x=1;
//               
//            }
//            if ($("#password").val()!==$("#password2").val()) {
//               $("#password2Error").show();
//                x=1;
//            }
//            if($("#type").val()==""){
//               $("#typeError").show();
//                x=1;
//            }

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
              $('#city').html("<option>Select City</option>"+response);
            },
            error: function(xhr) {
                alert("CityByDistrict Error");
            }
          });

    });
        
    </script>
    
      
  <!--close jsp tag-->
  <% } %>
  <!--close tag-->