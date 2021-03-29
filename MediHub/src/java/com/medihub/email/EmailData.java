/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.medihub.email;

/**
 *
 * @author uvinp
 */
public class EmailData {
    
    public String confirmEmail="<!DOCTYPE html>\n" +
"<html lang=\"en-US\">\n" +
"\n" +
"<head>\n" +
"  <meta charset=\"utf-8\">\n" +
"  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n" +
"  <link href=\"https://fonts.googleapis.com/css2?family=Montserrat:wght@500&display=swap\" rel=\"stylesheet\">\n" +
"  <link href=\"https://fonts.googleapis.com/css2?family=Spartan:wght@600&display=swap\" rel=\"stylesheet\">\n" +
"  <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css\">\n" +
"  <style type=\"text/css\">\n" +
"    * {\n" +
"      margin: 0;\n" +
"      padding: 0;\n" +
"    }\n" +
"\n" +
"    hr {\n" +
"      border-top: 25px solid #2b3030;\n" +
"    }\n" +
"\n" +
"    #heading {\n" +
"      font-family: 'Montserrat', sans-serif;\n" +
"    }\n" +
"\n" +
"    #box {\n" +
"      text-align: center;\n" +
"      padding-bottom: 40px;\n" +
"    }\n" +
"\n" +
"    h6 {\n" +
"      font-family: sans-serif;\n" +
"\n" +
"      font-size: 15px;\n" +
"      padding-bottom: 15px;\n" +
"    }\n" +
"\n" +
"    #emailBody {\n" +
"      padding-top: 20px;\n" +
"      padding-left: 5%;\n" +
"      padding-right: 5%;\n" +
"      font-family: sans-serif;\n" +
"      text-align: center;\n" +
"    }\n" +
"\n" +
"    .styled {\n" +
"      border: 0px;\n" +
"      margin-left: 10px;\n" +
"      margin-right: 15px;\n" +
"      padding: 0 20px;\n" +
"      font-family: 'Montserrat', sans-serif;\n" +
"      text-align: center;\n" +
"      color: white;\n" +
"      text-shadow: 1px 1px 1px #000;\n" +
"      background-color: #0087a1;\n" +
"      line-height: 3;\n" +
"      box-shadow: inset 2px 2px 3px rgba(255, 255, 255, .6),\n" +
"        inset -2px -2px 3px rgba(0, 0, 0, .6);\n" +
"    }\n" +
"\n" +
"    .styled:hover {\n" +
"      background-color: white;\n" +
"      color: black;\n" +
"      text-shadow: none;\n" +
"    }\n" +
"\n" +
"    footer {\n" +
"      background-color: #2b3030;\n" +
"    }\n" +
"\n" +
"\n" +
"    .footerText {\n" +
"      color: white;\n" +
"      font-family: sans-serif;\n" +
"      text-align: center;\n" +
"    }\n" +
"\n" +
"    .fa {\n" +
"      padding: 25px;\n" +
"      font-size: 20px;\n" +
"      width: 6px;\n" +
"      text-align: center;\n" +
"      text-decoration: none;\n" +
"      border-radius: 50%;\n" +
"      color: white;\n" +
"    }\n" +
"\n" +
"    .styled:active {\n" +
"      box-shadow: inset -2px -2px 3px rgba(255, 255, 255, .6),\n" +
"        inset 2px 2px 3px rgba(0, 0, 0, .6);\n" +
"    }\n" +
"  </style>\n" +
"\n" +
"\n" +
"\n" +
"</head>\n" +
"\n" +
"<body>\n" +
"  <hr>\n" +
"  <div id=\"box\">\n" +
"    <div id=\"heading\">\n" +
"      <center>\n" +
"        <div id=\"logo\">\n" +
"\n" +
"          <img src=\"https://i.postimg.cc/dtBCqRPb/logo.png\">\n" +
"        </div>\n" +
"        <h2>Welcome to Medihub!</h2>\n" +
"      </center>\n" +
"    </div>\n" +
"    <div id=\"emailBody\">\n" +
"      <h6> Hello #Name, </h6>\n" +
"      Thank you for registering with MediHub! Please click the button to verify your email address.\n" +
"      </br></br></br>\n" +
"      <a href=\"#activationLink\">Click To Verify</a> \n" +
"      </br></br></br>\n" +
"      Please note that failure to verify your email address within 24 hours will terminate your registration.</br></br>\n" +
"      If you have any issues, please contact medihub54@gmail.com\n" +
"    </div>\n" +
"  </div>\n" +
"  <footer>\n" +
"    </br>\n" +
"    <div class=\"footerText\">\n" +
"      All rights Reserved @MediHub2020\n" +
"      <div class=\"footerText\">\n" +
"        <center>\n" +
"          <a href=\"#\" class=\"fa fa-facebook\"></a>\n" +
"          <a href=\"#\" class=\"fa fa-twitter\"></a>\n" +
"          <a href=\"#\" class=\"fa fa-google\"></a>\n" +
"          <a href=\"#\" class=\"fa fa-instagram\"></a>\n" +
"        </center>\n" +
"      </div>\n" +
"    </div>\n" +
"  </footer>\n" +
"</body>\n" +
"\n" +
"</html>";
    
