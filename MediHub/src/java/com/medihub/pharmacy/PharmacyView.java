/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.medihub.pharmacy;

import com.medihub.db.DbConfig;
import com.medihub.user.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author yash
 */

@WebServlet(name = "PharmacyView", urlPatterns = {"/pharmacyview"})
public class PharmacyView extends HttpServlet {

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
            HttpSession session = request.getSession();
            int pharmacistId =Integer.parseInt(session.getAttribute("userid").toString());
            PrintWriter out = response.getWriter();   
            
            
            try
            {
                
                DbConfig db = DbConfig.getInstance();
                Connection con = db.getConnecton();
                
                Statement stmt=con.createStatement();
                ResultSet rs=stmt.executeQuery("SELECT pharmacy_id FROM pharmacy_admins WHERE user_id="+pharmacistId);
                int pharmacyId=1;
                while(rs.next()){
                        pharmacyId=rs.getInt("pharmacy_id");
                }
                Pharmacy p = new Pharmacy(pharmacyId);
                
                request.setAttribute("pharmacyprofile", p.getPharmacyProfile());
                request.getRequestDispatcher("viewpharmacy.jsp").forward(request, response);
                }catch(Exception e){
                    out.println(e.toString());
                }
            
    }


    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}