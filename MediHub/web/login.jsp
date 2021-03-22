<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Medi hub</title>
    <link rel="icon" href="./public/images/onlylogo.png" type="image/icon type"> <!--Header icon-->
    <link rel="stylesheet" href="./public/css/loginstyle.css" type="text/css"><!--Login box styles-->
    <link rel="stylesheet" href="./public/css/sidenavstyle.css" type="text/css"><!--Side navigation styles-->
    <title>Login</title>
</head>
<body>


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

    <div id="sidenav"><!--The side navigation, Use this tag at the bottm most always-->
        <input type="checkbox" name="" checked="checked">
        <span class="icon"></span>
        <ul>
            <li><a href="#">Home</a></li>
            <li><a href="#">Login</a></li>
            <li><a href="#">Contact</a></li>
            <li><a href="#">About</a></li>
        </ul>
    </div>

</body>

</html>
