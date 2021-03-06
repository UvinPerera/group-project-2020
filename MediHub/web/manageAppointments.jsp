<!doctype html>
<html>
<head>
  <meta charset=utf-8>
  <title>MediHub</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@500&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Spartan:wght@600&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
  <link rel="stylesheet" type="text/css" href="./public/css/modal.css" media="screen" />
  <link rel="stylesheet" type="text/css" href="./public/css/Manage_Appointment.css" media="screen" />
  <script language="JavaScript" type="text/javascript" src="./public/js/Manage_Appointment.js"></script>

</head>
<body>
  <div class="navbar">
    <ul>
      <li><button class="style" type="button" onclick="window.location.href='logout';"> LOGOUT</button></li>
      <li><button class="style" type="button" onclick="window.location.href='hospitalDashboard.jsp'"> Dashboard </button></li>
      <li><a href="About.jsp" id="end">About</a></li>
      <li><a href="contactUs.jsp">Contact</a></li>
      <li><a href="EmergencyServices.jsp">Emergency Services</a></li>
      <li><a href="/MediHub">Home</a></li>
      <li id="logo"><img src="./public/images/onlylogo.png" width="15.5%"></li>
    </ul>
  </div><br>
    <h3>Manage Appointments</h3><hr>
  <div class="Dropdown">
    <select name='Dropdown' class="filters">
      <option value='Action' selected><a href="">All</a></option>
      <option value='Action'><a href="#">Active</a></option>
      <option value='Action'><a href="#">Cancelled by patient</a></option>
      <option value='Action'><a href="#">Cancelled by service provider</a></option>
      <option value='Action'><a href="#">Completed</a></option>
   </select>
   
   <select name='Dropdown' class="filter_dropdown filters">
      <option value='Action' selected><a href="">All</a></option>
      <option value='Action'><a href="#">ID</a></option>
      <option value='Action'><a href="#">Doctor</a></option>
      <option value=99><a href="#">Date</a></option>
      <option value='Action'><a href="#">Time</a></option>
      <option value='Action'><a href="#">Status</a></option>
   </select>
   <input type="text" class="filter_text textt" placeholder="Filter">
   <input type="date" class="filter_date textt" placeholder="From">
   <input type="date" class="filter_date textt" placeholder="To">
   <a href="#"><button class="btn1"><i class="fa fa-filter"></i></button></a>

   <div class="new">
    <div class="create">
          <a href="#" class=""><button class="btn"><i class="fa fa-plus-circle"></i></button></a>
      </div>
      <div class="add-text">
          Add New Appointment
      </div>
    </div>

  </div>
  <br>
<center>
  <div class="container-table">
    <table class="table">
      <thead>
      <tr>
        <th class="tableheading">Appointment ID</th>
        
        <th class="tableheading">Doctor</th>
        <th class="tableheading">Date</th>
        <th class="tableheading">Time</th>
        <th class="tableheading">Status</th>
        <th class="tableheading">Actions</th>
      </tr>
      </thead>
      <tbody>
      <tr>
        <td class="Row">001</td>
       
        <td class="Row">Dr.John Doe</td>
        <td class="Row">15/10/2020</td>
        <td class="Row">5.00 pm</td>
        <td class="Row">Active</td>
        <td>
          <ul class="actions">
              <li><button class="btn" id="viewappointment"><i class="fa fa-eye"></i></button></li>
              <li><a href="#"><button class="btn"><i class="fa fa-edit"></i></button></a></li>
              <li><button class="btn" onclick="confirm('Do you want to remove this appointment')"><i class="fa fa-trash"></i></button></li>
          </ul>
        </td>
      </tr>
      <tr>
        <td class="Row">002</td>
        
        <td class="Row">Dr.James Potter</td>
        <td class="Row">15/10/2020</td>
        <td class="Row">3.00 pm</td>
        <td class="Row">Completed</td>
        <td>
          <ul class="actions">
              <li><a href="#"><button class="btn"><i class="fa fa-eye"></i></button></a></li>
              <li><a href="#"><button class="btn"><i class="fa fa-edit"></i></button></a></li>
              <li><a href="#"><button class="btn"><i class="fa fa-trash"></i></button></a></li>
          </ul>
        </td>
      </tr>
      <tr>
        <td class="Row">003</td>
        
        <td class="Row">Dr.George Leo</td>
        <td class="Row">15/10/2020</td>
        <td class="Row">4.00 pm</td>
        <td class="Row">Cancelled by patient</td>
        <td>
          <ul class="actions">
              <li><a href="#"><button class="btn"><i class="fa fa-eye"></i></button></a></li>
              <li><a href="#"><button class="btn"><i class="fa fa-edit"></i></button></a></li>
              <li><a href="#"><button class="btn"><i class="fa fa-trash"></i></button></a></li>
          </ul>
        </td>
      </tr>
      <tr>
        <td class="Row">004</td>
        
        <td class="Row">Dr.David Oscar</td>
        <td class="Row">15/10/2020</td>
        <td class="Row">6.00 pm</td>
        <td class="Row">Cancelled by Service Provider</td>
        <td>
          <ul class="actions">
              <li><a href="#"><button class="btn"><i class="fa fa-eye"></i></button></a></li>
              <li><a href="#"><button class="btn"><i class="fa fa-edit"></i></button></a></li>
              <li><a href="#"><button class="btn"><i class="fa fa-trash"></i></button></a></li>
          </ul>
        </td>
      </tr>
      </tbody>
    </table>
 </div>
</center>
 <br>
 <div id="viewAppointment" class="modal">

    <div class="modal-content">
      <div class="modal-header">
        <span class="close">&times;</span>
        <h2>View Appointment</h2>
      </div>
      
      <div class="modal-body">
        
        <table class="table">
          <thead>
            <tr>
              <th class="tableheading">Appointment ID</th>
              
              <th class="tableheading">Doctor</th>
              <th class="tableheading">Date</th>
              <th class="tableheading">Time</th>
              <th class="tableheading">Status</th>
              <th class="tableheading">Description</th>
              
            </tr>
            <tr>
              <td class="Row">001</td>
              
              <td class="Row">Dr. John Doe</td>
              <td class="Row">15/10/2020</td>
              <td class="Row">5.00 pm</td>
              <td class="Row">Active</td>
              <td class="Row">This is some random description of something boring</td>
            
              </tr>
          </thead>
        </table>
      </div>
    </div>


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

<script>
var modal = document.getElementById("viewAppointment");
var btn = document.getElementById("viewappointment");
var span = document.getElementsByClassName("close")[0];
btn.onclick = function() {
  modal.style.display = "block";
}

span.onclick = function() {
  modal.style.display = "none";
}

window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}
</script>
</html>
