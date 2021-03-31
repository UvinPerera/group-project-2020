/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.medihub.admin;

import com.medihub.db.DbConfig;
import com.medihub.resources.SecureUtils;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author DELL
 */
@WebServlet(name = "changepasswordupdateadmin", urlPatterns = {"/changepasswordupdateadmin"})
public class changepasswordupdateadmin extends HttpServlet {


    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
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
            
             HttpSession session = request.getSession();
            int adminId =Integer.parseInt(session.getAttribute("userid").toString());
            
        try
        {
            
            //getting from DbConfig class
            DbConfig db = DbConfig.getInstance();
            Connection con = db.getConnecton();
                    
            String curentPassword=SecureUtils.generatePasswordHash(request.getParameter("current_password"));
            String newPassword=SecureUtils.generatePasswordHash(request.getParameter("new_password"));
            String newPasswordConfirmation=SecureUtils.generatePasswordHash(request.getParameter("new_password_confirmation"));
            
            String query="SELECT password FROM users WHERE status=1 AND id="+adminId;
            
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
                    query="UPDATE users SET password='"+newPassword+"', updated_at=CURRENT_TIMESTAMP, updated_by='"+adminId+"' WHERE status=1 AND id="+adminId;
                    
                    stmt=con.prepareStatement(query);
                    rss=stmt.executeUpdate();
                    
                    if(rss>0){
                        session.setAttribute("alert", "success");
                        session.setAttribute("message", "Password Update Successful !");
                        
                        com.medihub.user.Notifications n = new com.medihub.user.Notifications();
                        n.createNotification(0, adminId, "Your Password Has been Updated", 1);
                    }
                    else{
//                        out.println("subbb");
                        session.setAttribute("alert", "error");
                        session.setAttribute("message", "Password Update Unsuccessful !");
                    }
                }
                else
                {
//                    out.println("sub");
                    session.setAttribute("alert", "error");
                    session.setAttribute("message", "New Passwords Didn't Match !");
                }
            }
            else
            {
//                out.println("main");
                session.setAttribute("alert", "error");
                session.setAttribute("message", "Passwords Error !");
            }
            
            response.sendRedirect("changepasswordadmin");
            con.close();  
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
