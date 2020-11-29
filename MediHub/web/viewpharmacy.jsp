<%-- 
    Document   : viewpharmacy
    Created on : Nov 24, 2020, 10:50:50 AM
    Author     : Yash
--%>

<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<!doctype html>
<html>
<head>
  <meta charset=utf-8>
  <title>MediHub</title>
  <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@500&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Spartan:wght@600&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" type="text/css" href="./public/css/viewpharmacy.css" media="screen" />
</head>
<body>

  <div class="navbar" id="navbar">
      <ul>
        <li><button class="styled" type="button" onclick="window.location.href='logout';"> LOGOUT</button></li>
        <li><a href="#" id="end">About</a></li>
        <li><a href="#">Contact</a></li>
        <li><a href="#">Emergency Services</a></li>
        <li><a href="#">Home</a></li>
        <li id="logo"><img src="./public/images/onlylogo.png" width="15.5%"></li>
      </ul>
  </div>
    <% String username="";
       username= session.getAttribute("username").toString();
  
       
       ArrayList al = new ArrayList();
       ArrayList a2 = new ArrayList();
       if(request.getAttribute("profile")!=null){
           al=(ArrayList)request.getAttribute("profile");
            
            a2 =(ArrayList) al.get(0);
        }
  %>

 <div class="contentContainer">
  <div class="">
  <div class="profile">
    <img src="./public/images/p3.jpg" id="profile">
    <h4 style="text-align:center; margin-bottom:25px;font-size:20px;fontweight:bold;"><%=username%></h4>
    <button class="button" id="profilePic" onclick="window.location.href='pharmacyDashboard.jsp';"><b>Back</b></button>
  </div>
  <div class="login">
    <h4 style="text-align:center; margin-top:25px;font-size:20px;fontweight:bold;">Login Activity</h4>
    <br><br>
    <h5>First access time :</h5>
    <p>Monday, 21 January 2019, 8:48 AM</p>
    <br><br>
    <h5>Last access time :</h5>
    <p>Tuesday, 17 January 2020, 9:00 AM</p>
    <br><br><br><br>
  </div>
  </div>
  <div class="information">
    <h3 style="text-align:center;font-size:25px;margin-bottom:40px;"> Personal Details</h3>

    <div class="record">
    <div class="label">Name</div>
    <div class="data"><%=a2.get(1)%></div>
  </div>

  <div class="record">
    <div class="label">License No</div>
    <div class="data"><%=a2.get(2)%></div>
  </div>

  <div class="record">
    <div class="label">Pharmacist ID</div>
    <div class="data"><%=a2.get(4)%></div>
  </div>

  <div class="record">
    <div class="label">Land Number</div>
    <div class="data"><%=a2.get(7)%></div>
  </div>

  <div class="record">
    <div class="label">Fax Number</div>
    <div class="data"><%=a2.get(8)%></div>
  </div>

  <div class="record">
    <div class="label">Email</div>
    <div class="data"><%=a2.get(9)%></div>
  </div>

  <div class="record">
    <div class="label">Address 1</div>
    <div class="data"><%=a2.get(10)%></div>
  </div>

  <div class="record">
    <div class="label">Address 2</div>
    <div class="data"><%=a2.get(11)%></div>
  </div>

  <div class="record">
    <div class="label">City</div>
    <div class="data"><%=a2.get(12)%></div>
  </div>

  <div class="record">
    <div class="label">Longitude</div>
    <div class="data"><%=a2.get(13)%></div>
  </div>

  <div class="record">
    <div class="label">Latitude</div>
    <div class="data"><%=a2.get(14)%></div>

  </div>
</div>
</div>


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
</html>
