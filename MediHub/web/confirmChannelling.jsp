<%-- 
    Document   : submitChannelling
    Created on : Nov 26, 2020, 3:57:44 AM
    Author     : tharshan
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.medihub.patient.*"%>
<%@page import="com.medihub.payment.*"%>
<%@page import="com.medihub.location.*"%>
<%@page import="com.medihub.doctor.*"%>
<%@page import="com.medihub.hospital.*"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset=utf-8>
        <title>MediHub</title>
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@500&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Spartan:wght@600&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="./public/css/channelling.css" media="screen" >
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    </head>
    <body>
        <div class="navbar" id="navbar">
            <ul>
              <li><button class="style" type="button" onclick="window.location.href='logout';"> LOGOUT</button></li>
              <li><button class="style" type="button" onclick="window.location.href='patient'"> Dashboard </button></li>
             <li><a href="About.jsp" id="end">About</a></li>
      <li><a href="contactUs.jsp">Contact</a></li>
      <li><a href="EmergencyServices.jsp">Emergency Services</a></li>
      <li><a href="/MediHub">Home</a></li>
              <li id="logo"><img src="./public/images/onlylogo.png" width="15.5%"></li>
            </ul>
        </div>
        
        <!--     ##################
            table starts
         ##################-->
            
        <div class="container-table">
            <table class="table result" style="max-width: 60%">
            <%
                    if(request.getAttribute("doctorAvalability")!=null){
                        DoctorAvailability da = (DoctorAvailability)request.getAttribute("doctorAvalability");
            %>
            <form action="submitchannelling" method="post">
                <input type="hidden" name="id" value="<%= da.id%>"/>
                <thead>
                    <tr>
                        <th colspan="2" class="tableheading resultheading">Confirmation</th>
                    </tr>
                </thead>
                <tbody id="doctorAvailability">
                    <tr>
                        <td class="Row" >Hospital</td>
                        <td class="Row" ><%=da.hospitalName %></td>
                    </tr>
                    <tr>
                        <td class="Row" >Doctor</td>
                        <td class="Row" ><%=da.doctorName %></td>
                    </tr>
                    <tr>
                        <td class="Row" >Date / Time</td>
                        <td class="Row" ><%=da.date+" "+da.startTime %></td>
                    </tr>
                    <tr>
                        <td class="Row" >Appointment No</td>
                        <td class="Row" ><%=da.count+1 %> (Subject to Change if delayed)</td>
                    </tr>
                    <% // if(request.getAttribute("check")!=null){ %>
                    <tr>
                        <td class="Row" >Patient Name</td>
                        <td class="Row" ><input type="text" name="description" id="description" class="selectpatient" required="required"/></td>
                    </tr>
                    <% // } %>
                    <tr>
                        <td class="Row" >Payment Method</td>
                        <td class="Row" >
                            <div class="Dropdown">
                                <select name='payment_method' id="payment_method" class="selectpayment">
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
<!--                                        <option value='1' selected>Cash</option>-->
                                        <% } %>
                                </select>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan='2'><button type="submit" class="style accept" id="final">Accept and Submit</button></td>
                    </tr>
                </tbody>
            </form>
                <% } else { %>
                    <tr>
                        <th colspan="2" class="tableheading">Something Went Wrong</th>
                    </tr>
                    <tr>
                        <td colspan="2"><button onclick='window.location.href="patient";' class="btn" id="final">OK</button></td>
                    </tr>
                <% } %>
            </table>
        </div>

<!--        ################
            table ends
        ################-->
        
    </body>
</html>