    public String resetEmail="<!DOCTYPE html>\n" +
"<html lang=\"en-US\">\n" +
"\n" +
"<head>\n" +
"  <meta charset=\"utf-8\">\n" +
"  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n" +
"  <link href=\"https://fonts.googleapis.com/css2?family=Montserrat:wght@500&display=swap\" rel=\"stylesheet\">\n" +
"  <link href=\"https://fonts.googleapis.com/css2?family=Spartan:wght@600&display=swap\" rel=\"stylesheet\">\n" +
"  <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css\">\n" +
"  <style type=\"text/css\">\n" +
"    * {\n" +
"      margin: 0;\n" +
"      padding: 0;\n" +
"    }\n" +
"\n" +
"    hr {\n" +
"      border-top: 25px solid #2b3030;\n" +
"    }\n" +
"\n" +
"    #heading {\n" +
"      font-family: 'Montserrat', sans-serif;\n" +
"    }\n" +
"\n" +
"    #box {\n" +
"      text-align: center;\n" +
"      padding-bottom: 40px;\n" +
"    }\n" +
"\n" +
"    h6 {\n" +
"      font-family: sans-serif;\n" +
"\n" +
"      font-size: 15px;\n" +
"      padding-bottom: 15px;\n" +
"    }\n" +
"\n" +
"    #emailBody {\n" +
"      padding-top: 20px;\n" +
"      padding-left: 5%;\n" +
"      padding-right: 5%;\n" +
"      font-family: sans-serif;\n" +
"      text-align: center;\n" +
"    }\n" +
"\n" +
"    .styled {\n" +
"      border: 0px;\n" +
"      margin-left: 10px;\n" +
"      margin-right: 15px;\n" +
"      padding: 0 20px;\n" +
"      font-family: 'Montserrat', sans-serif;\n" +
"      text-align: center;\n" +
"      color: white;\n" +
"      text-shadow: 1px 1px 1px #000;\n" +
"      background-color: #0087a1;\n" +
"      line-height: 3;\n" +
"      box-shadow: inset 2px 2px 3px rgba(255, 255, 255, .6),\n" +
"        inset -2px -2px 3px rgba(0, 0, 0, .6);\n" +
"    }\n" +
"\n" +
"    .styled:hover {\n" +
"      background-color: white;\n" +
"      color: black;\n" +
"      text-shadow: none;\n" +
"    }\n" +
"\n" +
"    footer {\n" +
"      background-color: #2b3030;\n" +
"    }\n" +
"\n" +
"\n" +
"    .footerText {\n" +
"      color: white;\n" +
"      font-family: sans-serif;\n" +
"      text-align: center;\n" +
"    }\n" +
"\n" +
"    .fa {\n" +
"      padding: 25px;\n" +
"      font-size: 20px;\n" +
"      width: 6px;\n" +
"      text-align: center;\n" +
"      text-decoration: none;\n" +
"      border-radius: 50%;\n" +
"      color: white;\n" +
"    }\n" +
"\n" +
"    .styled:active {\n" +
"      box-shadow: inset -2px -2px 3px rgba(255, 255, 255, .6),\n" +
"        inset 2px 2px 3px rgba(0, 0, 0, .6);\n" +
"    }\n" +
"  </style>\n" +
"\n" +
"\n" +
"\n" +
"</head>\n" +
"\n" +
"<body>\n" +
"  <hr>\n" +
"  <div id=\"box\">\n" +
"    <div id=\"heading\">\n" +
"      <center>\n" +
"        <div id=\"logo\">\n" +
"\n" +
"          <img src=\"https://i.postimg.cc/dtBCqRPb/logo.png\">\n" +
"        </div>\n" +
"        <h2>Welcome to Medihub!</h2>\n" +
"      </center>\n" +
"    </div>\n" +
"    <div id=\"emailBody\">\n" +
"      <h6> Hello #Name, </h6>\n" +
"      Thank you for using MediHub! Please click the button to reset your email password.\n" +
"      </br></br></br>\n" +
"      <a href=\"#resetLink\">Click To Reset</a> \n" +
"      </br></br></br>\n" +
"      Please note that failure to verify your email address within 24 hours will terminate your registration.</br></br>\n" +
"      If you have any issues, please contact medihub54@gmail.com\n" +
"    </div>\n" +
"  </div>\n" +
"  <footer>\n" +
"    </br>\n" +
"    <div class=\"footerText\">\n" +
"      All rights Reserved @MediHub2020\n" +
"      <div class=\"footerText\">\n" +
"        <center>\n" +
"          <a href=\"#\" class=\"fa fa-facebook\"></a>\n" +
"          <a href=\"#\" class=\"fa fa-twitter\"></a>\n" +
"          <a href=\"#\" class=\"fa fa-google\"></a>\n" +
"          <a href=\"#\" class=\"fa fa-instagram\"></a>\n" +
"        </center>\n" +
"      </div>\n" +
"    </div>\n" +
"  </footer>\n" +
"</body>\n" +
"\n" +
"</html>";
    
    
  public  String emailCommon="<!DOCTYPE html>\n" +
"<html lang=\"en-US\">\n" +
"\n" +
"<head>\n" +
"  <meta charset=\"utf-8\">\n" +
"  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n" +
"  <link href=\"https://fonts.googleapis.com/css2?family=Montserrat:wght@500&display=swap\" rel=\"stylesheet\">\n" +
"  <link href=\"https://fonts.googleapis.com/css2?family=Spartan:wght@600&display=swap\" rel=\"stylesheet\">\n" +
"  <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css\">\n" +
"  <style type=\"text/css\">\n" +
"    * {\n" +
"      margin: 0;\n" +
"      padding: 0;\n" +
"    }\n" +
"\n" +
"    hr {\n" +
"      border-top: 25px solid #2b3030;\n" +
"    }\n" +
"\n" +
"    #heading {\n" +
"      font-family: 'Montserrat', sans-serif;\n" +
"    }\n" +
"\n" +
"    #box {\n" +
"      text-align: center;\n" +
"      padding-bottom: 40px;\n" +
"    }\n" +
"\n" +
"    h6 {\n" +
"      font-family: sans-serif;\n" +
"\n" +
"      font-size: 15px;\n" +
"      padding-bottom: 15px;\n" +
"    }\n" +
"\n" +
"    #emailBody {\n" +
"      padding-top: 20px;\n" +
"      padding-left: 5%;\n" +
"      padding-right: 5%;\n" +
"      font-family: sans-serif;\n" +
"      text-align: center;\n" +
"    }\n" +
"\n" +
"    .styled {\n" +
"      border: 0px;\n" +
"      margin-left: 10px;\n" +
"      margin-right: 15px;\n" +
"      padding: 0 20px;\n" +
"      font-family: 'Montserrat', sans-serif;\n" +
"      text-align: center;\n" +
"      color: white;\n" +
"      text-shadow: 1px 1px 1px #000;\n" +
"      background-color: #0087a1;\n" +
"      line-height: 3;\n" +
"      box-shadow: inset 2px 2px 3px rgba(255, 255, 255, .6),\n" +
"        inset -2px -2px 3px rgba(0, 0, 0, .6);\n" +
"    }\n" +
"\n" +
"    .styled:hover {\n" +
"      background-color: white;\n" +
"      color: black;\n" +
"      text-shadow: none;\n" +
"    }\n" +
"\n" +
"    footer {\n" +
"      background-color: #2b3030;\n" +
"    }\n" +
"\n" +
"\n" +
"    .footerText {\n" +
"      color: white;\n" +
"      font-family: sans-serif;\n" +
"      text-align: center;\n" +
"    }\n" +
"\n" +
"    .fa {\n" +
"      padding: 25px;\n" +
"      font-size: 20px;\n" +
"      width: 6px;\n" +
"      text-align: center;\n" +
"      text-decoration: none;\n" +
"      border-radius: 50%;\n" +
"      color: white;\n" +
"    }\n" +
"\n" +
"    .styled:active {\n" +
"      box-shadow: inset -2px -2px 3px rgba(255, 255, 255, .6),\n" +
"        inset 2px 2px 3px rgba(0, 0, 0, .6);\n" +
"    }\n" +
"  </style>\n" +
"\n" +
"\n" +
"\n" +
"</head>\n" +
"\n" +
"<body>\n" +
"  <hr>\n" +
"  <div id=\"box\">\n" +
"    <div id=\"heading\">\n" +
"      <center>\n" +
"        <div id=\"logo\">\n" +
"\n" +
"          <img src=\"https://i.postimg.cc/dtBCqRPb/logo.png\">\n" +
"        </div>\n" +
"        <h2>Welcome to Medihub!</h2>\n" +
"      </center>\n" +
"    </div>\n" +
"    <div id=\"emailBody\">\n" +
"      " +
"      #message"+
"    </div>\n" +
"  </div>\n" +
"  <footer>\n" +
"    </br>\n" +
"    <div class=\"footerText\">\n" +
"      All rights Reserved @MediHub2020\n" +
"      <div class=\"footerText\">\n" +
"        <center>\n" +
"          <a href=\"#\" class=\"fa fa-facebook\"></a>\n" +
"          <a href=\"#\" class=\"fa fa-twitter\"></a>\n" +
"          <a href=\"#\" class=\"fa fa-google\"></a>\n" +
"          <a href=\"#\" class=\"fa fa-instagram\"></a>\n" +
"        </center>\n" +
"      </div>\n" +
"    </div>\n" +
"  </footer>\n" +
"</body>\n" +
"\n" +
"</html>";
    
    
   }
