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
  <link rel="stylesheet" type="text/css" href="./public/css/main.css" media="screen" />
  <link rel="stylesheet" type="text/css" href="./public/css/cookiePopup.css" media="screen" />
</head>

<body>

  <!--Nav bar-->

  <div style="background-color:#2b3030;" id="sidebarPlace"></div>
  <div class="navbar" id="navbar">
    <ul>
        <% if(session.getAttribute("username")==null){%>
        
        <li><button class="styled" type="button" onclick="window.location.href='login.jsp';"> SIGN IN </button></li>
        <li><button class="styled" type="button" onclick="window.location.href='signup';"> SIGN UP</button></li> 
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
            <li><button class="styled" type="button" onclick="window.location.href='pharmacy';"> DASHBOARD</button></li> 
            <%}%>
            <li><button class="styled" type="button" onclick="window.location.href='logout';"> LOGOUT</button></li> 
        <%}%>
      <li><a href="About.jsp" id="end">About</a></li>
      <li><a href="contactUs.jsp">Contact</a></li>
      <li><a href="EmergencyServices.jsp">Emergency Services</a></li>
      <li><a href="BrowseDoctorReviewsGuest"> Browse Service Providers</a></li>
      <li class="active"><a href="/MediHub">Home</a></li>
      
      <li id="logo"><img src="./public/images/onlylogo.png" width="15.5%"></li>
    </ul>
  </div>

  <!--Cover picture-->
  <div class="container">
    
    <% if(session.getAttribute("username")==null){%>
    <img src="./public/images/finale.jpeg" width="100%" id="pic">
    <button class="btn" onclick="window.location.href='signUp.jsp';">Sign Up</button>
    <%}else{%>
    <img src="./public/images/finale2.png" width="100%" id="pic">
    <%}%>
  </div>

  <!--Content-->
  <div id="services">
    <center>
      </br></br></br>
      <h1>WHAT WE HAVE TO OFFER</h1>
      <hr class="divider">
      <div class="row">
        <div class="column">
          <div class="flip-box">
            <div class="flip-box-inner">
              <div class="flip-box-front">
                <img src="./public/images/doctor (3).jpg" width="100%"></br></br>
                <strong> Find a Doctor </strong>
              </div>
              <div class="flip-box-back card">
                </br></br></br></br>Search for the doctor of your choice</br></br>Check their availability and schedule
                an appointment</br></br></br>
<!--                <button class="btn default" >Find a Doctor</button>-->
              </div>
            </div>
          </div>
        </div>
        <div class="column">
          <div class="flip-box">
            <div class="flip-box-inner ">
              <div class="flip-box-front">
                <img src="./public/images/appointment.jpg" width="100%"></br></br>
                <strong> Schedule an Appointment </strong>
              </div>
              <div class="flip-box-back card">
                </br></br></br></br>Is your doctor available?</br></br>Place an appointment and reserve time with your
                doctor!</br></br>
<!--                <button class="btn default">Make Appointment</button>-->
              </div>
            </div>
          </div>
        </div>
        <div class="column">
          <div class="flip-box">
            <div class="flip-box-inner">
              <div class="flip-box-front">
                <img src="./public/images/pharmacy.jpg" width="100%"></br></br>
                <strong> Pharmacy Deliveries</strong>
              </div>
              <div class="flip-box-back card">
                </br></br></br></br>Upload any prescription and direct it to a pharmacy of choice.</br></br>They will
                deliver your medication to your doorstep!</br></br>
<!--                <button class="btn default">Order Medication</button>-->
              </div>
            </div>
          </div>
        </div>
        <div class="column">
          <div class="flip-box">
            <div class="flip-box-inner">
              <div class="flip-box-front">
                <img src="./public/images/records3.jpg" width="100%"> </br></br>
                <strong> Store Medical Records </strong>
              </div>
              <div class="flip-box-back card">
                </br></br></br></br>Is manually maintaining your medical files a hassle?</br></br>We've got you
                covered.</br>Upload all your medical files online and direct them to your doctor!</br></br>
