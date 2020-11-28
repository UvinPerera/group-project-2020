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
            <table class="table" style="max-width: 60%">
            <%
                    if(request.getAttribute("channelling")!=null){
                        Channelling c = (Channelling)request.getAttribute("channelling");
            %>
                <input type="hidden" name="id" value="<%= c.id%>"/>
                <thead>
                    <tr>
                        <th colspan="2" class="tableheading">Confirmation</th>
                    </tr>
                </thead>
                <tbody id="doctorAvailability">
                    <tr>
                        <td class="Row" >Hospital</td>
                        <td class="Row" ><%=c.hospital %></td>
                    </tr>
                    <tr>
                        <td class="Row" >Doctor</td>
                        <td class="Row" ><%=c.doctor %></td>
                    </tr>
                    <tr>
                        <td class="Row" >Date / Time</td>
                        <td class="Row" ><%=c.date+" "+c.start_time %></td>
                    </tr>
                    <tr>
                        <td class="Row" >Appointment No</td>
                        <td class="Row" ><%=c.appointmentNo %></td>
                    </tr>
                    <tr>
                        <td class="Row" >Patient Name</td>
                        <td class="Row" ><%= c.description %></td>
                    </tr>
                    <tr>
                        <td class="Row" >Amount</td>
                        <td class="Row" ><%= c.payment_amount %></td>
                    </tr>
                    <tr>
                        <td class="Row" >Payment</td>
                        <td class="Row" style='color: <% if(c.payment_method!=null){out.print("green");}else{out.print("red");} %>;' ><% if(c.payment_method!=null){out.print("Paid");}else{out.print("Not Paid");} %></td>
                    </tr>
                    <tr>
                        <td colspan="2"><button onclick='window.location.href="patient";' class="btn" id="final">OK</button></td>
                    </tr>
                </tbody>
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