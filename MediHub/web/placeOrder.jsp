<!doctype html>
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
        <li><a href="#" id="end">About</a></li>
        <li><a href="#">Contact</a></li>
        <li><a href="#">Emergency Services</a></li>
        <li><a href="#">Home</a></li>
        <li id="logo"><img src="./public/images/onlylogo.png" width="15.5%"></li>
      </ul>
  </div>

  <div class="container">
    <h1>Order Form</h1><br>
    <form class="" action="" method="post" id="">

      <div class="dropdown">
        <div class="filterContainer">
        <div class="filtername"><h2 class="name">Select Your District </h2></div>
        <div class="filter"><select name='district' id="district">
                 <option value='' selected>Select District</option>
                      
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
         <button class="button" id="id" onclick="window.location.href='/medihub';"><b>Cancel</b></button>
         <button class="button" type="reset" id="clear"><b>Clear</b></button>
         <button class="button" type="submit"><b>Submit</b></button>

  </div>







  </div>
</form>
  </body>
  </html>
