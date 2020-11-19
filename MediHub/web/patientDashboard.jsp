<%@page import="java.util.ArrayList"%>÷
<%@page import="java.util.List"%>
<%@page import="com.medihub.patient.*"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<!doctype html>
<html>
<head>
  <meta charset=utf-8>
  <title>MediHub</title>
  <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@500&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Spartan:wght@600&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" type="text/css" href="./public/css/Dashboard_Patient.css" media="screen" />
</head>
<body>
  <div class="navbar" id="navbar">
    <ul>
      <li><button class="style" type="button" onclick="window.location.href='logout';"> LOGOUT</button></li>
      <li><a href="About.jsp" id="end">About</a></li>
      <li><a href="contactUs.jsp">Contact</a></li>
      <li><a href="EmergencyServices.jsp">Emergency Services</a></li>
      <li><a href="/medihub">Home</a></li>
      <li id="logo"><img src="./public/images/onlylogo.png" width="15.5%"></li>
    </ul>
  </div>
  <div class="welcome">
      <% String username="";
          username= session.getAttribute("username").toString();
       %>
            <h1><center>Hello, <%=username%> <br>WELCOME TO MEDIHUB!</center></h1>
  </div>
  <br><br><br>
  

  <div class="page_divide">
        <section class="profile">
          <div class="card-container">
             <div class="upper-container">
                <div class="image-container">
                  <img src="./public/images/p3.jpg">
                </div>
             </div>
             <div class="lower-container">
                <div>
                   <h5><%=username%></h5>
                </div>
                <br><br>
                <div>
                  <a href="patientview" class="btn">View Profile</a>
                <br><br><br>
                  <a href="#" class="btn">Edit Profile</a>
                </div>
             </div>
          </div>
        </section>
        <div class="tiles">
            <div class="tileset">
                <section class="Service">
                    <button class="styled" type="button">E-Channeling</button>
                </section>
                <section class="Service">
                    <button class="styled" type="button" onclick="window.location.href='trackOrder(pat).jsp'">Orders</button>
                </section>
                <section class="Service">
                    <button class="styled" type="button">Medical Records</button>
                </section>
                <section class="Service">
                  <button class="styled" type="button">Service Review</button>
                </section>
            </div>
            
            <!--pending appointments starts-->
            <!--checking for availability-->
            <%
                
                if(request.getAttribute("appointments")!=null){
                    List<Channelling> table = (ArrayList<Channelling>)request.getAttribute("appointments");
            %>
            <div class="appointment">
                <table class="table-hub table-hub-appoint">
                    <thead>
                        <tr>
                            <th class="table-hub-owner">Channelling ID</th>
                            <th class="table-hub-owner">Hospital</th>
                            <th class="table-hub-owner">Doctor</th>
                            <th class="table-hub-owner">Appointment No</th>
                            <th class="table-hub-owner">Date</th>
                            <th class="table-hub-owner">Time</th>
                            <th class="table-hub-owner">Description</th>
                            <th class="table-hub-owner">Action</th>
                            <!--<th class="table-hub-time-head">Time</th>-->
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>000</td>
                            <td>demo hos</td>
                            <td>demo doc</td>
                            <td>000</td>
                            <td>01-01-2020</td>
                            <td>00:00</td>
                            <td>demo description</td>
                            <td>demo action</td>
                        </tr>
                        <% for(Channelling row : table) { %>
                        <tr>
                            <%
                                
                            %>
                            <td class="table-hub-owner"><%= row.getId() %></td>
                            <td class="table-hub-owner"><%= row.hospital %></td>
                            <td class="table-hub-owner"><%= row.doctor %></td>
                            <td class="table-hub-owner"><%= row.appointmentNo %></td>
                            <td class="table-hub-owner"><%= row.date %></td>
                            <td class="table-hub-owner"><%= row.time %></td>
                            <td class="table-hub-owner"><%= row.description %></td>
                            <td>
                                <ul class="actions">
                                    <li><a href="#"><button class="btn"><i class="fa fa-eye"></i></button></a></li>
                                    <li><a href="#"><button class="btn"><i class="fa fa-reply"></i></button></a></li>
                                </ul>
                            </td>
                        </tr>
                        <%}%> 
                    </tbody>
                </table>
            </div>
                    
<!--            when there is no pending appointments-->
            <%
                }
                else
                {
                    out.write("no datas");
                }
            %>
            
            <!--pending appointments ends-->

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

</html>
