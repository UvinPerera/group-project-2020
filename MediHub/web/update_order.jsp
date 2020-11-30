<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.medihub.pharmacy.*"%>

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
  <link rel="stylesheet" type="text/css" href="./public/css/updateOrder.css" media="screen"/>
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>

</head>
<body>

  <div class="navbar" id="navbar">
      <ul>
        <li><button class="styled" type="button" onclick="window.location.href='logout';"> LOGOUT </button></li>
        <li><a href="#" id="end">About</a></li>
        <li><a href="#">Contact</a></li>
        <li><a href="#">Emergency Services</a></li>
        <li><a href="#">Home</a></li>
        <li id="logo"><img src="./public/images/onlylogo.png" width="15.5%"></li>
      </ul>
  </div>
   
<%ArrayList al = new ArrayList();
       ArrayList a2 = new ArrayList();
       if(request.getAttribute("orders")!=null){
           al=(ArrayList )request.getAttribute("orders");
            
            a2 =(ArrayList ) al.get(0);
        }
%>
  <div class="container">
    <h1>Update Order </h1><br>
    <form action="updatepatientorder?orderid=<%=a2.get(0)%>"" method="post">

      <h2 class="details">Order ID</h2>
      <input class="input" type="text" name="orderid" id="orderid" placeholder="<%=a2.get(0)%>" readonly>

       <h2 class="details">Date and Time</h2>
      <input class="input" type="text" name="datetime" id="datetime" placeholder="<%=a2.get(3)%>" readonly>

      <h2 class="details">Patient ID</h2>
       <input class="input" type="text" name="patientid" id="patientid" placeholder="<%=a2.get(1)%>" readonly>

       <h2 class="details">Patient Name </h2>
        <input class="input" type="text" name="patientname" id="patientname" placeholder="<%=a2.get (2)%>" readonly>

        <h2 class="details"> Patient Order Description</h2>
         <input class="input" type="text" name="patientdescription" id="patientorderdescription" placeholder="<%=a2.get(6)%>" readonly>

         <h2 class="details">Order Description</h2>
          <input class="input" type="text" name="orderdescription" id="orderdescription" placeholder="<%=a2.get(4)%>">

      <h2 class="details">Prescription</h2>
       <input class="input" type="text" name="file_path" id="filepath" placeholder="<%=a2.get(5)%>" readonly>

       <div class="button-container">
             <button class="button" id="id" onclick="window.location.href='/medihub';"><b>Cancel</b></button>
             <button class="button" type="reset" id="clear"><b>Clear</b></button>
             <button class="button" type="submit"><b>Submit</b></button>

      </div>

    </form>
  </div>
</body>
</html>
