/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.medihub.admin;

import com.medihub.location.City;
import com.medihub.location.District;
import com.medihub.user.User;
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
 * @author DELL
 */
@WebServlet(name = "AdminEditDoctor", urlPatterns = {"/admineditdoctor"})
public class AdminEditDoctor extends HttpServlet {

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
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            int doctorId = Integer.parseInt(request.getParameter("dId"));
            PrintWriter out = response.getWriter();
             
            
       
             try
            {
                
                User doctor = new User();
                doctor.setId(doctorId);
                District d = new District();
                
                City c = new City();
                
                request.setAttribute("cities", c.getAllCities()); //directly get districts
                request.setAttribute("districts", d.getAllDistricts()); //directly get districts
                request.setAttribute("profile", doctor.getProfile());
                request.getRequestDispatcher("AdminEditDoctor.jsp").forward(request, response);
            }
             catch(Exception e){
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
