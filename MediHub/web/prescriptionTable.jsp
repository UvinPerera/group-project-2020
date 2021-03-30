
<%@page import="java.util.List"%>
<%@page import="com.medihub.prescription.PrescriptionItem"%>
<%@page import="com.medihub.prescription.Prescription"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
  <meta charset=utf-8>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>MediHub</title>
  <link rel="icon" href="./public/images/onlylogo.png" type="image/icon type"> <!--Header icon-->
  <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@500&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Spartan:wght@600&display=swap" rel="stylesheet">
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>

  <style>

        table {
            font-family: 'Montserrat','sans-serif';
             border-collapse: collapse;
             margin: 25px 0;
             font-size: 0.9em;
             min-width: 400px;
             width: 100%;
             border-radius: 5px 5px 0 0;
             box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
        }

        thead tr {
             background-color: #0087a1;
             color: #ffffff;
             text-align: center;
             font-weight: bold;
        }

        th,  td {
             padding: 12px 15px;
             white-space: nowrap;
             text-overflow: ellipsis;
        }

        td {
             font-weight: 700;
             text-align: center;
        }

        td button{
             margin: 0 5px;
             border-radius: 5px;
        }

        tbody tr {
             border-bottom: 1px solid #dddddd;
        }

        tbody tr:nth-of-type(even) {
             background-color: #f3f3f3;
        }

        tbody tr:last-of-type {
             border-bottom: 2px solid #0087a1;
        }

         tbody tr:hover {
             color: rgba(0, 0, 0, 0.6);
        }


  </style>
</head>
  <body id="printPart">
    <table>
      <thead>
        <th>Generic Name </th>
        <th>Trade Name</th>
        <th>Dosage</th>
        <th>Interval</th>
        <th>Duration </th>
        <th>Meal Preference</th>
      </thead>
      <tbody>
          <%
          Prescription p = (Prescription)request.getAttribute("prescription");
          List <PrescriptionItem> lst = p.presItems ;
          for(PrescriptionItem row : lst){
          %>
        <tr>
          <td><%=row.genericName %></td>
          <td><%=row.tradeName %></td>
          <td><%=row.dosage %></td>
          <% if(row.intervalId==8){ %>
          <td>Three times a Day</td>
          <% }%>
          <% if(row.intervalId==12){ %>
          <td>Twice a Day</td>
          <% }%>
          <% if(row.intervalId==24){ %>
          <td>Once a Day (Morning)</td>
          <% }%>
          <% if(row.intervalId==25){ %>
          <td>Once a Day (Evening)</td>
          <% }%>
          <% if(row.intervalId==26){ %>
          <td>Once a Day (Night)</td>
          <% }%>
          <td><%=row.duration %></td>
          <%if(row.mealPref==0){%>
          <td>Before Meals</td>
          <%}else{%>
          <td>After Meals</td>
          <%}%>
        </tr>
        <%}%>
        <button id="print" class="btn"><i class="fa fa-envelope"> Print </i></button>
      </tbody>
    </table>
        <script>
            var print = document.getElementById("print");
              print.onclick = function () {
        print.style.display = "none";
        var win = window.open();
        var printContent = $("#printPart").html();

        $(win.document.body).html(printContent);
        win.print();
        print.style.display = "block";
    }
         </script>
  </body>
  </html>