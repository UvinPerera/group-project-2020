/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.medihub.doctor;

import com.medihub.db.DbConfig;
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
 * @author uvinp
 */
@WebServlet(name = "MedicationReminder", urlPatterns = {"/medicationreminder"})
public class MedicationReminder extends HttpServlet {

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
            int doctorId =Integer.parseInt(session.getAttribute("userid").toString());
            
        String query ="SELECT p.*,c.appointment_no FROM prescriptions p "
                + "INNER JOIN channelling c ON p.channeling_id=c.id "
                + "INNER JOIN doctor_availability da ON da.id = c.doctor_availability_id "
                + "INNER JOIN doctors doc ON doc.id=da.doctor_id WHERE doc.id="+doctorId
                + " ORDER BY c.appointment_no";
                  
            try{
                DbConfig db = DbConfig.getInstance();
                Connection con = db.getConnecton();
                
                Statement stmt=con.createStatement(); 
                ResultSet rs=stmt.executeQuery(query);
                
                ArrayList Prescriptions = new ArrayList();
                while(rs.next()){
                        ArrayList row = new ArrayList();
                        for (int i = 1; i <=1 ; i++){
                            row.add(rs.getString(i));
                        }
                        Prescriptions.add(row);
                }
                request.setAttribute("prescriptions", Prescriptions);
                request.getRequestDispatcher("createMedicationReminders.jsp").forward(request, response);
            }
            
            
            catch(Exception e){
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
