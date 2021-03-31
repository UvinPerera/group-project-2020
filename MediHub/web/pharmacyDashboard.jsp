<%-- 
    Document   : pharmacyDashboard
    Created on : Mar 18, 2021, 7:46:33 PM
    Author     : Yash
--%>

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
          <meta name="viewport" content="width=device-width, initial-scale=1.0">
          <title>MediHub</title>
          <link rel="icon" href="./public/images/onlylogo.png" type="image/icon type"> <!--Header icon-->
          <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@500&display=swap" rel="stylesheet">
          <link href="https://fonts.googleapis.com/css2?family=Spartan:wght@600&display=swap" rel="stylesheet">
          <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
          <link rel="stylesheet" type="text/css" href="./public/css/new_dash.css" media="screen" />
          <link rel="stylesheet" type="text/css" href="./public/css/patient_modal.css" media="screen" />
          <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
     </head>

     <body>

          <% 
               String username="";
               String absolutePath ="";
               String completeNo="";
               String pendingNo=""; 
               username= session.getAttribute("username").toString();
               try{
                    absolutePath = request.getAttribute("absolutePath").toString();
                    completeNo = request.getAttribute("noCompleted").toString();
                    pendingNo = request.getAttribute("noPending").toString();
               }
               catch(NullPointerException ex){
                   absolutePath ="";
               }
               
          %>

          <div class="container">
                 <!--start of navbar-->
              
              <jsp:include page="./public/includes/navbar.jsp"/>
             
                 <!--end of navbar-->
            
               <main>
                    <!--start of main container-->
                    
                    <div class="main_container">

                         <div class="main_title">
                               <%if(absolutePath.isEmpty()){%>
                              <img src="./public/images/user.png" alt="hello">
                              <%}else{%>
                              <img src="./public/storage/pp/<%=absolutePath%>" alt="hello">
                              <%}%>
                              <div class="main_greeting">
                                   <h1>Hello <%=username%></h1>
                                   <p>Welcome</p>
                              </div>
                         </div>

                         <!-- change the main cards css fragments to change number of cards Available -->
                         <div class="main_cards">


                              <div class="card">
                                   <i class="fa fa-calendar fa-2x text-red"></i>
                                   <div class="card_inner">
                                        <p class="text-primary-p">Pending Orders</p>
                                        <span class="font-bold text-title"><%=pendingNo%></span>
                                   </div>
                              </div>

                           
                              <div class="card">
                                   <i class="fa fa-bell fa-2x text-green"></i>
                                   <div class="card_inner">
                                        <p class="text-primary-p">Completed Orders</p>
                                        <span class="font-bold text-title"><%=completeNo%></span>
                                   </div>
                              </div>
                             
                             <div class="card">
                                   <i class="fa fa-bell fa-2x text-green"></i>
                                   <div class="card_inner">
                                        <p class="text-primary-p">Notifications</p>
                                        
                                        <span class="font-bold text-title">
                                            <%
                                             if(request.getAttribute("anotifications")!=null || request.getAttribute("pnotifications")!=null){
                                                 out.print(Integer.parseInt(request.getAttribute("anotifications").toString())+Integer.parseInt(request.getAttribute("pnotifications").toString()));
                                             }
                                             else{
                                                 out.print("-");
                                             }%> 
                                            
                                       
                                        </span>
                                   </div>
                              </div>


                         </div>

                         <div class="charts">

                               <div class="charts_left">                                   
                                        <div class="charts_left_title">
                                             <div>
                                                  <h1>Pending Orders</h1>
                                                  
                                             </div>
                                             
                                        </div>
                                   
                                        <!--pending orders starts-->
                                        
                                        <%
                                             if(request.getAttribute("pendingOrders")!=null){
                                                  List<Orders> table = (ArrayList<Orders>)request.getAttribute("pendingOrders");
                                                  if(table.size()>0){
                                        %>
                                        <!--js array-->
                                        <script>
                                             var id = [];
                                             var pharmacyId = [];
                                             var description = [];
                                             var status = [];
                                             var orderStatus = [];
                                             var patientId = [];
                                             var patientFirstName = [];
                                             var patientLastName = [];
                                             var patientAddress1 = [];
                                             var patientAddress2 = [];
                                             var patientMobileNumber = [];
                                             var patientLandNumber = [];
                                             var expectedDeliveryDate = [];
                                             var orderStatus = [];
                                             var size =<%= table.size() %>;
                                        </script>
                                        <!--js array end-->

                                   <!-- limit the results to 5 in db query... view more option will lead to all results -->
                                        <div class="charts_table_div">
                                             <table class="charts_table">
                                                  <thead>
                                                       <tr>
                                                            
                                                            <th>Patient Name</th>
                                                            <th>Order Status</th>
                                                            <th>Expected Delivery Date</th>
                                                            <th>Order Number</th>
                                                            
                                                       </tr>
                                                  </thead>
                                                  <tbody>
                                                       <% 
                                                           int cc = 0;
                                                           for(Orders row : table) { 
                                                                cc++;
                                                                if (cc>10){
                                                                    break;
                                                                }
                                                       %>
                                                       <tr>
                                                            <td><%= row.patientFirstName %> <%= row.patientLastName %></td>
                                                            <td><%= row.orderStatus %></td>
                                                            <td><%= row.expectedDeliveryDate %></td>
                                                            <td><%= row.id %></td>
                                                       </tr>
                                                       
                                                       <script>
                                                            id[<%= table.indexOf(row) %>]                   =<%= row.id %>;                                                            
                                                            patientFirstName[<%= table.indexOf(row) %>]     ="<%= row.patientFirstName %>";
                                                            patientLastName[<%= table.indexOf(row) %>]      ="<%= row.patientLastName %>";
                                                            orderStatus[<%= table.indexOf(row) %>]          ="<%= row.orderStatus %>";
                                                            patientAddress1[<%= table.indexOf(row) %>]      ="<%= row.patientAddress1 %>";
                                                            patientAddress2[<%= table.indexOf(row) %>]      ="<%= row.patientAddress2 %>";
                                                            patientMobileNumber[<%= table.indexOf(row) %>]  ="<%= row.patientMobileNumber %>";
                                                            patientLandNumber[<%= table.indexOf(row) %>]    ="<%= row.patientLandNumber %>";
                                                            expectedDeliveryDate[<%= table.indexOf(row) %>] ="<%= row.expectedDeliveryDate %>";
                                                            description[<%= table.indexOf(row) %>]          ="<%= row.description %>";
                                                                  
                                                        </script>
                                
                                
                                                        <%}%>
                                                        
                                                        <% if(table.size()>10) {%>
                                                        <tr>
                                                            <td colspan="6"><a href="#">View More...</a></td>
                                                        </tr>
                                                        <%}%>
                                                  </tbody>
                                             </table>
                                        </div>
                                              
                                        <!--when there is no pending orders-->
                                                  <%
                                                       }
                                                       else
                                                       {
                                                  %>
                                                  <div class="buttons">
                                                      No pending Orders !
                                                         
                                                  </div>
                                                  <%
                                                       }}
                                                  %>


                             </div>
                             <!--end of left table-->
                             <!--start of right table-->
                             
                              <div class="charts_right">

                                   <div class="charts_right_title">
                                        <div>
                                             <h1>Completed Orders</h1>
                                             
                                        </div>
                                        <!--<i class="fa fa-usd"></i>-->
                                   </div>
                                   <!--pending orders starts-->
                                        
                                        <%
                                            try{
                                             if(request.getAttribute("completedOrders")!=null){
                                                  List<Orders> table = (ArrayList<Orders>)request.getAttribute("completedOrders");
                                                  if(table.size()>0){
                                        %>
                                        <!--js array-->
                                        <script>
                                             var id = [];
                                             var pharmacyId = [];
                                             var description = [];
                                             var status = [];
                                             var orderStatus = [];
                                             var patientId = [];
                                             var patientFirstName = [];
                                             var patientLastName = [];
                                             var patientAddress1 = [];
                                             var patientAddress2 = [];
                                             var patientMobileNumber = [];
                                             var patientLandNumber = [];
                                             var expectedDeliveryDate = [];
                                             var orderStatus = [];
                                             var size =<%= table.size() %>;
                                        </script>
                                        <!--js array end-->

                                   <!-- limit the results to 5 in db query... view more option will lead to all results -->
                                   <div class="charts_table_div">
                                        <table class="charts_table">
                                             <thead>
                                                  <tr>
                                                            <th>Patient Name</th>
                                                            <th>Order Status</th>
                                                            <th>Expected Delivery Date</th>
                                                            <th>Order Number</th>
                                                           
                                                  </tr>
                                             </thead>
                                          <tbody>
                                                       <% 
                                                           int cc = 0;
                                                           for(Orders row : table) { 
                                                                cc++;
                                                                if (cc>10){
                                                                    break;
                                                                }
                                                       %>
                                                       <tr>
                                                            <td><%= row.patientFirstName %> <%= row.patientLastName %></td>
                                                            <td><%= row.orderStatus %></td>
                                                            <td><%= row.expectedDeliveryDate %></td>
                                                            <td><%= row.id %></td>
                                                            
                                                             </tr>
                                                       
                                                       <script>
                                                            id[<%= table.indexOf(row) %>]                   =<%= row.getId() %>;                                                            
                                                            patientFirstName[<%= table.indexOf(row) %>]     ="<%= row.patientFirstName %>";
                                                            patientLastName[<%= table.indexOf(row) %>]      ="<%= row.patientLastName %>";
                                                            orderStatus[<%= table.indexOf(row) %>]          =<%= row.orderStatus %>;
                                                            patientAddress1[<%= table.indexOf(row) %>]      ="<%= row.patientAddress1 %>";
                                                            patientAddress2[<%= table.indexOf(row) %>]      ="<%= row. patientAddress2 %>";
                                                            patientMobileNumber[<%= table.indexOf(row) %>]  ="<%= row.patientMobileNumber %>";
                                                            patientLandNumber[<%= table.indexOf(row) %>]    ="<%= row.patientLandNumber %>";
                                                            expectedDeliveryDate[<%= table.indexOf(row) %>] ="<%= row.expectedDeliveryDate %>";
                                                            description[<%= table.indexOf(row) %>]          ="<%= row.description %>";
                                                                  
                                                        </script>
                                
                                
                                                        <%}%>
                                                        
                                                        
                                                  </tbody>
                                        </table>
                                   </div>
                                                     <%
                                                       }
                                                       else
                                                       {
                                                  %>
                                                  <div class="buttons">
                                                      No completed Orders !
                                                         
                                                  </div>
                                                  <%
                                                       }}}catch(Exception e){e.printStackTrace();}
                                                  %>


                              </div>
                             <!--end of right table-->

                         </div>


                         <!-- Modal starts -->
                         <div id="modalBox" class="modal">

                              <!-- Modal content -->
                              <div id="printPart" class="modal-content">
                                   <span id="modalCloseIcon" class="close">&times;</span>
                                   <h3 style="text-align: center;">Order Details</h3>
                                   <table style="border:none; text-align: left;">

                                        <tr>
                                             <td> Order ID : </td>
                                             <td id="modal_id"> ** </td>
                                             <td> Estimated Delivery Date : </td>
                                             <td id="modal_delivery_date"> ** </td>
                                        </tr>

                                        <tr>
