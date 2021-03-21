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
    
    public String confirmEmail=
"  <head>\n" +
"    <meta charset=\"utf-8\">\n" +
"    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n" +
"    <link href=\"https://fonts.googleapis.com/css2?family=Montserrat:wght@500&display=swap\" rel=\"stylesheet\">\n" +
"    <link href=\"https://fonts.googleapis.com/css2?family=Spartan:wght@600&display=swap\" rel=\"stylesheet\">\n" +
"      <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css\">\n" +
"    \n" +
"  </head>\n" +
"  <body>\n" +
"    <hr>\n" +
"    <div id=\"box\">\n" +
"    <div id=\"heading\">\n" +
"      <center>\n" +
"        <div id=\"logo\">\n" +
"\n" +
"          <svg version=\"1.0\" xmlns=\"http://www.w3.org/2000/svg\"\n" +
"           width=\"300.000000pt\" height=\"137.000000pt\" viewBox=\"0 0 300.000000 137.000000\"\n" +
"           preserveAspectRatio=\"xMidYMid meet\">\n" +
"          <metadata>\n" +
"          Created by potrace 1.10, written by Peter Selinger 2001-2011\n" +
"          </metadata>\n" +
"          <g transform=\"translate(0.000000,137.000000) scale(0.050000,-0.050000)\"\n" +
"          fill=\"#b4e2db\" stroke=\"none\">\n" +
"          <path d=\"M830 1961 c-118 -28 -192 -89 -220 -179 -12 -39 -8 -46 16 -36 17 6\n" +
"          36 1 42 -12 6 -13 9 -6 6 16 -13 106 240 196 331 118 32 -28 37 -29 19 -5 -22\n" +
"          28 -20 35 10 42 27 7 18 17 -38 42 -81 36 -78 36 -166 14z\"/>\n" +
"          <path d=\"M900 1779 c-192 -64 -363 -118 -380 -118 -87 -4 -86 -27 13 -338 64\n" +
"          -200 107 -303 125 -303 25 0 547 162 622 194 17 6 45 15 62 18 67 14 140 48\n" +
"          132 63 -5 8 -51 148 -102 310 -51 162 -100 294 -108 293 -8 -1 -171 -54 -364\n" +
"          -119z m73 -159 c15 -77 28 -84 106 -57 74 25 77 23 93 -57 11 -57 8 -62 -62\n" +
"          -75 -55 -10 -70 -21 -62 -44 40 -102 36 -122 -26 -143 -67 -24 -70 -21 -90 63\n" +
"          -14 58 -35 61 -138 22 -22 -9 -34 6 -44 52 -15 67 8 98 72 99 51 0 56 19 27\n" +
"          90 -28 65 -27 67 26 87 81 30 85 28 98 -37z\"/>\n" +
"          <path d=\"M1640 1310 l0 -470 79 0 79 0 -12 285 c-11 282 13 367 44 155 7 -49\n" +
"          17 -94 21 -101 4 -6 12 -52 19 -100 29 -212 37 -229 101 -229 61 0 81 63 140\n" +
"          440 31 202 54 112 42 -166 l-12 -286 80 6 81 6 0 460 0 460 -100 6 c-96 6\n" +
"          -101 3 -113 -50 -7 -31 -21 -87 -30 -126 -9 -38 -22 -107 -28 -152 -7 -45 -20\n" +
"          -110 -30 -145 -21 -71 -21 -74 -21 -106 0 -50 -23 2 -31 71 -8 61 -31 167 -99\n" +
"          467 -9 39 -23 45 -110 45 l-100 0 0 -470z\"/>\n" +
"          <path d=\"M2420 1311 l0 -471 241 0 241 0 -6 75 -6 75 -155 0 -155 0 0 126 0\n" +
"          126 120 -14 120 -13 0 95 0 96 -120 -11 -120 -11 0 118 0 118 159 0 159 0 -5\n" +
"          75 -5 75 -234 6 -234 5 0 -470z\"/>\n" +
"          <path d=\"M3000 1310 l0 -470 188 0 c290 0 282 -13 282 457 0 485 1 483 -283\n" +
"          483 l-187 0 0 -470z m302 3 c0 -164 -2 -300 -6 -302 -3 -3 -35 -11 -71 -18\n" +
"          l-65 -12 0 321 0 320 71 -6 72 -6 -1 -297z\"/>\n" +
"          <path d=\"M3580 1309 l0 -471 80 6 c45 3 81 13 80 21 0 8 0 218 0 465 l0 450\n" +
"          -80 0 -80 0 0 -471z\"/>\n" +
"          <path d=\"M3860 1760 c-1 -11 -1 -220 -1 -465 l-1 -445 81 -6 81 -6 0 201 0\n" +
"          201 70 0 70 0 0 -197 c0 -226 -2 -220 91 -205 l71 12 1 460 0 460 -82 6 -81 6\n" +
"          0 -202 0 -202 -73 6 -73 6 4 195 4 195 -81 0 c-44 0 -81 -9 -81 -20z\"/>\n" +
"          <path d=\"M4440 1351 c0 -519 -4 -511 232 -511 242 0 238 -9 238 503 l0 427\n" +
"          -80 0 -80 0 0 -380 0 -380 -70 0 -70 0 -5 385 -6 385 -79 0 -80 0 0 -429z\"/>\n" +
"          <path d=\"M5020 1310 l0 -470 188 0 c259 0 280 17 289 246 6 158 4 171 -40 202\n" +
"          -36 25 -39 32 -12 32 46 0 61 71 52 239 -12 198 -42 221 -290 221 l-187 0 0\n" +
"          -470z m308 278 c43 -111 0 -208 -92 -208 -55 0 -56 2 -56 120 l0 120 68 0 c43\n" +
"          0 72 -11 80 -32z m7 -448 c7 -109 -6 -130 -90 -146 l-65 -13 0 131 0 130 75\n" +
"          -6 c74 -6 75 -8 80 -96z\"/>\n" +
"          </g>\n" +
"          </svg>\n" +
"\n" +
"\n" +
"\n" +
"</div>\n" +
"        <h2>Welcome to Medihub!</h2>\n" +
"      </center>\n" +
"    </div>\n" +
"        <div id=\"emailBody\">\n" +
"          <h6> Hello Name, </h6>\n" +
"          Thank you for registering with MediHub! Please click the button to verify your email address.\n" +
"          </br></br></br>\n" +
"          <button class=\"styled\" type=\"button\" onclick=\"window.location.href='#'\"> Click To Verify </button>\n" +
"         </br></br></br>\n" +
"          Please note that failure to verify your email address within 24 hours will terminate your registration.</br></br>\n" +
"          If you have any issues, please contact medihub54@gmail.com\n" +
"      </div>\n" +
"    </div>\n" +
"    <footer>\n" +
"    </br>\n" +
"      <div class=\"footerText\">\n" +
"      All rights Reserved @MediHub2020\n" +
"      <div class=\"footerText\">\n" +
"      <center>\n" +
"        <a href=\"#\" class=\"fa fa-facebook\"></a>\n" +
"        <a href=\"#\" class=\"fa fa-twitter\"></a>\n" +
"        <a href=\"#\" class=\"fa fa-google\"></a>\n" +
"        <a href=\"#\" class=\"fa fa-instagram\"></a>\n" +
"      </center>\n" +
"      </div>\n" +
"    </div>\n" +
"    </footer>\n" +
"  </body>\n" +
"  <style>\n" +
"    *{\n" +
"  margin:0;\n" +
"  padding:0;\n" +
"}\n" +
"hr{\n" +
"  border-top: 25px solid  #2b3030;\n" +
"}\n" +
"\n" +
"#heading{\n" +
"  font-family: 'Montserrat', sans-serif;\n" +
"}\n" +
"\n" +
"#box{\n" +
"  text-align: center;\n" +
"  padding-bottom: 40px;\n" +
"}\n" +
"\n" +
"h6{\n" +
"  font-family: sans-serif;\n" +
"\n" +
"  font-size: 15px;\n" +
"  padding-bottom: 15px;\n" +
"}\n" +
"\n" +
"#emailBody{\n" +
"  padding-top: 20px;\n" +
"  padding-left: 5%;\n" +
"  padding-right: 5%;\n" +
"  font-family: sans-serif;\n" +
"  text-align: center;\n" +
"}\n" +
"\n" +
".styled {\n" +
"    border:0px;\n" +
"    margin-left: 10px;\n" +
"    margin-right: 15px;\n" +
"    padding: 0 20px;\n" +
"    font-family: 'Montserrat', sans-serif;\n" +
"    text-align: center;\n" +
"    color: white;\n" +
"    text-shadow: 1px 1px 1px #000;\n" +
"    background-color:  #0087a1;\n" +
"    line-height: 3;\n" +
"    box-shadow: inset 2px 2px 3px rgba(255, 255, 255, .6),\n" +
"                inset -2px -2px 3px rgba(0, 0, 0, .6);\n" +
"}\n" +
"\n" +
".styled:hover {\n" +
"    background-color: white;\n" +
"    color:black;\n" +
"    text-shadow:none;\n" +
"}\n" +
"footer{\n" +
"    background-color: #2b3030;\n" +
"}\n" +
"\n" +
"\n" +
".footerText{\n" +
"    color:white;\n" +
"    font-family: sans-serif;\n" +
"    text-align: center;\n" +
"}\n" +
".fa {\n" +
"  padding: 25px;\n" +
"  font-size: 20px;\n" +
"  width: 6px;\n" +
"  text-align: center;\n" +
"  text-decoration: none;\n" +
"  border-radius: 50%;\n" +
"  color:white;\n" +
"}\n" +
".styled:active {\n" +
"    box-shadow: inset -2px -2px 3px rgba(255, 255, 255, .6),\n" +
"                inset 2px 2px 3px rgba(0, 0, 0, .6);\n" +
"}\n" +
"\n" +
"  </style>\n" +
"\n";
    
}
