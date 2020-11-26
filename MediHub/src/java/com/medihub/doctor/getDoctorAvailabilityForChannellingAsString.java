/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.medihub.doctor;

import com.medihub.hospital.*;
import com.medihub.hospital.Hospital;
import com.medihub.location.*;
import java.io.IOException;
import java.io.PrintWriter;
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
 * @author tharshan
 */
@WebServlet(name = "getDoctorAvailabilityForChannellingAsString", urlPatterns = {"/getdoctoravailabilityforChannellingasstring"})
public class getDoctorAvailabilityForChannellingAsString extends HttpServlet {

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
        
                HttpSession session = request.getSession();
                PrintWriter out = response.getWriter();
//                response.setContentType("application/json");
                
                try
                {
                    int hospitalId=Integer.parseInt(request.getParameter("hospital"));
                    int doctorSpecialisationId=Integer.parseInt(request.getParameter("doctorSpecialisation"));
                    String date=request.getParameter("date");
                    DoctorAvailability da = new DoctorAvailability();
                    String returnData=da.getAllDoctorAvailabilitiesByHospital(hospitalId,doctorSpecialisationId,date);
                    response.setContentType("text/html;charset=UTF-8");
                    out.write(returnData);
                }
                catch(Exception e)
                {
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
