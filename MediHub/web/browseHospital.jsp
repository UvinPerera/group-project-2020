<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.medihub.patient.*"%>
<%@page import="com.medihub.hospital.*"%>

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
          <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
          <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
          <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
     </head>

     <body>

          <% 
               String username="";
               username= session.getAttribute("username").toString();
               
               String getHospital="";
                     
               if (request.getParameter("hospital")!=null && request.getParameter("hospital")!="") {
                    getHospital=request.getParameter("hospital");
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
                        
                        <form class="" action="BrowseHospital" method="GET" id="">
                            <input type="hidden" name="search" value="1"/>
                            <div class="card">
                                <i class="fa fa-stethoscope fa-2x text-red"></i>
                                <div class="card_inner_profile">
                                     <p class="text-primary-p">Hospital Name</p>
                                     <!--<p class="text-secondary-p hospital_select"><input placeholder="Search Hospital" type="text" name="hospital" id="hospital" maxlength="10" class="" value="<%= getHospital %>"/></p>-->

                                     <select class="text-secondary-p hospital_select" style="width: 100%" name="hospital" id="hospital">
                                         <option value="" disabled>Select Hospital</option>
                                         <%
                             if(request.getAttribute("allHospitals")!=null){
                                 List<Hospital> table = (ArrayList<Hospital>)request.getAttribute("allHospitals");
                                 if(table.size()>0){
                                     for(Hospital row : table) { %>
                                         <option value='<%= row.id %>'><%= row.displayName %></option>
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
                                 <!--checking for availability of hospital-->
                                        <%
                                             if(request.getAttribute("hospital")!=null){
                                                  Hospital h = (Hospital)request.getAttribute("hospital");
                                                  
                                        %>
                                        <br>
                         <div class="main_title">
                              <img src="./public/images/p3.jpg" alt="hospital Profile">
                              <div class="main_greeting">
                                   <h1><%=h.displayName%></h1>
                                   
                              </div>
                         </div>

                         <!-- change the main cards css fragments to change number of cards Available -->
                         <div class="main_cards">

                              <div class="card">
                                   <!--<i class="fa fa-user-o fa-2x text-lightblue"></i>-->
                                   <div class="card_inner">
                                       <!--<p class="text-primary-p">Address</p>-->
                                       <p><%=h.address1%><br><%=h.address2%></p>
                                   </div>
                              </div>

                              <div class="card">
                                   <p class="text-primary-p">District / City</p>
                                   <div class="card_inner">
                                        <p class=""><%=h.strCity%></p>
                                        <p class=""><%=h.strDistrict%></p>
                                   </div>
                              </div>
                                   
                              <div class="card">
                                   <p class="text-primary-p">Tel Number / Fax</p>
                                   <div class="card_inner">
                                        <p class=""><%=h.landNumber%></p>
                                        <p class=""><%=h.fax%></p>
                                   </div>
                              </div>
                                   
                              <div class="card">
                                   <p class="text-primary-p">Email</p>
                                   <div class="card_inner">
                                        <p class=""><%=h.email%></p>
                                   </div>
                              </div>
                                   
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
                              
                              <div class="card">
                                   <i class="fa fa-book fa-2x text-yellow"></i>
                                   <div class="card_inner">
                                        <p class="text-primary-p">
                                            <a href="channelling?search=0&hospital=<%=h.id%>&hospital=&specialisation=&date=&limit=" class="button-success"><button class="button-success" type=""><b>Channel Hospital</b></button></a>
                                        </p>
                                   </div>
                              </div>

                         </div>

                         <div class="charts">

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
                                                  List<HospitalReview> table = (ArrayList<HospitalReview>)request.getAttribute("reviews");
                                                  if(table.size()>0){
                                                      
                                        %>
                                        
                                        <!--js array-->
                                        <script>
                                             var id = [];
                                             var rating = [];
                                             var star0 = [];
                                             var star1 = [];
                                             var star2 = [];
                                             var description = [];
                                             var size =<%= table.size() %>;
                                        </script>
                                        <!--js array end-->
                                        

                                   <!-- limit the results to 5 in db query... view more option will lead to all results -->
                                        <div class="charts_table_div">
                                             <table class="charts_table">
                                                  <thead>
                                                       <tr>
                                                            <th>Patient</th>
                                                            <th style='white-space: normal;'>Description</th>
                                                            <th>Review</th>
                                                       </tr>
                                                  </thead>
                                                  <tbody>
                                                       <% 
                                                           int cc = 0;
                                                           for(HospitalReview row : table) { 
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
                                                                <% if(Integer.parseInt(session.getAttribute("userid").toString())==row.patientId) { %>
                                                                <br>
                                                                <button class="button" id="popUp" onclick="popup('<%= table.indexOf(row) %>');" index="<%= table.indexOf(row) %>"><i class="fa fa-edit"></i></button>
                                                                <a class="button" id="" href="hospitalReviewDelete?id=<%=row.id%>&hospital=<%=getHospital%>" onclick="return confirm('Are you sure?');"><i class="fa fa-trash"></i></a>
                                                                <% } %>
                                                            </td>
                                                       </tr>
                                                       
                                                       <script>
                                                            id[<%= table.indexOf(row) %>]                   =<%= row.id %>;
                                                            rating[<%= table.indexOf(row) %>]               =<%= row.rating %>;
                                                            star0[<%= table.indexOf(row) %>]                =<%= row.star[0] %>;
                                                            star1[<%= table.indexOf(row) %>]                =<%= row.star[1] %>;
                                                            star2[<%= table.indexOf(row) %>]                =<%= row.star[2] %>;
                                                            description[<%= table.indexOf(row) %>]          ="<%= row.description %>";
                                                                
                                                        </script>
                                
                                                        <% } %>
                                                        
                                                        <% if(table.size()>5) { %>
                                                        <tr>
                                                            <td colspan="6"><a href="BrowseHospitalReviews?search=1&hospital=<%=getHospital%>">View More...</a></td>
                                                        </tr>
                                                        <% } %>
                                                  </tbody>
                                             </table>
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
                                                  
                                                  
                                                  
                                                  
                              <!--######################-->
                                <!--right table section starting-->
                             <!--######################-->
                              <div class="charts_right">

                                   <div class="charts_right_title">
                                        <div>
                                             <h1>Write Review</h1>
                                             <!-- <p>Something</p> -->
                                        </div>
                                        <!--<i class="fa fa-usd"></i>-->
                                   </div>

                                   <div class="charts_table_div">
                                       <form class="" action="submitReviewH" method="POST" id="">
                                        <div class="star-rating">
                                            <span onclick="changeColour(this);" id='one' class="rateStar fa fa-star" title="1" style="color: orange;"></span>
                                            <span onclick="changeColour(this);" id='two' class="rateStar fa fa-star" title="2"></span>
                                            <span onclick="changeColour(this);" id='three' class="rateStar fa fa-star" title="3"></span>
                                            <span onclick="changeColour(this);" id='four' class="rateStar fa fa-star" title="4"></span>
                                            <span onclick="changeColour(this);" id='five' class="rateStar fa fa-star" title="5"></span>
                                        </div>
                                       <input type="hidden" name="rating" id='ratingSubmit' value="1">
                                       <input type="hidden" name="hospital" id='' value="<%=getHospital%>">
                                       <br>
                                       <textarea name="review" cols="50" rows="6" placeholder="Write Review" value="" required></textarea>
                                       <div class="buttons">
                                            <button class="button" type="reset" id=""><b>Reset</b></button>
                                            <button class="button-success" type="submit"><b>Submit</b></button>     
                                       </div>
                                       </form>
                                   </div>

                              </div>
                             <!--######################-->
                                <!--right table section ending-->
                             <!--######################-->

                         </div>
                                                  
                           <%
                                }
                                else
                                {
                           %>
                           <div class="card">
                                   <div class="card_inner">
                                        <p class="text-primary-p">Search For a Hospital</p>
                                   </div>
                              </div>
                           <%
                                }
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
                                   
                                   <form class="" action="updateReviewH" method="POST" id="submitForm">
                                        <div class="star-rating" id='modal-star'>
                                            
                                        </div>
                                       <input type="hidden" name="rating" id='ratingUpdate' value="">
                                       <input type="hidden" name="id" id='modal-id' value="">
                                       <input type="hidden" name="hospital" id='' value="<%=getHospital%>">
                                       <br>
                                       <textarea name="review" cols="50" rows="6" placeholder="Write Review" id='modal-review' value="" required></textarea>
                                       <div class="buttons">
                                            <button class="button" type="reset" id="clear"><b>Reset</b></button>
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
          <script>

                $(document).ready( function () {
                    
                    //select2
                    $('.hospital_select').select2({
                        placeholder: "Select Hospital",
                        allowClear: true,
                    }).val("<%=getHospital%>").trigger("change");
        
        
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

                    
                  //    #########################
               //    modal script start
               //    #########################

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
               //        var index=btn.getAttribute("index");
               var index = indexId;
               
               var i=0;
               document.getElementById("modal-star").innerHTML="";
               for(i=0;i<rating[index];i++) {
                       document.getElementById("modal-star").innerHTML += "<span onclick=\"changeColourr(this);\" id='one' class=\"rateStarr fa fa-star\" title=\""+(i+1)+"\" style=\"color: orange;\"></span>";
               }
               var j=0;
               for(j=i;j<5;j++) {
                       document.getElementById("modal-star").innerHTML += "<span onclick=\"changeColourr(this);\" id='one' class=\"rateStarr fa fa-star\" title=\""+(j+1)+"\"></span>";
               }
               
               $("#ratingUpdate").val(rating[index]);
               $("#modal-review").val(description[index]);
               $("#modal-id").val(id[index]);
               
               }

               // When the user clicks on <span> (x), close the modal
               span.onclick = function () {
               modal.style.display = "none";

               document.getElementById("modal-star").innerHTML = "";
               $("#ratingUpdate").val(0);
               $("#modal-review").val("");
               $("#modal-id").val(0);

               }

               // When the user clicks anywhere outside of the modal, close it
               window.onclick = function (event) {
               if (event.target == modal) {
                    modal.style.display = "none";

                    document.getElementById("modal-star").innerHTML = "";
               $("#ratingUpdate").val(0);
               $("#modal-review").val("");
               $("#modal-id").val(0);
               
               }
               }


               //    #########################
               //    modal script end
               //    #########################


          </script>

     </body>
</html>