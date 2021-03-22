
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
  <link rel="stylesheet" type="text/css" href="./public/css/updateOrder.css" media="screen" />
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
  
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
            <div class="container1">
                <h1>Update Order </h1><br><hr><br><br>
                
              <form action="updatepatientorder?orderid=<%=a2.get(0)%>" method="post">

                <h2 class="details">Order ID</h2>
                <input class="input" type="text" name="orderid" id="orderid" placeholder="<%=a2.get(0)%>" readonly>

                 <h2 class="details">Date and Time</h2>
                <input class="input" type="text" name="datetime" id="datetime" placeholder="<%=a2.get(3)%>" readonly>

                <h2 class="details">Patient ID</h2>
                 <input class="input" type="text" name="patientid" id="patientid" placeholder="<%=a2.get(1)%>" readonly>

                 <h2 class="details">Patient Name </h2>
                  <input class="input" type="text" name="patientname" id="patientname" placeholder="<%=a2.get (2)%>" readonly>

                  <h2 class="details"> Order Status </h2>
                   <input class="input" type="text" name="orderstatus" id="patientorderdescription" placeholder="<%=a2.get(6)%>" readonly>

                   <h2 class="details">Order Description</h2>
                    <input class="input" type="text" name="orderdescription" id="orderdescription" value="<%=a2.get(4)%>" placeholder="<%=a2.get(4)%>">

                <h2 class="details">Update Prescription</h2>
                 <input class="input" type="file" name="file_path" id="file_path" value="<%=a2.get(5)%>" placeholder="<%=a2.get(5)%>" >

                 <h2 class="details">Order Delivery Date</h2>
                 <input class="input" type="date" name="deliverydate" id="deliverydate" placeholder="<%=a2.get(7)%>" value="<%=a2.get(7)%>" >

                 <div class="button-container1">
                       <button class="button" id="id" onclick="window.location.href='patient';"><b>Cancel</b></button>
                       <button class="button" type="reset" id="clear"><b>Clear</b></button>
                       <button class="button" type="submit"><b>Submit</b></button>

                </div>

              </form>
            </div>
        </main>
           <jsp:include page="./public/includes/patientSidebar.jsp"/>
        </div>
     </body>

</html>
