<%-- 
    Document   : editadmin
    Created on : Nov 28, 2020, 5:55:33 PM
    Author     : Ifra
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.medihub.admin.*"%>

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
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@500&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Spartan:wght@600&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" type="text/css" href=".public/css/editadmin.css" media="screen"/>
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>

</head>
<body>

  <div class="navbar" id="navbar">
      <ul>
        <li><button class="styled" type="button" onclick="window.location.href='logout';> LOGOUT </button></li>
        <li><a href="#" id="end">About</a></li>
        <li><a href="#">Contact</a></li>
        <li><a href="#">Emergency Services</a></li>
        <li><a href="#">Home</a></li>
        <li id="logo"><img src="./public/images/onlylogo.png" width="15.5%"></li>
      </ul>
  </div>
<%ArrayList al = new ArrayList();
       ArrayList a2 = new ArrayList();
       if(request.getAttribute("details")!=null){
           al=(ArrayList )request.getAttribute("details");
            
            a2 =(ArrayList ) al.get(0);
        }
%>
<%=a2%>
 <div class="contentContainer">
  <div class="profile">
    <img src="./public/images/p3.jpg" id="profile">
    <h2 style="text-align:center; margin-bottom:25px;"><%=a2.get(3)%></h2>
    <button class="button" id="profilePic"><b>Change Profile Picture</b></button>
  </div>

  <div class="information">
    <h3 style="text-align:center;font-size: 35px;margin-bottom:40px;"> Profile information</h3>

    <div class="record">
    <div class="label">First Name </div>
    <input class="data" type="text" name="first_name" id="firstname" placeholder="First Name" value="<%=a2.get(1)%>">
  </div>

  <div class="record">
    <div class="label">Last Name </div>
    <input class="data" type="text" name="last_name" id="lastname" placeholder="Last Name" value="<%=a2.get(2)%>">
  </div>

  <div class="record">
    <div class="label">NIC No</div>
    <input class="data" type="text" name="nic_no" id="nic" placeholder="NIC number" value="<%=a2.get(7)%>">
  </div>

  <div class="record">
    <div class="label">Date of Birth</div>
    <input class="data" type="date" name="dob" id="dob" placeholder="DOB" value=" <%=a2.get(8)%>">
  </div>

  <div class="record">
    <div class="label">Gender</div>
    <select class="data" name="gender" id="gender"  style=" height: 50px;">
      <option disabled="disabled" selected="selected"><%=a2.get(9).toString().equals("M")?"Male":"Female"%></option>
      <option>Male</option>
      <option>Female</option>
      <option>Not preferred to say</option>
    </select>
  </div>

  <div class="record">
    <div class="label">Email</div>
    <input class="data" type="email" name="email" id="email" placeholder="Email" value="<%=a2.get(4)%>>
  </div>

  <div class="record">
    <div class="label">Address 1</div>
    <input class="data" type="text" name="address_1" id="address1" placeholder="Address 1" value="<%=a2.get(12)%>>
  </div>

  <div class="record">
    <div class="label">Address 2</div>
    <input class="data" type="text" name="address_2" id="address1" placeholder="Address 2" value="<%=a2.get(13)%>>
  </div>

  <div class="record">
    <div class="label">City</div>
    <input class="data" type="text" name="city" id="city" placeholder="City" value="<%=a2.get(14)%>>
  </div>

  <div class="record">
    <div class="label">District</div>
    <input class="data" type="text" name="district" id="district" placeholder="District" value="<%=a2.get(15)%>>
  </div>

  <div class="record">
    <div class="label">Zip Code</div>
    <input class="data" type="text" name="zip_code" id="zip" placeholder="Zip code" value="<%=a2.get(16)%>>
  </div>

  <div class="record">
    <div class="label">Contact Number - Land</div>
    <input class="data" type="text" name="land_line" id="land" placeholder="Land number" value="<%=a2.get(10)%>>
  </div>

  <div class="record">
    <div class="label">Contact Number - Mobile</div>
    <input class="data" type="text" name="mobile" id="mobile" placeholder="Mobile number" value="<%=a2.get(11)%>>
  </div>

  <div class="buttons">
      <br><br>
      <button class="button" id="id" onclick="window.location.href='/medihub';"><b>Cancel</b></button>
      <button class="button" id="id" onclick="window.location.href='/medihub';"><b>Done</b></button>
   </div>

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

