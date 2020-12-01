<!doctype html>
<html>
<head>
  <meta charset=utf-8>
  <title>MediHub</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@500&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Spartan:wght@600&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" type="text/css" href="css/Manage_Doctors.css" media="screen" />
</head>
<body>
  <div class="navbar">
    <ul>
      <li><button class="style" type="button" onclick="window.location.href='logout';"> LOGOUT </button></li>
  <li><a href="About.jsp" id="end">About</a></li>
      <li><a href="contactUs.jsp">Contact</a></li>
      <li><a href="EmergencyServices.jsp">Emergency Services</a></li>
      <li><a href="/MediHub">Home</a></li>
      <li id="logo"><img src="logo.png" width="15.5%"></li>
    </ul>
  </div>
  <br><br>
  <div class="Dropdown">
    <select name='Dropdown'>
      <option value='Action' selected><a href="">All</a></option>
      <option value='Action'><a href="#">Pending</a></option>
      <option value='Action'><a href="#">Active</a></option>
      <option value='Action'><a href="#">Inactive</a></option>
      <option value='Action'><a href="#">Blacklisted</a></option>
   </select>
   <br>
   <select name='Dropdown' class="filter_dropdown">
     <option value='Action' selected><a href="">All</a></option>
     <option value='Action'><a href="#">ID</a></option>
     <option value='Action'><a href="#">Doctor</a></option>
     <option value=99><a href="#">Special</a></option>
     <option value='Action'><a href="#">Status</a></option>
   </select>
   <input type="text" class="filter_text" placeholder="Filter">
   <a href="#"><button class="btn1"><i class="fa fa-filter"></i></button></a>

   <div class="new">
    <div class="create">
          <a href="creatdoctor.jsp" class=""><button class="btn"><i class="fa fa-plus-circle"></i></button></a>
      </div>
      <div class="add-text">
          Add New Doctor
      </div>
    </div>

  </div>
  <br>
  <div class="container-table">
    <table class="table">
      <thead>
      <tr>
          <th class="tableheading">Doctor ID</th>
          <th class="tableheading">Doctor</th>
          <th class="tableheading">Special</th>
          <th class="tableheading">Status</th>
          <th class="tableheading">Actions</th>
      </tr>
      </thead>
      <tbody>
      <tr>
        <td class="Row">001</td>
        <td class="Row">Dr.John Doe</td>
        <td class="Row">Dermatologists</td>
        <td class="Row">Active</td>
        <td>
          <ul class="actions">
              <li><a href="#"><button class="btn"><i class="fa fa-eye"></i></button></a></li>
              <li><a href="#"><button class="btn"><i class="fa fa-edit"></i></button></a></li>
              <li><a href="#"><button class="btn"><i class="fa fa-trash"></i></button></a></li>
          </ul>
        </td>
      </tr>
      <tr>
        <td class="Row">002</td>
        <td class="Row">Dr.James Potter</td>
        <td class="Row">Cardiologists</td>
        <td class="Row">Pending</td>
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
       <td class="Row">Gastroenterologists</td>
       <td class="Row">Inactive</td>
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
      <td class="Row">Endocrinologists</td>
      <td class="Row">Blacklisted</td>
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
</html>
