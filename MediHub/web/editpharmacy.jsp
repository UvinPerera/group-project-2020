<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.medihub.pharmacy.*"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
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
        <li><button class="styled" type="button"> LOGOUT </button></li>
        <li><button class="styled" type="button" onclick="window.location.href='pharmacy'"> Dashboard </button></li>
        <li><a href="About.jsp" id="end">About</a></li>
      <li><a href="contactUs.jsp">Contact</a></li>
      <li><a href="EmergencyServices.jsp">Emergency Services</a></li>
      <li><a href="/MediHub">Home</a></li>
        <li id="logo"><img src="./public/images/onlylogo.png" width="15.5%"></li>
      </ul>
  </div>
    
<%ArrayList al = new ArrayList();
       ArrayList a2 = new ArrayList();
       if(request.getAttribute("details")!=null){
           al=(ArrayList )request.getAttribute("details");
            
            a2 =(ArrayList ) al.get(0);
        }
%>
 <div class="contentContainer">
  <div class="profile">
    <img src="./public/images/p3.jpg" id="profile">
    <h2 style="text-align:center; margin-bottom:25px;"><%=a2.get(3)%></h2>
    <button class="button" id="profilePic"><b>Change Profile Picture</b></button>
  </div>

  <div class="information">
    <h3 style="text-align:center;font-size: 35px;margin-bottom:40px;"> Profile information</h3>

    <div class="record">
      <div class="label">First Name </div>
      <input class="data" type="text" name="first_name" id="firstname" placeholder=<%=a2.get(1)%>>
    </div>

    <div class="record">
      <div class="label">Last Name </div>
      <input class="data" type="text" name="last_name" id="lastname" placeholder=<%=a2.get(2)%>>
    </div>

    <div class="record">
      <div class="label">NIC No</div>
      <input class="data" type="text" name="nic_no" id="nic" placeholder=<%=a2.get(7)%>>
    </div>

    <div class="record">
      <div class="label">Date of Birth</div>
      <input class="data" type="date" name="dob" id="dob" placeholder=<%=a2.get(8)%>>
    </div>

    <div class="record">
      <div class="label">Gender</div>
      <select class="data" name="gender" id="gender"  style=" height: 50px;">
        <option disabled="disabled" selected="selected"><%=a2.get(9).toString().equals("M")?"Male":"Female"%></option>
        <option>Male</option>
        <option>Female</option>
        <option>Not preferred to say</option>
      </select>
    </div>

    <div class="record">
      <div class="label">Email</div>
      <input class="data" type="email" name="email" id="email" placeholder=<%=a2.get(4)%>>
    </div>

    <div class="record">
      <div class="label">Address 1</div>
      <input class="data" type="text" name="address_1" id="address1" placeholder=<%=a2.get(12)%>>
    </div>

    <div class="record">
      <div class="label">Address 2</div>
      <input class="data" type="text" name="address_2" id="address1" placeholder=<%=a2.get(13)%>>
    </div>

    <div class="record">
      <div class="label">City</div>
      <input class="data" type="text" name="city" id="city" placeholder=<%=a2.get(14)%>>
    </div>


    <div class="record">
      <div class="label">Zip Code</div>
      <input class="data" type="text" name="zip_code" id="zip" placeholder="Zip code">
    </div>

    <div class="record">
      <div class="label">Contact Number - Land</div>
      <input class="data" type="text" name="land_line" id="land" placeholder=<%=a2.get(11)%>>
    </div>

    <div class="record">
      <div class="label">Contact Number - Mobile</div>
      <input class="data" type="text" name="mobile" id="mobile" placeholder=<%=a2.get(10)%>>
    </div>
    
<%ArrayList a3 = new ArrayList();
       ArrayList a4 = new ArrayList();
       if(request.getAttribute("details2")!=null){
           a3=(ArrayList )request.getAttribute("details2");
            
            a4 =(ArrayList ) a3.get(0);
        }
%>   
    <h3 style="text-align:center;font-size: 35px;margin-top: 40px;margin-bottom:40px;"> Pharmacy information</h3>

    <div class="record">
      <div class="label">Pharmacy Name</div>
      <input class="data" type="text" name="name" id="pharmacy_name" placeholder=<%=a4.get(1)%>>
    </div>

    <div class="record">
      <div class="label">Pharmacy License Number</div>
      <input class="data" type="text" name="license_number" id="license_number" placeholder=<%=a4.get(2)%>>
    </div>


    <div class="record">
      <div class="label">Pharmacy Land Line</div>
      <input class="data" type="text" name="land_number" id="land_number" placeholder=<%=a4.get(7)%>>
    </div>

    <div class="record">
      <div class="label">Pharmacy Fax</div>
      <input class="data" type="text" name="fax" id="fax" placeholder=<%=a4.get(8)%>>
    </div>

    <div class="record">
      <div class="label">Pharmacy Email</div>
      <input class="data" type="text" name="email" id="email" placeholder=<%=a4.get(9)%>>
    </div>

    <div class="record">
      <div class="label">Pharmacy Address o1</div>
      <input class="data" type="text" name="address_1" id="address_1" placeholder=<%=a4.get(10)%>>
    </div>

    <div class="record">
      <div class="label">Pharmacy Address o2</div>
      <input class="data" type="text" name="address_2" id="address_2" placeholder=<%=a4.get(11)%>>
    </div>

    <div class="record">
      <div class="label">City</div>
      <input class="data" type="text" name="city" id="city" placeholder=<%=a4.get(12)%>>
    </div>

    <div class="record">
      <div class="label">Longitude</div>
      <input class="data" type="text" name="longitude" id="longitude" placeholder=<%=a4.get(13)%>>
    </div>

    <div class="record">
      <div class="label">Latiture</div>
      <input class="data" type="text" name="latitude" id="latitude" placeholder=<%=a4.get(14)%>>
    </div>

    <h3 style="text-align:center;font-size: 35px;margin-top: 40px;margin-bottom:40px;"> Pharmacist information</h3>

    <div class="record">
      <div class="label">Pharmacist ID</div>
      <input class="data" type="text" name="pharmacist_id" id="pharmacist_id" placeholder=<%=a4.get(4)%>>
    </div>
 

    <div class="buttons">
        <br><br>
        <button class="button" id="id" onclick="window.location.href='pharmacyDashboard.jsp';"><b>Cancel</b></button>
        <button class="button" id="id" onclick="window.location.href='pharmacyDashboard.jsp';"><b>Done</b></button>
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
