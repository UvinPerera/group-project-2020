/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.medihub.pharmacy;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.medihub.user.*;
import com.medihub.db.*;
import com.medihub.resources.SecureUtils;
import java.sql.*; 
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 *
 * @author Yash
 */
@WebServlet(name = "ChangePasswordUpdatePharmacy", urlPatterns = {"/changepasswordupdatepharmacy"})
public class ChangePasswordUpdatePharmacy extends HttpServlet {

  

@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            PrintWriter out = response.getWriter();
            
             HttpSession session = request.getSession();
            int pharmacistId =Integer.parseInt(session.getAttribute("userid").toString());
            
        try
        {
            
            //getting from DbConfig class
            DbConfig db = DbConfig.getInstance();
            Connection con = db.getConnecton();
                    
            String curentPassword=SecureUtils.generatePasswordHash(request.getParameter("current_password"));
            String newPassword=SecureUtils.generatePasswordHash(request.getParameter("new_password"));
            String newPasswordConfirmation=SecureUtils.generatePasswordHash(request.getParameter("new_password_confirmation"));
            
            String query="SELECT password FROM users WHERE status=1 AND id="+pharmacistId;
            
            PreparedStatement stmt=con.prepareStatement(query);  
            ResultSet rs=stmt.executeQuery();
            
            String checkPassword="";
            
            while(rs.next()) { 
                checkPassword = rs.getString("password");
            }
            int rss=0;
//            out.println(checkPassword);
//            out.println(curentPassword);
            if(checkPassword.equals(curentPassword)){
                
                if(newPassword.equals(newPasswordConfirmation)) {
                    query="UPDATE users SET password='"+newPassword+"', updated_at=CURRENT_TIMESTAMP, updated_by='"+pharmacistId+"' WHERE status=1 AND id="+pharmacistId;
                    
                    stmt=con.prepareStatement(query);
                    rss=stmt.executeUpdate();
                    
                    if(rss>0){
                        session.setAttribute("alert", "success");
                        session.setAttribute("message", "Password Update Successful !");
                        
                        com.medihub.user.Notifications n = new com.medihub.user.Notifications();
                        n.createNotification(0, pharmacistId, "Your Password Has been Updated", 1);
                    }
                    else{

                        session.setAttribute("alert", "error");
                        session.setAttribute("message", "Password Update Unsuccessful !");
                    }
                }
                else
                {

                    session.setAttribute("alert", "error");
                    session.setAttribute("message", "New Passwords Didn't Match !");
                }
            }
            else
            {

                session.setAttribute("alert", "error");
                session.setAttribute("message", "Passwords Error !");
            }
            
            response.sendRedirect("changepasswordpharmacy");
            con.close();  
        }
        catch(Exception e)
        { 
            out.println(e.toString());
        }  }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
