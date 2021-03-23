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
 * @author hp
 */
@WebServlet(name = "Doctor", urlPatterns = {"/doctor"})
public class DoctorDashboard extends HttpServlet {

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
            int userid = Integer.parseInt(session.getAttribute("usertype").toString());
            
            if(userid==2){
             PrintWriter out = response.getWriter();
            try{
                DbConfig db = DbConfig.getInstance();
                Connection con = db.getConnecton();
                
                Statement stmt=con.createStatement(); 
                ResultSet rs=stmt.executeQuery("SELECT * FROM prescriptions");
                
                
                ArrayList Prescriptions = new ArrayList();
                while(rs.next()){
                        ArrayList row = new ArrayList();
                        for (int i = 1; i <=1 ; i++){
                            row.add(rs.getString(i));
                        }
                        Prescriptions.add(row);
                }
                
                //rs.close();
                rs=stmt.executeQuery("SELECT doctor_availability.*,hospitals.name FROM `doctor_availability` INNER JOIN hospitals ON doctor_availability.hospital_id=hospitals.id");
                ArrayList Appointments = new ArrayList();
                while(rs.next()){
                        ArrayList row = new ArrayList();
                        for (int i = 1; i <=15 ; i++){
                            row.add(rs.getString(i));
                        }
                        Appointments.add(row);
                }
                Doctor p = new Doctor(doctorId);
                String absolutePath = p.getAbsPath();
                request.setAttribute("absolutePath",absolutePath);
                request.setAttribute("prescriptions", Prescriptions);
                request.setAttribute("appointments", Appointments);
                request.getRequestDispatcher("doctorDashboard.jsp").forward(request, response);
                }catch(Exception e){
                    out.println(e.toString());
                }
            }else{
                request.getRequestDispatcher("403.jsp").forward(request, response);
            }
    }

        protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            PrintWriter out = response.getWriter();
            int presId = Integer.parseInt(request.getParameter("pid"));
            int duration = Integer.parseInt(request.getParameter("duration"));
            String description = request.getParameter("desc");
            int sms = request.getParameter("sms").equals("on")?1:0;
            int email = request.getParameter("email").equals("on")?1:0;
            try{
                DbConfig db = DbConfig.getInstance();
                Connection con = db.getConnecton();
                
                Statement stmt=con.createStatement(); 
                int rs=stmt.executeUpdate("INSERT INTO medication_reminders(prescription_id,duration,through_mail,through_sms,description) VALUES("+presId+","+duration+","+email+","+sms+",'"+description+"')");
                response.sendRedirect("doctor");
            }
            catch(Exception e){
                e.printStackTrace();
            }
            
            
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
