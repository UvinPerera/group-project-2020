/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.medihub.admin;

import com.medihub.db.DbConfig;
import com.medihub.patient.*;
import com.medihub.user.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
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
@WebServlet(name = "ReadPatient", urlPatterns = {"/readpatient"})
public class ReadPatient extends HttpServlet {

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
            int adminId =Integer.parseInt(session.getAttribute("userid").toString());
            PrintWriter out = response.getWriter();
            PreparedStatement pst = null;
            ResultSet rs;
            ArrayList<String> patient = new ArrayList<String>();

            try
            {
               DbConfig db = DbConfig.getInstance();
               Connection con = db.getConnecton();
               pst = con.prepareStatement("");
               String query= "SELECT first_name,last_name,display_name FROM users WHERE user_type =1";
               pst.executeQuery(query);
               rs = pst.getResultSet();
                    int i = 0;
                    while(rs.next()) { 
                   patient.add(rs.getString("first_name"));
                   patient.add(rs.getString("last_name"));
                   patient.add(rs.getString("display_name"));
                   
                       
                   }
                request.setAttribute("users", patient);
                request.getRequestDispatcher("managePatients.jsp").forward(request, response);
                }catch(Exception e){
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
