<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.medihub.patient.Patient"%>
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
  <link rel="stylesheet" type="text/css" href="./public/css/view_patient.css" media="screen" />
</head>
<body>

  <div class="navbar" id="navbar">
      <ul>
        <li><button class="styled" type="button" onclick="window.location.href='logout';"> LOGOUT </button></li>
        <li><button class="styled" type="button" onclick="window.location.href='patient'"> Dashboard </button></li>
        <li><a href="About.jsp" id="end">About</a></li>
        <li><a href="contactUs.jsp">Contact</a></li>
        <li><a href="EmergencyServices.jsp">Emergency Services</a></li>
        <li><a href="/MediHub">Home</a></li>
        <li id="logo"><img src="./public/images/onlylogo.png" width="15.5%"></li>
      </ul>
  </div>
                        <%
                            if(request.getAttribute("profile")!=null){
                                Patient row = (Patient)request.getAttribute("profile");
                                
                                
                        %>

 <div class="contentContainer">
  <div class="">
  <div class="profile">
    <img src="./public/images/p3.jpg" id="profile">
    <h4 style="text-align:center; margin-bottom:25px;font-size:20px;fontweight:bold;">Jane Doe</h4>
    <button class="button" id="profilePic" onclick="window.location.href='patient'"><b>Back</b></button>
  </div>
  <div class="login">
    <h4 style="text-align:center; margin-top:25px;font-size:20px;fontweight:bold;">Login Activity</h4>
    <br><br>
    <h5>First access time :</h5>
    <p><%= row.createdAt %></p>
    <br><br>
    <h5>Last access time :</h5>
    <p><%= row.updatedAt %></p>
    <br><br><br><br>
  </div>
  </div>
  <div class="information">
    <h3 style="text-align:center;font-size:25px;margin-bottom:40px;"> Personal Details</h3>

    <div class="record">
    <div class="label">First Name </div>
    <div class="data"><%= row.firstName %></div>
  </div>

  <div class="record">
    <div class="label">Last Name </div>
    <div class="data"><%= row.lastName %></div>
  </div>

  <div class="record">
    <div class="label">NIC No</div>
    <div class="data"><%= row.nic %></div>
  </div>

  <div class="record">
    <div class="label">Date of Birth</div>
    <div class="data"><%= row.dob %></div>
  </div>

  <div class="record">
    <div class="label">Gender</div>
    <div class="data"><% if(row.gender.equalsIgnoreCase("M")){out.print("Male");}else if(row.gender.equalsIgnoreCase("F")){out.print("Female");}else{out.print("Not Specified");} %></div>
  </div>

  <div class="record">
    <div class="label">Email</div>
    <div class="data"><%= row.email %></div>
  </div>

  <div class="record">
    <div class="label">Address</div>
    <div class="data"><%= row.address1+"\n"+row.address2 %></div>
  </div>

<!--  <div class="record">
    <div class="label">Address 2</div>
    <div class="data">Kottegoda Road</div>
  </div>-->

  <div class="record">
    <div class="label">District</div>
    <div class="data"><%= row.districtStr %></div>
  </div>
  
  <div class="record">
    <div class="label">City</div>
    <div class="data"><%= row.cityStr %></div>
  </div>

  <div class="record">
    <div class="label">Contact Number - Land</div>
    <div class="data"><%= row.landNumber %></div>
  </div>

  <div class="record">
    <div class="label">Contact Number - Mobile</div>
    <div class="data"><%= row.mobileNumber %></div>
  </div>

  </div>
</div>
  
<!--closing jsp tag-->                        
<% } %>
<!--tag close-->
 

<br><br>


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
    </body>
</html>

