/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.medihub.hospital;

import com.medihub.db.DbConfig;
import com.medihub.user.Notifications;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.management.Notification;
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
@WebServlet(name = "DeleteAppointment", urlPatterns = {"/deleteappointment"})
public class DeleteAppointment extends HttpServlet {

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
        try {
            String avId = request.getParameter("aId");

            HttpSession session = request.getSession();

            int hospitalAdminId = Integer.parseInt(session.getAttribute("userid").toString());

            String query = "UPDATE doctor_availability SET status=0 WHERE id=" + avId;
            String query2 = "SELECT c.patient_id,h.name,concat(u.first_name,' ',u.last_name) AS doctor_name, da.date,da.start_time FROM channelling c "
                    + "INNER JOIN doctor_availability da ON da.id=c.doctor_availability_id "
                    + "INNER JOIN hospitals h ON h.id=da.hospital_id "
                    + "INNER JOIN users u ON u.id=da.doctor_id "
                    + "WHERE c.doctor_availability_id =" + avId;

            DbConfig db = DbConfig.getInstance();
            Connection con = db.getConnecton();

            PreparedStatement pst = con.prepareStatement(query);
            PreparedStatement pst2 = con.prepareStatement(query2);

            int rs = pst.executeUpdate();

            ResultSet rs2 = pst2.executeQuery();

            while (rs2.next()) {

                int patientId = rs2.getInt("patient_id");
                String hosName=rs2.getString("name");
                String date = rs2.getString("date");
                String startTime = rs2.getString("start_time");
                String docName = rs2.getString("doctor_name");
                String message = "Your appointment for DR."+docName+" in "+hosName+" on "+date+" at "+startTime+" has been cancelled by the hospital. "
                        + "If you have made any online payemnets it will be refunded shortly";
                Notifications not = new Notifications();
                not.createNotification(hospitalAdminId, patientId, message, 1);

            }

        } catch (Exception e) {
            e.printStackTrace();

        }

        response.sendRedirect("manageappointments");

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
