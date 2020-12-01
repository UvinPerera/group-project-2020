<!doctype html>
<html>
<head>
  <meta charset=utf-8>
  <title>MediHub</title>
  <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@500&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Spartan:wght@600&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" type="text/css" href="./public/css/Dashboard_Hospital.css" media="screen" />
</head>
<body>
  <div class="navbar" id="navbar">
    <ul>
      <li><button class="style" type="button" onclick="window.location.href='logout';"> Log out </button></li>
     <li><a href="About.jsp" id="end">About</a></li>
      <li><a href="contactUs.jsp">Contact</a></li>
      <li><a href="EmergencyServices.jsp">Emergency Services</a></li>
      <li><a href="/MediHub">Home</a></li>
      <li id="logo"><img src="./public/images/onlylogo.png" width="15.5%"></li>
    </ul>
  </div>
     <% String username="";
          username= session.getAttribute("username").toString();
   %>
 
  <div class="container">
      <div class="profile">
          <img src="./public/images/p3.jpg" id="profile">
          <h2 style="text-align:center; margin-bottom:25px;"><%=username%></h2><br>
          <div><center>
            <a href="viewhospital.jsp" class="btn">View Profile</a>
            <br><br><br>
            <a href="edithospital.jsp" class="btn">Edit Profile</a>
            <br><br><br>
            <a href="" class="btn deactivate">Deactivate</a>
              </center>
          </div>
          
        </div>

        <div class="contentBox">
              <div class="tab">
                <button class="tablinks" onclick="openTab(event, 'Services')" id="defaultOpen">Your Services</button>
                <button class="tablinks" onclick="openTab(event, 'Appointments')">Upcoming Notifications</button>
               
        </div>    
        <div id="Services" class="tabcontent">
          <div class="serviceTile">
              <center> <button class="styled" type="button" onclick="window.location.href='manageAppointments.jsp'">Manage Appointments</button></center>
          
          </div>
            <div class="serviceTile">
              <center><button class="styled" type="button" onclick="window.location.href='manageDoctors(hos).jsp'">Manage Doctors</button></center>
          
          </div>
        </div>
            <div id="Appointments" class="tabcontent"> There are no upcoming notifications yet..</div>
      </div>
  
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
        <div class="footerText"> -->
          <br><br>
          <a href="#" class="fa fa-facebook"></a>
          <a href="#" class="fa fa-twitter"></a>
          <a href="#" class="fa fa-google"></a>
          <a href="#" class="fa fa-instagram"></a>
        </div>
    <!--  </div>
    </div> -->
    <br>
    <div class="footerText">
      All rights Reserved @MediHub2020
    </div>
    <br><br>
  </footer>
</center>

</html>
<script>
       document.getElementById("defaultOpen").click();
    
    function openTab(evt, tabName) {
        var i, tabcontent, tablinks;

        // Get all elements with class="tabcontent" and hide them
        tabcontent = document.getElementsByClassName("tabcontent");
        for (i = 0; i < tabcontent.length; i++) {
          tabcontent[i].style.display = "none";
        }

        // Get all elements with class="tablinks" and remove the class "active"
        tablinks = document.getElementsByClassName("tablinks");
        for (i = 0; i < tablinks.length; i++) {
          tablinks[i].className = tablinks[i].className.replace(" active", "");
        }

        // Show the current tab, and add an "active" class to the button that opened the tab
        document.getElementById(tabName).style.display = "block";
        evt.currentTarget.className += " active";
}
</script>