<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.medihub.patient.*"%>

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
        
        <div class="Dropdown">
            <select name='Dropdown'>
              <option value='Action' selected><a href="">All</a></option>
              <option value='Action'><a href="#">Active</a></option>
              <option value='Action'><a href="#">Inactive</a></option>
              <option value='Action'><a href="#">Blacklisted</a></option>
            </select>
            <br>
            <select name='Dropdown' class="filter_dropdown">
               <option value='Action' selected><a href="">All</a></option>
               <option value='Action'><a href="#">ID</a></option>
               <option value='Action'><a href="#">Patient</a></option>
               <option value=99><a href="#">Phone Number</a></option>
               <option value='Action'><a href="#">Status</a></option>
            </select>
            <input type="text" class="filter_text" placeholder="Filter">
            <a href="#"><button class="btn1"><i class="fa fa-filter"></i></button></a>
          </div>
        
    </body>
</html>
