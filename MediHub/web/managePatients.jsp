<!doctype html>
<html>
<head>
  <meta charset=utf-8>
  <title>MediHub</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@500&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Spartan:wght@600&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" type="text/css" href="./public/css/Manage_Patients.css" media="screen" />
  <link rel="stylesheet" type="text/css" href="./public/css/modal.css" media="screen" />
</head>
<body>
  <div class="navbar">
    <ul>
      <li><button class="style" type="button"> Joen Doe </button></li>
      <li><a href="#" id="end">About</a></li>
      <li><a href="#">Contact</a></li>
      <li><a href="#">Emergency Services</a></li>
      <li><a href="#">Home</a></li>
      <li id="logo"><img src="logo.png" width="15.5%"></li>
    </ul>
  </div>
  <br><br>
  <div class="Dropdown">
    <select name='Dropdown'>
      <option value='Action' selected><a href="">All</a></option>
      <option value='Action'><a href="#">Active</a></option>
      <option value='Action'><a href="#">Inactive</a></option>
      <option value='Action'><a href="#">Blacklisted</a></option>
   </select>
   <br>
   <select name='Dropdown' class="filter_dropdown">
      <option value='Action' selected><a href="">All</a></option>
      <option value='Action'><a href="#">ID</a></option>
      <option value='Action'><a href="#">Patient</a></option>
      <option value=99><a href="#">Phone Number</a></option>
      <option value='Action'><a href="#">Status</a></option>
   </select>
   <input type="text" class="filter_text" placeholder="Filter">
   <a href="#"><button class="btn1"><i class="fa fa-filter"></i></button></a>
  </div>
  <br>
  
      
  <div id="viewPatient" class="modal">

    <div class="modal-content">
      <div class="modal-header">
        <span class="close">&times;</span>
        <h2>View Order</h2>
      </div>
      
      <div class="modal-body">
        
        <table class="table">
          <thead>
            <tr>
              <th class="tableheading">Patient ID</th>
              <th class="tableheading">Patient</th>
              <th class="tableheading">Phone Number</th>
              <th class="tableheading">DOB</th>
              
              <th class="tableheading">NIC</th>
              <th class="tableheading">Status</th>
            
              <th class="tableheading">Description</th>
              
            </tr>
            <tr>
              <td class="Row">001</td>
              <td class="Row">John</td>
              <td class="Row">0771231231</td>
              <td class="Row">15/10/2020</td>
              <td class="Row">985678908V</td>
              <td class="Row">Active</td>
              <td class="Row">This is some random description of something boring</td>
            
              </tr>
          </thead>
        </table>
      </div>
    </div>


</div>
    </div>
  <div class="container-table">
    <table class="table">
      <thead>
      <tr>
        <th class="tableheading">Patient ID</th>
        <th class="tableheading">Patient</th>
        <th class="tableheading">Phone Number</th>
        <th class="tableheading">Status</th>
        <th class="tableheading">Actions</th>
      </tr>
      </thead>
      <tbody>
      <tr>
        <td class="Row">001</td>
        <td class="Row">John</td>
        <td class="Row">0771231231</td>
        <td class="Row">Active</td>
        <td>
          <ul class="actions">
              <li><button class="btn" id="viewpatient"><i class="fa fa-eye"></i></button></li>
              <li><button class="btn" onclick="confirm('Do you want to remove this patient')"><i class="fa fa-trash"></i></button></li>
          </ul>
        </td>
      </tr>
      <tr>
        <td class="Row">002</td>
        <td class="Row">James Potter</td>
        <td class="Row">0761231234</td>
        <td class="Row">Inactive</td>
        <td>
          <ul class="actions">
              <li><a href="#"><button class="btn"><i class="fa fa-eye"></i></button></a></li>
              <li><a href="#"><button class="btn"><i class="fa fa-trash"></i></button></a></li>
          </ul>
        </td>
      </tr>
      <tr>
        <td class="Row">003</td>
        <td class="Row">George Leo</td>
        <td class="Row">0711231235</td>
        <td class="Row">Blacklisted</td>
        <td>
          <ul class="actions">
              <li><a href="#"><button class="btn"><i class="fa fa-eye"></i></button></a></li>
              <li><a href="#"><button class="btn"><i class="fa fa-trash"></i></button></a></li>
          </ul>
        </td>
      </tr>
      <tr>
        <td class="Row">004</td>
        <td class="Row">David Oscar</td>
        <td class="Row">0786786789</td>
        <td class="Row">Active</td>
        <td>
          <ul class="actions">
              <li><a href="#"><button class="btn"><i class="fa fa-eye"></i></button></a></li>
              <li><a href="#"><button class="btn"><i class="fa fa-trash"></i></button></a></li>
          </ul>
        </td>
      </tr>
      </tbody>
    </table>
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
var modal = document.getElementById("viewPatient");
var btn = document.getElementById("viewpatient");
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
