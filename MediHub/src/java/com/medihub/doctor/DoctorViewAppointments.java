/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.medihub.doctor;

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
 * @author uvinp
 */
@WebServlet(name = "DoctorViewAppointments", urlPatterns = {"/doctorviewappointments"})
public class DoctorViewAppointments extends HttpServlet {

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
        int doctorId = Integer.parseInt(session.getAttribute("userid").toString());
        int userid = Integer.parseInt(session.getAttribute("usertype").toString());
        
        DoctorAvailability da = new DoctorAvailability();
        
        
        String getLimit="0";
        if(request.getParameter("limit")!=null){
            getLimit=request.getParameter("limit");
        }
        
        String searching = "";
        if(request.getParameter("searching")!=null){
        
         searching= request.getParameter("searching");
        }
        
        if(searching.isEmpty()){
        request.setAttribute("appointments", da.getCurrentAvailabilities(doctorId,getLimit));
        }
        
        else{
            request.setAttribute("appointments", da.getCurrentAvailabilities(doctorId,getLimit,searching));
        }
        request.getRequestDispatcher("viewdoctorappointments.jsp").forward(request, response);

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
