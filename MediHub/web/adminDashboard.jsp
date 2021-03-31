<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.medihub.patient.*"%>
<%@page import="com.medihub.doctor.DoctorReview"%>

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
          <link rel="stylesheet" type="text/css" href="./public/css/Dashboard_Admin.css" media="screen" />
          <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
     </head>

     <body>

          <% 
               String username="";
               username= session.getAttribute("username").toString();
                String absolutePath ="";
       
               try{
                    absolutePath = request.getAttribute("absolutePath").toString(); 
               }
               catch(NullPointerException ex){
                   absolutePath ="";
               }
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
                                   <i class="fa fa-bell fa-2x text-green"></i>
                                   <div class="card_inner">
                                        <p class="text-primary-p">Notifications</p>
                                        <span class="font-bold text-title">
                                           <%
                                             if(request.getAttribute("cnotifications")!=null){
                                                 out.print(request.getAttribute("cnotifications"));
                                             }
                                             else{
                                                 out.print("-");
                                             }
                                        %>
                                        </span>
                                   </div>
                              </div>
                         </div>
                         
                <div class="charts">
                          
                            <div class="charts_right">

                                   <div class="charts_right_title">
                                        <div>
                                             <h1>Pending Reviews</h1>
                                             <!-- <p>Something</p> -->
                                        </div>
                                        <!--<i class="fa fa-usd"></i>-->
                                   </div>

                                   <!-- limit the results to 5 in db query... view more option will lead to all resutls -->
                                   
                                   <%
                                             if(request.getAttribute("reviews")!=null){
                                                  List<DoctorReview> table = (ArrayList<DoctorReview>)request.getAttribute("reviews");
                                                  if(table.size()>0){
                                        %>
                                   <div class="charts_table_div">
                                             <table class="charts_table">
                                                  <thead>
                                                       <tr>
                                                            <th>Patient</th>
                                                            <th>Doctor</th>
                                                            <th>Description</th>
                                                            <th>Review</th>
                                                            <th>Action</th>
                                                       </tr>
                                                  </thead>
                                                  <tbody>
                                                       <% 
                                                           int cc = 0;
                                                           for(DoctorReview row : table) { 
                                                                cc++;
                                                                if (cc>5){
                                                                    break;
                                                                }
                                                       %>
                                                       <tr>
                                                           <td class="<% if(Integer.parseInt(session.getAttribute("userid").toString())==row.patientId){out.print("text-blue");} %>">
                                                               <%= row.PatientFirstName %> <%= row.PatientLastName %>
                                                               <br>
                                                               <text style="font-size:10px;"><%= row.createdAt %></text>
                                                           </td>
                                                           <td style='white-space: normal;'><%= row.doctorName %></td>
                                                           <td style='white-space: normal;'><%= row.description %></td>
                                                           <td>
                                                                <% for(int i=0;i<row.star[0];i++) { %>
                                                                <i class="fa fa-star text-red"></i>
                                                                <% } %>
                                                                <% for(int i=0;i<row.star[1];i++) { %>
                                                                <i class="fa fa-star-half-o text-red"></i>
                                                                <% } %>
                                                                <% for(int i=0;i<row.star[2];i++) { %>
                                                                <i class="fa fa-star-o"></i>
                                                                <% } %>
                                                           </td>
                                                            <td>
                                                                <a class="button" id="" href="doctorReviewDelete?id=<%=row.id%>" onclick="return confirm('Are you sure?');"><i class="fa fa-trash"></i></a>
                                                                &nbsp;
                                                                <a class="button" id="" href="doctorReviewAccept?id=<%=row.id%>" onclick="return confirm('Are you sure want to Accept?');"><i class="fa fa-user-secret"></i></a>
                                                            </td>
                                                       </tr>
                                                       
                                                        <% } %>
                                                        
                                                        <% if(table.size()>5) { %>
                                                        <tr>
                                                            <td colspan="6"><a href="BrowseDoctorReviewsAdmin">View More...</a></td>
                                                        </tr>
                                                        <% } %>
                                                  </tbody>
                                             </table>
                                        </div>
                                              
                                        <!--when there is no pending appointments-->
                                                  <%
                                                       } 
                                                        else
                                                       {
                                                       %>
                                                       <div class="buttons">
                                                      No pending Reviews for Doctor !
                                                  </div>
                                                       
                                                       <%
                                                        }
                                                        } else
                                                       {
                                                  %>
                                                  <div class="buttons">
                                                      No pending Reviews for Doctor !
                                                  </div>
                                                  <%
                                                       }
                                                  %>

                              </div>

                              </div>
                        </div>     
                                                  
                    <!--######################-->
                        <!--container ending-->
                    <!--######################-->

               </main>

                <!--######################-->
                <!--sidebar starting-->
                <!--######################-->
               
                <jsp:include page="./public/includes/adminSidebar.jsp"/>
                
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