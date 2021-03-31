<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.medihub.patient.*"%>
<%@page import="com.medihub.pharmacy.*"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>


           <% 
               String username="";
               int getLimit=0;
               username= session.getAttribute("username").toString();
               int usertype = Integer.parseInt(session.getAttribute("usertype").toString());
               String getPharmacy="";
                     
               if (request.getParameter("pharmacy")!=null && request.getParameter("pharmacy")!="") {
                    getPharmacy=request.getParameter("pharmacy");
               }
                     
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
          <link rel="stylesheet" type="text/css" href="./public/css/Dashboard_Admin.css" media="screen" />
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
                        <form class="" action="BrowsePharmacyReviewsAdmin" method="GET" id="">
                            <input type="hidden" name="search" value="1"/>
                            <div class="card">
                                <i class="fa fa-stethoscope fa-2x text-red"></i>
                                <div class="card_inner_profile">
                                     <p class="text-primary-p">Pharmacy Name</p>
                                     <!--<p class="text-secondary-p pharmacy_select"><input placeholder="Search Pharmacy" type="text" name="pharmacy" id="pharmacy" maxlength="10" class="" value="<%= getPharmacy %>"/></p>-->

                                     <select class="text-secondary-p pharmacy_select" style="width: 100%" name="pharmacy" id="pharmacy">
                                         <option value="" disabled>Search Pharmacy</option>
                                         <%
                             if(request.getAttribute("allPharmacies")!=null){
                                 List<Pharmacy> table = (ArrayList<Pharmacy>)request.getAttribute("allPharmacies");
                                 if(table.size()>0){
                                     for(Pharmacy row : table) { %>
                                         <option value='<%= row.id %>'><%= row.displayName %> </option>
                         <%
                                 }}}
                         %>
                                     </select>
                                     <div class="buttons">
                                            <button class="button" type="reset" id="clear"><b>Reset</b></button>
                                            <button class="button-success" type="submit"><b>Submit</b></button>     
                                       </div>
                                </div>
                            </div>
                        </form>
                                 <!--checking for availability of pharmacy-->
                                        <%
                                             if(request.getAttribute("reviews")!=null){
                                                  
                                        %>
                                        <br>
                                        <% if(request.getAttribute("pharmacy")!=null){
                                           Pharmacy h = (Pharmacy)request.getAttribute("pharmacy"); 
                                        %>               
                         <div class="main_title">
                              <img src="./public/images/p3.jpg" alt="pharmacy Profile">
                              <div class="main_greeting">
                                   <h1><%=h.displayName%></h1>
                                   
                              </div>
                         </div>

                         <!-- change the main cards css fragments to change number of cards Available -->
                         <div class="main_cards">

                                   <%
                                             if(request.getAttribute("star")!=null){
                                                  int[] s = (int[])request.getAttribute("star");
                                                  
                                   %>
                              
                              <div class="card">
                                   <div class="card_inner">
                                        <p class="text-primary-p">Rating</p>
                                        <p>
                                            <% for(int i=0;i<s[0];i++) { %>
                                            <i class="fa fa-star fa-2x text-red"></i>
                                            <% } %>
                                            <% for(int i=0;i<s[1];i++) { %>
                                            <i class="fa fa-star-half-o fa-2x text-red"></i>
                                            <% } %>
                                            <% for(int i=0;i<s[2];i++) { %>
                                            <i class="fa fa-star-o fa-2x"></i>
                                            <% } %>
                                        </p>
                                   </div>
                              </div>
                                        
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
                                                  <h1>Reviews</h1>
                                                  <!-- <p>Something</p> -->
                                             </div>
                                             <!--<i class="fa fa-suitcase"></i>-->
                                        </div>
                                   
                                        <!--Review starts-->
                                        <!--checking for availability-->
                                        <%   
                                             if(request.getAttribute("reviews")!=null){
                                                  List<PharmacyReview> table = (ArrayList<PharmacyReview>)request.getAttribute("reviews");
                                                  if(table.size()>0){
                                                      
                                        %>
                                      
                                        

                                   <!-- limit the results to 5 in db query... view more option will lead to all results -->
                                        <div class="charts_table_div">
                                             <table id="avail" class="display charts_table" style="width:100%">
                                                  <thead>
                                                       <tr>
                                                            <th>Patient</th>
                                                            <th>Pharmacy</th>
                                                            <th>Description</th>
                                                            <th>Review</th>
                                                            <th>Action</th>
                                                       </tr>
                                                  </thead>
                                                  <tbody>
                                                       <% 
                                                           int cc = 0;
                                                           for(PharmacyReview row : table) { 
                                                                cc++;
                                                                if (cc>10){
                                                                    break;
                                                                }
                                                       %>
                                                       <tr>
                                                           <td class="<% if(Integer.parseInt(session.getAttribute("userid").toString())==row.patientId){out.print("text-blue");} %>">
                                                               <%= row.PatientFirstName %> <%= row.PatientLastName %>
                                                               <br>
                                                               <text style="font-size:10px;"><%= row.createdAt %></text>
                                                           </td>
                                                           <td style='white-space: normal;'><%= row.pharmacyName %></td>
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
                                                                <a class="button" id="" href="pharmacyReviewDelete?id=<%=row.id%>&pharmacy=<%=getPharmacy%>" onclick="return confirm('Are you sure?');"><i class="fa fa-trash"></i></a>
                                                                &nbsp;
                                                                <a class="button" id="" href="pharmacyReviewAccept?id=<%=row.id%>&pharmacy=<%=getPharmacy%>" onclick="return confirm('Are you sure want to Accept?');"><i class="fa fa-user-secret"></i></a>
                                                            </td>
                                                       </tr>
                                                       
                                
                                                        <% } %>
                                                        
                                                        
                                                  </tbody>
                                                   <tfoot>
                                                       <tr>
                                                            <th>Patient</th>
                                                            <th>Pharmacy</th>
                                                            <th>Description</th>
                                                            <th>Review</th>
                                                            <th>Action</th>
                                                       </tr>
                                                  </tfoot>
                                             </table>
                                                  
                                                  <% if(table.size()>10 || getLimit>0) { %>
                                                        <div class="card">
                                                        <p style="text-align: center;">
                                                            <% if(getLimit>0) { %>
                                                                <a href="BrowsePharmacyReviewsAdmin?search=1&pharmacy=<%=getPharmacy%>&limit=<%=getLimit-10%>">Prev</a>
                                                            <% } %>
                                                            &nbsp;
                                                            <% if(table.size()>10) { %>
                                                                <a href="BrowsePharmacyReviewsAdmin?search=1&pharmacy=<%=getPharmacy%>&limit=<%=getLimit+10%>">Next</a>
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
                                                      No Reviews available !
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
                                                  
                           <%
                                }
                                else
                                {
                                if(usertype==1) {
                           %>
                           <div class="card">
                                   <div class="card_inner">
                                        <p class="text-primary-p">Search For a Pharmacy</p>
                                   </div>
                              </div>
                           <%
                                }}
                           %>

                    </div>
                                                  
                    <!--######################-->
                        <!--container ending-->
                    <!--######################-->
                    
                    
                    <!-- Modal starts -->
                         <div id="modalBox" class="modal">

                              <!-- Modal content -->
                              <div id="printPart" class="modal-content">
                                   <span id="modalCloseIcon" class="close">&times;</span>
                                   <h3 style="text-align: center;">Update Review</h3>
                                   
                                   <form class="" action="updateReview" method="POST" id="submitForm">
                                        <div class="star-rating" id='modal-star'>
                                            
                                        </div>
                                       <input type="hidden" name="rating" id='ratingUpdate' value="">
                                       <input type="hidden" name="id" id='modal-id' value="">
                                       <input type="hidden" name="pharmacy" id='' value="<%=getPharmacy%>">
                                       <br>
                                       <textarea name="review" cols="50" rows="6" placeholder="Write Review" id='modal-review' value="" required></textarea>
                                       <div class="buttons">
                                            <button class="button" type="reset" id=""><b>Reset</b></button>
                                            <button class="button-success" type="submit"><b>Submit</b></button>     
                                       </div>
                                    </form>
                                       
                              </div>
                         </div>
                         <!--Modal content ends-->  
                    
                    

               </main>

                <!--######################-->
                <!--sidebar starting-->
                <!--######################-->
               
               <jsp:include page="<%="./public/includes/adminSidebar.jsp"%>"/>
                
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
                    
                    //select2
                    $('.pharmacy_select').select2({
                        placeholder: "Select Pharmacy",
                        allowClear: true,
                    }).val("<%=getPharmacy%>").trigger("change");
        
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
                
                function changeColour(qq)
                {
                    // alert($(qq).attr('id'));

                    $(".rateStar").css('color','black');
                    var s = $(".rateStar");
                    var r = $(qq).attr('title');
                    $("#ratingSubmit").val(r);
                    var i;
                    for (i = 0; i < r; i++) {
                        $(s[i]).css('color','orange');
                    }
                }
                
                function changeColourr(qq)
                {
                    // alert($(qq).attr('id'));

                    $(".rateStarr").css('color','black');
                    var s = $(".rateStarr");
                    var r = $(qq).attr('title');
                    $("#ratingUpdate").val(r);
                    var i;
                    for (i = 0; i < r; i++) {
                        $(s[i]).css('color','orange');
                    }
                }

          </script>

     </body>
</html>