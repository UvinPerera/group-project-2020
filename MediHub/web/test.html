<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.medihub.patient.*"%>
<%@page import="com.medihub.location.*"%>
<%@page import="com.medihub.doctor.*"%>
<%@page import="com.medihub.hospital.*"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset=utf-8>
        <title>MediHub</title>
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@500&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Spartan:wght@600&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="./public/css/channelling.css" media="screen" >
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    </head>
    <body>
        <div class="navbar" id="navbar">
            <ul>
              <li><button class="style" type="button" onclick="window.location.href='logout';"> LOGOUT</button></li>
              <li><button class="style" type="button" onclick="window.location.href='patient'"> Dashboard </button></li>
              <li><a href="About.jsp" id="end">About</a></li>
              <li><a href="contactUs.jsp">Contact</a></li>
              <li><a href="EmergencyServices.jsp">Emergency Services</a></li>
              <li><a href="/MediHub">Home</a></li>
              <li id="logo"><img src="./public/images/onlylogo.png" width="15.5%"></li>
            </ul>
        </div>
        
        <!--<form class="" action="registration" method="post" id="regform">-->
            <br><br>
            <h3>E-Channelling </h3><hr>
            <div class="Dropdown">
                <center>Select your Preferences </center><br>
                <center><select name='district' id="district" class="filters">
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
                    </select></center>
                
                <center><select name='city' id="city" class="filter_dropdown filters" >
                    <option value='' selected>Select City</option>
                   
                    </select></center>
                
                    <center><select name='hospital' id="hospital" class="filter_dropdown filters">
                    <option value='' selected>Select Hospital</option>
                   
                        </select></center>
                
                        <center><select name='doctorSpecialisation' id="doctorSpecialisation" class="filter_dropdown filters">
                    <option value='' selected>Select Specialization</option>
                   
                            </select></center>
                
                        <center><input type="date" name="date" id="date" class="form-control textt"/></center>
                
            </div>
        
            
            
        <!--</form>-->
        
        
<!--     ##################
            table starts
         ##################-->
            
        <div class="container-table">
            <table class="table">
                <thead>
                    <tr>
                        <th class="tableheading">Doctor</th>
                        <th class="tableheading" colspan="8">Time (Payment)</th>
                    </tr>
                </thead>
                <tbody id="doctorAvailability">
                    <tr>
                        <td class="Row" colspan="9">Select Filters</td>
                    </tr>

                </tbody>
            </table>
        </div>

<!--        ################
            table ends
        ################-->

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
        $('#doctorAvailability').html("<tr><td class=\"Row\" colspan=\"9\">Select Filters</td></tr>");
        
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
        $('#doctorAvailability').html("<tr><td class=\"Row\" colspan=\"9\">Select Filters</td></tr>");
        
        $.ajax({
            url: "gethospitalbycityasstring",
            type: "get", //send it through get method
            data: { 
              stage: "city", 
              city: cityId
            },
            success: function(response) {
              //populate city data
//              alert(response);
              $('#hospital').html("<option>Select Hospital</option>"+response);
            },
            error: function(xhr) {
                alert("HospitalByCity Error");
            }
          });

    });
    
//    onchange hospital
    $('#hospital').change(function(){
        var hospitalId=$(this).find(':selected').val();
        $('#doctorAvailability').html("<tr><td class=\"Row\" colspan=\"9\">Select Filters</td></tr>");
        
        $.ajax({
            url: "getspecialisationbyhospitalasstring",
            type: "get", //send it through get method
            data: { 
              stage: "hospital", 
              hospital: hospitalId
            },
            success: function(response) {
              //populate city data
//              alert(response);
              $('#doctorSpecialisation').html("<option>Select Specialisation</option>"+response);
            },
            error: function(xhr) {
                alert("SpecialisationByHospital Error");
            }
          });

    });
    
//    onchange date
    $('#date').change(function(){
        var hospitalId=$("#hospital").find(':selected').val();
        var doctorSpecialisationId=$("#doctorSpecialisation").find(':selected').val();
        var date=$(this).val();
        
        $.ajax({
            url: "getdoctoravailabilityforChannellingasstring",
            type: "get", //send it through get method
            data: { 
              stage: "hospital", 
              hospital: hospitalId,
              doctorSpecialisation: doctorSpecialisationId,
              date: date
            },
            success: function(response) {
              //populate city data
//              alert(response);
                if(response!=="")
                {
                    $('#doctorAvailability').html(response);
                }
                else
                {
                    $('#doctorAvailability').html("<tr><td class=\"Row\" colspan=\"9\">No Available Doctors</td></tr>");
                }
              
            },
            error: function(xhr) {
                alert("DoctorAvailability Error");
            }
          });

    });
    
    //confirm channeling
//    $('#confirmChannelling').click(function(){
    function confirmChannelling(doctorAvailabilityId){
//        var doctorAvailabilityId=$(this).attr("da-id");
//        alert(doctorAvailabilityId);
//        alert("sfg");
        
        $.ajax({
            url: "confirmchannelling",
            type: "get", //send it through get method
            data: { 
              doctorAvailabilityId: doctorAvailabilityId, 
              check: "0"
            },
            success: function(response) {
              //check dulpication
//              alert(response);
              if(response==1)
              {
                  var c = confirm("Another channelling found for same doctor availability !\nAre you sure want to channel for another person?");
                  if(c==true)
                  {
                      window.location.href="confirmchannelling?check=1&doctorAvailabilityId="+doctorAvailabilityId;
                  }
                  else
                  {
                      alert("You Cancelled the channelling ! ");
                  }
              }
              else
              {
                    window.location.href="confirmchannelling?doctorAvailabilityId="+doctorAvailabilityId;
              }
            },
            error: function(xhr) {
                alert("SpecialisationByHospital Error");
            }
          });

    };
//    });
    
</script>