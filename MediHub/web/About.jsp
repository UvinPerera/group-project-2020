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
  <link rel="stylesheet" type="text/css" href="./public/css/About.css" media="screen" />
</head>

<body>

  <!--Navigation bar -->
    <div style="background-color:#2b3030;" id="sidebarPlace"></div>
    <div class="navbar" id="navbar">
      <ul>
         <% if(session.getAttribute("username")==null){%>
        
        <li><button class="styled" type="button" onclick="window.location.href='login.jsp';"> SIGN IN </button></li>
        <li><button class="styled" type="button" onclick="window.location.href='signUp.jsp';"> SIGN UP</button></li> 
        <%}else{%>
           
            <% if(Integer.parseInt(session.getAttribute("usertype").toString())==0){%>
            <li><button class="styled" type="button" onclick="window.location.href='admin';"> DASHBOARD</button></li> 
            <%}%>
            <% if(Integer.parseInt(session.getAttribute("usertype").toString())==1){%>
            <li><button class="styled" type="button" onclick="window.location.href='patient';"> DASHBOARD</button></li> 
            <%}%>
             <% if(Integer.parseInt(session.getAttribute("usertype").toString())==2){%>
            <li><button class="styled" type="button" onclick="window.location.href='doctor';"> DASHBOARD</button></li> 
            <%}%>
             <% if(Integer.parseInt(session.getAttribute("usertype").toString())==3){%>
            <li><button class="styled" type="button" onclick="window.location.href='hospital';"> DASHBOARD</button></li> 
            <%}%>
             <% if(Integer.parseInt(session.getAttribute("usertype").toString())==4){%>
            <li><button class="styled" type="button" onclick="window.location.href='pharmacyDashboard.jsp';"> DASHBOARD</button></li> 
            <%}%>
            <li><button class="styled" type="button" onclick="window.location.href='logout';"> LOGOUT</button></li> 
        <%}%>
        <li class="active"><a href="About.jsp" id="end">About</a></li>
      <li><a href="contactUs.jsp">Contact</a></li>
      <li><a href="EmergencyServices.jsp">Emergency Services</a></li>
      <li><a href="BrowseDoctorReviewsGuest"> Browse Service Providers</a></li>
      <li><a href="/MediHub">Home</a></li>
        <li id="logo"><img src="./public/css/images/onlylogo.png" width="15.5%"></li>
      </ul>
    </div>

    <!--About content card -->
    <div class="row">
      <div class="column" id="left">
        <div class="card">

            <h2><center>About Us</center></h2>
            <br><br><p style="text-align:justify">
            MediHub is a user-friendly interface for patients to access to all their medical services in just one touch.
            <br><br>We provide our users an efficient way for channelling appointments, uploading medical records and prescriptions, ordering medication online and many more. </br></br>
            MediHub also provides  doctors, hospitals and pharmacies an easier interface to interact with the patients directly in order to provide them with the best experience in accessing medical services</br></br>
            We respect your privacy and we ensure that all your data is protected.
          </p><br><br>
            <p style="text-align:center">
            If you have any concerns contact our Mediub Administrators!
            </p>
      </div>
    </div>
      <!--About image -->
      <div class="column" id="right">
            <br><br>
            <img src="./public/images/one.jpg" width="90%">
      </div>

      <!--Footer -->
    </div>
    <div style="clear: both;"></div>
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

</body>
</html>
