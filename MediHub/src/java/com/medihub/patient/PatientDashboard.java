package com.medihub.patient;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import com.medihub.db.*;
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
 * @author hp
 */
@WebServlet(name = "Patient", urlPatterns = {"/patient"})
public class PatientDashboard extends HttpServlet {

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
                //getting from DbConfig class
                DbConfig db = DbConfig.getInstance();
                Connection con = db.getConnecton();
                
                Statement stmt=con.createStatement(); 
                ResultSet rs=stmt.executeQuery("SELECT hospitals.name,medication_reminders.* FROM (((((`medication_reminders` INNER JOIN prescriptions ON medication_reminders.prescription_id=prescriptions.id)INNER JOIN channeling on prescriptions.channeling_id = channeling.id)INNER JOIN users ON channeling.patient_id=users.id) INNER JOIN doctor_availability ON channeling.doctor_availability_id = doctor_availability.id)INNER JOIN hospitals ON hospitals.id=doctor_availability.hospital_id) WHERE users.id="+patientId);
                ArrayList Reminders = new ArrayList();
                while(rs.next()){
                        ArrayList row = new ArrayList();
                        for (int i = 1; i <= 7 ; i++){
                            row.add(rs.getString(i));
                        }
                        Reminders.add(row);
                }
                
                request.setAttribute("reminders", Reminders);
                request.getRequestDispatcher("patientDashboard.jsp").forward(request, response);
                }catch(Exception e){
                    out.println(e.toString());
                }
           
    }

    
    
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
