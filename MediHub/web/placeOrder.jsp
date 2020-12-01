<!doctype html>
<%@page import="com.medihub.location.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<html>
<head>
  <meta charset=utf-8>
  <title>MediHub</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@500&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Spartan:wght@600&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" type="text/css" href="./public/css/placeorder.css" media="screen"/>
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>

</head>
<body>

  <div class="navbar" id="navbar">
      <ul>
        <li><button class="styled" type="button" onclick="window.location.href='logout';"> LOGOUT </button></li>
        <li><button class="styled" type="button" onclick="window.location.href='patient'"> Dashboard </button></li>
       <li><a href="About.jsp" id="end">About</a></li>
      <li><a href="contactUs.jsp">Contact</a></li>
      <li><a href="EmergencyServices.jsp">Emergency Services</a></li>
      <li><a href="/MediHub">Home</a></li>
        <li id="logo"><img src="./public/images/onlylogo.png" width="15.5%"></li>
      </ul>
  </div>

  <div class="container">
    <h1>Order Form</h1><br>
    <form action="submitorder" method="post">

      <div class="dropdown">
        <div class="filterContainer">
        <div class="filtername"><h2 class="name">Select Your District </h2></div>
        <div class="filter"><select name='district' id="district">
                 <option value='' selected>Select District</option>
                 <%
                            if(request.getAttribute("districts")!=null){
                                List<District> table = (ArrayList<District>)request.getAttribute("districts");
                                if(table.size()>0){
                                    for(District row : table) { %>
                                        <option value='<%= row.id %>'><%= row.nameEn %></option>
                        <%
                                }}}
                        %>
                      
        </select>
      </div>
    </div>
      <div class="filterContainer">
        <div class="filtername"><h2 class="name">Select Your City </h2></div>
        <div class="filter"><select name='city' id="city" class="filter_dropdown">
                    <option value='' selected>Select City</option>

                </select>
      </div>
    </div>
    <div class="filterContainer">
      <div class="filtername"><h2 class="name">Select a preferred Pharmacy </h2></div>
      <div class="filter">
     <select name='pharmacy' id="pharmacy" class="filter_dropdown">
                    <option value='' selected>Select pharmacy</option>

      </select>
      </div>
    </div>
  </div>
  <h2 class="details">Prescription</h2>
   <input class="input" type="file" name="file_path" id="email" placeholder="Select Image">

  <h2 class="details">Description</h2>
   <input class="input" type="text" name="description" id="email" placeholder="Enter description">

   <div class="button-container">
         <button class="button" id="id" type="button" onclick="window.location.href='patient';"><b>Cancel</b></button>
         <button class="button" type="reset" id="clear"><b>Clear</b></button>
         <button class="button" type="submit"><b>Submit</b></button>

  </div>
    </form>







  </div>

  </body>
  </html>
<script>
    
    //date selection limiting
    function validDate(){
        var today = new Date().toISOString().split('T')[0];
        var nextWeekDate = new Date(new Date().getTime() + 7 * 24 * 60 * 60 * 1000).toISOString().split('T')[0];
        document.getElementsByName("date")[0].setAttribute('min', today);
        document.getElementsByName("date")[0].setAttribute('max', nextWeekDate);
    }
    
//    $('#date').click(function(){
//        validDate();
//    });
    
//    onchange district
    $('#district').change(function(){
        var districtId=$(this).find(':selected').val();
        $('#doctorAvailability').html("<tr><td class=\"Row\" colspan=\"5\">Select Filters</td></tr>");
        
        $.ajax({
            url: "getcityasstring",
            type: "get", //send it through get method
            data: { 
              stage: "district", 
              district: districtId
            },
            success: function(response) {
              //populate city data
//              alert(response);
              $('#city').html("<option>Select City</option>"+response);
            },
            error: function(xhr) {
                alert("CityByDistrict Error");
            }
          });

    });
    
//    onchange city
    $('#city').change(function(){
        var cityId=$(this).find(':selected').val();
        $('#doctorAvailability').html("<tr><td class=\"Row\" colspan=\"5\">Select Filters</td></tr>");
        
        $.ajax({
            url: "getpharmacybycityasstring",
            type: "get", //send it through get method
            data: { 
              stage: "city", 
              city: cityId
            },
            success: function(response) {
              //populate city data
//              alert(response);
              $('#pharmacy').html("<option>Select Pharmacy</option>"+response);
            },
            error: function(xhr) {
                alert("PharmacyByCity Error");
            }
          });

    });
    

    
 
//    });
    
</script>