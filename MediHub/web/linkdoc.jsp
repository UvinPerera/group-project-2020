<%-- 
    Document   : linkdoc
    Created on : Mar 27, 2021, 8:04:25 PM
    Author     : uvinp
--%>

<%@page import="com.medihub.doctor.Doctor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset=utf-8>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>MediHub</title>
        <link rel="icon" href="./public/images/onlylogo.png" type="image/icon type"> <!--Header icon-->
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@500&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Spartan:wght@600&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="./public/css/managePharmacy.css" media="screen" />
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
            <jsp:include page="./public/includes/navbar.jsp"/>

            <main>
                <div class="main_container">
                    <form method="GET" action="linkdoctor">
                        <div class="main_cards">
                            <div class="card">
                                <i class="fa fa-stethoscope fa-2x text-red"></i>
                                <div class="card_inner_profile">
                                    <p class="text-primary-p">Doctor Name</p>


                                    <select class="text-secondary-p doctor_select" style="width: 100%" name="doctor" id="doctor">
                                        <option value="" disabled>Search Doctor</option>
                                    </select>
                                </div>
                            </div>
                            <div class="buttons">
                                <button class="button" type="reset" id="clear"><b>Reset</b></button>
                                <button class="button-success" type="submit"><b>Search</b></button>     
                            </div>
                        </div>
                    </form>
                    <%
                        if (request.getAttribute("doctor") != null) {
                            Doctor d = (Doctor) request.getAttribute("doctor");
                            Boolean b = (Boolean) request.getAttribute("isLinked");
                    %>
                    <div class="charts">
                        <div class="charts_table_div">
                            <table class="charts_table">
                                <thead>
                                    <tr>
                                        <th> Doctor Id</th> 
                                        <th>Doctor Name</th>
                                        <th>Specialization 1</th>
                                        <th>Specialization 2</th>

                                        <th>Status</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td> <%=d.id%></td> 
                                        <td><%=d.doctorName%></td>
                                        <td><%=d.strSpecialisation_1%></td>
                                        <td><%=d.strSpecialisation_2%></td>
                                        <%if (b.booleanValue()) {%>
                                        <td style="color: green">Linked</td>
                                        <%} else {%>
                                        <td style="color: red">Not Linked</td>
                                        <%}%>
                                    </tr>
                                </tbody>
                            </table>

                        </div>
                        <div class="buttons">
                            <%if (!b.booleanValue()) {%>
                            <form method="POST" action="linkdoctor">
                                <input name="docId" type="hidden" value="<%=d.id%>">
                                <button class="button-success" type="submit"><b>Link Doctor</b></button> 
                            </form>
                            <%}%>
                        </div>

                    </div>
                    <%}%>

            </main>

            <jsp:include page="./public/includes/hospitalSidebar.jsp"/>

        </div>

        <jsp:include page="./public/includes/footer.jsp"/>

        <!--######################-->
        <!--footer ending-->
        <!--######################-->



        <script src="./public/js/new_script.js"></script>
    </body>

    <script>

        $('.doctor_select').select2({
            placeholder: "Select Doctor",
            minimumInputLength: 2,
            allowClear: true,
            ajax: {
                url: "getDoctors",
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
                                text: item.doctorName,
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
