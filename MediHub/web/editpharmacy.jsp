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
        <li><button class="styled" type="button" onclick="window.location.href='logout';"> LOGOUT </button></li>
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
      <div class="uploadPopup" id="PopUp">
       <span class="close">&times;</span>
       <center>
       <svg version="1.1" class="fill" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 419.2 419.2" style="enable-background:new 0 0 419.2 419.2;" xml:space="preserve"> <g> <g> <g> <circle cx="158" cy="144.4" r="28.8"/> <path d="M394.4,250.4c-13.6-12.8-30.8-21.2-49.6-23.6V80.4c0-15.6-6.4-29.6-16.4-40C318,30,304,24,288.4,24h-232 c-15.6,0-29.6,6.4-40,16.4C6,50.8,0,64.8,0,80.4v184.4V282v37.2c0,15.6,6.4,29.6,16.4,40c10.4,10.4,24.4,16.4,40,16.4h224.4 c14.8,12,33.2,19.6,53.6,19.6c23.6,0,44.8-9.6,60-24.8c15.2-15.2,24.8-36.4,24.8-60C419.2,286.8,409.6,265.6,394.4,250.4z M21.2,80.4c0-9.6,4-18.4,10.4-24.4c6.4-6.4,15.2-10.4,24.8-10.4h232c9.6,0,18.4,4,24.8,10.4c6.4,6.4,10.4,15.2,10.4,24.8v124.8 l-59.2-59.2c-4-4-10.8-4.4-15.2,0L160,236l-60.4-60.8c-4-4-10.8-4.4-15.2,0l-63.2,64V80.4z M56,355.2v-0.8 c-9.6,0-18.4-4-24.8-10.4c-6-6.4-10-15.2-10-24.8V282v-12.4L92,198.4l60.4,60.4c4,4,10.8,4,15.2,0l89.2-89.6l58.4,58.8 c-1.2,0.4-2.4,0.8-3.6,1.2c-1.6,0.4-3.2,0.8-5.2,1.6c-1.6,0.4-3.2,1.2-4.8,1.6c-1.2,0.4-2,0.8-3.2,1.6c-1.6,0.8-2.8,1.2-4,2 c-2,1.2-4,2.4-6,3.6c-1.2,0.8-2,1.2-3.2,2c-0.8,0.4-1.2,0.8-2,1.2c-3.6,2.4-6.8,5.2-9.6,8.4c-15.2,15.2-24.8,36.4-24.8,60 c0,6,0.8,11.6,2,17.6c0.4,1.6,0.8,2.8,1.2,4.4c1.2,4,2.4,8,4,12v0.4c1.6,3.2,3.2,6.8,5.2,9.6H56z M378.8,355.2 c-11.6,11.6-27.2,18.4-44.8,18.4c-16.8,0-32.4-6.8-43.6-17.6c-1.6-1.6-3.2-3.6-4.8-5.2c-1.2-1.2-2.4-2.8-3.6-4 c-1.6-2-2.8-4.4-4-6.8c-0.8-1.6-1.6-2.8-2.4-4.4c-0.8-2-1.6-4.4-2-6.8c-0.4-1.6-1.2-3.6-1.6-5.2c-0.8-4-1.2-8.4-1.2-12.8 c0-17.6,7.2-33.2,18.4-44.8c11.2-11.6,27.2-18.4,44.8-18.4s33.2,7.2,44.8,18.4c11.6,11.6,18.4,27.2,18.4,44.8 C397.2,328,390,343.6,378.8,355.2z"/> <path d="M341.6,267.6c-0.8-0.8-2-1.6-3.6-2.4c-1.2-0.4-2.4-0.8-3.6-0.8c-0.4,0-0.4,0-0.4,0c-0.4,0-0.4,0-0.4,0 c-1.2,0-2.4,0.4-3.6,0.8c-1.2,0.4-2.4,1.2-3.6,2.4l-24.8,24.8c-4,4-4,10.8,0,15.2c4,4,10.8,4,15.2,0l6.4-6.4v44 c0,6,4.8,10.8,10.8,10.8s10.8-4.8,10.8-10.8v-44l6.4,6.4c4,4,10.8,4,15.2,0c4-4,4-10.8,0-15.2L341.6,267.6z"/> </g> </g> </g> </svg>
       <br><button class="button" id="update">Update Profile Picture</button>
       </center>
                            
   </div>

<div class="contentContainer">
  <div class="profile">
    <img src="./public/images/p3.jpg" id="profile">
    <h2 style="text-align:center; margin-bottom:25px;"><%=a2.get(3)%></h2>
    <button class="button" id="profilePic" onclick="openpopup();"><b>Change Profile Picture</b></button>
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
      <input class="data" type="text" name="address_2" id="address2" placeholder=<%=a2.get(13)%>>
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
      <input class="data" type="text" name="email" id="pemail" placeholder=<%=a4.get(9)%>>
    </div>

    <div class="record">
      <div class="label">Pharmacy Address o1</div>
      <input class="data" type="text" name="address_1" id="paddress_1" placeholder=<%=a4.get(10)%>>
    </div>

    <div class="record">
      <div class="label">Pharmacy Address o2</div>
      <input class="data" type="text" name="address_2" id="paddress_2" placeholder=<%=a4.get(11)%>>
    </div>

    <div class="record">
      <div class="label">City</div>
      <input class="data" type="text" name="city" id="pcity" placeholder=<%=a4.get(12)%>>
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
      </body>
      <script>
          var popup = document.getElementById("PopUp");
        var span = document.getElementsByClassName("close")[0];
        
        span.onclick = function () {
        popup.style.display = "none";
    }

    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function (event) {
        if (event.target == popup) {
            popup.style.display = "none";
        }
    }
    function openpopup() {
        popup.style.display = "block";
     
    }
    </script>
          </html>
