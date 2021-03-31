<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Medi hub</title>
    <link rel="icon" href="./public/images/onlylogo.png" type="image/icon type"> <!--Header icon-->
    <link rel="stylesheet" href="./public/css/loginstyle.css" type="text/css"><!--Login box styles-->
    
     <link rel="stylesheet" type="text/css" href="./public/css/contactUs.css" media="screen" />
    <title>Login</title>
</head>
<body>
    <div class="navbar" id="navbar">
        <ul>  
           
        <li><button class="styled" type="button" onclick="window.location.href='signup';"> SIGN UP</button></li> 
           <li><a href="About.jsp" id="end">About</a></li>
            <li ><a href="contactUs.jsp">Contact</a></li>
            <li><a href="EmergencyServices.jsp">Emergency Services</a></li>
            <li><a href="BrowseDoctorReviewsGuest"> Browse Service Providers</a></li>
            <li><a href="/MediHub">Home</a></li>
        <li id="logo"><img src="./public/images/onlylogo.png" width="15.5%"></li>
      </ul>
    </div>
    
    <%
        if(request.getParameter("status")!=null){
        int i = Integer.parseInt(request.getParameter("status")); %>
         <br>
         <%if(i==1){%>
         <div class="registerSuccessful" id="registerSuccessful" style="background-color: green ; color:#ffff">
            <center><h3><b>Registration is successful! Confirm Email Address to Login.</b></h3></center>  
        </div> 
         <%}}%>
        <div class="login-container"> <!--The container which has the login box-->
            <img class="avatar-image" src="./public/images/avatar-default-icon.png">
            <h1>Login</h1>
            <form action="auth" method="POST"> <!--Gets username and password for login-->
                <p>Email:</p><input type="text" name="email" id="email" placeholder="Enter Email"><br>
                <p>Password:</p><input type="password" name="userpassword" id="userpassword" placeholder="Enter Password"><br><br>
                <input type="submit" name="submit" id="submit" value="Login">
                <br><br><a href="forgetPassword.jsp">Forgot password?</a>
            </form>
        </div>

   
</body>

</html>
