<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.medihub.prescription.*"%>

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
                                   <p>Medical Reminders</p>
                              </div>
                         </div>

                         <div class="charts">
                             
                             
                                        <!--checking for availability-->
                                        <%
                                             if(request.getAttribute("reminders")!=null){
                                                 int flag2am=0;
                                                 int flag8am=0;
                                                 int flag2pm=0;
                                                 int flag8pm=0;
                                                 
                                                 int doc=0;
                                                 int pdoc=0;
                                                  List<PrescriptionItem> table = (ArrayList<PrescriptionItem>)request.getAttribute("reminders");
                                                  if(table.size()>0){
                                                      for(PrescriptionItem row : table) { 
                                                                    if(row.intervalId==8 || row.intervalId==12 || row.intervalId==24) {
                                                                        flag8am=1;
                                                                    }
                                                                    if(row.intervalId==8 || row.intervalId==25) {
                                                                        flag2pm=1;
                                                                    }
                                                                    if(row.intervalId==8 || row.intervalId==12 || row.intervalId==26) {
                                                                        flag8pm=1;
                                                                    }
                                                                    if(row.intervalId==6) {
                                                                        flag2am=1;
                                                                    }
                                                                }
                                        %>

                             <!--######################-->
                                <!-- 2am reminders -->
                             <!--######################-->
                             <% if(flag2am==1) { 
                                    doc=0;
                                    pdoc=0;
                             %>
                              <div class="charts_left">
                                   <!-- <div class=""> -->
                                        <div class="charts_left_title">
                                             <div>
                                                  <h1>2am Medications</h1>
                                                  <!-- <p>Something</p> -->
                                             </div>
                                        </div>

                                                       <% 
                                                           for(PrescriptionItem row : table) { 
                                                                if(row.intervalId==8) {
                                                                    doc=row.doctorId;
                                                       %>
                                                       <%if(doc!=pdoc) { 
                                                            pdoc=row.doctorId;
                                                       %>
                                                        <p class="text-primary-p">
                                                            Doctor <br> <%=row.doctorName%>
                                                        </p><br>
                                                        <% } %>
                                                        
                                                        <p class="text-secondary-p">
                                                            <%=row.tradeName%> (<%=row.genericName%>) <br>
                                                            Meal: <% if(row.mealPref==0){ out.println("Before Meals"); } else { out.println("Before Meals"); } %>
                                                            Dos: <%=row.dosage%><br>
                                                        </p>
                                                       
                                                        <% } } %>
                                                        
                                                        
                                                  
                                        </div>
                                                        <% } %>
                                        
                             <!--######################-->
                                <!--2am section ending-->
                             <!--######################-->

                             <!--######################-->
                                <!-- 8am reminders -->
                             <!--######################-->
                             <% if(flag8am==1) { 
                                    doc=0;
                                    pdoc=0;
                             %>
                              <div class="charts_left">
                                   <!-- <div class=""> -->
                                        <div class="charts_left_title">
                                             <div>
                                                  <h1>8am Medications</h1>
                                                  <!-- <p>Something</p> -->
                                             </div>
                                        </div>

                                                       <% 
                                                           for(PrescriptionItem row : table) { 
                                                                if(row.intervalId==8 || row.intervalId==12 || row.intervalId==24) {
                                                                    doc=row.doctorId;
                                                       %>
                                                       <%if(doc!=pdoc) { 
                                                            pdoc=row.doctorId;
                                                       %>
                                                        <p class="text-primary-p">
                                                            Doctor <br> <%=row.doctorName%>
                                                        </p><br>
                                                        <% } %>
                                                        
                                                        <p class="text-secondary-p">
                                                            <%=row.tradeName%> (<%=row.genericName%>) <br>
                                                            Meal: <% if(row.mealPref==0){ out.println("Before Meals"); } else { out.println("Before Meals"); } %>
                                                            Dos: <%=row.dosage%>
                                                        </p><br>
                                                       
                                                        <% } } %>
                                                        
                                                        
                                                  
                                        </div>
                                                        <% } %>
                                        
                             <!--######################-->
                                <!--8am section ending-->
                             <!--######################-->

                             <!--######################-->
                                <!-- 2pm reminders -->
                             <!--######################-->
                             <% if(flag2pm==1) { 
                                    doc=0;
                                    pdoc=0;
                             %>
                              <div class="charts_left">
                                   <!-- <div class=""> -->
                                        <div class="charts_left_title">
                                             <div>
                                                  <h1>2pm Medications</h1>
                                                  <!-- <p>Something</p> -->
                                             </div>
                                        </div>

                                                       <% 
                                                           for(PrescriptionItem row : table) { 
                                                                if(row.intervalId==8 || row.intervalId==25) {
                                                                    doc=row.doctorId;
                                                       %>
                                                       <%if(doc!=pdoc) { 
                                                            pdoc=row.doctorId;
                                                       %>
                                                        <p class="text-primary-p">
                                                            Doctor <br> <%=row.doctorName%><br>
                                                        </p>
                                                        <% } %>
                                                        
                                                        <p class="text-secondary-p">
                                                            <%=row.tradeName%> (<%=row.genericName%>) <br>
                                                            Meal: <% if(row.mealPref==0){ out.println("Before Meals"); } else { out.println("Before Meals"); } %>
                                                            Dos: <%=row.dosage%>
                                                        </p><br>
                                                       
                                                        <% } } %>
                                                        
                                                        
                                                  
                                        </div>
                                                        <% } %>
                                        
                             <!--######################-->
                                <!--2pm section ending-->
                             <!--######################-->

                             <!--######################-->
                                <!-- 8pm reminders -->
                             <!--######################-->
                             <% if(flag8pm==1) { 
                                    doc=0;
                                    pdoc=0;
                             %>
                              <div class="charts_left">
                                   <!-- <div class=""> -->
                                        <div class="charts_left_title">
                                             <div>
                                                  <h1>8pm Medications</h1>
                                                  <!-- <p>Something</p> -->
                                             </div>
                                        </div>

                                                       <% 
                                                           for(PrescriptionItem row : table) { 
                                                                if(row.intervalId==8 || row.intervalId==12 || row.intervalId==26) {
                                                                    doc=row.doctorId;
                                                       %>
                                                       <%if(doc!=pdoc) { 
                                                            pdoc=row.doctorId;
                                                       %>
                                                        <p class="text-primary-p">
                                                            Doctor <br> <%=row.doctorName%>
                                                        </p><br>
                                                        <% } %>
                                                        
                                                        <p class="text-secondary-p">
                                                            <%=row.tradeName%> (<%=row.genericName%>) <br>
                                                            Meal: <% if(row.mealPref==0){ out.println("Before Meals"); } else { out.println("Before Meals"); } %>
                                                            Dos: <%=row.dosage%>
                                                        </p><br>
                                                       
                                                        <% } } %>
                                                        
                                                        
                                                  
                                        </div>
                                                        <% } %>
                                        
                             <!--######################-->
                                <!--8pm section ending-->
                             <!--######################-->
                                   
                                        <!--when there is no pending reminders-->
                                                  <%
                                                       } }
                                                       else
                                                       {
                                                  %>
                                                  <div class="buttons">
                                                      No pending Reminders !
                                                      <a href="channelling"><button class="button-success" type=""><b>Channel a Doctor</b></button></a>    
                                                  </div>
                                                  <%
                                                       }
                                                  %>



                         </div>

                    </div>
                                                  
                    <!--######################-->
                        <!--container ending-->
                    <!--######################-->

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