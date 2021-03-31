<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.medihub.doctor.*"%>

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
        <link rel="stylesheet" type="text/css" href="./public/css/managePatients.css" media="screen" />
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
                            <h3>Manage Appointments</h3>
                        </div>
                    </div> 
                    <form class="" action="manageappointments" method="GET" id="submitForm">

                        <div class="main_cards">

                            

                            <div class="card">
                                <i class="fa fa-medkit fa-2x text-green"></i>
                                <div class="card_inner_profile">
                                    <p class="text-primary-p">Search</p>

                                    <select class="text-secondary-p search_select" style="width: 100%" id="search">
                                        <option disabled=""selected><a href="">Choose Filter</a></option>
                                        <option value='Action'><a href="#">Doctor Name</a></option>
                                           
                                    </select>
                                </div>
                            </div>

                            <div class="card">
                                <i class="fa fa-filter fa-2x text-lightblue"></i>
                                <div class="card_inner_profile">
                                    <p class="text-primary-p">Value</p>
                                    <input name="searching" type="text" class="filter_text textt" style="width: 100%" >
                                </div>
                            </div>

                            <div class="buttons">
                                <button class="button-success" type="submit"><b>Search</b></button>
                                <button class="button" type="reset" id="clear" style="background: red"><b>Reset</b></button>
                            </div>
                            </form>

                        </div>
                    

                    <hr>
                    <div class="buttons">
                        <a href="createappointment" class=""><button class="button" ><b>Create Appointment</b></button></a>
                    </div>

                    <div class="charts">

                        <div class="charts_table_div">
                            <table class="charts_table">

                                </script>
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Doctor Name</th>
                                        <th>Start Time</th>
                                        <th>End Time</th>
                                        <th>Max patients</th>
                                        <th>Current patients</th>
                                        <th>Payment</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <%
                                    if (request.getAttribute("doctoravailability") != null) {

                                        List<DoctorAvailability> apList = (ArrayList<DoctorAvailability>) request.getAttribute("doctoravailability");
                                        
                                        int cc=0;
                                        for (int i = 0; i < apList.size(); i++) {
                                            
                                                                cc++;
                                                                if (cc>10){
                                                                    break;
                                                                }

                                %>
                                <tr>
                                    <td><%=apList.get(i).id%></td>
                                    <td><%=apList.get(i).doctorName%></td>
                                    <td><%=apList.get(i).date%><br><%=apList.get(i).startTime%></td>
                                    <td><%=apList.get(i).date%><br><%=apList.get(i).endTime%></td>
                                    <td><%=apList.get(i).maxCount%></td>
                                    <td><%=apList.get(i).count%></td>
                                    <td><%=apList.get(i).payment%></td>
                                    <td><button id="app_<%=apList.get(i).id%>" appId="<%=apList.get(i).id%>"><i class="fa fa-trash"></i></button></td>
                                </tr>
                                <% } %>
                               
                                </tbody>
                            </table>
                                                      
                                                        <% if(apList.size()>10 || getLimit>0) { %>
                                                        <div class="card">
                                                        <p style="text-align: center;">
                                                            <% if(getLimit>0) { %>
                                                                <a href="manageappointments?limit=<%=getLimit-10%>">Prev</a>
                                                            <% } %>
                                                            &nbsp;
                                                            <% if(apList.size()>10) { %>
                                                                <a href="manageappointments?limit=<%=getLimit+10%>">Next</a>
                                                            <% } %>
                                                        </p>
                                                        </div>
                                                        <% }} %>
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

            <jsp:include page="./public/includes/hospitalSidebar.jsp"/>

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
            $("[id^=app]").click(function(){
                
                var r = confirm('WARNING! Are you sure you want to delete this appointment? This process is Irriversible');
                if(r===true){
                    window.location.href="deleteappointment?aId="+$(this).attr("appId");
                }
                
            });
            
        </script>
    </body>
</html>