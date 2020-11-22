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
  <link rel="stylesheet" type="text/css" href="./public/css/view_patient.css" media="screen" />
  
</head>
<body>
  <div class="navbar" id="navbar">
    <ul>
      <li><button class="style" type="button" onclick="window.location.href='logout';"> LOGOUT</button></li>
      <<li><a href="About.jsp" id="end">About</a></li>
      <li><a href="contactUs.jsp">Contact</a></li>
      <li><a href="EmergencyServices.jsp">Emergency Services</a></li>
      <li><a href="/MediHub">Home</a></li>
      <li id="logo"><img src="./public/images/onlylogo.png" width="15.5%"></li>
    </ul>
  </div>
  <br><br>
 
    <%
       
       ArrayList al = new ArrayList();
       ArrayList a2 = new ArrayList();
       if(request.getAttribute("profile")!=null){
           al=(ArrayList )request.getAttribute("profile");
            
            a2 =(ArrayList ) al.get(0);
        }
  %>
  
  <div class="split left">
  <div class="centered">
    <img src="./public/images/p3.jpg" alt="Avatar woman">
    <h2><%=a2.get(3)%></h2>
    <br>
    <button class="style" type="button" onclick="window.location.href='patient'"> Back </button>
  </div>
</div>
<div class="split middle">
  <div class="middle_container">
       <h4>Personal Details</h4>
      <p><i class="fa fa-user" style="color:black;font-size:15px;"></i><%=a2.get(1)%> <i class="fa fa-user" style="color:black;font-size:15px;"></i><%=a2.get(2)%></p>
      <p><i class="fa fa-envelope" style="color:black;font-size:15px;"></i><%=a2.get(4)%></p>
      <p><i class="fa fa-users" style="color:black;font-size:15px;"></i>Patient</p>
      <p><i class="fa fa-id-card" style="color:black;font-size:15px;"></i><%=a2.get(7)%></p>
      <p><i class="fa fa-calendar" style="color:black;font-size:15px;"></i><%=a2.get(8)%></p>
      <p><i class="fa fa-male" style="color:black;font-size:15px;"></i><%=a2.get(9).toString().equals("M")?"Male":"Female"%></p>
      <p><i class="fa fa-mobile" style="color:black;font-size:15px;"></i><%=a2.get(10)%></p>
      <p><i class="fa fa-phone" style="color:black;font-size:15px;"></i><%=a2.get(11)%></p>
      <p><i class="fa fa-home" style="color:black;font-size:15px;"></i><%=a2.get(12)%>,<%=a2.get(13)%></p>
   </div>
</div>

<div class="split right">
  <div class="right_container">
    <h4>Login Activity</h4>
    <br><br>
    <h5>First access time : </h5>
    <p>Monday, 21 January 2019, 8:48 AM</p>
    <br><br>
    <h5>Last access time :</h5>
    <p>Tuesday, 17 November 2020, 9.00 AM</p>
   </div>
</div>
<br>


</body>
<br><br>
<center>
<footer>
  <div class="row4">
    <div class="column4">
      <div class="footerText">
        <br>ABOUT <br><br>
        MediHub is a mainly a patient portal providing users eaiser access to all medical services. <br>MediHub also
        provides different doctors, hospitals and pharmacies interact with the patients directly in order to provide
        them with the best experience in accessing medical<br> services.<br>
      </div>
    </div>
    <!--<div class="column4"><br>
      <div class="footerText">-->
        <br><br>
        <a href="#" class="fa fa-facebook"></a>
        <a href="#" class="fa fa-twitter"></a>
        <a href="#" class="fa fa-google"></a>
        <a href="#" class="fa fa-instagram"></a>
      </div>
  <br>
  <div class="footerText">
    All rights Reserved @MediHub2020
  </div>
  <br><br>
</footer>
</center>
</html>
