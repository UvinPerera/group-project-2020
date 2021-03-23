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
 * @author Yash
 */
@WebServlet(name = "DoctorView", urlPatterns = {"/DoctorView"})
public class DoctorView extends HttpServlet {

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
            PrintWriter out = response.getWriter();   
            
            
            try
            {
                //getting from DbConfig class
                DbConfig db = DbConfig.getInstance();
                Connection con = db.getConnecton();
                
                Statement stmt=con.createStatement(); 
                ResultSet rs=stmt.executeQuery("SELECT users.*,doctors.*,cities.name_en,districts.name_en FROM users INNER JOIN doctors ON users.id=doctors.id INNER JOIN cities ON users.city=cities.id INNER JOIN districts ON cities.district_id=districts.id WHERE users.id="+doctorId);
                ArrayList Profile = new ArrayList();
                while(rs.next()){
                        ArrayList row = new ArrayList();
                        for (int i = 1; i <= 34 ; i++){
                            row.add(rs.getString(i));
                        }
                        Profile.add(row);
                }
                
                request.setAttribute("profile", Profile);
                
                request.getRequestDispatcher("viewdoctor.jsp").forward(request, response);
                }catch(Exception e){
                    out.println(e.toString());
                }
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
