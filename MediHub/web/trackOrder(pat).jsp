<!doctype html>
<html>
<head>
  <meta charset=utf-8>
  <title>MediHub</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@500&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Spartan:wght@600&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" type="text/css" href="./public/css/Track_Order(pat).css" media="screen"/>
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
  <script language="JavaScript" type="text/javascript" src="./public/js/Track_Order(pat).js"></script>
  <link rel="stylesheet" type="text/css" href="./public/css/modal.css" media="screen" />
</head>
<body>
  <div class="navbar" id="navbar">
      <ul>
        <li><button class="style" type="button"> Logout </button></li>
        <li><a href="#" id="end">About</a></li>
        <li><a href="#">Contact</a></li>
        <li><a href="#">Emergency Services</a></li>
        <li><a href="/MediHub">Home</a></li>
        <li id="logo"><img src="logo.png" width="15.5%"></li>
      </ul>
  </div>
  <div id="viewOrder" class="modal">

    <div class="modal-content">
      <div class="modal-header">
        <span class="close">&times;</span>
        <h2>View Order</h2>
      </div>
      
      <div class="modal-body">
        
        <table class="table">
          <thead>
            <tr>
              <th class="tableheading">Order ID</th>
              <th class="tableheading">Pharmacy ID</th>
              <th class="tableheading">Pharmacy Name</th>
              <th class="tableheading">Date</th>
              <th class="tableheading">Status</th>
              <th class="tableheading">Description</th>
              
            </tr>
            <tr>
              <td class="Row">001</td>
              <td class="Row">101</td>
              <td class="Row">Apolo Pharmacy</td>
              <td class="Row">15/10/2020</td>
              <td class="Row">Oredred</td>
              <td class="Row">This is some random description of something boring</td>
            
              </tr>
          </thead>
        </table>
      </div>
    </div>


</div>
  <br><br>
  <div class="Dropdown">
    <select name='Dropdown'>
      <option value='Action' selected><a href="">All</a></option>
      <option value='Action'><a href="#">Oredred</a></option>
      <option value='Action'><a href="#">Received</a></option>
      <option value='Action'><a href="#">Cancelled</a></option>
   </select>
   <br>
   <select name='Dropdown' class="filter_dropdown">
      <option value='Action' selected><a href="">All</a></option>
      <option value='Action'><a href="#">Order ID</a></option>
      <option value='Action'><a href="#">Pharmacy ID</a></option>
      <option value='Action'><a href="#">Pharmacy Name</a></option>
      <option value=99><a href="#">Date</a></option>
      <option value='Action'><a href="#">Status</a></option>
   </select>
   <input type="text" class="filter_text" placeholder="Filter">
   <input type="date" class="filter_date" placeholder="From">
   <input type="date" class="filter_date" placeholder="To">
   <a href="#"><button class="btn1"><i class="fa fa-filter"></i></button></a>

  </div>
  <br>
  <div class="container-table">
    <table class="table">
      <thead>
      <tr>
        <th class="tableheading">Order ID</th>
        <th class="tableheading">Pharmacy ID</th>
        <th class="tableheading">Pharmacy Name</th>
        <th class="tableheading">Date</th>
        <th class="tableheading">Status</th>
        <th class="tableheading">Actions</th>
      </tr>
      </thead>
      <tbody>
      <tr>
        <td class="Row">001</td>
        <td class="Row">101</td>
        <td class="Row">Apolo Pharmacy</td>
        <td class="Row">15/10/2020</td>
        <td class="Row">Oredred</td>
        <td>
          <ul class="actions">
              <li><button class="btn" id="vieworder"><i class="fa fa-eye"></i></button></li>
              <li><button class="btn" id="editorder"><i class="fa fa-edit"></i></button></li>
              <li><button class="btn" id="deleteOrder" onclick="confirm('Do you want to delete this order?')"><i class="fa fa-trash"></i></button></li>
          </ul>
        </td>
      </tr>
      <tr>
        <td class="Row">002</td>
        <td class="Row">102</td>
        <td class="Row">Medi Center</td>
        <td class="Row">15/10/2020</td>
        <td class="Row">Received</td>
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
        <td class="Row">103</td>
        <td class="Row">Lanka Osusala</td>
        <td class="Row">15/10/2020</td>
        <td class="Row">Cancelled</td>
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
        <td class="Row">104</td>
        <td class="Row">Health Plus</td>
        <td class="Row">15/10/2020</td>
        <td class="Row">Cancelled</td>
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
var modal = document.getElementById("viewOrder");
var btn = document.getElementById("vieworder");
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
