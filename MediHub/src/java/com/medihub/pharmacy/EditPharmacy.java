/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.medihub.pharmacy;

import com.medihub.db.DbConfig;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
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
 * @author Yash
 */
@WebServlet(name = "EditPharmacy", urlPatterns = {"/editpharmacy"})
public class EditPharmacy extends HttpServlet {

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
            int pharmacyId =Integer.parseInt(session.getAttribute("userid").toString());
             PrintWriter out = response.getWriter();
            try{
                DbConfig db = DbConfig.getInstance();
                Connection con = db.getConnecton();
                
                Statement stmt=con.createStatement(); 
                ResultSet rs=stmt.executeQuery("SELECT * FROM users WHERE id="+pharmacyId);
                ArrayList Details = new ArrayList();
                while(rs.next()){
                        ArrayList row = new ArrayList();
                        for (int i = 1; i <= 20 ; i++){
                            row.add(rs.getString(i));
                        }
                        Details.add(row);
                }
                
                ResultSet rs2=stmt.executeQuery("SELECT * FROM pharmacies WHERE pharmacist_id="+pharmacyId);
                ArrayList Details2 = new ArrayList();
                while(rs2.next()){
                        ArrayList row2 = new ArrayList();
                        for (int i = 1; i <= 20 ; i++){
                            row2.add(rs2.getString(i));
                        }
                        Details2.add(row2);
                }
                
                request.setAttribute("details", Details);
                request.setAttribute("details2", Details2);
                request.getRequestDispatcher("editpharmacy.jsp").forward(request, response);
                }catch(Exception e){
                    out.println(e.toString());
                }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
   

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
