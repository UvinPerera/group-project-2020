/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.medihub.hospital;

import com.medihub.db.DbConfig;
import com.medihub.doctor.Doctor;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
@WebServlet(name = "LinkDoctor", urlPatterns = {"/linkdoctor"})
public class LinkDoctor extends HttpServlet {

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
        int doctorId;

        HttpSession session = request.getSession();
        int userType = Integer.parseInt(session.getAttribute("usertype").toString());
        int hospitalAdminId = Integer.parseInt(session.getAttribute("userid").toString());
        int hosId = hosId(hospitalAdminId);
        
        if (request.getParameter("doctor") != null) {
            doctorId = Integer.parseInt(request.getParameter("doctor"));

            Doctor d = new Doctor();
            request.setAttribute("doctor", d.getDoctorWithHos(doctorId));
            request.setAttribute("isLinked", d.checkDoctorWithHos(hosId, doctorId));
        } 

        request.getRequestDispatcher("linkdoc.jsp").forward(request, response);

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
        HttpSession session = request.getSession();
        
        int docId = Integer.parseInt(request.getParameter("docId"));
        int hospitalAdminId = Integer.parseInt(session.getAttribute("userid").toString());
        int hosId = hosId(hospitalAdminId);
        
        Doctor d = new Doctor();
        d.linkDoctor(hosId, docId);
        
        response.sendRedirect("managedoctorhos");
        
        

    }

    protected int hosId(int adminId) {

        int hospitalId = 0;
        String query = "SELECT hospital_id FROM hospital_admins WHERE user_id=" + adminId;
        try {

            DbConfig db = DbConfig.getInstance();
            Connection con = db.getConnecton();

            PreparedStatement pst = con.prepareStatement(query);
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                hospitalId = Integer.parseInt(rs.getString("hospital_id"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return hospitalId;
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
