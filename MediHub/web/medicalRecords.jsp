<%-- 
    Document   : medical_records
    Created on : Mar 17, 2021, 2:24:07 PM
    Author     : Yash
--%>

<%@page import="com.medihub.records.MedicalRecords"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.medihub.patient.*"%>

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
          <link rel="stylesheet" type="text/css" href="./public/css/medicalrecords.css" media="screen" />
          <link rel="stylesheet" type="text/css" href="./public/css/patient_modal.css" media="screen" />
          <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
     </head>

     <body>

          <% 
               String username="";
               username= session.getAttribute("username").toString();
          %>
        <div class="container">  
           <jsp:include page="./public/includes/navbar.jsp"/>
           <main>
               <div class="main_container">
                   <br><h3>Medical Records</h3><br>
                <div class="main_cards" style="padding-left: 15px;padding-right: 15px">
                <%
                    if(request.getAttribute("medicalRecords")!=null){
                                                  List<MedicalRecords> table = (ArrayList<MedicalRecords>)request.getAttribute("medicalRecords");
                                                  if(table.size()>0){
                 %>
                 
                <script>
                     var id = [];
                     var name = [];
                     var description = [];
                     var status = [];
                     var category_id = [];
                     var channelling_id = [];
                     var path = [];
                     var size =<%= table.size() %>;
                      var finalId;
                </script>
                
                <% 
                    int i = 0;
                    for(MedicalRecords row : table) { 
                       i++; 
                     
                %>
                    
                    <div class="card">
                                <div class="card_inner_profile">
                                     <div class="text">
                                    <p class="text-primary-p" style="font-size: 20px;" ><%= row.name%></p>
                                    <p class="text-secondary-p" style="padding-top:3%; font-weight: normal;"><%= row.description%></p>
                                
                                     </div>
                                    <div class="image"><svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 56 56" style="enable-background:new 0 0 56 56;" xml:space="preserve"> <g> <path style="fill:#E9E9E0;" d="M36.985,0H7.963C7.155,0,6.5,0.655,6.5,1.926V55c0,0.345,0.655,1,1.463,1h40.074 c0.808,0,1.463-0.655,1.463-1V12.978c0-0.696-0.093-0.92-0.257-1.085L37.607,0.257C37.442,0.093,37.218,0,36.985,0z"/> <polygon style="fill:#D9D7CA;" points="37.5,0.151 37.5,12 49.349,12 	"/> <path style="fill:#CC4B4C;" d="M19.514,33.324L19.514,33.324c-0.348,0-0.682-0.113-0.967-0.326 c-1.041-0.781-1.181-1.65-1.115-2.242c0.182-1.628,2.195-3.332,5.985-5.068c1.504-3.296,2.935-7.357,3.788-10.75 c-0.998-2.172-1.968-4.99-1.261-6.643c0.248-0.579,0.557-1.023,1.134-1.215c0.228-0.076,0.804-0.172,1.016-0.172 c0.504,0,0.947,0.649,1.261,1.049c0.295,0.376,0.964,1.173-0.373,6.802c1.348,2.784,3.258,5.62,5.088,7.562 c1.311-0.237,2.439-0.358,3.358-0.358c1.566,0,2.515,0.365,2.902,1.117c0.32,0.622,0.189,1.349-0.39,2.16 c-0.557,0.779-1.325,1.191-2.22,1.191c-1.216,0-2.632-0.768-4.211-2.285c-2.837,0.593-6.15,1.651-8.828,2.822 c-0.836,1.774-1.637,3.203-2.383,4.251C21.273,32.654,20.389,33.324,19.514,33.324z M22.176,28.198 c-2.137,1.201-3.008,2.188-3.071,2.744c-0.01,0.092-0.037,0.334,0.431,0.692C19.685,31.587,20.555,31.19,22.176,28.198z M35.813,23.756c0.815,0.627,1.014,0.944,1.547,0.944c0.234,0,0.901-0.01,1.21-0.441c0.149-0.209,0.207-0.343,0.23-0.415 c-0.123-0.065-0.286-0.197-1.175-0.197C37.12,23.648,36.485,23.67,35.813,23.756z M28.343,17.174 c-0.715,2.474-1.659,5.145-2.674,7.564c2.09-0.811,4.362-1.519,6.496-2.02C30.815,21.15,29.466,19.192,28.343,17.174z M27.736,8.712c-0.098,0.033-1.33,1.757,0.096,3.216C28.781,9.813,27.779,8.698,27.736,8.712z"/> <path style="fill:#CC4B4C;" d="M48.037,56H7.963C7.155,56,6.5,55.345,6.5,54.537V39h43v15.537C49.5,55.345,48.845,56,48.037,56z"/> <g> <path style="fill:#FFFFFF;" d="M17.385,53h-1.641V42.924h2.898c0.428,0,0.852,0.068,1.271,0.205 c0.419,0.137,0.795,0.342,1.128,0.615c0.333,0.273,0.602,0.604,0.807,0.991s0.308,0.822,0.308,1.306 c0,0.511-0.087,0.973-0.26,1.388c-0.173,0.415-0.415,0.764-0.725,1.046c-0.31,0.282-0.684,0.501-1.121,0.656 s-0.921,0.232-1.449,0.232h-1.217V53z M17.385,44.168v3.992h1.504c0.2,0,0.398-0.034,0.595-0.103 c0.196-0.068,0.376-0.18,0.54-0.335c0.164-0.155,0.296-0.371,0.396-0.649c0.1-0.278,0.15-0.622,0.15-1.032 c0-0.164-0.023-0.354-0.068-0.567c-0.046-0.214-0.139-0.419-0.28-0.615c-0.142-0.196-0.34-0.36-0.595-0.492 c-0.255-0.132-0.593-0.198-1.012-0.198H17.385z"/> <path style="fill:#FFFFFF;" d="M32.219,47.682c0,0.829-0.089,1.538-0.267,2.126s-0.403,1.08-0.677,1.477s-0.581,0.709-0.923,0.937 s-0.672,0.398-0.991,0.513c-0.319,0.114-0.611,0.187-0.875,0.219C28.222,52.984,28.026,53,27.898,53h-3.814V42.924h3.035 c0.848,0,1.593,0.135,2.235,0.403s1.176,0.627,1.6,1.073s0.74,0.955,0.95,1.524C32.114,46.494,32.219,47.08,32.219,47.682z M27.352,51.797c1.112,0,1.914-0.355,2.406-1.066s0.738-1.741,0.738-3.09c0-0.419-0.05-0.834-0.15-1.244 c-0.101-0.41-0.294-0.781-0.581-1.114s-0.677-0.602-1.169-0.807s-1.13-0.308-1.914-0.308h-0.957v7.629H27.352z"/> <path style="fill:#FFFFFF;" d="M36.266,44.168v3.172h4.211v1.121h-4.211V53h-1.668V42.924H40.9v1.244H36.266z"/> </g> </g> </svg></div>
                                </div>
                                <div class="options">
                                    <ul>
                                        <li class="actions" onclick="confirmdelete('<%=i%>');"><i class="fa fa-trash"></i></li>
                                        <li class="actions" onclick="popup('<%=i%>');"><i class="fa fa-edit"></i></li>
                                        <li class="actions"><a href="#" id="displayRecord" onclick="displayRecord('<%=i%>');" target="_blank"><i class="fa fa-eye"></i></a></li>
                                    </ul>
                                </div>
                    </div>
             <script>
                            id[<%=i%>]                   ="<%= row.id %>";  
                            name[<%=i%>]                 ="<%= row.name %>";
                            description[<%=i%>]          ="<%= row.description%>"; 
                            status[<%=i%>]               ="<%= row.status %>"; 
                            category_id[<%=i%>]          ="<%= row.category_id %>"; 
                            channelling_id[<%=i%>]       ="<%=row.channelingId%>";
                            path[<%=i%>]                 ="<%=row.path%>";
          </script>
                <% } %>
                 <%
                                                       }
                                                       else
                                                       {
                                                  %>
                                                  <div>
                                                      No medical records
                                                         
                                                  </div>
                                                  <%
                                                       }}
                                                  %>

