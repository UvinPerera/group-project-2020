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
  <link rel="stylesheet" type="text/css" href="./public/css/Manage_Pharmacy.css" media="screen" />
</head>
<body>
  <div class="navbar" id="navbar">
      <ul>
        <li><button class="styled" type="button" onclick="window.location.href='logout';"> LOGOUT </button></li>
        <li><a href="About.jsp" id="end">About</a></li>
      <li><a href="contactUs.jsp">Contact</a></li>
      <li><a href="EmergencyServices.jsp">Emergency Services</a></li>
      <li><a href="/MediHub">Home</a></li>
        <li id="logo"><img src="./public/images/onlylogo.png" width="15.5%"></li>
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
      <option value='Action'><a href="#">Pharmacy ID</a></option>
      <option value='Action'><a href="#">pharmacy Name</a></option>
      <option value='Action'><a href="#">License No</a></option>
      <option value='Action'><a href="#">City</a></option>
      <option value='Action'><a href="#">Status</a></option>
   </select>
   <input type="text" class="filter_text" placeholder="Filter">
   <a href="#"><button class="btn1"><i class="fa fa-filter"></i></button></a>

   <div class="new">
    <div class="create">
          <a href="createpharmacy" class=""><button class="btn"><i class="fa fa-plus-circle"></i></button></a>
      </div>
      <div class="add-text">
          Add New Pharmacy
      </div>
    </div>

  </div>
  <br>
  <div class="container-table">
    <table class="table">
        
        <!--pending appointments starts-->
            <!--checking for availability-->
            <%
                if(request.getAttribute("pharmacies")!=null){
                    List<Pharmacy> table = (ArrayList<Pharmacy>)request.getAttribute("pharmacies");
                    if(table.size()>0){
            %>
            <!--js array-->
            <script>
                var licenseNumber = [];
                var display_name = [];
                var pharmacist = [];
                var district = [];
                var city = [];
                var pstatus = [];
                
                var size =<%= table.size() %>;
            </script>
        
        
        
      <thead>
      <tr>
        <th class="tableheading">License No</th>
        <th class="tableheading">Pharmacy Name</th>
        <th class="tableheading">Pharmacist</th>
        <th class="tableheading">District</th>
        <th class="tableheading">City</th>
        <th class="tableheading">Status</th>
        <th class="tableheading">Actions</th>
      </tr>
      </thead>
      <tbody>
          
          <% for(Pharmacy row : table) { %>
          
       <tr id="id_<%= table.indexOf(row) %>" value="<%= table.indexOf(row) %>">
        <td class="Row"><%= row.getLicenseNumber() %></td>
        <td class="Row"><%= row.displayName %></td>
        <td class="Row"><%= row.pharmacist %></td>
        <td class="Row"><%= row.districtStr %></td>
        <td class="Row"><%= row.cityStr %></td>
        <td class="Row" style="color: <% if(row.status==1){out.print("green");}else if(row.status==2){out.print("orange");}else if(row.status==3){out.print("red");}else{out.print("brown");} %>"><% if(row.status==1){out.print("Active");}else if(row.status==2){out.print("Pending");}else if(row.status==3){out.print("BlackListed");}else{out.print("Inactive");} %></td>
        <td>
          <ul class="actions">
              <li><button id="popUp" class="btn" onclick="popup('<%= table.indexOf(row) %>');" index="<%= table.indexOf(row) %>"><i class="fa fa-eye"></i></button></li>
              <li><button class="btn"><i class="fa fa-edit"></i></button></li>
              <li><button class="btn"><i class="fa fa-trash"></i></button></li>
          </ul>
        </td>
      </tr>
      
        <script>
            licenseNumber[<%= table.indexOf(row) %>]                     = <%= row.getLicenseNumber() %>;
            display_name[<%= table.indexOf(row) %>]                      = "<%= row.displayName %>";
            pharmacist[<%= table.indexOf(row) %>]                        = "<%= row.pharmacist %>";
            district[<%= table.indexOf(row) %>]                          = "<%= row.districtStr %>";
            city[<%= table.indexOf(row) %>]                              = "<%= row.cityStr %>";
            pstatus[<%= table.indexOf(row) %>]                            = <%= row.status %>;

        </script>
      
        <% } %>
      
      
      </tbody>
    </table>
 </div>
        
        
        <!--            when there is no pharmacies-->
            <%
                }
                else
                { %>
                        <div class="container-table">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th class="tableheading">Pharmacies</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td class="Row">No Pharmacy data Available</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <% }}
            %>

                        <!--pharmacies ends-->
       
                        <!-- Modal starts -->
        <div id="modalBox" class="modal">

            <!-- Modal content -->
            <div id="printPart" class="modal-content">
                <span class="close">&times;</span>
                <h3 style="text-align: center;">Pharmacy Details</h3>
                <table style="border:none; text-align: left;">

                    <tr>
                        <td> License Number : </td>
                        <td id="modal_license_number"> ** </td>
                        <td> Name </td>
                        <td id="modal_name"> ** </td>
                    </tr>

                    <tr>
                        <td> Pharmacist : </td>
                        <td id="modal_pharmacist"> ** </td>
