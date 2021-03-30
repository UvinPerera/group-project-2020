/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.medihub.hospital;

import com.medihub.db.DbConfig;
import com.medihub.doctor.Doctor;
import com.sun.xml.bind.util.CalendarConv;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
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
@WebServlet(name = "CreateAppointment", urlPatterns = {"/createappointment"})
public class CreateAppointment extends HttpServlet {

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
        Doctor doc = new Doctor();
        HttpSession session = request.getSession();
        int hospitalAdminId = Integer.parseInt(session.getAttribute("userid").toString());
        int hospitalId = hosId(hospitalAdminId);
       request.setAttribute("doctors", doc.getAllDoctorsByHospital(hospitalId));
        request.getRequestDispatcher("createappointment.jsp").forward(request, response);
       
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
        int hospitalAdminId = Integer.parseInt(session.getAttribute("userid").toString());
        
        String docId = request.getParameter("doctor");
        String date = request.getParameter("date");
        String startTime = request.getParameter("sTime");
        
        DateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd");  
        DateFormat timeFormat = new SimpleDateFormat("HH:mm:ss");  
        String endTime = request.getParameter("eTime");
        String maxPat = request.getParameter("maxCount");
        String doctorFee = request.getParameter("fee");
        int hospitalId = hosId(hospitalAdminId);
        
        //String strDate = dateFormat.format(date);
        //String strStartTime = timeFormat.format(startTime);
        //String strEndTime = timeFormat.format(endTime);
        
        
        String query ="INSERT INTO doctor_availability(doctor_id,hospital_id,date,start_time,end_time,max_count,payment,status) "
                + "VALUES("+docId+","+hospitalId+",'"+date+"','"+startTime+"','"+endTime+"',+"+maxPat+","+doctorFee+",1)";
        
        try{
            DbConfig db = DbConfig.getInstance();
            Connection con = db.getConnecton();
            
            PreparedStatement pst = con.prepareStatement(query);
            int rs = pst.executeUpdate();
            
            response.sendRedirect("manageappointments");
        
        }
        
        catch(Exception e){
        
            e.printStackTrace();
        }
    }
    
    protected int hosId(int adminId){
    
        
        int hospitalId=0;
        String query ="SELECT hospital_id FROM hospital_admins WHERE user_id="+adminId;
        try{
                
            DbConfig db = DbConfig.getInstance();
            Connection con = db.getConnecton();
            
            PreparedStatement pst = con.prepareStatement(query);
            ResultSet rs = pst.executeQuery();
            
            while(rs.next()){
                hospitalId = Integer.parseInt(rs.getString("hospital_id"));
            }
            
            }
            
            catch(Exception e){
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
