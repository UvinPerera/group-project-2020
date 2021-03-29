<%@page import="com.medihub.user.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.medihub.doctor.*"%>
<%@page import="com.medihub.location.*"%>

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
          <link rel="stylesheet" type="text/css" href="./public/css/admin_new_css.css" media="screen" />
          <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
     </head>

     <body>

          <% 
               String username="";
               username= session.getAttribute("username").toString();
               int userType = Integer.parseInt(session.getAttribute("usertype").toString());
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

                         <div class="main_title">
                             <!--<img src="./public/images/p3.jpg" alt="hello">-->
                              <div class="main_greeting">
                                   <h1>Hello <%=username%></h1>
                                   <p>Edit doctor</p>
                              </div>
                         </div>
                        
                        <%
                            if(request.getAttribute("profile")!=null){
                                User row = (User)request.getAttribute("profile");
                                
                                
                        %>

                         <!-- change the main cards css fragments to change number of cards Available -->
                         <form class="" action="adminupdatedoctor" method="POST" id="updateForm">
                             <input type="hidden" name="did" value="<%=row.id%>">
                            <div class="main_cards">
                                
                              <div class="card">
                                   <div class="card_inner_profile">
                                        <p class="text-primary-p">First Name</p>
                                        <input class="data" type="text" name="first_name" id="firstname" placeholder="First Name" value="<%= row.firstName %>">
                                        <div class="alert-danger" id="firstNameError">
                                            * First name can't be empty and must contain only letters
                                        </div>
                                   </div>
                              </div>

                              <div class="card">
                                   <div class="card_inner_profile">
                                        <p class="text-primary-p">Last Name</p>
                                        <input class="data" type="text" name="last_name" id="lastname" placeholder="Last Name" value="<%= row.lastName %>">
                                        <div class="alert-danger" id="lastNameError">
                                            * Last name can't be empty and must contain only letters
                                        </div>
                                   </div>
                              </div>

                              <div class="card">
                                   <div class="card_inner_profile">
                                        <p class="text-primary-p">Display Name</p>
                                        <input class="data" type="text" name="display_name" id="displayName" placeholder="Display Name" value="<%= row.displayName %>">
                                        <div class="alert-danger" id="displayNameError">
                                            * Display name can't be empty and must contain only alphanumeric
                                        </div>
                                   </div>
                              </div>
                                                            
                              <div class="card">
                                   <div class="card_inner_profile">
                                        <p class="text-primary-p">Email</p>
                                        <p class="text-secondary-p"><%= row.email %></p>
                                   </div>
                              </div>         

                              <div class="card">
                                   <div class="card_inner_profile">
                                        <p class="text-primary-p">NIC</p>
                                        <p class="text-secondary-p"><%= row.nic %></p>
                                   </div>
                              </div>
                             
                              <div class="card">
                                   <div class="card_inner_profile">
                                        <p class="text-primary-p">Date of Birth</p>
                                        <p class="text-secondary-p"><%= row.dob %></p>
                                   </div>
                              </div>

                              <div class="card">
                                   <div class="card_inner_profile">
                                        <p class="text-primary-p">Gender</p>
                                        <p class="text-secondary-p"><% if(row.gender.equalsIgnoreCase("M")){out.print("Male");}else if(row.gender.equalsIgnoreCase("F")){out.print("Female");}else{out.print("Not Specified");} %></p>
                                   </div>
                              </div>
                             

                              <div class="card">
                                   <div class="card_inner_profile">
                                        <p class="text-primary-p">District</p>
                                        <select class="data" name="district" id="district">
                                                            <%
                                                                if(request.getAttribute("districts")!=null){
                                                                    List<District> districts = (ArrayList<District>)request.getAttribute("districts");
                                                                    if(districts.size()>0){
                                                                        for(District district : districts) { %>
                                                                            <option value='<%= district.id %>' <% if(district.id==row.district){out.print("Selected");}%>><%= district.nameEn %></option>
                                                            <%
                                                                    }}}
                                                            %>

                                        </select>
                                        <div class="alert-danger" id="districtError">
                                            * Select valid district
                                        </div>
                                   </div>
                              </div>

                              <div class="card">
                                   <div class="card_inner_profile">
                                        <p class="text-primary-p">City</p>
                                        <select class="data" name="city" id="city">
                                                            <%
                                                                if(request.getAttribute("cities")!=null){
                                                                    List<City> cities = (ArrayList<City>)request.getAttribute("cities");
                                                                    if(cities.size()>0){
                                                                        for(City city : cities) { %>
                                                                            <option value='<%= city.id %>' <% if(city.id==row.city){out.print("Selected");}%>><%= city.nameEn %></option>
                                                            <%
                                                                    }}}
                                                            %>

                                        </select>
                                        <div class="alert-danger" id="cityError">
                                            * Select valid city
                                        </div>
                                   </div>
                              </div>

                              <div class="card">
                                   <div class="card_inner_profile">
                                        <p class="text-primary-p">Address 1</p>
                                        <input class="data" type="text" name="address_1" id="address1" placeholder="Address 1" value="<%= row.address1 %>">
                                        <div class="alert-danger" id="addressError">
                                            * Address 1 can't be empty
                                        </div>
                                   </div>
                              </div>
                                        
                              <div class="card">
                                   <div class="card_inner_profile">
                                        <p class="text-primary-p">Address 2</p>
                                        <input class="data" type="text" name="address_2" id="address2" placeholder="Address 2" value="<%= row.address2 %>">
<!--                                        <div class="alert-danger" id="addressError">
                                            * Address 2 can't be empty
                                        </div>-->
                                   </div>
                              </div>
                                                           
                             <div class="card">
                                   <div class="card_inner_profile">
                                        <p class="text-primary-p">Mobile Number</p>
                                        <input class="data" type="text" name="mobile_number" id="mobile_number" placeholder="Mobile number" value="<%= row.mobileNumber %>">
                                        <div class="alert-danger" id="numberError">
                                            * Enter valid mobile number
                                        </div>                                   
                                   </div>
                              </div>
                             
                             <div class="card">
                                   <div class="card_inner_profile">
                                        <p class="text-primary-p">Land Number</p>
                                        <input class="data" type="text" name="land_number" id="land_number" placeholder="Land number" value="<%= row.landNumber %>">
                                        <div class="alert-danger" id="landNumberError">
                                            * Enter valid land number
                                        </div>                                   
                                   </div>
                              </div>



                         </div>
                                                                     
                              
                              <div class="buttons">
                                <button class="button" type="reset" id="clear"><b>Reset</b></button>
                                <button class="button-success" type="submit"><b>Update</b></button>     
                              </div>
                         </form>
                         
                        <% } %>
                        
                    </div>

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
          
          
          <script>
        
            $("#firstNameError").hide();
            $("#lastNameError").hide();
            $("#displayNameError").hide();
            $("#addressError").hide();
            $("#cityError").hide();
            $("#districtError").hide();
            $("#numberError").hide();
            $("#landNumberError").hide();

            $("#updateForm").on('submit',function(e){
//                event.preventDefault();
                //to always refresh when submitting (hide and show only relevant)
                $("#firstNameError").hide();
                $("#lastNameError").hide();
                $("#displayNameError").hide();
                $("#addressError").hide();
                $("#cityError").hide();
                $("#districtError").hide();
                $("#numberError").hide();
                $("#landNumberError").hide();

                var x=0;
                   if(($("#firstname").val()=="")||($("#firstname").val().match(/^[A-Za-z]*$/)== null)){
                    $("#firstNameError").show();
                    x=1;

                }
                   if(($("#lastname").val()=="")||($("#lastname").val().match(/^[A-Za-z]*$/)== null)){
                    $("#lastNameError").show();
                    x=1;

                }
                if(($("#displayName").val()=="")||($("#displayName").val().match(/^[a-zA-Z0-9_]*$/)== null)){
                    $("#displayNameError").show();
                    x=1;

                }
                  if($("#address1").val()==""){
                    $("#addressError").show();
                    x=1;
                }
                if($("#city").val()==""){
                    $("#cityError").show();
                    x=1;
                }
                if($("#district").val()==""){
                    $("#districtError").show();
                    x=1;
                }
                if(($("#mobile_number").val()=="")||($("#mobile_number").val().match(/^[0-9]{10}$/)==null)){
//                if(($("#mobile_number").val()=="")||($("#mobile_number").val().match(/^[0-9]{10}$/)==null)||(($("#land_number").val().match(/^[0-9]{10}$/)==null) && ($("#land_number").val()==""))){
                  $("#numberError").show();
                    x=1;
                }
//                if(($("#land_number").val().match(/^[0-9]{10}$/)==null) && $("#land_number").val()!=""){
////                if(($("#mobile_number").val()=="")||($("#mobile_number").val().match(/^[0-9]{10}$/)==null)||(($("#land_number").val().match(/^[0-9]{10}$/)==null) && ($("#land_number").val()==""))){
//                  $("#landNumberError").show();
//                    x=1;
//                }

                if(x==1){
                    return false;
                }
                else if(x==0){
                    return true;
                }
            })



            //    onchange district
        $('#district').change(function(){
            var districtId=$(this).find(':selected').val();

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
        
    </script>
    
  <!--close tag-->
          
     </body>
</html>