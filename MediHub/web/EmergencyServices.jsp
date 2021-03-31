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
  <link rel="stylesheet" type="text/css" href="./public/css/EmergencyServices.css" media="screen" />
</head>

<body>

    <!--Navigation bar-->
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
        <li><a href="About.jsp" id="end">About</a></li>
      <li><a href="contactUs.jsp">Contact</a></li>
      <li class="active"><a href="EmergencyServices.jsp">Emergency Services</a></li>
      <li><a href="BrowseDoctorReviewsGuest"> Browse Service Providers</a></li>
      <li><a href="/MediHub">Home</a></li>
        <li id="logo"><img src="./public/images/onlylogo.png" width="15.5%"></li>
      </ul>
    </div>

    <!--Container for the heading-->
    <div class="container">
    <h2></br><center>Emergency Services</center></h2>
    </div>
    <center>

      <!--Embedding youtube video-->
    <iframe width="560" height="315" src="https://www.youtube.com/embed/ymTYfaKKEo4?controls=0" frameborder="0" allow="accelerometer; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen>
    </iframe>
    </center>

    <!--Container for text-->
    <div class="textContainer">
      <p style="text-align:center">
        MediHub currently do not offer any emergency sevices. Stay tuned for our latest updates to find out more! </p>
    </div>


    <!--Footer-->
    <div style="clear: both;"></div>
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

  </body>
  </html>