<!--                                             <td> Patient ID : </td>
                                             <td id="modal_patientId"> ** </td>-->
                                             <td> Patient Name : </td>
                                             <td id="modal_patientName"> ** </td>
                                             
                                        </tr>

                                        <tr>
                                             <td> Description : </td>
                                             <td id="modal_description"> ** </td>
                                             <td> Order Status : </td>
                                             <td id="modal_orderStatus"> ** </td>
                                            
                                        </tr>
                                        
                                        <tr>
                                             <td> Patient Address 01 : </td>
                                             <td id="modal_address1"> ** </td>
                                             <td> Patient Address 02 : </td>
                                             <td id="modal_address2"> ** </td>
                                             
                                        </tr>
                                        
                                        <tr>
                                             <td> Patient Mobile Number : </td>
                                             <td id="modal_patientMobileNumber"> ** </td>
                                             <td> Patient Land Number : </td>
                                             <td id="modal_patientLandNumber"> ** </td>
                                             
                                        </tr>

<!--                                        <tr>
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
                                        </tr>-->

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
                         <!--Modal content ends-->

                    </div>
                                                  
                    <!--######################-->
                        <!--container ending-->
                    <!--######################-->

               </main>

                <!--######################-->
                <!--sidebar starting-->
                <!--######################-->
               
                <jsp:include page="./public/includes/pharmacySidebar.jsp"/>
                
                <!--######################-->
                <!--sidebar ending-->
                <!--######################-->
          </div>
            
            <!--######################-->
            <!--footer starting-->
            <!--######################-->                                      
                       
            <jsp:include page="./public/includes/footer.jsp"/>
            
            <!--######################-->
            <!--footer ending-->
            <!--######################-->
            
            
            
          <script src="./public/js/new_script.js"></script>
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
               
               var index = indexId;

               document.getElementById("modal_id").innerHTML = id[index];
               document.getElementById("modal_delivery_date").innerHTML = expectedDeliveryDate[index];
               //document.getElementById("modal_patientId").innerHTML = hospital[index];
               document.getElementById("modal_patientName").innerHTML = patientFirstName[index]+ " " + patientLastName[index];
               document.getElementById("modal_description").innerHTML = description[index];
               document.getElementById("modal_orderStatus").innerHTML = orderStatus[index];
               document.getElementById("modal_address1").innerHTML = patientAddress1[index];
               document.getElementById("modal_address2").innerHTML = patientAddress2[index];
               document.getElementById("modal_patientMobileNumber").innerHTML = patientMobileNumber[index];
               document.getElementById("modal_patientLandNumber").innerHTML = patientLandNumber[index];
           }
               // When the user clicks on <span> (x), close the modal
               span.onclick = function () {
               modal.style.display = "none";

               document.getElementById("modal_id").innerHTML = "**";
               document.getElementById("modal_delivery_date").innerHTML =  "**";//+ " " + time[index];
               //document.getElementById("modal_patientId").innerHTML = hospital[index];
               document.getElementById("modal_patientName").innerHTML = "**";
               document.getElementById("modal_description").innerHTML =  "**";
               document.getElementById("modal_orderStatus").innerHTML =  "**";
               document.getElementById("modal_address1").innerHTML =  "**";
               document.getElementById("modal_address2").innerHTML =  "**";
               document.getElementById("modal_patientMobileNumber").innerHTML =  "**";
               document.getElementById("modal_patientLandNumber").innerHTML =  "**";

               }

               // When the user clicks anywhere outside of the modal, close it
               window.onclick = function (event) {
               if (event.target == modal) {
                    modal.style.display = "none";

                    document.getElementById("modal_id").innerHTML = "**";
                document.getElementById("modal_delivery_date").innerHTML =  "**";//+ " " + time[index];
                //document.getElementById("modal_patientId").innerHTML = hospital[index];
                document.getElementById("modal_patientName").innerHTML = "**";
                document.getElementById("modal_description").innerHTML =  "**";
                document.getElementById("modal_orderStatus").innerHTML =  "**";
                document.getElementById("modal_address1").innerHTML =  "**";
                document.getElementById("modal_address2").innerHTML =  "**";
                document.getElementById("modal_patientMobileNumber").innerHTML =  "**";
                document.getElementById("modal_patientLandNumber").innerHTML =  "**";

               }
               }

               //when printing
               print.onclick = function () {
                   
                    print.style.display = "none";
                    $("#modalCloseIcon").hide();
                    var win = window.open();
                    var printContent = $("#printPart").html();

                    $(win.document.body).html(printContent);
                    win.print();
                    print.style.display = "block";
                    $("#modalCloseIcon").show();
               }

               //    #########################
               //    modal script end
               //    #########################



          </script>

     </body>
</html>