<!--                <button class="btn default">Upload Medical Records</button>-->
              </div>
            </div>
          </div>
        </div>
      </div>
      </br></br></br>
  </div>
  </center>

 <!--Why choose medihub div-->

  <center>
    <div id="whydiv">
      </br></br></br>
      <h1>WHY CHOOSE MEDIHUB?</h1>
      <hr class="divider"></br>
      <div class="row2">
        <div class="column2"><img src="./public/images/doctor (2).png" width="20%"></br></br></br>
          <div class="textI">
            Doctors registered with MediHub are verfied to be highly trained to serve our patients’ needs.</br></br>
            MedHub is not only for patients! Even doctors can be a part of our community to interact with patients and
            provide them with the care they need.
          </div>
        </div>
        <div class="column2"><img src="./public/images/security.png" width="20%"></br></br></br>
          <div class="textI">
            We ensure that your personal information will remain private and confidential. </br></br>
            All your medical records will be secured inorder to provide you a safe experience with MediHub.
          </div>
        </div>
        <div class="column2"><img src="./public/images/pharmacy (3).png" width="20%"></br></br></br>
          <div class="textI">
            All your prescriptions will be verified and handled with care. </br></br>
            MedHub is not only for patients! Even pharmacies can be a part of our community to interact with patients
            and provide them with the medication they require.
          </div>
        </div>
      </div>
      </br></br></br>
    </div>
    <!--Comments section-->
    <div id="comments"></br></br></br>
      <h1>TESTIMONIALS</h1>
      <hr class="divider">
      <div class="row3">
        <div class="columnPicture"><img src="./public/images/p1.jpg" width="95%" class="avatar"></div>
        <div class="columnComment">
          <h2><i>"Using MediHub is easy, reliable and safe. I would personally recommend it to anyone I know"</i></h2>
          </br></br></br>
          <h3 style="text-align:right">- Joanne Simons</h4>
        </div>
      </div>
      </br>
      <hr></br>
      <div class="row3">
        <div class="columnComment">
          <h2><i>"Using MediHub is easy, reliable and safe. I would personally recommend it to anyone I know"</i></h2>
          </br></br></br>
          <h3 style="text-align:right">- John Doe</h4>
        </div>
        <div class="columnPicture"><img src="./public/images/p4.jpg" width="95%" class="avatar"></div>
      </div>
      </br>
      <hr></br>
      <div class="row3">
        <div class="columnPicture"><img src="./public/images/p3.jpg" width="95%" class="avatar"></div>
        <div class="columnComment">
          <h2><i>"Using MediHub is easy, reliable and safe. I would personally recommend it to anyone I know"</i></h2>
          </br></br></br>
          <h3 style="text-align:right">- Jenifer Lautner</h4>
        </div>
      </div>
      </br></br>
    </div>
    </div>
    </div>
    </div>
    <div id="cookieConsent">
    <div id="closeCookieConsent">x</div>
    This website uses cookies. These cookies will not be used to save or collect any personal data as we value your privacy. They will only be utilized when you are logged in to our site to ensure that you get the best experience! <a class="accept">I Accept</a>
</div>

</body>

<!--footer-->
<footer>
  <div class="row4">
    <div class="column4">
      <div class="footerText">
        </br>ABOUT </br></br>
        MediHub is a mainly a patient portal providing users easier access to all medical services. </br>MediHub also
        provides different doctors, hospitals and pharmacies interact with the patients directly in order to provide
        them with the best experience in accessing medical services</br>
      </div>
    </div>
    <div class="column4"></br>
      <div class="footerText">
        </br></br>
        <a href="#" class="fa fa-facebook"></a>
        <a href="#" class="fa fa-twitter"></a>
        <a href="#" class="fa fa-google"></a>
        <a href="#" class="fa fa-instagram"></a>
      </div>
    </div>
  </div>
  </br>
  <div class="footerText">
    All rights Reserved @MediHub2020
  </div>
  </br></br>
</footer>
</center>
<script>
  if(screen.width<700)
  {
    document.getElementById("navbar").innerHTML =""
  document.getElementById("sidebarPlace").innerHTML = `
      <div id="mySidenav" class="sidenav">
        <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
        <a href="#">Home</a>
        <a href="#">Emergency Services</a>
        <a href="#">Contact</a>
        <a href="#">About</a>
        <br><br><br>
        <a href="#">Sign In</a>
        <a href="#">Sign out</a>
      </div>
      <span style="font-size:30px;cursor:pointer;color:white" onclick="openNav()">&#9776;</span>
      <img align="right" src="images/onlylogo.png" width="15.5%">

      `;
  //  alert(screen.width);
   }
   
   
  function openNav() {
    document.getElementById("mySidenav").style.width = "250px";
  }

  /* Set the width of the side navigation to 0 */
  function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
  }
  
  var cookiePopup = document.getElementById("cookieConsent");
  
  var close = document.getElementById("closeCookieConsent");
  
  close.onclick = function() {
      cookiePopup.style.display = "none";
    }
  
  var accept = document.getElementsByClassName("accept")[0];
  
  accept.onclick = function() {
      cookiePopup.style.display = "none";
    }

</script>

</html>
