/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.medihub.patient;

import com.medihub.db.DbConfig;
import com.medihub.location.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
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
 * @author hp
 */
@WebServlet(name = "EditPatient", urlPatterns = {"/editpatient"})
public class EditPatient extends HttpServlet {

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
            int patientId =Integer.parseInt(session.getAttribute("userid").toString());
             PrintWriter out = response.getWriter();
            
       
             try
            {
                Patient p = new Patient(patientId);
                
                District d = new District();
                
                City c = new City();
                
                request.setAttribute("cities", c.getAllCities()); //directly get districts
                request.setAttribute("districts", d.getAllDistricts()); //directly get districts
                request.setAttribute("profile", p.getProfile());
                request.getRequestDispatcher("editPatient.jsp").forward(request, response);
            }
             catch(Exception e){
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

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
