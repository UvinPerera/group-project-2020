package com.medihub.user;

import java.sql.*; 
import com.medihub.db.*;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.medihub.resources.*;

/**
 *
 * @author Yash
 */
@WebServlet(urlPatterns = {"/auth"})
public class auth extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                PrintWriter out = response.getWriter();
                try
                {
                    //getting from DbConfig class
                    DbConfig db = DbConfig.getInstance();
                    Connection con = db.getConnecton();
                    
                    Statement stmt=con.createStatement(); 
                    String email=request.getParameter("email");
                     //start generate password hash
                        //  check password parameter value is empty before generate 
                        //  bcz if password is empty SecureUtils.generatePasswordHash(password) will return a null
                        //  validate every required parameters before the select query.
                    String password=SecureUtils.generatePasswordHash(request.getParameter("userpassword"));
                    //end generate password hash

                    ResultSet rs=stmt.executeQuery("Select * from users where email='"+email+"' and password='"+password+"' and status=1"); 
                    String displayName="";
                    int userType=1;
                    int userId=1;
                    while(rs.next())
                    {
                        displayName=rs.getString("display_name");
                        userType=rs.getInt("user_type");
                        userId=rs.getInt("id");
                    }
                    //String actualUsername = "Yashithi";
                    //String actualPassword ="kay";
                    if(!displayName.isEmpty()){
                        if(userType==0){
                            response.sendRedirect("admin");
                            HttpSession session = request.getSession();
                            session.setAttribute("username", displayName);
                            session.setAttribute("userid", userId);
                            session.setAttribute("usertype", userType);
                        }
                        else if(userType==1){
                            response.sendRedirect("patient");
                            HttpSession session = request.getSession();
                            session.setAttribute("username", displayName);
                            session.setAttribute("userid", userId);
                            session.setAttribute("usertype", userType);
                            
                        }
                        else if(userType==2){
                            response.sendRedirect("doctor");
                            HttpSession session = request.getSession();
                            session.setAttribute("username",displayName);
                            session.setAttribute("userid", userId);
                            session.setAttribute("usertype", userType);
                        }
                        else if(userType==3){
                            response.sendRedirect("hospital");
                            HttpSession session = request.getSession();
                            session.setAttribute("username",displayName);
                            session.setAttribute("userid", userId);
                            session.setAttribute("usertype", userType);
                        }
                        else if(userType==4){
                            response.sendRedirect("pharmacy");
                            HttpSession session = request.getSession();
                            session.setAttribute("username",displayName);
                            session.setAttribute("userid", userId);
                            session.setAttribute("usertype", userType);
                        }
                    }
                    else{
                        response.sendRedirect("invalid.html");
                    }
                }
                catch(Exception e)
                {
                    out.println(e.toString());
                }
    }
    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
