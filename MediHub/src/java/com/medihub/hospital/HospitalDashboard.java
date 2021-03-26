/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.medihub.hospital;

import com.medihub.doctor.DoctorAvailability;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.medihub.user.User;

/**
 *
 * @author hp
 */
@WebServlet(name = "Hospital", urlPatterns = {"/hospital"})
public class HospitalDashboard extends HttpServlet {

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
        int userType = Integer.parseInt(session.getAttribute("usertype").toString());
        int hospitalAdminId = Integer.parseInt(session.getAttribute("userid").toString());
        String query ="";
        if(userType==3){
            
            DoctorAvailability da = new DoctorAvailability();
            
            
            User u = new User(hospitalAdminId);
            
            String absolutePath = u.getAbsPath();
            request.setAttribute("absolutePath",absolutePath);
            request.setAttribute("doctoravailability", da.getAllDoctorAvailability(1));
            request.getRequestDispatcher("hospitalDashboard.jsp").forward(request, response);
        }
        else{
            request.getRequestDispatcher("403.jsp").forward(request, response);
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
