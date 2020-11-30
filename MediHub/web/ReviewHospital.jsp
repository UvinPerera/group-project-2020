<%-- 
    Document   : ReviewHospital
    Created on : Nov 30, 2020, 8:04:48 PM
    Author     : Ifra
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html>

<head>
  <meta charset=utf-8>
  <title>Medihub</title>
   <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@500&display=swap" rel="stylesheet">
   <link href="https://fonts.googleapis.com/css2?family=Spartan:wght@600&display=swap" rel="stylesheet">
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
   <link rel="stylesheet" type="text/css" href="./public/css/review.css" media="screen">
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>

<body>
  <div class="navbar" id="navbar">
        <ul>
            <li><button class="style" type="button" onclick="window.location.href='logout';"> LOGOUT</button></li>
            <li><a href="About.jsp" id="end">About</a></li>
            <li><a href="contactUs.jsp">Contact</a></li>
            <li><a href="EmergencyServices.jsp">Emergency Services</a></li>
            <li><a href="/MediHub">Home</a></li>
            <li id="logo"><img src="./public/images/onlylogo.png" width="15.5%"></li>
        </ul>
    </div>

    <div class="container">

        <div class="profile">
          <img src="./public/images/hospital.jpg" id="profile">
          <h2 style="text-align:center;">Hospital</h2><br>
          <h4 style="text-align:center;">City Hospital,Galle</h4>
             <div>
              <center>
                <div class="review-rating">
                    <div class="box-review">
                        <div class="review-title">3.5</div>
                        <div class="review-star">
                            <span class="fa fa-star"></span>
                            <span class="fa fa-star"></span>
                            <span class="fa fa-star"></span>
                            <span class="fa fa-star-half-o"></span>
                            <span class="fa fa-star-o"></span>
                        </div>
                        <div class="review-people"><i class="fa fa-user"></i> 568 total</div>
                    </div>
                </div>
                <br><br><br>
                <a href="patientview" class="btn">Images</a>
                <br><br><br>
                <a href="editpatient" class="btn">Location in Map</a>
                <br><br><br>
                <a href="" class="btn deactivate">Report</a>
              </center>
          </div>

        </div>

          <div class="contentBox">
              <div class="tab">
                <button class="tablinks" onclick="openTab(event, 'data')" id="defaultOpen">Profile</button>
                <button class="tablinks" onclick="openTab(event, 'view')">Reviews</button>
                <button class="tablinks" onclick="openTab(event, 'write')">Write Review</button>

              </div>


  <div id="data" class="tabcontent">
  <center>
  <div class="information">
   <h3 style="text-align:center;font-size:25px;margin-bottom:40px;">City Hospital, Galle</h3>

   <div class="record">
   <div class="label">Hospital Name </div>
   <div class="data"> City Hospital</div>
 </div>

 <div class="record">
   <div class="label">Address</div>
   <div class="data">No.65, Main Street, Galle</div>
 </div>

 <div class="record">
   <div class="label">Contact Number</div>
   <div class="data">041-2250111</div>
 </div>

 <div class="record">
   <div class="label">Fax</div>
   <div class="data">011-11111111</div>
 </div>

 <div class="record">
   <div class="label">Email</div>
   <div class="data">cityhospital@gmail.com</div>
 </div>

 <div class="record">
   <div class="label">Start Year</div>
   <div class="data">1950</div>
 </div>

 <div class="record">
   <div class="label">Employees</div>
   <div class="data">1000</div>
 </div>

 <div class="record">
   <div class="label">Director Name</div>
   <div class="data">P.P.S Vimal</div>
 </div>

 <div class="record">
   <div class="label">Director-Email</div>
   <div class="data">cityhospital@director.com</div>
 </div>



 </div>

            </center>

            </div>

            <div id="view" class="tabcontent">

                    <table class="table-hub table-hub-appoint" style="width: 100%;">
                        <!-- <thead>
                            <tr>
                                <th class="table-hub-owner">Appointment No</th>
                                <th class="table-hub-owner">Hospital</th>
                                <th class="table-hub-owner">Doctor</th>
                                <th class="table-hub-owner">Date</th>
                                <th class="table-hub-owner">Time</th>
                                <th class="table-hub-owner">Action</th>
                                <th class="table-hub-time-head">Time</th>
                            </tr>
                        </thead> -->
                        <tbody>
                            <tr>
                                <td class="review-img">
                                    <img src="./public/images/user.png" alt="profile image" href="" />
                                </td>
                                <td class="review-text">Lorem ipsum dolor sit amet consectetur, adipisicing elit. Nisi temporibus error perferendis recusandae distinctio consequuntur, dolores dolorem? Ut quidem, repellendus repellat velit dolorem vel soluta pariatur maxime officia quisquam doloremque!</td>
                                <td class="review-given">
                                    <div class="review-rating">
                                        <div class="box-review">
                                            <div class="review-title">3.0</div>
                                            <div class="review-star">
                                                <span class="fa fa-star"></span>
                                                <span class="fa fa-star"></span>
                                                <span class="fa fa-star"></span>
                                                <span class="fa fa-star-0"></span>
                                                <span class="fa fa-star-o"></span>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                <!-- <td style="width: 20%;">000</td> -->

                            </tr>

                            <!--  <tr>
                                <td class="review-img">
                                    <img src="user.png" alt="profile image" href="" />
                                </td>
                                <td class="review-text">Lorem ipsum dolor sit amet consectetur, adipisicing elit. Nisi temporibus error perferendis recusandae distinctio consequuntur, dolores dolorem? Ut quidem, repellendus repellat velit dolorem vel soluta pariatur maxime officia quisquam doloremque!</td>
                                <td class="review-given">
                                    <div class="review-rating">
                                        <div class="box-review">
                                            <div class="review-title">4.0</div>
                                            <div class="review-star">
                                                <span class="fa fa-star"></span>
                                                <span class="fa fa-star"></span>
                                                <span class="fa fa-star"></span>
                                                <span class="fa fa-star"></span>
                                                <span class="fa fa-star-o"></span>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                <!-- <td style="width: 20%;">000</td> -->

                          <!--  </tr> -->

                            <tr>
                                <td class="review-img">
                                    <img src="./public/images/user.png" alt="profile image" href="" />
                                </td>
                                <td class="review-text">Lorem ipsum dolor sit amet consectetur, adipisicing elit. Nisi temporibus error perferendis recusandae distinctio consequuntur, dolores dolorem? Ut quidem, repellendus repellat velit dolorem vel soluta pariatur maxime officia quisquam doloremque!</td>
                                <td class="review-given">
                                    <div class="review-rating">
                                        <div class="box-review">
                                            <div class="review-title">3.0</div>
                                            <div class="review-star">
                                                <span class="fa fa-star"></span>
                                                <span class="fa fa-star"></span>
                                                <span class="fa fa-star"></span>
                                                <span class="fa fa-star-0"></span>
                                                <span class="fa fa-star-o"></span>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                <!-- <td style="width: 20%;">000</td> -->

                            </tr>

                            <tr>
                                <td class="review-img">
                                    <img src="./public/images/user.png" alt="profile image" href="" />
                                </td>
                              <center>  <td class="review-text">Lorem ipsum dolor sit amet consectetur, adipisicing elit. Nisi temporibus error perferendis recusandae distinctio consequuntur, dolores dolorem? Ut quidem, repellendus repellat velit dolorem vel soluta pariatur maxime officia quisquam doloremque!</td><center>
                                <td class="review-given">
                                    <div class="review-rating">
                                        <div class="box-review">
                                            <div class="review-title">5.0</div>
                                            <div class="review-star">
                                                <span class="fa fa-star"></span>
                                                <span class="fa fa-star"></span>
                                                <span class="fa fa-star"></span>
                                                <span class="fa fa-star"></span>
                                                <span class="fa fa-star"></span>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                <!-- <td style="width: 20%;">000</td> -->

                            </tr>



                        </tbody>
                    </table>


            </div>


            <div id="write" class="tabcontent">
                 <br><br>
                 <div class="write-review">
                    <div class="star-rating">
                        <span onclick="changeColour(this);" id='one' class="fa fa-star-o" title="1"></span>
                        <span onclick="changeColour(this);" id='two' class="fa fa-star-o" title="2"></span>
                        <span onclick="changeColour(this);" id='three' class="fa fa-star-o" title="3"></span>
                        <span onclick="changeColour(this);" id='four' class="fa fa-star-o" title="4"></span>
                        <span onclick="changeColour(this);" id='five' class="fa fa-star-o" title="5"></span>
                    </div>
                    <br><br><br>
                    <textarea placeholder="Enter your Review" name="review_input" id="review_input" cols="30" rows="10"></textarea>
                    <br><br><br>
                    <a href="patientview" class="btn">Submit</a>
                 </div>

            </div>

        </div>

    </div>

