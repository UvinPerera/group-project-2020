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
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Map;
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
@WebServlet(name = "CreatePrescription", urlPatterns = {"/createprescription"})
public class CreatePrescription extends HttpServlet {

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

        DoctorAvailability da = new DoctorAvailability();

        request.setAttribute("hospitals", da.getCurrentAvailabilitiesCurrent(doctorId));
        request.getRequestDispatcher("createprescription.jsp").forward(request, response);

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
        PrintWriter out = response.getWriter();

        String hosId = request.getParameter("hosId");
        String channelId = request.getParameter("channel");
        String reminder = "";
        String duration="";
        String description="";
        String presId = "";
        try {
            reminder = request.getParameter("reminder");
            if (reminder.compareTo("on") == 0) {
                duration = request.getParameter("duration");
                description = request.getParameter("des");
            }
        } catch (Exception e) {

        }
        

        String query = "INSERT INTO prescriptions(channeling_id,status) VALUES(" + channelId + ",1)";
        String query2 = "SELECT LAST_INSERT_ID() AS pres_id";

        Map<String, String[]> m = request.getParameterMap();
        String[] genericName = m.get("gName");
        String[] tradeName = m.get("tName");
        String[] dosage = m.get("dosage");
        String[] interval = m.get("interval");
        String[] mp = m.get("mp");
        String[] durationMed = m.get("durationMed");

        try {
            DbConfig db = DbConfig.getInstance();
            Connection con = db.getConnecton();
            PreparedStatement pst = con.prepareStatement(query);
            PreparedStatement pst2 = con.prepareStatement(query2);
            
            
            int rs = pst.executeUpdate();
            ResultSet rs2 = pst2.executeQuery();
            while (rs2.next()) {
                presId = rs2.getString("pres_id");
            }

            for (int i = 0; i < genericName.length; i++) {
                String query3 = "INSERT INTO prescription_items(prescription_id,generic_name,trade_name,dosage,interval_id,meal_preference,status,duration)"
                        + " VALUES(" + presId + ",'" + genericName[i] + "','" + tradeName[i] + "','" + dosage[i] + "'," + interval[i] + "," + mp[i] + ",1,"+durationMed[i]+")";
                PreparedStatement pst3 = con.prepareStatement(query3);
                int rs3 = pst3.executeUpdate();
            }
            try{
            if (reminder.compareTo("on") == 0) {
             String query4= "INSERT INTO medication_reminders(prescription_id,duration,through_mail,through_sms,description) "
                     + "VALUES("+presId+","+duration+",1,1,'"+description+"')";
             PreparedStatement pst4 = con.prepareStatement(query4);
             int rs4 = pst4.executeUpdate();
            }
            }catch(NullPointerException e){}
            
            /*String patientId="";
            String query5="SELECT u.id FROM users u "
                    + "INNER JOIN channelling ch ON u.id=ch.patient_id "
                    + "INNER JOIN prescriptions p ON p.channeling_id=ch.id "
                    + "WHERE p.id="+presId;
            
            PreparedStatement pst5 = con.prepareStatement(query5);
            ResultSet rs5 = pst5.executeQuery();
            
            
             
            String query6="INSERT INTO medical_records()";*/
            
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
        
        /*out.println(reminder);
        out.println(duration);
        out.println(description);*/
        response.sendRedirect("createprescription");

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
