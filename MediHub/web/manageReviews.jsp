<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>


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
                                 <h3>Manage Reviews</h3>
                             </div>
                        </div> 
                        <form class="" action="manageReview" method="GET" id="submitForm">
                             <input type="hidden" name="searching" value=""/>
                        <div class="main_cards">

                            <div class="card">
                                      <i class="fa fa-search-plus fa-2x text-red"></i>
                                      <div class="card_inner_profile">
                                           <p class="text-primary-p">Status</p>
                                           
                                           <select class="text-secondary-p status_select" style="width: 100%" name='status' id="status">
                                               <option value='Action' selected><a href="">All</a></option>
                                               <option value='Action'><a href="#">Responded</a></option>
                                               <option value='Action'><a href="#">Not yet responded</a></option>
                                           </select>
                                      </div>
                             </div>

                                 <div class="card">
                                      <i class="fa fa-medkit fa-2x text-green"></i>
                                      <div class="card_inner_profile">
                                           <p class="text-primary-p">Search</p>
                                               
                                               <select name='search' class="text-secondary-p search_select" style="width: 100%" id="search">
                                                   <option value='Action' selected><a href="">All</a></option>
                                                   <option value='Action'><a href="#">Review ID</a></option>
                                                   <option value='Action'><a href="#">Patient ID</a></option>
                                                   <option value='Action'><a href="#">patient Name</a></option>
                                                   <option value='Action'><a href="#">Date</a></option>
                                                   <option value='Action'><a href="#">Status</a></option>
                                               </select>
                                      </div>
                                 </div>

                                 <div class="card">
                                      <i class="fa fa-filter fa-2x text-lightblue"></i>
                                      <div class="card_inner_profile">
                                          <p class="text-primary-p">Value</p>
                                            <input type="text" class="filter_text textt" style="width: 100%" >
                                      </div>
                                 </div>
               
                                 <div class="buttons">
                                   <button class="button-success" type="submit"><b>Search</b></button>
                                   <button class="button" type="reset" id="clear" style="background: red"><b>Reset</b></button>
                                 </div>


                            </div>
                              </form>
                                               
                        <hr>
                        <br>
                        
                        <div class="charts">
                          
                            <div class="charts_table_div">
                                        <table class="charts_table">
                                             <thead>
                                                  <tr>
                                                      <th>Review ID</th>
                                                       <th>Patient ID</th>
                                                       <th>Patient Name</th>
                                                       <th>Date</th>
                                                       <th>Status</th>
                                                       <th>Action</th>
                                                  </tr>
                                             </thead>
                                             <tbody>
                                                  <tr>
                                                       <td>1</td> 
                                                       <td>1</td>
                                                       <td>Patient 1</td>
                                                       <td>Weligama</td>
                                                       <td>Active</td>
                                                       <td><button><i class="fa fa-eye"></i></button><button><i class="fa fa-reply-all"></i></button></td>
                                                  </tr>
                                                  <tr>
                                                       <td>1</td>
                                                       <td>1</td>
                                                       <td>Patient 1</td>
                                                       <td>Weligama</td>
                                                       <td>Active</td>
                                                       <td><button><i class="fa fa-eye"></i></button><button><i class="fa fa-reply-all"></i></button></td>
                                                  </tr>
                                                  <tr>
                                                       <td>1</td>
                                                       <td>1</td>
                                                       <td>Patient 1</td>
                                                       <td>Weligama</td>
                                                       <td>Active</td>
                                                       <td><button><i class="fa fa-eye"></i></button><button><i class="fa fa-reply-all"></i></button></td>
                                                  </tr>
                                                  <tr>
                                                       <td>1</td>
                                                       <td>1</td>
                                                       <td>Patient 1</td>
                                                       <td>Weligama</td>
                                                       <td>Active</td>
                                                       <td><button><i class="fa fa-eye"></i></button><button><i class="fa fa-reply-all"></i></td>
                                                  </tr>
                                                  <tr>
                                                       <td>1</td> 
                                                       <td>1</td>
                                                       <td>Patient 1</td>
                                                       <td>Weligama</td>
                                                       <td>Active</td>
                                                       <td><button><i class="fa fa-eye"></i></button><button><i class="fa fa-reply-all"></i></button></td>
                                                  </tr>
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