
<%-- 
    Document   : trackOrder(phar)
    Created on : Nov 30, 2020, 03:50:50 AM
    Author     : Yash
--%>
<%@page import="java.util.List"%>
<%@page import="com.medihub.pharmacy.*"%>
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
 
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" type="text/css" href="./public/css/new_dash.css" media="screen" />
  <link rel="stylesheet" type="text/css" href="./public/css/patient_modal.css" media="screen" />
  <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.22/css/jquery.dataTables.css">
  <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/rowgroup/1.1.2/css/rowGroup.dataTables.min.css">
  <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script type="text/javascript" src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.js"></script>
  <script type="text/javascript" src="https://cdn.datatables.net/rowgroup/1.1.2/js/dataTables.rowGroup.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>

  
  <link rel="stylesheet" type="text/css" href="./public/css/new_dash.css" media="screen" />
  
 
</head>
<body>
  <div class="container">  
           <jsp:include page="./public/includes/navbar.jsp"/>
           <main>
   
<%ArrayList al = new ArrayList();
       ArrayList a2 = new ArrayList();
       if(request.getAttribute("orders")!=null){
           al=(ArrayList )request.getAttribute("orders");
            
            a2 =(ArrayList ) al.get(0);
        }
%>
                <h3 style="padding-left: 5%;padding-top:2%;">Update Pharmacy Order</h3>

                <div class="main_container">
                    <form action="updatepatientorder" method="post" enctype="multipart/form-data">
                        <input type="hidden" name="pharmacyId" value="<%=a2.get(8)%>"/>
                        <input type="hidden" name="filepath" value="<%=a2.get(5)%>"/>
                        <div class="main_cards"> 
                            
                             <div class="card">
                                      <i class="fa fa-id-card-o fa-2x text-blue"></i>
                                      <div class="card_inner_profile">
                                            <p class="text-primary-p">Order ID</p>
                                            <p class="text-secondary-p"> <input class="input" type="text" name="orderid" id="orderid" placeholder="<%=a2.get(0)%>" value="<%=a2.get(0)%>" readonly></p>
                                          
                                      </div>
                             </div>
                             
                             <div class="card">
                                      <i class="fa fa-user-o fa-2x text-yellow"></i>
                                      <div class="card_inner_profile">
                                            <p class="text-primary-p">Patient ID</p>
                                            <p class="text-secondary-p"><input class="input" type="text" name="patientid" id="patientid" placeholder="<%=a2.get(1)%>" readonly></p>
                                          
                                      </div>
                             </div>
                            
                            <div class="card">
                                      <i class="fa fa-user-circle fa-2x text-green"></i>
                                      <div class="card_inner_profile">
                                            <p class="text-primary-p">Patient Name </p>
                                            <p class="text-secondary-p"><input class="input" type="text" name="patientname" id="patientname" placeholder="<%=a2.get (2)%>" readonly></p>
                                          
                                      </div>
                             </div>
                             
                              <div class="card">
                                      <i class="fa fa-tachometer fa-2x text-lightblue"></i>
                                      <div class="card_inner_profile">
                                            <p class="text-primary-p">Order Status </p>
                                            <p class="text-secondary-p"><input class="input" type="text" name="orderstatus" id="patientorderdescription" placeholder="<%=a2.get(6)%>" readonly></p>
                                          
                                      </div>
                             </div>
                                            
                            <div class="card">
                                      <i class="fa fa-commenting fa-2x text-red"></i>
                                      <div class="card_inner_profile">
                                            <p class="text-primary-p">Order Description</p>
                                            <p class="text-secondary-p"><input class="input" type="text" name="orderdescription" id="orderdescription" value="<%=a2.get(4)%>" placeholder="<%=a2.get(4)%>"></p>
                                          
                                      </div>
                             </div>
                                   
                            <div class="card">
                                      <i class="fa fa-file fa-2x text-brown"></i>
                                      <div class="card_inner_profile">
                                            <p class="text-primary-p">Update Prescription</p>
                                            <p class="text-secondary-p"><input class="input" type="file" name="file_path" id="file_path" value="<%=a2.get(5)%>" placeholder="<%=a2.get(5)%>" ></p>
                                          
                                      </div>
                             </div>
                                            
                            <div class="card">
                                      <i class="fa fa-calendar fa-2x text-yellow"></i>
                                      <div class="card_inner_profile">
                                            <p class="text-primary-p">Order Delivery Date</p>
                                            <p class="text-secondary-p"><input class="input" type="date" name="deliverydate" id="deliverydate" value="<%=a2.get(7)%>"></p>
                                          <div class="alert-danger" id="dateError">
                                            * Expected Delivery Date must be a future date
                                        </div>
                                      </div>
                             </div>
                                            <div class=""></div>   
                             <div class="buttons">
                                     <button class="button" id="id" type="button" onclick="window.location.href='patient';"><b>Cancel</b></button>
                                    <button class="button" type="reset" id="clear"><b>Clear</b></button>
                                 
                                   <button class="button-success" type="submit"><b>Update Order</b></button>     
                                 </div>

                       </div>  
                 </form>
                                               
                        <br>
                         
                        
                        
                   

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
</html>
<script>
    //////FIX
    deliveryDate = document.getElementById('deliverydate');
    $("#dateError").hide();
    $("#updateForm").on('submit',function(e){
        $("#dateError").hide();
         var date = Date.parse(deliveryDate);
         alert(date);
    }
</script>