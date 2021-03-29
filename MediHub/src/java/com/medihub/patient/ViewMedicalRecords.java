/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.medihub.patient;

import com.medihub.db.DbConfig;
import com.medihub.records.MedicalRecords;
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
@WebServlet(name = "ViewMedicalRecords", urlPatterns = {"/viewmedicalrecords"})
public class ViewMedicalRecords extends HttpServlet {

 

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
            HttpSession session = request.getSession();
            int patientId =Integer.parseInt(session.getAttribute("userid").toString());
            PrintWriter out = response.getWriter(); 
             try
            {
                MedicalRecords mr = new MedicalRecords();
                request.setAttribute("medicalRecords",mr.getRecordsByPatient(patientId));
                request.getRequestDispatcher("medicalRecords.jsp").forward(request, response);
            }
            catch(Exception e){
                    out.println(e.toString());
                }
     
    }

    
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
