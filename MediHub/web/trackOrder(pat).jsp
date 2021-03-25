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



<!doctype html>
<html>
<head>
  <meta charset=utf-8>
  <title>MediHub</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@500&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Spartan:wght@600&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
  
  <script language="JavaScript" type="text/javascript" src="./public/js/Track_Order(pat).js"></script>
  <link rel="stylesheet" type="text/css" href="./public/css/modal.css" media="screen" />
  <link rel="stylesheet" type="text/css" href="./public/css/Track_Order(phar).css" media="screen"/>
  <link rel="stylesheet" type="text/css" href="./public/css/new_dash.css" media="screen" />
</head>
<body>
  <div class="container">  
           <jsp:include page="./public/includes/navbar.jsp"/>
           <main>
     
   <% String username="";
       username= session.getAttribute("username").toString();
  
   
  %>
   
     <div class="main_container">
    
     <form class="" action="TrackOrders" method="GET" id="submitForm">
                            <input type="hidden" name="search" value="1"/>
                            <div class="main_cards">
                                
                                 <div class="card">
                                      <i class="fa fa-plus-square fa-2x text-red"></i>
                                      <div class="card_inner_profile">
                                           <p class="text-primary-p">Pharmacy Name</p>
                                           <select class="text-secondary-p doctor_select" style="width: 100%" name="pharmacy" id="pharmacy">
                                               <option value="" disabled>Search Pharmacy</option>
                                           </select>
                                      </div>
                                 </div>
                                
                                <div class="card">
                                      <i class="fa fa-tachometer fa-2x text-green"></i>
                                      <div class="card_inner_profile">
                                           <p class="text-primary-p">Order Status</p>
                                           <select class="text-secondary-p status_select" style="width: 100%" name="status" id="ostatus">
                                               <option value="" disabled>Search Order Status</option>
                                               <option value="Pending">Pending</option>
                                               <option value="Delayed">Delayed</option>
                                               <option value="Cancelled">Cancelled</option>
                                               <option value ="Completed">Completed</option>
                                               
                                           </select>
                                      </div>
                                 </div>
                               <div class=""></div>
                                <div class=""></div>
                                <div class="buttons">
                                   <button class="button" type="reset" id="clear"><b>Reset</b></button>
                                   <button class="button-success" type="submit"><b>Search</b></button>     
                                 </div>
                            </div>
 </form>
  <br>
  <div></div>
<center>
    <%
                  
       ArrayList array = new ArrayList();
       ArrayList a2 = new ArrayList();
       int size = 0;
       
       if(request.getAttribute("orders")!=null){
           array=(ArrayList)request.getAttribute("orders");
            size= array.size();
    %>
     <script>
                var id = [];
                var pharmacyId = [];
                var pharmacyName= [];
                var datetime = [];
                var orderStatus = [];
                var filepath= [];
                var description = [];
                var absolutepath = [];
                var finalId;
  </script>
  <div class="charts_left">
      <div class="charts_left_title">
          <div>
               <h1>Order Details</h1>
                                                
            </div>
       </div>
      
  <div class="charts_table_div" style="clear:both;">
    <table  class="display charts_table">
      <thead>
      <tr>
        <th class="tableheading">Order ID</th>
        <th class="tableheading">Pharmacy ID</th>
        <th class="tableheading">Pharmacy Name</th>
        <th class="tableheading">Delivery Date</th>
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
              <li><a><button class="btn" onclick="confirmdelete('<%=i%>');"><i class="fa fa-trash"></i></button></a></li> 
          </ul>  
        </td>
        <script>
                            id[<%=i%>]                   ="<%=a2.get(0)%>"; 
                            pharmacyId[<%=i%>]           ="<%=a2.get(1)%>"; 
                            pharmacyName[<%=i%>]         ="<%=a2.get(2)%>";
                            datetime[<%=i%>]             ="<%=a2.get(3)%>";
                            orderStatus[<%=i%>]               ="<%=a2.get(4)%>";
                            filepath[<%=i%>]             ="<%=a2.get(5)%>";
                            description[<%=i%>]          ="<%=a2.get(6)%>"; 
                            absolutepath[<%=i%>]          ="<%=a2.get(7)%>"; 
          </script>
      </tr>
       <%}%>
       <tr>

      </tbody>
    </table>
      </div>
    <%
                                                       }
                                                       else
                                                       {
                                                  %>
                                                  <div>
                                                      No order information
                                                         
                                                  </div>
                                                  <%
                                                       }
                                                  %>
