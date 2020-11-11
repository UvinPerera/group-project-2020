<!DOCTYPE html>
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
          background-image:url('./public/images/img.png');
        }
    </style>

    <!--Navigation bar -->
    <div style="background-color:#2b3030;" id="sidebarPlace"></div>
    <div class="navbar" id="navbar">
      <ul>
        <li><button class="styled" type="button"> SIGN IN </button></li>
        <li><a href="#" id="end">About</a></li>
        <li><a href="#">Contact Us</a></li>
        <li><a href="#">Emergency Services</a></li>
        <li><a href="#">Home</a></li>
        <li id="logo"><img src="./public/images/onlylogo.png" width="15.5%"></li>
      </ul>
    </div>

    <div class="regform"><h1>Pharmacy Registration Form</h1><br></div>
    <div class="main">
     <form class="" action="index.html" method="post" id="pharmacyform">

         <br>
        <h2 class="name">Pharmacy Name</h2>
        <input class="input" type="text" name="name">
        
        <h2 class="name" >Display Name</h2>
       <input class="input" type="text" name="display_name" id="displayName">

       <h2 class="name">License Number</h2>
       <input class="input" type="text" name="license_number" >

       <h2 class="name">License Certification</h2>
       <input class="input" type="file" name="license_proof_location" >

       <h2 class="name">Land Number</h2>
       <input class="input" type="text" name="land_number" >

       <h2 class="name">Fax</h2>
       <input class="input" type="text" name="fax" >

       <h2 class="name">Email</h2>
       <input class="input" type="email" name="email" >

       <h2 class="name">Address 1</h2>
       <input class="input" type="text" name="address_1" >

       <h2 class="name">Address 2</h2>
       <input class="input" type="text" name="address_2" >

       <h2 class="name">City</h2>
       <input class="input" type="text" name="city" >

       <h2 class="name">Longitude</h2>
       <input class="input" type="text" name="longitude" >

       <h2 class="name">Latitude</h2>
       <input class="input" type="text" name="latitude" >

       <h2 class="name">Description</h2>
       <input class="input" type="text" name="description" >


       <h2 class="name">Province</h2>
       <input class="input" type="text" name="province" >

       <h1 style="text-align:center;color:white;">Pharmacist Details </h1><br>

       <h2 class="name">Pharmacist ID</h2>
       <input class="input" type="text" name="pharmacist_id" >

       <h2 class="name">Pharmacist Certification</h2>
       <input class="input" type="file" name="pharmacist_id_proof_location" >

       <br><br><br><br>

       <div>
         <center>
         <button class="button"><b>Cancel</b></button>
         <button class="button" type="submit"><b>Submit</b></button>
         </center>
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
        $("#pharmacyform").on('submit',function(e){

            alert('hi');
           
        })
    </script>
  </body>
</html>
