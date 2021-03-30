package com.medihub.patient;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import com.medihub.prescription.*;
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
 * @author hp
 */
@WebServlet(name = "MedicalRemindersPatient", urlPatterns = {"/MedicalRemindersPatient"})
public class MedicalRemindersPatient extends HttpServlet {

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
            int userType = Integer.parseInt(session.getAttribute("usertype").toString());
             PrintWriter out = response.getWriter();
            if(userType==1){
               
            try
            {
                
                PrescriptionItem pi = new PrescriptionItem();
                request.setAttribute("reminders", pi.getReminders(patientId)); //directly get appointments
                request.getRequestDispatcher("medicalRemindersPatient.jsp").forward(request, response);
                }
            catch(Exception e)
            {
                out.println(e.toString());
            }
        }else{
                request.getRequestDispatcher("403.jsp").forward(request, response);
            }
           
    }

    
    
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
