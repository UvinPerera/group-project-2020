<%@page import="java.util.ArrayList"%>
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
    <link rel="stylesheet" type="text/css" href="./public/css/Dashboard_Patient.css" media="screen">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>

<body>
    <div class="navbar" id="navbar">
        <ul>
            <li><button class="style" type="button" onclick="window.location.href='logout';"> LOGOUT</button></li>
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
            <a href="patientview" class="btn">View Profile</a>
            <br><br><br>
            <a href="editpatient" class="btn">Edit Profile</a>
              </center>
          </div>
          
        </div>
          
          <div class="contentBox">
              <div class="tab">
                <button class="tablinks" onclick="openTab(event, 'Services')" id="defaultOpen">Your Services</button>
                <button class="tablinks" onclick="openTab(event, 'Appointments')">Upcoming Appointments</button>
               
              </div>
              
               
        <div id="Services" class="tabcontent">
          <div class="serviceTile">
              <center> <button class="styled" type="button" onclick="window.location.href='channelling';">E-Channeling</button></center>
          
          </div>
            <div class="serviceTile">
              <center><button class="styled" type="button" onclick="window.location.href='trackOrder(pat).jsp'">Orders</button></center>
          
          </div>
            
          <div class="serviceTile">
              <center> <button class="styled" type="button" onclick="window.location.href='medicalRecords.jsp'">Medical Records</button></center>
          
          </div>
            <div class="serviceTile">
              <center> <button class="styled" type="button">Service Review</button></center>
          
          </div>
          
        </div>

        <div id="Appointments" class="tabcontent">
            
            <!--pending appointments starts-->
            <!--checking for availability-->
            <%
                if(request.getAttribute("appointments")!=null){
                    List<Channelling> table = (ArrayList<Channelling>)request.getAttribute("appointments");
                    if(table.size()>0){
            %>
            <!--js array-->
            <script>
                var id = [];
                var hospital = [];
                var doctor = [];
                var appointmentNo = [];
                var date = [];
                var time = [];
                var description = [];
                var paymentMethod = [];
                var paymentAmount = [];
                var paidAmount = [];
                var paymentDescription = [];
                var paymentStatus = [];
                var size =<%= table.size() %>;
            </script>
            <!--js array end-->
            
            <div class="appointment">
                <table class="table-hub table-hub-appoint">
                    <thead>
                        <tr>
                            <th class="table-hub-owner">Appointment No</th>
                            <th class="table-hub-owner">Hospital</th>
                            <th class="table-hub-owner">Doctor</th>                            
                            <th class="table-hub-owner">Date</th>
                            <th class="table-hub-owner">Time</th>
                            <th class="table-hub-owner">Action</th>
                            <!--<th class="table-hub-time-head">Time</th>-->
                        </tr>
                    </thead>
                    <tbody>
                        <!--<tr>
                            <td>000</td>
                            <td>demo hos</td>
                            <td>demo doc</td>
                            <td>000</td>
                            <td>01-01-2020</td>
                            <td>00:00</td>
                            <td>demo description</td>
                            <td>demo action</td>
                        </tr>-->
                        <% for(Channelling row : table) { %>
                        <tr>
                            <td class="table-hub-owner"><%= row.appointmentNo %></td>
                            <td class="table-hub-owner"><%= row.hospital %> </td>
                            <td class="table-hub-owner"><%= row.doctor %> </td>
                            <td class="table-hub-owner"><%= row.date %> </td>
                            <td class="table-hub-owner"><%= row.start_time %> </td>
                            <td>
                                <ul class="actions">
                                    <li><button id="popUp" class="btn" onclick="popup('<%= table.indexOf(row) %>');"
                                                index="<%= table.indexOf(row) %>"><center><i class="fa fa-eye"></i></<center></button></li>
                                    <!--<li><button class="btn"><i class="fa fa-reply"></i></button></li>-->
                                </ul>
                            </td>
                        </tr>

                        <script>
                            id[<%= table.indexOf(row) %>]                   =<%= row.getId() %>;
                            hospital[<%= table.indexOf(row) %>]             ="<%= row.hospital %>";
                            doctor[<%= table.indexOf(row) %>]               ="<%= row.doctor %>";
                            appointmentNo[<%= table.indexOf(row) %>]        =<%= row.appointmentNo %>;
                            date[<%= table.indexOf(row) %>]                 ="<%= row.date %>";
                            time[<%= table.indexOf(row) %>]                 ="<%= row.start_time %>";
                            description[<%= table.indexOf(row) %>]          ="<%= row.description %>";
                            paymentMethod[<%= table.indexOf(row) %>]        ="<%= row.payment_method %>";
                            paymentAmount[<%= table.indexOf(row) %>]        =<%= row.payment_amount %>;
                            paidAmount[<%= table.indexOf(row) %>]           =<%= row.paid_amount %>;
                            paymentDescription[<%= table.indexOf(row) %>]   ="<%= row.payment_description %>";
                            paymentStatus[<%= table.indexOf(row) %>]        =<%= row.payment_status %>;        
                        </script>


                        <%}%> 
                    </tbody>
                </table>
            </div>
                     
                    
<!--            when there is no pending appointments-->
            <%
                }
                else
                {%>
                        <div class="tablecont">
                            <table class="table-hub table-hub-appoint">
                                <thead>
                                    <tr>
                                        <!--                                <th class="table-hub-owner">Channelling ID</th>
                                <th class="table-hub-owner">Hospital</th>
                                <th class="table-hub-owner">Doctor</th>
                                <th class="table-hub-owner">Appointment No</th>
                                <th class="table-hub-owner">Date</th>
                                <th class="table-hub-owner">Time</th>
                                <th class="table-hub-owner">Description</th>
                                <th class="table-hub-owner">Action</th>-->
                                        <th class="table-hub-time-head">Pending Appointments</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>No Channeling data Available</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <%}}
            %>

                        <!--pending appointments ends-->

            </div>
        </div>

        <!-- Modal starts -->
        <div id="modalBox" class="modal">

            <!-- Modal content -->
            <div id="printPart" class="modal-content">
                <span class="close">&times;</span>
                <h3 style="text-align: center;">Appointment Details</h3>
                <table style="border:none; text-align: left;">

                    <tr>
                        <td> Channelling ID : </td>
                        <td id="modal_id"> ** </td>
                        <td> Date / Time : </td>
                        <td id="modal_date_time"> ** </td>
                    </tr>

                    <tr>
                        <td> Hospital : </td>
                        <td id="modal_hospital"> ** </td>
                        <td> Description : </td>
                        <td id="modal_description"> ** </td>
                    </tr>

                    <tr>
                        <td> Doctor : </td>
                        <td id="modal_doctor"> ** </td>
                        <td> Appointment No : </td>
                        <td id="modal_appointmet_no"> ** </td>
                    </tr>

                    <tr>
                        <td> Payment Method : </td>
                        <td id="modal_Payment_method"> ** </td>
                        <td> Payment Amount : </td>
                        <td id="modal_payment_amount"> ** </td>
                    </tr>

                    <tr>
                        <td> Payment Description : </td>
                        <td id="modal_payment_description"> ** </td>
                        <td> Payment Status : </td>
                        <td id="modal_payment_status"> ** </td>
                    </tr>

                    <tr>
                        <td colspan="4" style="text-align: center;"><tt>THIS IS A DIGITAL COPY</tt></td>
                    </tr>
                    <tr>
                        <td colspan="4" style="text-align: center;"><tt>* # M E D H U B # *</tt></td>
                    </tr>
                    <tr>
                        <td colspan="4"><button id="print" class="btn"><i class="fa fa-envelope"> Print </i></button>
                        </td>
                    </tr>

                </table>

            </div>
            <!--Modal content ends-->

        </div>



          
            
            
            
            
            
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
                    MediHub is a mainly a patient portal providing users eaiser access to all medical services.
                    <br>MediHub also
                    provides different doctors, hospitals and pharmacies interact with the patients directly in order to
                    provide
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

    //    #########################
    //    modal script start
    //    #########################

    var modal = document.getElementById("modalBox");

    // Get the button that opens the modal
    var btn = document.getElementById("popUp");

    // Get the <span> element that closes the modal
    var span = document.getElementsByClassName("close")[0];

    //modal print btn
    var print = document.getElementById("print");

    // When the user clicks on the button, open the modal
    //    btn.onclick = function() 
    function popup(indexId) {
        modal.style.display = "block";
        //        var index=btn.getAttribute("index");
        var index = indexId;

        document.getElementById("modal_id").innerHTML = id[index];
        document.getElementById("modal_date_time").innerHTML = date[index] + " " + time[index];
        document.getElementById("modal_hospital").innerHTML = hospital[index];
        document.getElementById("modal_description").innerHTML = description[index];
        document.getElementById("modal_doctor").innerHTML = doctor[index];
        document.getElementById("modal_appointmet_no").innerHTML = appointmentNo[index];
        document.getElementById("modal_Payment_method").innerHTML = paymentMethod[index];
        document.getElementById("modal_payment_amount").innerHTML = paymentAmount[index];
        document.getElementById("modal_payment_description").innerHTML = paymentDescription[index];

        var status = "";
        var colour = "";

        if (paymentStatus[index] != "") {
            status = "Paid";
            colour = "green";
        }
        else {
            status = "Not Paid";
            colour = "red";
        }
        document.getElementById("modal_payment_status").style.color = colour;
        document.getElementById("modal_payment_status").innerHTML = status;

    }

    // When the user clicks on <span> (x), close the modal
    span.onclick = function () {
        modal.style.display = "none";

        document.getElementById("modal_id").innerHTML = "**";
        document.getElementById("modal_date_time").innerHTML = "**";
        document.getElementById("modal_hospital").innerHTML = "**";
        document.getElementById("modal_description").innerHTML = "**";
        document.getElementById("modal_doctor").innerHTML = "**";
        document.getElementById("modal_appointmet_no").innerHTML = "**";
        document.getElementById("modal_Payment_method").innerHTML = "**";
        document.getElementById("modal_payment_amount").innerHTML = "**";
        document.getElementById("modal_payment_description").innerHTML = "**";
        document.getElementById("modal_payment_status").innerHTML = "**";


    }

    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function (event) {
        if (event.target == modal) {
            modal.style.display = "none";

            document.getElementById("modal_id").innerHTML = "**";
            document.getElementById("modal_date_time").innerHTML = "**";
            document.getElementById("modal_hospital").innerHTML = "**";
            document.getElementById("modal_description").innerHTML = "**";
            document.getElementById("modal_doctor").innerHTML = "**";
            document.getElementById("modal_appointmet_no").innerHTML = "**";
            document.getElementById("modal_Payment_method").innerHTML = "**";
            document.getElementById("modal_payment_amount").innerHTML = "**";
            document.getElementById("modal_payment_description").innerHTML = "**";
            document.getElementById("modal_payment_status").innerHTML = "**";
        }
    }

    //when printing
    print.onclick = function () {
        print.style.display = "none";
        var win = window.open();
        var printContent = $("#printPart").html();

        $(win.document.body).html(printContent);
        win.print();
        print.style.display = "block";
    }

//    #########################
//    modal script end
//    #########################





</script>