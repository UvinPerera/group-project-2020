<%-- 
    Document   : trackOrder(phar)
    Created on : Nov 30, 2020, 03:50:50 AM
    Author     : Yash
--%>

<%@page import="java.util.ArrayList"%>
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
  <link rel="stylesheet" type="text/css" href="./public/css/Track_Order(phar).css" media="screen"/>
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
  <script language="JavaScript" type="text/javascript" src="./public/js/Track_Order(phar).js"></script>
</head>
<body>
  <div class="navbar" id="navbar">
      <ul>
        <li><button class="style" type="button" onclick="window.location.href='logout';"> Log out </button></li>
        <li><button class="style" type="button" onclick="window.location.href='pharmacy'"> Dashboard </button></li>
         <li><a href="About.jsp" id="end">About</a></li>
      <li><a href="contactUs.jsp">Contact</a></li>
      <li><a href="EmergencyServices.jsp">Emergency Services</a></li>
      <li><a href="/MediHub">Home</a></li>
        <li id="logo"><img src="./public/images/onlylogo.png" width="15.5%"></li>
      </ul>
  </div>
    
   <% String username="";
       username= session.getAttribute("username").toString();
  
       
       ArrayList array = new ArrayList();
       ArrayList a2 = new ArrayList();
       int size = 0;
       
       if(request.getAttribute("orders")!=null){
           array=(ArrayList)request.getAttribute("orders");
            size= array.size();
//            for(int i=0; i<size; i++){
//            a2 =(ArrayList) array.get(i);  
            //}
       //}
        
  %>
  <br><br>
  <h3>Your Orders </h3><hr>
  <div class="Dropdown">
      <center>
    <select name='Dropdown'class="filters">
      <option value='Action' selected><a href="">All</a></option>
      <option value='Action'><a href="#">Pending</a></option>
      <option value='Action'><a href="#">Shipped</a></option>
      <option value='Action'><a href="#">Accepted</a></option>
      <option value='Action'><a href="#">Rejected</a></option>
    </select>
   
   <select name='Dropdown' class="filter_dropdown filters">
      <option value='Action' selected><a href="">All</a></option>
      <option value='Action'><a href="#">Order ID</a></option>
      <option value='Action'><a href="#">Patient ID</a></option>
      <option value='Action'><a href="#">Patient Name</a></option>
      <option value=99><a href="#">Date</a></option>
      <option value='Action'><a href="#">Status</a></option>
   </select>
   <input type="text" class="filter_text textt" placeholder="Filter">
   <input type="date" class="filter_date textt" placeholder="From">
   <input type="date" class="filter_date textt" placeholder="To">
   <a href="#"><button class="btn1"><i class="fa fa-filter"></i></button></a>
   </center>
  </div>
  <br> 
 <script>
                var id = [];
                var patientId = [];
                var patientName= [];
                var datetime = [];
                var orderdescription = [];
                var itemdescription = [];
                var filepath= [];
  
  </script>
  <div class="container-table">
    <table class="table">
      <thead>
      <tr>
        <th class="tableheading">Order ID</th>
        <th class="tableheading">Patient ID</th>
        <th class="tableheading">Patient Name</th>
        <th class="tableheading">Date & Time</th>
        <th class="tableheading">Status</th>
        <th class="tableheading">Actions</th>
      </tr>
      </thead>
      <tbody>
          <%for(int i=0; i<size; i++){
            a2 =(ArrayList) array.get(i);%>
      <tr>
        <td class="Row"><%=a2.get(0)%></td>
        <td class="Row"><%=a2.get(1)%></td>
        <td class="Row"><%=a2.get(2)%></td>
        <td class="Row"><%=a2.get(3)%></td>
        <td class="Row"><%=a2.get(4)%></td>
        <td>
          
          <ul class="actions">
              <li><button  class="btn" onclick="popup('<%=i%>');"><center><i class="fa fa-eye"></i></<center></button></li> 
              <li><a href="editorderupdate?orderid=<%=a2.get(0)%>"><button class="btn"><i class="fa fa-edit"></i></button></a></li> 
              <li><a><button class="btn" onclick="confirmdelete('<%=a2.get(0)%>');"><i class="fa fa-trash"></i></button></a></li> 
          </ul>  
        </td> 
         <script>
                            id[<%=i%>]                   ="<%=a2.get(0)%>"; 
                            patientId[<%=i%>]            ="<%=a2.get(1)%>";
                            patientName[<%=i%>]          ="<%=a2.get(2)%>";
                            datetime[<%=i%>]             ="<%=a2.get(3)%>";
                            orderdescription[<%=i%>]     ="<%=a2.get(4)%>";
                            itemdescription[<%=i%>]      ="<%=a2.get(6)%>"; 
                            filepath[<%=i%>]             ="<%=a2.get(5)%>";
          </script>
      </tr>
       <%}}%>
      <tr>

      </tbody>
    </table>
      </div>
      <!-- Modal starts -->
<center>
        <div id="modalBox" class="modal">

            <!-- Modal content -->
            <div id="printPart" class="modal-content">
                <span class="close">&times;</span>
                <h3 style="text-align: center;">Order Details</h3>
                <table style="border:none; text-align: left;">

                    <tr>
                        <td> Order ID : </td>
                        <td id="modal_id"> ** </td>
                        <td> Date / Time : </td>
                        <td id="modal_date_time"> ** </td>
                    </tr>

                    <tr>
                        <td> Patient ID : </td>
                        <td id="modal_patientId"> ** </td>
                        <td> Patient Name : </td>
                        <td id="modal_patientName"> ** </td>
                    </tr>

                    <tr>
                        <td> Order Description : </td>
                        <td id="modal_orderDescription"> ** </td>
                        <td> Patient Order Description : </td>
                        <td id="modal_itemDescription"> ** </td>
                        
                    </tr>

                    <tr>
                        <td colspan="2"> File Path : </td>
                        <td colspan="2" id="modal_filePath"> ** </td>
                        
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
            
             </div>

</center>
            <!--Modal content ends-->
        
 <br>
 <div><li><button class="style back" type="button" onclick="window.location.href='pharmacyDashboard.jsp';"> < Back to Dashboard </button></li></div>
</body>
<br><br>

</html>
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
        
        var index=indexId;
        
        document.getElementById("modal_id").innerHTML = id[index];
        document.getElementById("modal_patientId").innerHTML = patientId[index];
        document.getElementById("modal_patientName").innerHTML = patientName[index];
        document.getElementById("modal_date_time").innerHTML = datetime[index];
        document.getElementById("modal_orderDescription").innerHTML = orderdescription[index];
        document.getElementById("modal_itemDescription").innerHTML = itemdescription[index];
        document.getElementById("modal_filePath").innerHTML = filepath[index];
        

    }

    // When the user clicks on <span> (x), close the modal
    span.onclick = function () {
        modal.style.display = "none";
    }

    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function (event) {
        if (event.target == modal) {
            modal.style.display = "none";
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
    
        function confirmdelete(index) {
        var orderId=index;
        var del = confirm("Are you sure you want delete this order permenently ?");
        if (del == true){
            window.location.href="deleteorder?orderid="+orderId;
          //$(location).attr('href',reidrect);
        }
        

    }
   </script>