</center>
 <br>
  <div id="modalBox" class="modal">

            <!-- Modal content -->
            <div id="printPart" class="modal-content">
                <span class="close">&times;  &nbsp;&nbsp;</span>
                <h3 style="text-align: center;">Order Details</h3>
                <center>
                <table style="border:none; text-align: left;">

                    <tr>
                        <td> Order ID : </td>
                        <td id="modal_id"> ** </td>
                        <td> Delivery Date / Time : </td>
                        <td id="modal_date_time"> ** </td>
                    </tr>

                    <tr>
                        <td> Pharmacy ID : </td>
                        <td id="modal_pharmacyId"> ** </td>
                        <td> Pharmacy Name : </td>
                        <td id="modal_pharmacyName"> ** </td>
                    </tr>

                    <tr>
                        <td> Order Status : </td>
                        <td id="modal_orderStatus"> ** </td>
                        <td> Patient Order Description : </td>
                        <td id="modal_description"> ** </td>
                        
                    </tr>

                   <tr>
                        <td colspan="2" ><button class="style"> <a href="#" id="displayPrescription" onclick="displayPrescriptionFun();" target="_blank">Click to View Prescription</a> </button></td> 
                        <td colspan="2" ><button class="style"><a href="#" id="downloadPrescription" download="#" onclick="downloadPrescriptionFun();" target="_blank">Click to Download Prescription</a></button></td>

                    
                    </tr>

                   
                    <tr>
                        <td colspan="4" style="text-align: center;"><tt>THIS IS A DIGITAL COPY</tt></td>
                    </tr>
                    <tr>
                        <td colspan="4" style="text-align: center;"><tt>* # M E D H U B # *</tt></td>
                    </tr>
                    <tr>
                        <td colspan="4" style="text-align: center;"><button id="print" class="btn"><i class="fa fa-envelope"> Print </i></button>
                        </td>
                    </tr>

                </table></center>

            </div>
            
             </div>
   

   </main>
           <jsp:include page="./public/includes/patientSidebar.jsp"/>
        </div>
     </body>


<script>
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
         finalId =index; 
        document.getElementById("modal_id").innerHTML = id[index];
        document.getElementById("modal_pharmacyId").innerHTML = pharmacyId[index];
        document.getElementById("modal_pharmacyName").innerHTML = pharmacyName[index];
        document.getElementById("modal_date_time").innerHTML = datetime[index];
        document.getElementById("modal_description").innerHTML = description[index];
        document.getElementById("modal_orderStatus").innerHTML = orderStatus[index];
        document.getElementById("modal_filePath").innerHTML = filepath[index];
        

    }
        function displayPrescriptionFun(){
            document.getElementById("displayPrescription").href = "public/storage/pres/"+absolutepath[finalId];
       
     
    
    }
        function downloadPrescriptionFun(){
        
            document.getElementById("downloadPrescription").download = filepath[finalId];;
        
    
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
        
        var del = confirm("Are you sure you want delete this order permenently ?");
        
       
       
        if (del == true){
            if((orderStatus[index]==="Completed")||(orderStatus[index]==="Cancelled")){
            var orderId = index+1;
            window.location.href="deletepatientorder?orderid="+orderId;
       
        }
        else{
            alert("You cannot delete an order which is not completed nor cancelled.")
        }
        

    }}

   </script>
</html>