</body>
<br><br>
<center>
    <footer>
        <div class="row4">
            <div class="column4">
                <div class="footerText">
                    <br>ABOUT <br><br>
                    MediHub is a mainly a patient portal providing users eaiser access to all medical services.
                    <br>MediHub also
                    provides different doctors, hospitals and pharmacies interact with the patients directly in order to
                    provide
                    them with the best experience in accessing medical<br> services.<br>
                </div>
            </div>
            <!--<div class="column4"><br>
        <div class="footerText"> -->
            <br><br>
            <a href="#" class="fa fa-facebook"></a>
            <a href="#" class="fa fa-twitter"></a>
            <a href="#" class="fa fa-google"></a>
            <a href="#" class="fa fa-instagram"></a>
        </div>
        <!--  </div>
    </div> -->
        <br>
        <div class="footerText">
            All rights Reserved @MediHub2020
        </div>
        <br><br>
    </footer>
</center>

</html>

<script>

    function changeColour(qq)
    {
        // alert($(qq).attr('id'));

        document.getElementById("one").style.color='black';
        document.getElementById("two").style.color='black';
        document.getElementById("three").style.color='black';
        document.getElementById("four").style.color='black';
        document.getElementById("five").style.color='black';
        document.getElementById($(qq).attr('id')).style.color='orange';
    }

    document.getElementById("defaultOpen").click();

    function openTab(evt, tabName) {
        var i, tabcontent, tablinks;

        // Get all elements with class="tabcontent" and hide them
        tabcontent = document.getElementsByClassName("tabcontent");
        for (i = 0; i < tabcontent.length; i++) {
          tabcontent[i].style.display = "none";
        }

        // Get all elements with class="tablinks" and remove the class "active"
        tablinks = document.getElementsByClassName("tablinks");
        for (i = 0; i < tablinks.length; i++) {
          tablinks[i].className = tablinks[i].className.replace(" active", "");
        }

        // Show the current tab, and add an "active" class to the button that opened the tab
        document.getElementById(tabName).style.display = "block";
        evt.currentTarget.className += " active";
}



</script>
</html>

