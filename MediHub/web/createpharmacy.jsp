<%-- 
    Document   : createpharmacy
    Created on : Nov 29, 2020, 7:54:30 PM
    Author     : Ifra
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.medihub.pharmacy.*"%>
<%@page import="com.medihub.location.*"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!doctype html>
<html>
<head>
  <meta charset=utf-8>
  <title>MediHub</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@500&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Spartan:wght@600&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" type="text/css" href="./public/css/createpharmacy.css" media="screen"/>
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
 
 <div class="contentContainer">
  <div class="information">
    <h3 style="text-align:center;font-size: 35px;margin-bottom:40px;"> Create Pharmacy</h3>
    
    <form action="createpharmacy" method="POST" id="">
    <div class="record">
    <div class="label">Pharmacy Name </div>
    <input class="data" type="text" name="pharmacy_name" id="pharmacyname" placeholder="Pharmacy Name">
  </div>
        
    <div class="record">
    <div class="label">Display Name </div>
    <input class="data" type="text" name="display_name" id="pharmacyname" placeholder="Display Name">
  </div>

  <div class="record">
    <div class="label">License Number </div>
    <input class="data" type="text" name="license_number" id="licensename" placeholder="License Number">
  </div>
<!--
  <div class="record">
    <div class="label">License Proof Location</div>
    <input class="data" type="text" name="license_proof_location" id="nic" placeholder="License Proof Location">
  </div>-->
<!--       
   <div class="record">
    <div class="label">Pharmacist Id</div>
    <input class="data" type="text" name="pharmacist_id" id="pharmacist_id" placeholder="Pharmacist ID">
  </div>-->

<!--  <div class="record">
    <div class="label">Pharmacist Proof Location</div>
    <input class="data" type="text" name="pharmacist_proof_location" id="pharmacistprooflocation" placeholder="Pharmacist Proof Location">
  </div>-->

  <div class="record">
    <div class="label">Land Number</div>
    <input class="data" type="text" name="land_line" id="land" placeholder="Land number">
  </div>

  <div class="record">
    <div class="label">Fax</div>
    <input class="data" type="text" name="fax" id="fax" placeholder="Fax">
  </div>

  <div class="record">
    <div class="label">Email</div>
    <input class="data" type="email" name="email" id="email" placeholder="Email">
  </div>

  <div class="record">
    <div class="label">Address 1</div>
    <input class="data" type="text" name="address_1" id="address1" placeholder="Address 1">
  </div>

  <div class="record">
    <div class="label">Address 2</div>
    <input class="data" type="text" name="address_2" id="address2" placeholder="Address 2">
  </div>
        
   <div class="record">
    <div class="label">District</div>
    <select class="input option data" name="district" id="district" style="height: 50px">
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
  </div>
        

  <div class="record">
    <div class="label">City</div>
    <select class="input option data" name='city' id="city" class="filter_dropdown" style="height: 50px"> 
            <option value='' selected>--Choose Option--</option>

        </select>
  </div>

  <div class="record">
    <div class="label">Description</div>
    <input class="data" type="text" name="description" id="description" placeholder="Description">
  </div>
<!--
  <div class="record">
    <div class="label">Status</div>
    <input class="data" type="text" name="status" id="status" placeholder="Status">
  </div>-->

  <div class="buttons">
      <br>
      <button class="button" type="reset"><b>Clear</b></button>
      <button class="button" type="submit"><b>Submit</b></button>
    <!--  <button class="button" onclick="window.location.href='readpharmacy'"><b>Cancel</b></button>-->
   </div>
    </form>
   

  </div>
</div>
</div>


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
    </center>
  </footer>

<script>
    
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