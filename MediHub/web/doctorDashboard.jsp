<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<!doctype html>
<html>
<head>
  <meta charset=utf-8>
  <title>MediHub</title>
  <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@500&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Spartan:wght@600&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" type="text/css" href="./public/css/Dashboard_Doctor.css" media="screen" />
  <link rel="stylesheet" type="text/css" media="screen" href="./public/css/reminder.css">
    <link rel="stylesheet" type="text/css" media="screen" href="./public/css/form.css">
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
<%ArrayList al = new ArrayList();
       ArrayList a2 = new ArrayList();
       if(request.getAttribute("prescriptions")!=null){
           al=(ArrayList )request.getAttribute("prescriptions");
            
            ;
        }
%>
<%ArrayList a3 = new ArrayList();
       ArrayList a4 = new ArrayList();
       if(request.getAttribute("appointments")!=null){
           a3=(ArrayList )request.getAttribute("appointments");
            
            
        }
%>
  <div class="container">
      <div class="profile">
          <img src="./public/images/p3.jpg" id="profile">
          <h2 style="text-align:center; margin-bottom:25px;"><%=username%></h2><br>
          <div><center>
            <a href="viewdoctor.jsp"class="btn">View Profile</a>
            <br><br><br>
            <a href="editDoctorProfile.jsp" class="btn">Edit Profile</a>
            <br><br><br>
            <a href="" class="btn deactivate">Deactivate</a>
              </center>
          </div>
          
        </div>

        <div class="contentBox">
              <div class="tab">
                <button class="tablinks" onclick="openTab(event, 'Services')" id="defaultOpen">Your Services</button>
                <button class="tablinks" onclick="openTab(event, 'Appointments')">Upcoming Appointments</button>
                <button class="tablinks" onclick="openTab(event, 'Notifications')">Upcoming Notifications</button>
               
        </div>    
        <div id="Services" class="tabcontent">
          <div class="serviceTile">
              <center> <button class="styled" type="button" id="createpres">Create Prescription</button></center>
          
          </div>
            <div class="serviceTile">
                <center><button class="styled" type="button" id="medicationreminder">Set Medication Reminder</button></center>
          
          </div>
        </div>
            <div id="Notifications" class="tabcontent"> There are no upcoming Notifications yet..</div>
            <div id="Appointments" class="tabcontent"> <!--There are no upcoming appointments yet..-->
              <%for(int i=0;i<a3.size();i++){a4 =(ArrayList ) a3.get(i);%>
              <div class="card">
                
                <table>
                  <thead>
                    <tr>
                      <th>Hospital</th>
                      <th>Date</th>
                      <th>Start Time</th>
                      <th>End Time</th>
                      <th>Max Patients</th>
                      <th>Current Patients</th>
                      <th>Payment</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td><%=a4.get(14)%></td>
                      <td><%=a4.get(3)%></td>
                      <td><%=a4.get(4)%></td>
                      <td><%=a4.get(5)%></td>
                      <td><%=a4.get(6)%></td>
                      <td><%=a4.get(7)%></td>
                      <td><%=a4.get(8)%></td>
                    </tr>
                  </tbody>
                </table>
              </div>
              <%}%>
            </div>
      </div>
  </div>
          <div id="medicationReminder" class="modal">

        <div class="modal-content">
            <div class="modal-header">
                <span class="close">&times;</span>
               
                   <h3>Add Medication Reminder</h3>
               
            </div>

            <div class="modal-body">
                <form action="doctor" method="POST">
                    <label>Prescription ID: </label>
                    <select class="input option" name="pid">
                        <option disabled="disabled" selected="selected">--Choose Option--</option>
                        <%for(int i=0;i<al.size();i++){a2 =(ArrayList ) al.get(i);%>
                        <option value="<%=a2.get(0)%>">Prescription ID:<%=a2.get(0)%></option>
                        
                        <%}%>
                    </select>
                <br>
                <br>
                    <label>Duration: </label>
                    <input type="number" class="input duration" placeholder="Enter duration" name="duration">
                    <br><br>
                    <label>Through SMS: </label>
                    <input type="checkbox" class="tsms" name="sms">
                    <br><br>
                    <label>Through Email: </label>
                    <input type="checkbox" class="temail" name="email">
                    <br><br>
                    <label>Description: </label>
                    <br><br>
                    <textarea class="description" placeholder="Enter description to be displayed to the patient" name="desc"></textarea>
                    <button class="button" type="submit">Add Prescription</button>
                    
                </form>

            </div>
        </div>

        </div>
        <div id="createPres" class="modal">

          <div class="modal-content" style="width: 80%">
              <div class="modal-header">
                  <span class="close">&times;</span>
                 
                     <h3>Create Prescription</h3>
                 
              </div>
  
              <div class="modal-body">
                  <form>
                      <label>Patient Number: </label>
                      <select class="input option" name="pid">
                          <option disabled="disabled" selected="selected">--Choose Option--</option>
                          <%for(int i=0;i<al.size();i++){a2 =(ArrayList ) al.get(i);%>
                          <option value="<%=a2.get(0)%>"><%=a2.get(0)%></option>
                          
                          <%}%>
                      </select>
                  <br>
                  <br>
                  <br>
                  <div class="card" id="presitems">
                    <div class="cardhead">
                      <h4>Prescription Items</h4>
                    </div>
                    <div class="cardbody">
                      <div style="display:inline ;width: fit-content;height: fit-content;margin-right: 20px;">
                        <label>Generic Name: </label>
                        <input type="text" class="input duration" placeholder="Enter generic name" name="duration">
                      </div>
                      <div style="display: inline;">
                        <label>Dosage: </label>
                        <input type="number" class="input duration" placeholder="Dosage in Days" name="duration">
                      </div>  
                    </div>
                  </div>
                  <div id="moreitems">

                  </div>
                  
  
              </div>
              <div style="width: 100%;padding: 10px 10px; align-items: center;justify-content: center;">
                <button class="button" id="additems" type="button">Add Prescription Items</button>
                <button class="button" type="submit">Submit Prescription</button>
              </div>
            </form>
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

<script>
    var modal = document.getElementById("medicationReminder");
    var btn = document.getElementById("medicationreminder");
    var span = document.getElementsByClassName("close")[0];
    btn.onclick = function () {
        modal.style.display = "block";
    }

    span.onclick = function () {
        modal.style.display = "none";
    }

    window.onclick = function (event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }
</script>

<script>
  var modal1 = document.getElementById("createPres");
  var btn1 = document.getElementById("createpres");
  var span1 = document.getElementsByClassName("close")[1];
  btn1.onclick = function () {
      modal1.style.display = "block";
  }

  span1.onclick = function () {
      modal1.style.display = "none";
  }

  window.onclick = function (event) {
      if (event.target == modal1) {
          modal1.style.display = "none";
      }
  }
</script>
<script>
  var btn2 = document.getElementById("additems");
  btn2.onclick = function (){
    document.getElementById("moreitems").innerHTML+=`
    <div class="card" id="presitems">
      <div class="cardhead">
        <h4>Prescription Items</h4>
      </div>
      <div class="cardbody">
        <div style="display:inline ;width: fit-content;height: fit-content;margin-right: 20px;">
          <label>Generic Name: </label>
          <input type="text" class="input duration" placeholder="Enter generic name" name="duration">
        </div>
        <div style="display: inline;">
          <label>Dosage: </label>
          <input type="number" class="input duration" placeholder="Dosage in Days" name="duration">
        </div>  
      </div>
    </div>
    `
  }
</script>
