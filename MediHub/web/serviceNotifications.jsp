<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.medihub.user.Notifications"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>

           <% 
               String username="";
               int getLimit=0;
               username= session.getAttribute("username").toString();
               int usertype = Integer.parseInt(session.getAttribute("usertype").toString());
                     
               if (request.getParameter("limit")!=null && request.getParameter("limit")!="") {
                    getLimit=Integer.parseInt(request.getParameter("limit"));
               }
          %>

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
          <% if(usertype==0) { %>
          <link rel="stylesheet" type="text/css" href="./public/css/new_dash.css" media="screen" />
          <% } else if(usertype==1) { %>
          <link rel="stylesheet" type="text/css" href="./public/css/new_dash.css" media="screen" />
          <% } else if(usertype==2) { %>
          <link rel="stylesheet" type="text/css" href="./public/css/new_dash_doc.css" media="screen" />
          <% } else if(usertype==3) { %>
          <link rel="stylesheet" type="text/css" href="./public/css/new_dash_hos.css" media="screen" />
          <% } else if(usertype==4) { %>
          <link rel="stylesheet" type="text/css" href="./public/css/new_dash.css" media="screen" />
          <% } %>
          <link rel="stylesheet" type="text/css" href="./public/css/patient_modal.css" media="screen" />
          <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.22/css/jquery.dataTables.css">
          <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/rowgroup/1.1.2/css/rowGroup.dataTables.min.css">
          <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
          <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
          <script type="text/javascript" src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.js"></script>
          <script type="text/javascript" src="https://cdn.datatables.net/rowgroup/1.1.2/js/dataTables.rowGroup.min.js"></script>
          <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
     </head>

     <body>

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
                        
                        <%if(request.getAttribute("alert")!=null) { %>
                                   <div class="message">
                                       <%if(request.getAttribute("alert").toString().equalsIgnoreCase("success")) { %>
                                            <p class="" style="background: green; color: white;"><%=request.getAttribute("message").toString()%></p>
                                       <% } %>
                                       <%if(request.getAttribute("alert").toString().equalsIgnoreCase("error")) { %>
                                            <p class="" style="background: red; color: white;"><%=request.getAttribute("message").toString()%></p>
                                       <% } %>
                                   </div>
                                   <% } %>
                                 
                         <!--<div class="charts">-->

                             <!--######################-->
                                <!--left table section starting-->
                             <!--######################-->
                              <div class="charts_left">
                                   <!-- <div class=""> -->
                                        <div class="charts_left_title">
                                             <div>
                                                  <h1>Notifications</h1>
                                                  <!-- <p>Something</p> -->
                                             </div>
                                             <!--<i class="fa fa-suitcase"></i>-->
                                        </div>
                                   
                                        <!--Review starts-->
                                        <!--checking for availability-->
                                        <%   
                                             if(request.getAttribute("notifications")!=null){
                                                  List<Notifications> table = (ArrayList<Notifications>)request.getAttribute("notifications");
                                                  if(table.size()>0){
                                                      
                                        %>

                                   <!-- limit the results to 5 in db query... view more option will lead to all results -->
                                        <div class="charts_table_div">
                                             <table id="avail" class="display charts_table" style="width:100%">
                                                  <thead>
                                                       <tr>
                                                            <th>Origin</th>
                                                            <th>Description</th>
                                                            <th>Read</th>
                                                       </tr>
                                                  </thead>
                                                  <tbody>
                                                       <% 
                                                           int cc = 0;
                                                           for(Notifications row : table) { 
                                                                cc++;
                                                                if (cc>10){
                                                                    break;
                                                                }
                                                       %>
                                                       <tr>
                                                           <td>
                                                               <%= row.fromName %>
                                                               <br>
                                                               <text style="font-size:10px;"><%= row.created_at %></text>
                                                           </td>
                                                           <td style='white-space: normal;'><%= row.description %></td>
                                                           <td>
                                                               <% if(row.status!=0) { %>
                                                                <button class="button" id="x<%= row.id %>" onclick="markAsRead('<%= row.id %>');"><i class="fa fa-eye"></i></button><span><i id="y<%= row.id %>" class="fa fa-lock text-primary-p" style="display: none;"></i></span>
                                                               <% } else { %>
                                                                <span><i id="y<%= row.id %>" class="fa fa-lock text-primary-p"></i></span>
                                                               <% } %>
                                                           </td>
                                                       </tr>
                                
                                                        <% } %>
                                                        
                                                        
                                                  </tbody>
                                                   <tfoot>
                                                       <tr>
                                                            <th>Origin</th>
                                                            <th>Description</th>
                                                            <th>Read</th>
                                                       </tr>
                                                  </tfoot>
                                             </table>
                                                  
                                                  <% if(table.size()>10 || getLimit>0) { %>
                                                        <div class="card">
                                                        <p style="text-align: center;">
                                                            <% if(getLimit>0) { %>
                                                                <a href="serviceNotifications?&limit=<%=getLimit-10%>">Prev</a>
                                                            <% } %>
                                                            &nbsp;
                                                            <% if(table.size()>10) { %>
                                                                <a href="serviceNotifications?limit=<%=getLimit+10%>">Next</a>
                                                            <% } %>
                                                        </p>
                                                        </div>
                                                        <%}%>
                                        </div>
                                              
                                        <!--when there is no pending appointments-->
                                                  <%
                                                       } }
                                                       else
                                                       { 
                                                  %>
                                                  <div class="buttons">
                                                      No Notifications available !
                                                      <!--<a href="channelling"><button class="button-success" type=""><b>Make New Appointment</b></button></a>-->    
                                                  </div>
                                                  <%
                                                       }
                                                  %>


                                    <!--</div>--> 
                              </div>
                             <!--######################-->
                                <!--left table section ending-->
                             <!--######################-->
                                                  
                                                  

                         <!--</div>-->
                                                  
                          

                    </div>
                                                  
                    <!--######################-->
                        <!--container ending-->
                    <!--######################-->

                    
                    

               </main>

                <!--######################-->
                <!--sidebar starting-->
                <!--######################-->
               
                <% 
                   String sidebar = "";
                    if(usertype==0) {
                        sidebar = "adminSidebar";
                    } 
                    else if(usertype==1) {
                        sidebar = "patientSidebar";
                    }
                    else if(usertype==2){
                        sidebar = "doctorSidebar";
                    }
                    else if(usertype==3){
                        sidebar = "hospitalSidebar";
                    }
                    else if(usertype==4){
                        sidebar = "pharmacySidebar";
                    }
                    else{
                        sidebar = "";
                    }
               %>
               <jsp:include page="<%="./public/includes/"+sidebar+".jsp"%>"/>
                
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
          <script>

                $(document).ready( function () {
                    
        
                    //data table
                    $('#avail').DataTable( {
//                        order: [[0, 'asc'], [1, 'asc']],
//                        rowGroup: {
//                            dataSrc: [ 0, 1 ]
//                        },
//                        columnDefs: [ {
//                            targets: [ 0, 1 ],
//                            visible: false
//                        } ]
                    } );
        
        
                } );
                
                function markAsRead(qq)
                {
                    $.ajax({
                        url: "markAsReadNotifications?id="+qq,
                        success: function(result){
                            $("#x"+qq).hide();
                            $("#y"+qq).show();
                        },
                        error: function(XMLHttpRequest, textStatus, errorThrown) { 
                            alert("Status: " + textStatus); alert("Error: " + errorThrown); 
                        } 
                    });
                }
                
          </script>

     </body>
</html>