<!--                    <div class="card">
                                <div class="card_inner_profile">
                                    <svg version="1.1" id="Capa_1" class="fill" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 384 384" style="enable-background:new 0 0 384 384;" xml:space="preserve"> <g> <g> <circle cx="192" cy="42.667" r="42.667"/> </g> </g> <g> <g> <circle cx="192" cy="192" r="42.667"/> </g> </g> <g> <g> <circle cx="192" cy="341.333" r="42.667"/> </g> </g> </svg>
                                    <div class="image"><svg id=Capa_1 style="enable-background:new 0 0 56 56"version=1.1 viewBox="0 0 56 56"x=0px xml:space=preserve xmlns=http://www.w3.org/2000/svg xmlns:xlink=http://www.w3.org/1999/xlink y=0px><g><path d="M36.985,0H7.963C7.155,0,6.5,0.655,6.5,1.926V55c0,0.345,0.655,1,1.463,1h40.074 c0.808,0,1.463-0.655,1.463-1V12.978c0-0.696-0.093-0.92-0.257-1.085L37.607,0.257C37.442,0.093,37.218,0,36.985,0z"style=fill:#E9E9E0 /><polygon points="37.5,0.151 37.5,12 49.349,12 	"style=fill:#D9D7CA /><circle cx=18.931 cy=14.431 r=4.569 style=fill:#F3D55B /><polygon points="6.5,39 17.5,39 49.5,39 49.5,28 39.5,18.5 29,30 23.517,24.517 	"style=fill:#26B99A /><path d=M48.037,56H7.963C7.155,56,6.5,55.345,6.5,54.537V39h43v15.537C49.5,55.345,48.845,56,48.037,56z style=fill:#14A085 /><g><path d="M21.426,42.65v7.848c0,0.474-0.087,0.873-0.26,1.196c-0.173,0.323-0.406,0.583-0.697,0.779 c-0.292,0.196-0.627,0.333-1.005,0.41C19.085,52.961,18.696,53,18.295,53c-0.201,0-0.436-0.021-0.704-0.062 c-0.269-0.041-0.547-0.104-0.834-0.191s-0.563-0.185-0.827-0.294c-0.265-0.109-0.488-0.232-0.67-0.369l0.697-1.107 c0.091,0.063,0.221,0.13,0.39,0.198c0.168,0.068,0.353,0.132,0.554,0.191c0.2,0.06,0.41,0.111,0.629,0.157 s0.424,0.068,0.615,0.068c0.483,0,0.868-0.094,1.155-0.28s0.439-0.504,0.458-0.95V42.65H21.426z"style=fill:#FFF /><path d="M25.514,52.932h-1.641V42.855h2.898c0.428,0,0.852,0.068,1.271,0.205 c0.419,0.137,0.795,0.342,1.128,0.615c0.333,0.273,0.602,0.604,0.807,0.991s0.308,0.822,0.308,1.306 c0,0.511-0.087,0.973-0.26,1.388c-0.173,0.415-0.415,0.764-0.725,1.046c-0.31,0.282-0.684,0.501-1.121,0.656 s-0.921,0.232-1.449,0.232h-1.217V52.932z M25.514,44.1v3.992h1.504c0.2,0,0.398-0.034,0.595-0.103 c0.196-0.068,0.376-0.18,0.54-0.335s0.296-0.371,0.396-0.649c0.1-0.278,0.15-0.622,0.15-1.032c0-0.164-0.023-0.354-0.068-0.567 c-0.046-0.214-0.139-0.419-0.28-0.615c-0.142-0.196-0.34-0.36-0.595-0.492C27.5,44.166,27.163,44.1,26.744,44.1H25.514z"style=fill:#FFF /><path d="M39.5,47.736v3.896c-0.21,0.265-0.444,0.48-0.704,0.649s-0.533,0.308-0.82,0.417 s-0.583,0.187-0.889,0.232C36.781,52.978,36.479,53,36.178,53c-0.602,0-1.155-0.109-1.661-0.328s-0.948-0.542-1.326-0.971 c-0.378-0.429-0.675-0.966-0.889-1.613c-0.214-0.647-0.321-1.395-0.321-2.242s0.107-1.593,0.321-2.235 c0.214-0.643,0.51-1.178,0.889-1.606c0.378-0.429,0.822-0.754,1.333-0.978c0.51-0.224,1.062-0.335,1.654-0.335 c0.547,0,1.057,0.091,1.531,0.273c0.474,0.183,0.897,0.456,1.271,0.82l-1.135,1.012c-0.219-0.265-0.47-0.456-0.752-0.574 c-0.283-0.118-0.574-0.178-0.875-0.178c-0.337,0-0.659,0.063-0.964,0.191c-0.306,0.128-0.579,0.344-0.82,0.649 c-0.242,0.306-0.431,0.699-0.567,1.183s-0.21,1.075-0.219,1.777c0.009,0.684,0.08,1.276,0.212,1.777 c0.132,0.501,0.314,0.911,0.547,1.23s0.497,0.556,0.793,0.711c0.296,0.155,0.608,0.232,0.937,0.232c0.1,0,0.234-0.007,0.403-0.021 c0.168-0.014,0.337-0.036,0.506-0.068c0.168-0.032,0.33-0.075,0.485-0.13c0.155-0.055,0.269-0.132,0.342-0.232v-2.488h-1.709 v-1.121H39.5z"style=fill:#FFF /></g></g></svg></div>
                                    <p class="text-primary-p"><h5>Name of Record</h5></p>
                                    <p class="text-secondary-p" style="padding-top:3%; font-weight: normal;">Some Description</p>
                                </div>
                    </div>
                    <div class="card">
                                <div class="card_inner_profile">
                                    <svg version="1.1" id="Capa_1" class="fill" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 384 384" style="enable-background:new 0 0 384 384;" xml:space="preserve"> <g> <g> <circle cx="192" cy="42.667" r="42.667"/> </g> </g> <g> <g> <circle cx="192" cy="192" r="42.667"/> </g> </g> <g> <g> <circle cx="192" cy="341.333" r="42.667"/> </g> </g> </svg>
                                    <div class="image"><svg id=Capa_1 style="enable-background:new 0 0 56 56"version=1.1 viewBox="0 0 56 56"x=0px xml:space=preserve xmlns=http://www.w3.org/2000/svg xmlns:xlink=http://www.w3.org/1999/xlink y=0px><g><path d="M36.985,0H7.963C7.155,0,6.5,0.655,6.5,1.926V55c0,0.345,0.655,1,1.463,1h40.074 c0.808,0,1.463-0.655,1.463-1V12.978c0-0.696-0.093-0.92-0.257-1.085L37.607,0.257C37.442,0.093,37.218,0,36.985,0z"style=fill:#E9E9E0 /><path d=M48.037,56H7.963C7.155,56,6.5,55.345,6.5,54.537V39h43v15.537C49.5,55.345,48.845,56,48.037,56z style=fill:#659C35 /><polygon points="37.5,0.151 37.5,12 49.349,12 	"style=fill:#D9D7CA /><g><path d="M17.385,53h-1.641V42.924h2.898c0.428,0,0.852,0.068,1.271,0.205 c0.419,0.137,0.795,0.342,1.128,0.615c0.333,0.273,0.602,0.604,0.807,0.991s0.308,0.822,0.308,1.306 c0,0.511-0.087,0.973-0.26,1.388c-0.173,0.415-0.415,0.764-0.725,1.046c-0.31,0.282-0.684,0.501-1.121,0.656 s-0.921,0.232-1.449,0.232h-1.217V53z M17.385,44.168v3.992h1.504c0.2,0,0.398-0.034,0.595-0.103 c0.196-0.068,0.376-0.18,0.54-0.335c0.164-0.155,0.296-0.371,0.396-0.649c0.1-0.278,0.15-0.622,0.15-1.032 c0-0.164-0.023-0.354-0.068-0.567c-0.046-0.214-0.139-0.419-0.28-0.615c-0.142-0.196-0.34-0.36-0.595-0.492 c-0.255-0.132-0.593-0.198-1.012-0.198H17.385z"style=fill:#FFF /><path d=M31.316,42.924V53h-1.668l-3.951-6.945V53h-1.668V42.924h1.668l3.951,6.945v-6.945H31.316z style=fill:#FFF /><path d="M41.16,47.805v3.896c-0.21,0.265-0.444,0.48-0.704,0.649s-0.533,0.308-0.82,0.417 S39.052,52.954,38.747,53c-0.306,0.046-0.608,0.068-0.909,0.068c-0.602,0-1.155-0.109-1.661-0.328s-0.948-0.542-1.326-0.971 c-0.378-0.429-0.675-0.966-0.889-1.613c-0.214-0.647-0.321-1.395-0.321-2.242s0.107-1.593,0.321-2.235 c0.214-0.643,0.51-1.178,0.889-1.606c0.378-0.429,0.822-0.754,1.333-0.978c0.51-0.224,1.062-0.335,1.654-0.335 c0.547,0,1.057,0.091,1.531,0.273c0.474,0.183,0.897,0.456,1.271,0.82l-1.135,1.012c-0.219-0.265-0.47-0.456-0.752-0.574 c-0.283-0.118-0.574-0.178-0.875-0.178c-0.337,0-0.659,0.063-0.964,0.191c-0.306,0.128-0.579,0.344-0.82,0.649 c-0.242,0.306-0.431,0.699-0.567,1.183s-0.21,1.075-0.219,1.777c0.009,0.684,0.08,1.276,0.212,1.777 c0.132,0.501,0.314,0.911,0.547,1.23s0.497,0.556,0.793,0.711c0.296,0.155,0.608,0.232,0.937,0.232c0.1,0,0.234-0.007,0.403-0.021 c0.168-0.014,0.337-0.036,0.506-0.068c0.168-0.032,0.33-0.075,0.485-0.13c0.155-0.055,0.269-0.132,0.342-0.232v-2.488h-1.709 v-1.121H41.16z"style=fill:#FFF /></g><circle cx=18.931 cy=14.431 r=4.569 style=fill:#F3D55B /><polygon points="6.5,39 17.5,39 49.5,39 49.5,28 39.5,18.5 29,30 23.517,24.517 	"style=fill:#88C057 /></g></svg></div>
                                    <p class="text-primary-p"><h5>Name of Record</h5></p>
                                    <p class="text-secondary-p" style="padding-top:3%; font-weight: normal;">Some Description</p>
                                </div>
                      </div>
                    
                                        <div class="card">
                                <div class="card_inner_profile">
                                    <svg version="1.1" id="Capa_1" class="fill" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 384 384" style="enable-background:new 0 0 384 384;" xml:space="preserve"> <g> <g> <circle cx="192" cy="42.667" r="42.667"/> </g> </g> <g> <g> <circle cx="192" cy="192" r="42.667"/> </g> </g> <g> <g> <circle cx="192" cy="341.333" r="42.667"/> </g> </g> </svg>
                                    <div class="image"><svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 56 56" style="enable-background:new 0 0 56 56;" xml:space="preserve"> <g> <path style="fill:#E9E9E0;" d="M36.985,0H7.963C7.155,0,6.5,0.655,6.5,1.926V55c0,0.345,0.655,1,1.463,1h40.074 c0.808,0,1.463-0.655,1.463-1V12.978c0-0.696-0.093-0.92-0.257-1.085L37.607,0.257C37.442,0.093,37.218,0,36.985,0z"/> <polygon style="fill:#D9D7CA;" points="37.5,0.151 37.5,12 49.349,12 	"/> <path style="fill:#CC4B4C;" d="M19.514,33.324L19.514,33.324c-0.348,0-0.682-0.113-0.967-0.326 c-1.041-0.781-1.181-1.65-1.115-2.242c0.182-1.628,2.195-3.332,5.985-5.068c1.504-3.296,2.935-7.357,3.788-10.75 c-0.998-2.172-1.968-4.99-1.261-6.643c0.248-0.579,0.557-1.023,1.134-1.215c0.228-0.076,0.804-0.172,1.016-0.172 c0.504,0,0.947,0.649,1.261,1.049c0.295,0.376,0.964,1.173-0.373,6.802c1.348,2.784,3.258,5.62,5.088,7.562 c1.311-0.237,2.439-0.358,3.358-0.358c1.566,0,2.515,0.365,2.902,1.117c0.32,0.622,0.189,1.349-0.39,2.16 c-0.557,0.779-1.325,1.191-2.22,1.191c-1.216,0-2.632-0.768-4.211-2.285c-2.837,0.593-6.15,1.651-8.828,2.822 c-0.836,1.774-1.637,3.203-2.383,4.251C21.273,32.654,20.389,33.324,19.514,33.324z M22.176,28.198 c-2.137,1.201-3.008,2.188-3.071,2.744c-0.01,0.092-0.037,0.334,0.431,0.692C19.685,31.587,20.555,31.19,22.176,28.198z M35.813,23.756c0.815,0.627,1.014,0.944,1.547,0.944c0.234,0,0.901-0.01,1.21-0.441c0.149-0.209,0.207-0.343,0.23-0.415 c-0.123-0.065-0.286-0.197-1.175-0.197C37.12,23.648,36.485,23.67,35.813,23.756z M28.343,17.174 c-0.715,2.474-1.659,5.145-2.674,7.564c2.09-0.811,4.362-1.519,6.496-2.02C30.815,21.15,29.466,19.192,28.343,17.174z M27.736,8.712c-0.098,0.033-1.33,1.757,0.096,3.216C28.781,9.813,27.779,8.698,27.736,8.712z"/> <path style="fill:#CC4B4C;" d="M48.037,56H7.963C7.155,56,6.5,55.345,6.5,54.537V39h43v15.537C49.5,55.345,48.845,56,48.037,56z"/> <g> <path style="fill:#FFFFFF;" d="M17.385,53h-1.641V42.924h2.898c0.428,0,0.852,0.068,1.271,0.205 c0.419,0.137,0.795,0.342,1.128,0.615c0.333,0.273,0.602,0.604,0.807,0.991s0.308,0.822,0.308,1.306 c0,0.511-0.087,0.973-0.26,1.388c-0.173,0.415-0.415,0.764-0.725,1.046c-0.31,0.282-0.684,0.501-1.121,0.656 s-0.921,0.232-1.449,0.232h-1.217V53z M17.385,44.168v3.992h1.504c0.2,0,0.398-0.034,0.595-0.103 c0.196-0.068,0.376-0.18,0.54-0.335c0.164-0.155,0.296-0.371,0.396-0.649c0.1-0.278,0.15-0.622,0.15-1.032 c0-0.164-0.023-0.354-0.068-0.567c-0.046-0.214-0.139-0.419-0.28-0.615c-0.142-0.196-0.34-0.36-0.595-0.492 c-0.255-0.132-0.593-0.198-1.012-0.198H17.385z"/> <path style="fill:#FFFFFF;" d="M32.219,47.682c0,0.829-0.089,1.538-0.267,2.126s-0.403,1.08-0.677,1.477s-0.581,0.709-0.923,0.937 s-0.672,0.398-0.991,0.513c-0.319,0.114-0.611,0.187-0.875,0.219C28.222,52.984,28.026,53,27.898,53h-3.814V42.924h3.035 c0.848,0,1.593,0.135,2.235,0.403s1.176,0.627,1.6,1.073s0.74,0.955,0.95,1.524C32.114,46.494,32.219,47.08,32.219,47.682z M27.352,51.797c1.112,0,1.914-0.355,2.406-1.066s0.738-1.741,0.738-3.09c0-0.419-0.05-0.834-0.15-1.244 c-0.101-0.41-0.294-0.781-0.581-1.114s-0.677-0.602-1.169-0.807s-1.13-0.308-1.914-0.308h-0.957v7.629H27.352z"/> <path style="fill:#FFFFFF;" d="M36.266,44.168v3.172h4.211v1.121h-4.211V53h-1.668V42.924H40.9v1.244H36.266z"/> </g> </g> </svg></div>

                                    <p class="text-primary-p"><h5>Name of Record</h5></p>
                                    <p class="text-secondary-p" style="padding-top:3%; font-weight: normal;">Some Description</p>
                                </div>
                    </div>

                    <div class="card">
                                <div class="card_inner_profile">
                                    <svg version="1.1" id="Capa_1" class="fill" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 384 384" style="enable-background:new 0 0 384 384;" xml:space="preserve"> <g> <g> <circle cx="192" cy="42.667" r="42.667"/> </g> </g> <g> <g> <circle cx="192" cy="192" r="42.667"/> </g> </g> <g> <g> <circle cx="192" cy="341.333" r="42.667"/> </g> </g> </svg>
                                    <div class="image"><svg id=Capa_1 style="enable-background:new 0 0 56 56"version=1.1 viewBox="0 0 56 56"x=0px xml:space=preserve xmlns=http://www.w3.org/2000/svg xmlns:xlink=http://www.w3.org/1999/xlink y=0px><g><path d="M36.985,0H7.963C7.155,0,6.5,0.655,6.5,1.926V55c0,0.345,0.655,1,1.463,1h40.074 c0.808,0,1.463-0.655,1.463-1V12.978c0-0.696-0.093-0.92-0.257-1.085L37.607,0.257C37.442,0.093,37.218,0,36.985,0z"style=fill:#E9E9E0 /><polygon points="37.5,0.151 37.5,12 49.349,12 	"style=fill:#D9D7CA /><circle cx=18.931 cy=14.431 r=4.569 style=fill:#F3D55B /><polygon points="6.5,39 17.5,39 49.5,39 49.5,28 39.5,18.5 29,30 23.517,24.517 	"style=fill:#26B99A /><path d=M48.037,56H7.963C7.155,56,6.5,55.345,6.5,54.537V39h43v15.537C49.5,55.345,48.845,56,48.037,56z style=fill:#14A085 /><g><path d="M21.426,42.65v7.848c0,0.474-0.087,0.873-0.26,1.196c-0.173,0.323-0.406,0.583-0.697,0.779 c-0.292,0.196-0.627,0.333-1.005,0.41C19.085,52.961,18.696,53,18.295,53c-0.201,0-0.436-0.021-0.704-0.062 c-0.269-0.041-0.547-0.104-0.834-0.191s-0.563-0.185-0.827-0.294c-0.265-0.109-0.488-0.232-0.67-0.369l0.697-1.107 c0.091,0.063,0.221,0.13,0.39,0.198c0.168,0.068,0.353,0.132,0.554,0.191c0.2,0.06,0.41,0.111,0.629,0.157 s0.424,0.068,0.615,0.068c0.483,0,0.868-0.094,1.155-0.28s0.439-0.504,0.458-0.95V42.65H21.426z"style=fill:#FFF /><path d="M25.514,52.932h-1.641V42.855h2.898c0.428,0,0.852,0.068,1.271,0.205 c0.419,0.137,0.795,0.342,1.128,0.615c0.333,0.273,0.602,0.604,0.807,0.991s0.308,0.822,0.308,1.306 c0,0.511-0.087,0.973-0.26,1.388c-0.173,0.415-0.415,0.764-0.725,1.046c-0.31,0.282-0.684,0.501-1.121,0.656 s-0.921,0.232-1.449,0.232h-1.217V52.932z M25.514,44.1v3.992h1.504c0.2,0,0.398-0.034,0.595-0.103 c0.196-0.068,0.376-0.18,0.54-0.335s0.296-0.371,0.396-0.649c0.1-0.278,0.15-0.622,0.15-1.032c0-0.164-0.023-0.354-0.068-0.567 c-0.046-0.214-0.139-0.419-0.28-0.615c-0.142-0.196-0.34-0.36-0.595-0.492C27.5,44.166,27.163,44.1,26.744,44.1H25.514z"style=fill:#FFF /><path d="M39.5,47.736v3.896c-0.21,0.265-0.444,0.48-0.704,0.649s-0.533,0.308-0.82,0.417 s-0.583,0.187-0.889,0.232C36.781,52.978,36.479,53,36.178,53c-0.602,0-1.155-0.109-1.661-0.328s-0.948-0.542-1.326-0.971 c-0.378-0.429-0.675-0.966-0.889-1.613c-0.214-0.647-0.321-1.395-0.321-2.242s0.107-1.593,0.321-2.235 c0.214-0.643,0.51-1.178,0.889-1.606c0.378-0.429,0.822-0.754,1.333-0.978c0.51-0.224,1.062-0.335,1.654-0.335 c0.547,0,1.057,0.091,1.531,0.273c0.474,0.183,0.897,0.456,1.271,0.82l-1.135,1.012c-0.219-0.265-0.47-0.456-0.752-0.574 c-0.283-0.118-0.574-0.178-0.875-0.178c-0.337,0-0.659,0.063-0.964,0.191c-0.306,0.128-0.579,0.344-0.82,0.649 c-0.242,0.306-0.431,0.699-0.567,1.183s-0.21,1.075-0.219,1.777c0.009,0.684,0.08,1.276,0.212,1.777 c0.132,0.501,0.314,0.911,0.547,1.23s0.497,0.556,0.793,0.711c0.296,0.155,0.608,0.232,0.937,0.232c0.1,0,0.234-0.007,0.403-0.021 c0.168-0.014,0.337-0.036,0.506-0.068c0.168-0.032,0.33-0.075,0.485-0.13c0.155-0.055,0.269-0.132,0.342-0.232v-2.488h-1.709 v-1.121H39.5z"style=fill:#FFF /></g></g></svg></div>
                                    <p class="text-primary-p"><h5>Name of Record</h5></p>
                                    <p class="text-secondary-p" style="padding-top:3%; font-weight: normal;">Some Description</p>
                                </div>
                    </div>
                    <div class="card">
                                <div class="card_inner_profile">
                                    <svg version="1.1" id="Capa_1" class="fill" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 384 384" style="enable-background:new 0 0 384 384;" xml:space="preserve"> <g> <g> <circle cx="192" cy="42.667" r="42.667"/> </g> </g> <g> <g> <circle cx="192" cy="192" r="42.667"/> </g> </g> <g> <g> <circle cx="192" cy="341.333" r="42.667"/> </g> </g> </svg>
                                    <div class="image"><svg id=Capa_1 style="enable-background:new 0 0 56 56"version=1.1 viewBox="0 0 56 56"x=0px xml:space=preserve xmlns=http://www.w3.org/2000/svg xmlns:xlink=http://www.w3.org/1999/xlink y=0px><g><path d="M36.985,0H7.963C7.155,0,6.5,0.655,6.5,1.926V55c0,0.345,0.655,1,1.463,1h40.074 c0.808,0,1.463-0.655,1.463-1V12.978c0-0.696-0.093-0.92-0.257-1.085L37.607,0.257C37.442,0.093,37.218,0,36.985,0z"style=fill:#E9E9E0 /><path d=M48.037,56H7.963C7.155,56,6.5,55.345,6.5,54.537V39h43v15.537C49.5,55.345,48.845,56,48.037,56z style=fill:#659C35 /><polygon points="37.5,0.151 37.5,12 49.349,12 	"style=fill:#D9D7CA /><g><path d="M17.385,53h-1.641V42.924h2.898c0.428,0,0.852,0.068,1.271,0.205 c0.419,0.137,0.795,0.342,1.128,0.615c0.333,0.273,0.602,0.604,0.807,0.991s0.308,0.822,0.308,1.306 c0,0.511-0.087,0.973-0.26,1.388c-0.173,0.415-0.415,0.764-0.725,1.046c-0.31,0.282-0.684,0.501-1.121,0.656 s-0.921,0.232-1.449,0.232h-1.217V53z M17.385,44.168v3.992h1.504c0.2,0,0.398-0.034,0.595-0.103 c0.196-0.068,0.376-0.18,0.54-0.335c0.164-0.155,0.296-0.371,0.396-0.649c0.1-0.278,0.15-0.622,0.15-1.032 c0-0.164-0.023-0.354-0.068-0.567c-0.046-0.214-0.139-0.419-0.28-0.615c-0.142-0.196-0.34-0.36-0.595-0.492 c-0.255-0.132-0.593-0.198-1.012-0.198H17.385z"style=fill:#FFF /><path d=M31.316,42.924V53h-1.668l-3.951-6.945V53h-1.668V42.924h1.668l3.951,6.945v-6.945H31.316z style=fill:#FFF /><path d="M41.16,47.805v3.896c-0.21,0.265-0.444,0.48-0.704,0.649s-0.533,0.308-0.82,0.417 S39.052,52.954,38.747,53c-0.306,0.046-0.608,0.068-0.909,0.068c-0.602,0-1.155-0.109-1.661-0.328s-0.948-0.542-1.326-0.971 c-0.378-0.429-0.675-0.966-0.889-1.613c-0.214-0.647-0.321-1.395-0.321-2.242s0.107-1.593,0.321-2.235 c0.214-0.643,0.51-1.178,0.889-1.606c0.378-0.429,0.822-0.754,1.333-0.978c0.51-0.224,1.062-0.335,1.654-0.335 c0.547,0,1.057,0.091,1.531,0.273c0.474,0.183,0.897,0.456,1.271,0.82l-1.135,1.012c-0.219-0.265-0.47-0.456-0.752-0.574 c-0.283-0.118-0.574-0.178-0.875-0.178c-0.337,0-0.659,0.063-0.964,0.191c-0.306,0.128-0.579,0.344-0.82,0.649 c-0.242,0.306-0.431,0.699-0.567,1.183s-0.21,1.075-0.219,1.777c0.009,0.684,0.08,1.276,0.212,1.777 c0.132,0.501,0.314,0.911,0.547,1.23s0.497,0.556,0.793,0.711c0.296,0.155,0.608,0.232,0.937,0.232c0.1,0,0.234-0.007,0.403-0.021 c0.168-0.014,0.337-0.036,0.506-0.068c0.168-0.032,0.33-0.075,0.485-0.13c0.155-0.055,0.269-0.132,0.342-0.232v-2.488h-1.709 v-1.121H41.16z"style=fill:#FFF /></g><circle cx=18.931 cy=14.431 r=4.569 style=fill:#F3D55B /><polygon points="6.5,39 17.5,39 49.5,39 49.5,28 39.5,18.5 29,30 23.517,24.517 	"style=fill:#88C057 /></g></svg></div>
                                    <p class="text-primary-p"><h5>Name of Record</h5></p>
                                    <p class="text-secondary-p" style="padding-top:3%; font-weight: normal;">Some Description</p>
                                </div>
                            </div>
                    </div>-->
                </div>
                <br><br>
                <a href="addRecord.jsp"><button class="style" type="button">ADD NEW</button></a>
               </div>
            
                                                  
            <div id="modalBox" class="modal">

            <!-- Modal content -->
            <div id="printPart" class="modal-content">
                <span class="close">&times;  &nbsp;&nbsp;</span>
                <h3 style="text-align: center;">Medical Record Details</h3>
                <center>
                <img src="#" id="modal_image">
                <table style="border:none; text-align: left;">

                    <tr>
                        <td> Name of Record : </td>
                        <td id="modal_name"> ** </td>
                        <td> Description : </td>
                        <td id="modal_description"> ** </td>
                    </tr>

                  
                 </table><button id="print" class="btn"><i class="fa fa-envelope"> Print </i></button></center>

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
        document.getElementById("modal_name").innerHTML = name[index];
        document.getElementById("modal_description").innerHTML = description[index];
        document.getElementById("modal_image").src = "public/storage/rec/"+path[index];
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
    function displayRecord(finalId){
        
            document.getElementById("displayRecord").href = "public/storage/rec/"+path[finalId];
       
     
    
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
        
        var del = confirm("Are you sure you want delete this record permenently ?");
      
        if (del == true){
          
            window.location.href="deleterecord?id="+index;
       
        }
        
        

    }

   </script>
</html>
     
      