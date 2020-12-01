
<!doctype html>
<html>
<head>
  <meta charset=utf-8>
  <title>MediHub</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@500&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Spartan:wght@600&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" type="text/css" href="./public/css/editProfile.css" media="screen"/>
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>

</head>
<body>

  <div class="navbar" id="navbar">
      <ul>
        <li><button class="styled" type="button" onclick="window.location.href='logout';"> LOGOUT</button></li>
        <li><button class="styled" type="button" onclick="window.location.href='hospital'"> Dashboard </button></li>
        <li><a href="About.jsp" id="end">About</a></li>
      <li><a href="contactUs.jsp">Contact</a></li>
      <li><a href="EmergencyServices.jsp">Emergency Services</a></li>
      <li><a href="/MediHub">Home</a></li>
        <li id="logo"><img src="./public/images/onlylogo.png" width="15.5%"></li>
      </ul>
  </div>
    

 <div class="contentContainer">
  <div class="profile">
    <img src="./public/images/p3.jpg" id="profile">
    <h2 style="text-align:center; margin-bottom:25px;">City Hospital Admin</h2>
    <button class="button" id="profilePic"><b>Change Profile Picture</b></button>
  </div>

  <div class="information">
    <h3 style="text-align:center;font-size: 35px;margin-bottom:40px;"> Profile information</h3>

    <div class="record">
      <div class="label">First Name </div>
      <input class="data" type="text" name="first_name" id="firstname" placeholder="Aysha">
    </div>

    <div class="record">
      <div class="label">Last Name </div>
      <input class="data" type="text" name="last_name" id="lastname" placeholder="Ifra">
    </div>

    <div class="record">
      <div class="label">NIC No</div>
      <input class="data" type="text" name="nic_no" id="nic" placeholder="994561230V">
    </div>

    <div class="record">
      <div class="label">Date of Birth</div>
      <input class="data" type="date" name="dob" id="dob" placeholder="10-12-1997">
    </div>

    <div class="record">
      <div class="label">Gender</div>
      <select class="data" name="gender" id="gender"  style=" height: 50px;">
        <option disabled="disabled" selected="selected">Female</option>
        <option>Male</option>
        <option>Female</option>
        <option>Not preferred to say</option>
      </select>
    </div>

    <div class="record">
      <div class="label">Email</div>
      <input class="data" type="email" name="email" id="email" placeholder="aysha@hospital.com">
    </div>

    <div class="record">
      <div class="label">Address 1</div>
      <input class="data" type="text" name="address_1" id="address1" placeholder="11">
    </div>

    <div class="record">
      <div class="label">Address 2</div>
      <input class="data" type="text" name="address_2" id="address1" placeholder="Galle Road">
    </div>

    <div class="record">
      <div class="label">City</div>
      <input class="data" type="text" name="city" id="city" placeholder="Galle">
    </div>


    <div class="record">
      <div class="label">Zip Code</div>
      <input class="data" type="text" name="zip_code" id="zip" placeholder="Zip code">
    </div>

    <div class="record">
      <div class="label">Contact Number - Land</div>
      <input class="data" type="text" name="land_line" id="land" placeholder="0331245678">
    </div>

    <div class="record">
      <div class="label">Contact Number - Mobile</div>
      <input class="data" type="text" name="mobile" id="mobile" placeholder="0774561239">
    </div>
    

    <h3 style="text-align:center;font-size: 35px;margin-top: 40px;margin-bottom:40px;"> Hospital information</h3>

    <div class="record">
      <div class="label">Hospital Name</div>
      <input class="data" type="text" name="name" id="pharmacy_name" placeholder="City Hospital">
    </div>

    <div class="record">
      <div class="label">Hospital License Number</div>
      <input class="data" type="text" name="license_number" id="license_number" placeholder="666">
    </div>


    <div class="record">
      <div class="label">Hospital Land Line</div>
      <input class="data" type="text" name="land_number" id="land_number" placeholder="011223344">
    </div>

    <div class="record">
      <div class="label">Hospital Fax</div>
      <input class="data" type="text" name="fax" id="fax" placeholder="011223344">
    </div>

    <div class="record">
      <div class="label">Hospital Email</div>
      <input class="data" type="text" name="email" id="email" placeholder="city@hospital.com">
    </div>

    <div class="record">
      <div class="label">Hospital Address o1</div>
      <input class="data" type="text" name="address_1" id="address_1" placeholder="55">
    </div>

    <div class="record">
      <div class="label">Hospital Address o2</div>
      <input class="data" type="text" name="address_2" id="address_2" placeholder="Galle road">
    </div>

    <div class="record">
      <div class="label">City</div>
      <input class="data" type="text" name="city" id="city" placeholder="Colombo">
    </div>

    
 

    <div class="buttons">
        <br><br>
        <button class="button" id="id" onclick="window.location.href='hospital';"><b>Cancel</b></button>
        <button class="button" id="id" onclick="window.location.href='hospital';"><b>Done</b></button>
     </div>

    </div>
  </div>
  </div>


    <footer style="margin-top: 155%;">
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
