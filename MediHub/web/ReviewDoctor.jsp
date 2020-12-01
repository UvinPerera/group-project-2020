<%-- 
    Document   : ReviewDoctor
    Created on : Nov 30, 2020, 8:46:23 PM
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
            <li><button class="style" type="button" onclick="window.location.href='patient'"> Dashboard </button></li>
           <li><a href="About.jsp" id="end">About</a></li>
      <li><a href="contactUs.jsp">Contact</a></li>
      <li><a href="EmergencyServices.jsp">Emergency Services</a></li>
      <li><a href="/MediHub">Home</a></li>
            <li id="logo"><img src="./public/images/onlylogo.png" width="15.5%"></li>
        </ul>
    </div>
    
        <div class="search">
        <input class="searchinput" type="text" placeholder="Search Doctor">
        <div class="sicon"><svg version="1.1" class="fill" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 512 512" style="enable-background:new 0 0 512 512;" xml:space="preserve"> <g> <g> <path d="M310,190c-5.52,0-10,4.48-10,10s4.48,10,10,10c5.52,0,10-4.48,10-10S315.52,190,310,190z"/> </g> </g> <g> <g> <path d="M500.281,443.719l-133.48-133.48C388.546,277.485,400,239.555,400,200C400,89.72,310.28,0,200,0S0,89.72,0,200 s89.72,200,200,200c39.556,0,77.486-11.455,110.239-33.198l36.895,36.895c0.005,0.005,0.01,0.01,0.016,0.016l96.568,96.568 C451.276,507.838,461.319,512,472,512c10.681,0,20.724-4.162,28.278-11.716C507.837,492.731,512,482.687,512,472 S507.837,451.269,500.281,443.719z M305.536,345.727c0,0.001-0.001,0.001-0.002,0.002C274.667,368.149,238.175,380,200,380 c-99.252,0-180-80.748-180-180S100.748,20,200,20s180,80.748,180,180c0,38.175-11.851,74.667-34.272,105.535 C334.511,320.988,320.989,334.511,305.536,345.727z M326.516,354.793c10.35-8.467,19.811-17.928,28.277-28.277l28.371,28.371 c-8.628,10.183-18.094,19.65-28.277,28.277L326.516,354.793z M486.139,486.139c-3.78,3.78-8.801,5.861-14.139,5.861 s-10.359-2.081-14.139-5.861l-88.795-88.795c10.127-8.691,19.587-18.15,28.277-28.277l88.798,88.798 C489.919,461.639,492,466.658,492,472C492,477.342,489.919,482.361,486.139,486.139z"/> </g> </g> <g> <g> <path d="M200,40c-88.225,0-160,71.775-160,160s71.775,160,160,160s160-71.775,160-160S288.225,40,200,40z M200,340 c-77.196,0-140-62.804-140-140S122.804,60,200,60s140,62.804,140,140S277.196,340,200,340z"/> </g> </g> <g> <g> <path d="M312.065,157.073c-8.611-22.412-23.604-41.574-43.36-55.413C248.479,87.49,224.721,80,200,80c-5.522,0-10,4.478-10,10 c0,5.522,4.478,10,10,10c41.099,0,78.631,25.818,93.396,64.247c1.528,3.976,5.317,6.416,9.337,6.416 c1.192,0,2.405-0.215,3.584-0.668C311.472,168.014,314.046,162.229,312.065,157.073z"/> </g> </g></svg>
        </div>
        </div>
        

    <div class="container">

        <div class="profile">
          <img src="./public/images/doctor.jpg" id="profile">
          <h2 style="text-align:center;">Doctor</h2><br>
          <h4 style="text-align:center;">Dr. P.S.S Vimal</h4>
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
                <!--<br><br><br>-->
                <!--<a href="patientview" class="btn">Images</a>-->
                <br><br><br>
                <a href="editpatient" class="btn">Contact</a>
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
   <h3 style="text-align:center;font-size:25px;margin-bottom:40px;">Dr. P.S.S Vimal</h3>

   <div class="record">
   <div class="label">Full Name </div>
   <div class="data"> Srimal Vimal</div>
 </div>

 <div class="record">
   <div class="label">Address</div>
   <div class="data">No.65, Main Street, Galle</div>
 </div>

 <div class="record">
   <div class="label">Contact Number - Land </div>
   <div class="data">041-2250111</div>
 </div>

 <div class="record">
   <div class="label">Contact Number _ Mobile</div>
   <div class="data">071-11111111</div>
 </div>

 <div class="record">
   <div class="label">Email</div>
   <div class="data">srimal@gmail.com</div>
 </div>

 <div class="record">
   <div class="label">SLMC No</div>
   <div class="data">2000</div>
 </div>

<!-- <div class="record">
   <div class="label"></div>
   <div class="data">10</div>
 </div>-->

 <div class="record">
   <div class="label">Director Name</div>
   <div class="data">P.P.S Vimal</div>
 </div>

 <div class="record">
   <div class="label">Director-Email</div>
   <div class="data">citypharmacy@director.com</div>
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
                                                <span class="fa fa-star-o"></span>
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
                                                <span class="fa fa-star-o"></span>
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


