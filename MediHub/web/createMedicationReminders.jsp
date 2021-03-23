

<%@page import="java.util.ArrayList"%>
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
          
          
          <link rel="stylesheet" type="text/css" media="screen" href="./public/css/form.css">
          <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
     </head>

     <body>
         <%ArrayList al = new ArrayList();
       ArrayList a2 = new ArrayList();
       if(request.getAttribute("prescriptions")!=null){
           al=(ArrayList )request.getAttribute("prescriptions");
            
            ;
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

                        

                    <form action="doctor" method="POST">
                    <label>Prescription ID: </label>
                    <select class="input option" name="pid">
                         <option disabled="disabled" selected="selected">--Choose Option--</option>
                        <%for(int i=0;i<al.size();i++){a2 =(ArrayList ) al.get(i);%>
                        <option value="<%=a2.get(0)%>">Prescription ID:<%=a2.get(0)%></option>
                        
                        <%}%>
                        
                    </select>
                <br>
                <br>
                    <label>Duration: </label>
                    <input type="number" class="input duration" placeholder="Enter duration" name="duration">
                    <br><br>
                    <label>Through SMS: </label>
                    <input type="checkbox" class="tsms" name="sms">
                    <br><br>
                    <label>Through Email: </label>
                    <input type="checkbox" class="temail" name="email">
                    <br><br>
                    <label>Description: </label>
                    <br><br>
                    <textarea class="description" placeholder="Enter description to be displayed to the patient" name="desc"></textarea>
                    <button class="button" type="submit">Add Prescription</button>
                    
                </form>

                    </div>

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
          <script>


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

               document.getElementById("modal_id").innerHTML = id[index];
               document.getElementById("modal_date_time").innerHTML = date[index] + " " + time[index];
               document.getElementById("modal_hospital").innerHTML = hospital[index];
               document.getElementById("modal_description").innerHTML = description[index];
               document.getElementById("modal_doctor").innerHTML = doctor[index];
               document.getElementById("modal_appointmet_no").innerHTML = appointmentNo[index];
               document.getElementById("modal_Payment_method").innerHTML = paymentMethod[index];
               document.getElementById("modal_payment_amount").innerHTML = paymentAmount[index];
               document.getElementById("modal_payment_description").innerHTML = paymentDescription[index];

               var status = "";
               var colour = "";

               if (paymentStatus[index] != "") {
                    status = "Paid";
                    colour = "green";
               }
               else {
                    status = "Not Paid";
                    colour = "red";
               }
               document.getElementById("modal_payment_status").style.color = colour;
               document.getElementById("modal_payment_status").innerHTML = status;

               }

               // When the user clicks on <span> (x), close the modal
               span.onclick = function () {
               modal.style.display = "none";

               document.getElementById("modal_id").innerHTML = "**";
               document.getElementById("modal_date_time").innerHTML = "**";
               document.getElementById("modal_hospital").innerHTML = "**";
               document.getElementById("modal_description").innerHTML = "**";
               document.getElementById("modal_doctor").innerHTML = "**";
               document.getElementById("modal_appointmet_no").innerHTML = "**";
               document.getElementById("modal_Payment_method").innerHTML = "**";
               document.getElementById("modal_payment_amount").innerHTML = "**";
               document.getElementById("modal_payment_description").innerHTML = "**";
               document.getElementById("modal_payment_status").innerHTML = "**";


               }

               // When the user clicks anywhere outside of the modal, close it
               window.onclick = function (event) {
               if (event.target == modal) {
                    modal.style.display = "none";

                    document.getElementById("modal_id").innerHTML = "**";
                    document.getElementById("modal_date_time").innerHTML = "**";
                    document.getElementById("modal_hospital").innerHTML = "**";
                    document.getElementById("modal_description").innerHTML = "**";
                    document.getElementById("modal_doctor").innerHTML = "**";
                    document.getElementById("modal_appointmet_no").innerHTML = "**";
                    document.getElementById("modal_Payment_method").innerHTML = "**";
                    document.getElementById("modal_payment_amount").innerHTML = "**";
                    document.getElementById("modal_payment_description").innerHTML = "**";
                    document.getElementById("modal_payment_status").innerHTML = "**";
               }
               }

               //when printing
               print.onclick = function () {
                   
                    print.style.display = "none";
                    $("#modalCloseIcon").hide();
                    var win = window.open();
                    var printContent = $("#printPart").html();

                    $(win.document.body).html(printContent);
                    win.print();
                    print.style.display = "block";
                    $("#modalCloseIcon").show();
               }

               //    #########################
               //    modal script end
               //    #########################



          </script>

     </body>
</html>