<!--                        <td> Description : </td>
                        <td id="modal_description"> ** </td>-->
                    </tr>

                    <tr>
                        <td> District : </td>
                        <td id="modal_district"> ** </td>
                        <td> City : </td>
                        <td id="modal_city"> ** </td>
                    </tr>

                    <tr>
                        <td> Status : </td>
                        <td id="modal_status"> ** </td>
<!--                        <td> Payment Amount : </td>
                        <td id="modal_payment_amount"> ** </td>-->
                    </tr>


<!--                    <tr>
                        <td colspan="4"><button id="print" class="btn"><i class="fa fa-envelope"> Print </i></button>
                        </td>
                    </tr>-->

                </table>

            </div>
            <!--Modal content ends-->

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

        document.getElementById("modal_license_number").innerHTML = licenseNumber[index];
        document.getElementById("modal_name").innerHTML = display_name[index];
        document.getElementById("modal_pharmacist").innerHTML = pharmacist[index];
        document.getElementById("modal_district").innerHTML = district[index];
        document.getElementById("modal_city").innerHTML = city[index];
//        document.getElementById("modal_status").innerHTML = status[index];

        var status = "";
        var colour = "";

        if (pstatus[index] == 1) {
            status = "Active";
            colour = "green";
        }
        else if (pstatus[index] == 2) {
            status = "Pending";
            colour = "orange";
        }
        else if (pstatus[index] == 3) {
            status = "Blacklisted";
            colour = "red";
        }
        else{
            status = "Inactive";
            colour = "brown";
        }
        document.getElementById("modal_status").style.color = colour;
        document.getElementById("modal_status").innerHTML = status;

    }

    // When the user clicks on <span> (x), close the modal
    span.onclick = function () {
        modal.style.display = "none";

        document.getElementById("modal_license_number").innerHTML = "**";
        document.getElementById("modal_name").innerHTML = "**";
        document.getElementById("modal_pharmacist").innerHTML = "**";
        document.getElementById("modal_district").innerHTML = "**";
        document.getElementById("modal_city").innerHTML = "**";
        document.getElementById("modal_status").innerHTML = "**";


    }

    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function (event) {
        if (event.target == modal) {
            modal.style.display = "none";

        document.getElementById("modal_license_number").innerHTML = "**";
        document.getElementById("modal_name").innerHTML = "**";
        document.getElementById("modal_pharmacist").innerHTML = "**";
        document.getElementById("modal_district").innerHTML = "**";
        document.getElementById("modal_city").innerHTML = "**";
        document.getElementById("modal_status").innerHTML = "**";
        }
    }

    //when printing
//    print.onclick = function () {
//        print.style.display = "none";
//        var win = window.open();
//        var printContent = $("#printPart").html();
//
//        $(win.document.body).html(printContent);
//        win.print();
//        print.style.display = "block";
//    }

//    #########################
//    modal script end
//    #########################


    
    
    
</script>


</html>
