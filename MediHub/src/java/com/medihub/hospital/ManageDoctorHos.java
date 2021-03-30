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
 * @author uvinp
 */
@WebServlet(name = "ManageDoctorHos", urlPatterns = {"/managedoctorhos"})
public class ManageDoctorHos extends HttpServlet {

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
        
        String getLimit="0";
        if(request.getParameter("limit")!=null){
            getLimit=request.getParameter("limit");
        }
        
        String adminId = session.getAttribute("userid").toString();
        String query ="SELECT hospital_id FROM hospital_admins WHERE user_id="+adminId;
        int hospitalId=0;
        try{
            DbConfig db = DbConfig.getInstance();
            Connection con = db.getConnecton();
            
            PreparedStatement pst = con.prepareStatement(query);
            ResultSet rs = pst.executeQuery();
            
            while(rs.next()){
                hospitalId = Integer.parseInt(rs.getString("hospital_id"));
            }
            
            //PrintWriter out = response.getWriter();
            //out.println(hospitalId); 
            String q_limit = " limit "+getLimit+",11";
            String query2 ="SELECT d.*,u.first_name,u.last_name FROM doctors d INNER JOIN doctor_hospital dh ON d.id=dh.doctor_id INNER JOIN hospitals h ON h.id= dh.hospital_id INNER JOIN users u ON u.id =d.id WHERE h.id ="+hospitalId + q_limit;
            
            PreparedStatement pst1 = con.prepareStatement(query2);
            ResultSet rs1 = pst1.executeQuery();
            
             List<Doctor> ds = new ArrayList<Doctor>();
            
            while(rs1.next()){
                
                
                
                Doctor dcTemp = new Doctor();
                int docId = rs1.getInt("id");
                ds.add(dcTemp.getDoctor(docId));
                
                
            
            }
            
            request.setAttribute("doctors", ds);
            
            //out.println(ds.get(0).doctorName);
        }
        
        catch(Exception e){
        
            e.printStackTrace();
        
        }
        
        request.getRequestDispatcher("manageDoctors(hos).jsp").forward(request, response);
        
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
