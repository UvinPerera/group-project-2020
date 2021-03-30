/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.medihub.admin;

import com.medihub.user.User;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author DELL
 */
@WebServlet(name = "AdminDeletePatient", urlPatterns = {"/admindeletepatient"})
public class AdminDeletePatient extends HttpServlet {

 
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            int patientId = Integer.parseInt(request.getParameter("pId"));
        
               User patient = new User();
              patient.setId(patientId);
        
        
         try
            {
                patient.DeleteUser();
                response.sendRedirect("readpatient");
            //  request.setAttribute("profile", patient.getProfile());
            //  request.getRequestDispatcher("adminpatient.jsp").forward(request, response);
                }catch(Exception e){
                   e.printStackTrace();
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
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
