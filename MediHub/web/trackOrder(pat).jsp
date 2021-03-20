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
  <link rel="stylesheet" type="text/css" href="./public/css/Track_Order(pat).css" media="screen"/>
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
  <link rel="stylesheet" type="text/css" href="./public/css/new_dash.css" media="screen" />
  <script language="JavaScript" type="text/javascript" src="./public/js/Track_Order(pat).js"></script>
  <link rel="stylesheet" type="text/css" href="./public/css/modal.css" media="screen" />
</head>
<body>
  <div class="container">  
           <jsp:include page="./public/includes/navbar.jsp"/>
           <main>
     
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
   
 
    <br><br><h3>Track Orders</h3><hr>
  <div class="Dropdown">
    <select name='Dropdown' class="filters">
      <option value='Action' selected><a href="">All</a></option>
      <option value='Action'><a href="#">Oredred</a></option>
      <option value='Action'><a href="#">Received</a></option>
      <option value='Action'><a href="#">Cancelled</a></option>
   </select>
   
   <select name='Dropdown' class="filter_dropdown filters">
      <option value='Action' selected><a href="">All</a></option>
      <option value='Action'><a href="#">Order ID</a></option>
      <option value='Action'><a href="#">Pharmacy ID</a></option>
      <option value='Action'><a href="#">Pharmacy Name</a></option>
      <option value=99><a href="#">Date</a></option>
      <option value='Action'><a href="#">Status</a></option>
   </select>
   <input type="text" class="filter_text textt" placeholder="Filter">
   <input type="date" class="filter_date textt" placeholder="From">
   <input type="date" class="filter_date textt" placeholder="To">
   <a href="#"><button class="btn1"><i class="fa fa-filter"></i></button></a>

  </div>
  <br>
<center>
     <script>
                var id = [];
                var pharmacyId = [];
                var pharmacyName= [];
                var datetime = [];
                var status = [];
                var filepath= [];
                var description = [];
                
  
  </script>
  <div class="container-table" style="clear:both;">
    <table class="table">
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
              <li><a><button class="btn" onclick="confirmdelete('<%=a2.get(0)%>');"><i class="fa fa-trash"></i></button></a></li> 
          </ul>  
        </td>
        <script>
                            id[<%=i%>]                   ="<%=a2.get(0)%>"; 
                            pharmacyId[<%=i%>]           ="<%=a2.get(1)%>"; 
                            pharmacyName[<%=i%>]         ="<%=a2.get(1)%>";
                            datetime[<%=i%>]             ="<%=a2.get(2)%>";
                            status[<%=i%>]               ="<%=a2.get(3)%>";
                            filepath[<%=i%>]             ="<%=a2.get(4)%>";
                            description[<%=i%>]          ="<%=a2.get(6)%>"; 
                            
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
 <div id="viewOrder" class="modal">

    <div class="modal-content">
      <div class="modal-header">
        <span class="close">&times;</span>
        <h2>View Order</h2>
      </div>
      
      <div class="modal-body">
  
        <table class="table">
          <thead>
            <tr>
              <th class="tableheading">Order ID</th>
              <th class="tableheading">Pharmacy ID</th>
              <th class="tableheading">Pharmacy Name</th>
              <th class="tableheading">Date</th>
              <th class="tableheading">Status</th>
              <th class="tableheading">Description</th>
              
            </tr>
            <tr>
              <td class="Row">001</td>
              <td class="Row">101</td>
              <td class="Row">Apolo Pharmacy</td>
              <td class="Row">15/10/2020</td>
              <td class="Row">Oredred</td>
              <td class="Row">This is some random description of something boring</td>
            
              </tr>
          </thead>
        </table>
      </div>
    </div>


</div>
   </main>
           <jsp:include page="./public/includes/patientSidebar.jsp"/>
        </div>
     </body>


<script>
var modal = document.getElementById("viewOrder");
var btn = document.getElementById("vieworder");
var span = document.getElementsByClassName("close")[0];
btn.onclick = function() {
  modal.style.display = "block";
}

span.onclick = function() {
  modal.style.display = "none";
}

window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}
</script>
</html>
