<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
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
          <link rel="stylesheet" type="text/css" href="./public/css/manageHospital.css" media="screen" />
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
                        <div class="main_title">
                             <div class="main_greeting">
                                 <h3>Manage Hospitals</h3>
                             </div>
                        </div> 
                        <form class="" action="BrowseHospital" method="GET" id="">
                            <input type="hidden" name="search" value="1"/>
                            <div class="card">
                                <div class="card_inner_profile">
                                     <p class="text-primary-p">Hospital Name</p>
                                    

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
                                            <button class="button" type="reset" id="clear" style="background: red"><b>Reset</b></button>
                                            <button class="button-success" type="submit"><b>Submit</b></button>     
                                       </div>
                                </div>
                            </div>
                        </form>
                                               
                        <hr>
                        <!--######################-->
                        <!--create button-->
                        <!--######################-->
                        <div class="buttons">
                            <a href="createhospital"><button class="button" ><b>Create a new hospital</b></button></a>
                        </div>
                        
                        <div class="charts">
                          
                            <div class="charts_table_div">
                                       <%
                                         if(request.getAttribute("hospitals")!=null){
                                         List<Hospital> table = (ArrayList<Hospital>)request.getAttribute("hospitals");
                                         if(table.size()>0){
                                        %>
                                        <!--js array-->
                                        <script>
                                        var Id = [];
                                        var licenseNumber = [];
                                        var name = [];
                                        var display_name = [];
                                        var district = [];
                                        var city = [];
                                        var pstatus = [];
                
                                        var size =<%= table.size() %>;
                                        </script>
                                        <table class="charts_table">
                                             <thead>
                                                  <tr>
                                                       <th>Hospital Id</th>
                                                       <th>License Number</th>
                                                       <th>Hospital Name</th>
                                                       <th>Display Name</th>
                                                       <th>District</th>
                                                       <th>City</th>
                                                       <th>Status</th>
                                                       <th>Action</th>
                                                  </tr>
                                             </thead>
                                             <tbody>
                                                   <% for(Hospital row : table) { %>
                                                  <tr id="id_<%= table.indexOf(row) %>" value="<%= table.indexOf(row) %>">
                                                       
                                                      <td><%=row.id%></td>
                                                       <td><%= row.getLicenseNumber() %></td>
                                                       <td><%= row.name %></td>
                                                       <td><%= row.displayName %></td>
                                                       <td><%= row.strCity %></td>
                                                       <td><%= row.strDistrict %></td>
                                                       <td style="color: <% if(row.status==1){out.print("green");}else if(row.status==2){out.print("orange");}else if(row.status==3){out.print("red");}else{out.print("brown");} %>"><% if(row.status==1){out.print("Active");}else if(row.status==2){out.print("Pending");}else if(row.status==3){out.print("BlackListed");}else{out.print("Inactive");} %></td>
                                                       <td><a href ="adminviewhospital.jsp"><button><i class="fa fa-eye"></i></button></a><a href ="AdminEditHospital.jsp"><button><i class="fa fa-edit"></i></button></a><button><i class="fa fa-trash"></i></button></td>
                                                  </tr>
                                                  <script>
                                                   Id[<%= table.indexOf(row)%>]                                 = <%=row.id%>;
                                                   licenseNumber[<%= table.indexOf(row) %>]                     = <%= row.getLicenseNumber() %>;
                                                   name[<%= table.indexOf(row) %>]                              = "<%= row.name %>";
                                                   display_name[<%= table.indexOf(row) %>]                      = "<%= row.displayName %>";
                                                   district[<%= table.indexOf(row) %>]                          = "<%= row.strDistrict %>";
                                                   city[<%= table.indexOf(row) %>]                              = "<%= row.strCity %>";
                                                   pstatus[<%= table.indexOf(row) %>]                           = <%= row.status %>;

                                                 </script>
      
                                                 <% } %>
                                               <% } } %>

                                                  <tr>
                                                       <td colspan="6"><a href="#">View More...</a></td>
                                                  </tr>
                                             </tbody>
                                        </table>
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