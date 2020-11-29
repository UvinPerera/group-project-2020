<%-- 
    Document   : createpharmacy
    Created on : Nov 29, 2020, 7:54:30 PM
    Author     : Ifra
--%>

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
        <li><button class="styled" type="button"> LOGOUT </button></li>
        <li><a href="#" id="end">About</a></li>
        <li><a href="#">Contact</a></li>
        <li><a href="#">Emergency Services</a></li>
        <li><a href="#">Home</a></li>
        <li id="logo"><img src="images/onlylogo.png" width="15.5%"></li>
      </ul>
  </div>

 <div class="contentContainer">
  <div class="information">
    <h3 style="text-align:center;font-size: 35px;margin-bottom:40px;"> Create Pharmacy</h3>

    <div class="record">
    <div class="label">Pharmacy Name </div>
    <input class="data" type="text" name="pharmacy_name" id="pharmacyname" placeholder="Pharmacy Name">
  </div>

  <div class="record">
    <div class="label">License Number </div>
    <input class="data" type="text" name="last_name" id="lastname" placeholder="License Number">
  </div>

  <div class="record">
    <div class="label">License Proof Location</div>
    <input class="data" type="text" name="licenseprooflocation" id="nic" placeholder="License Proof Location">
  </div>

  <div class="record">
    <div class="label">Pharmacist Proof Location</div>
    <input class="data" type="text" name="pharmacistprooflocation" id="pharmacistprooflocation" placeholder="Pharmacist Proof Location">
  </div>

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
    <input class="data" type="text" name="address_2" id="address1" placeholder="Address 2">
  </div>

  <div class="record">
    <div class="label">City</div>
    <input class="data" type="text" name="city" id="city" placeholder="City">
  </div>

  <div class="record">
    <div class="label">Description</div>
    <input class="data" type="text" name="description" id="description" placeholder="Description">
  </div>

  <div class="record">
    <div class="label">Status</div>
    <input class="data" type="text" name="status" id="status" placeholder="Status">
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

