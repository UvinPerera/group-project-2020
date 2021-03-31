<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.medihub.doctor.*"%>
<%@page import="com.medihub.payment.*"%>

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
               username= session.getAttribute("username").toString();
               float paymentVal=0.0F;
          %>

          <div class="container">
              <!--######################-->
                 <!--navbar starting-->
              <!--######################-->
              
              <jsp:include page="./public/includes/navbar.jsp"/>
              
              <!--######################-->
                 <!--navbar ending-->
              <!--######################-->

               <main>
                    <!-- the content tag anything to do with the dashboard -->
                    
                    <!--######################-->
                        <!--container starting-->
                     <!--######################-->
                    <div class="main_container">

                         <div class="main_title">
                             <!--<img src="./public/images/p3.jpg" alt="hello">-->
                              <div class="main_greeting">
                                   <h1>Hello <%=username%></h1>
                                   <p>Channelling Confirmation</p>
                              </div>
                         </div>
                        
                        <%
                    if(request.getAttribute("doctorAvalability")!=null){
                        DoctorAvailability da = (DoctorAvailability)request.getAttribute("doctorAvalability");
                    %>
                    
                    <form id="payementForm" action="submitchannelling" method="post">
                        <input type="hidden" name="id" value="<%= da.id%>"/>

                         <!-- change the main cards css fragments to change number of cards Available -->
                         <div class="main_cards">

                              <div class=""></div>
                              
                              <div class="card">
                                   <div class="card_inner_profile">
                                        <p class="text-primary-p">Hospital</p>
                                        <p class="text-secondary-p"><%=da.hospitalName %></p>
                                   </div>
                              </div>

                              <div class="card">
                                   <div class="card_inner_profile">
                                        <p class="text-primary-p">Doctor</p>
                                        <p class="text-secondary-p"><%= da.doctorName %></p>
                                   </div>
                              </div>
                                   
                              <div class=""></div>
                              <div class=""></div>

                              <div class="card">
                                   <div class="card_inner_profile">
                                        <p class="text-primary-p">Date</p>
                                        <p class="text-secondary-p"><%= da.date %></p>
                                   </div>
                              </div>

                              <div class="card">
                                   <div class="card_inner_profile">
                                        <p class="text-primary-p">Time</p>
                                        <p class="text-secondary-p"><%= da.startTime %></p>
                                   </div>
                              </div>

                              <div class=""></div>
                              <div class=""></div>
                               
                              <div class="card">
                                   <div class="card_inner_profile">
                                        <p class="text-primary-p">#Appointment</p>
                                        <p class="text-secondary-p"><%=da.count+1 %></p>
                                        <div class="alert-danger" id="appointmentAlert">
                                            * Subject to change if delayed
                                        </div>
                                   </div>
                              </div>
                             
                              <% // if(request.getAttribute("check")!=null){ %>
                              <div class="card">
                                   <div class="card_inner_profile">
                                        <p class="text-primary-p">Patient Name</p>
                                        <p class="text-secondary-p"><input type="text" name="description" id="description" class="selectpatient" required="required"/></p>
                                   </div>
                              </div>
                              <% // } %>
                              
                              <div class=""></div>
                              <div class=""></div>

                              <div class="card">
                                        <div class="card_inner_profile">
                                             <p class="text-primary-p">Payment Method</p>
                                             <p class="text-secondary-p">
                                                 <select name='payment_method' id="payment_method" class="selectpayment" required="required">
                                                     <option disabled="disabled" value='' selected>Select Payment</option>
                                                         <%
                                                             if(request.getAttribute("payments")!=null){
                                                                 List<Payment> table = (ArrayList<Payment>)request.getAttribute("payments");
                                                                 if(table.size()>0){
                                                                     for(Payment row : table) { %>
                                                                         <option value='<%= row.id %>'><%= row.name %></option>
                                                         <%
                                                             }}}
                                                             else
                                                             {
                                                         %>
                                                         <option value='1' selected>Cash</option>
                                                         <% } %>
                                                 </select>
                                             </p>
                                        </div>
                                   </div>
                                                 <input type="hidden" id="captureId" name="captureId" value="">
                                                 <input type="hidden" id="payerId" name="payerId" value="">
                                                 <input type="hidden" id="transactionId" name="transactionId" value="">
                                                 <input type="hidden" id="price" name="price" value="<%= da.payment %>">
                                                 
                                    <div class="buttons" style="align-self:center;margin: auto;display: block;">
                                       <button class="button" type="reset" id="clear"><b>Reset</b></button>
                                       <button id="button_submit" class="button-success" type="submit"><b>Accept</b></button>     
                                        <div id="paypal-button-container"></div>
                                    </div>

                                    <div class=""></div>
                              
                              </div>
                                            
                    </form>
                         
                        <% paymentVal=da.payment;} else { %>
                            <div class="alert-danger" id="appointmentAlert">
                                Channelling cannot be proceeded !
                            </div>
                            
                        <% } %>
                        
                    </div>

               </main>

                <!--######################-->
                <!--sidebar starting-->
                <!--######################-->
               
                <jsp:include page="./public/includes/patientSidebar.jsp"/>
                
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
          
     </body>
     <script
    src="https://www.paypal.com/sdk/js?client-id=ASEtIC54L4jyZBnDG75kWu0ZUkk6UJ05fyG2fFq5Bb6eYx_u2D8k0TLnCDNcSykA3-M7tig2qbJTp-GQ&disable-funding=card"> // Required. Replace YOUR_CLIENT_ID with your sandbox client ID.
  </script>
  <script>
      var payerId;
      var transactionId;
      var captureId;
   paypal.Buttons({
    createOrder: function(data, actions) {
      // This function sets up the details of the transaction, including the amount and line item details.
      return actions.order.create({
        purchase_units: [{
          amount: {
            value: '<%=paymentVal%>'
          }
        }]
      });
    },
    onApprove: function(data, actions) {
      // This function captures the funds from the transaction.
      return actions.order.capture().then(function(details) {
        // This function shows a transaction success message to your buyer.
        //alert('Transaction completed by ' + details.payer.name.given_name);
        payerId = details.payer.payer_id;
        transactionId = details.purchase_units[0].reference_id;
        captureId = details.purchase_units[0].payments.captures[0].id;
        //alert('Payer ID:'+payerId);
        //alert('Capture Id'+captureId);
        
        $("#payerId").val(payerId);
        $("#transactionId").val(transactionId);
        $("#captureId").val(captureId);
        
        $("#payementForm").submit();
        
      });
    }
  }).render('#paypal-button-container');
    $("#paypal-button-container").hide();
    // This function displays Smart Payment Buttons on your web page.
  </script>
     <script>
         $("#payment_method").change(function(){
             if($(this).val()==4){
             $("#button_submit").hide();
             $("#paypal-button-container").show();
         }
         
         else{
             
             $("#button_submit").show();
             $("#paypal-button-container").hide();
         }
             
         });
         
     </script>
</html>