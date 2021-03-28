/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.medihub.admin;

import com.medihub.db.DbConfig;
import com.medihub.pharmacy.Pharmacy;
import com.medihub.user.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author DELL
 */
@WebServlet(name = "AdminDeletePharmacy", urlPatterns = {"/admindeletepharmacy"})
public class AdminDeletePharmacy extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
 

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
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
          int pharmacyId = Integer.parseInt(request.getParameter("pId"));
          Pharmacy pharmacy = new Pharmacy();
          pharmacy.setId(pharmacyId);
        
                
        
         try
            {   
                DbConfig db = DbConfig.getInstance();
                Connection con = db.getConnecton();
                
                Statement stmt=con.createStatement();
                ResultSet rs=stmt.executeQuery("SELECT user_id FROM pharmacy_admins WHERE pharmacy_id="+pharmacyId);
                int userId=1;
                while(rs.next()){
                        userId=rs.getInt("user_id");
                } 
                 User pharmacist = new User(userId);
                
               
                pharmacy.DeletePharmacy();
                pharmacist.DeleteUser();
                response.sendRedirect("readpharmacy");
                }catch(Exception e){
                   e.printStackTrace();
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
