<%@page import="com.medihub.records.MedicalRecords"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.medihub.doctor.*"%>
<%@page import="com.medihub.db.DbConfig"%>

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
        <link rel="stylesheet" type="text/css" href="./public/css/new_dash_doc.css" media="screen" />
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
                    <form method="GET" action="doctorrecords">
                        <div class="main_cards">
                            <div class="card">
                                <i class="fa fa-user fa-2x text-green"></i>
                                <div class="card_inner_profile">
                                    <p class="text-primary-p">Patient Name</p>


                                    <select class="text-secondary-p doctor_select" style="width: 100%" name="patient" id="doctor">
                                        <option value="" disabled>Search Patient</option>
                                    </select>
                                </div>
                            </div>
                            <div class="buttons">
                                <button class="button" type="reset" id="clear"><b>Reset</b></button>
                                <button class="button-success" type="submit"><b>Search</b></button>     
                            </div>
                        </div>
                        <%
                            if(request.getAttribute("records")!=null){
                                
                            List<MedicalRecords> mrl = (ArrayList<MedicalRecords>)request.getAttribute("records");
                            
                            if(mrl.size()>0){
                            
                        %>
                        <div class="main_title">
                            <div class="main_greeting">
                                
                                <h4>Medical Records of <%=mrl.get(0).patientName %></h4>
                                
                            </div>
                        </div>
                        <div class="main_cards">
                            <%for(MedicalRecords row:mrl){%>
                            <div class="card">
                                <!-- <i class="fa fa-user fa-2x text-green"></i>-->
                                <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/8/87/PDF_file_icon.svg/833px-PDF_file_icon.svg.png" width="50px">
                                <div class="card_inner_profile">
                                    <p class="text-primary-p"><%=row.name %></p>
                                    <p class="text-secondary-p"><a href="public/storage/rec/<%=row.path %>">Click to View</a></p>


                                </div>
                            </div>
                            <%}%>
                        </div>
                        <%}}%>
                    </form>
                </div>                            
                <!--######################-->
                <!--container ending-->
                <!--######################-->

            </main>

            <!--######################-->
            <!--sidebar starting-->
            <!--######################-->

            <jsp:include page="./public/includes/doctorSidebar.jsp"/>

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

    <script>

        $('.doctor_select').select2({
            placeholder: "Select Patient",
            minimumInputLength: 2,
            allowClear: true,
            ajax: {
                url: "getuser",
                dataType: 'json',
                type: "GET",
                quietMillis: 50,
                data: function (term) {
                    return {
                        q: term
                    };
                },
                processResults: function (data) {
                    return {
                        results: $.map(data, function (item) {
                            return {
                                text: item.fullNameWithEmail,
                                id: item.id
                            };
                        })
                    };
                },
                cache: true
            }
        });
    </script>
</html>