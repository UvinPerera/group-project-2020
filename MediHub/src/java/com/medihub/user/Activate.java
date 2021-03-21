/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.medihub.user;

import com.medihub.db.*;
import java.sql.*; 

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author uvinp
 */
@WebServlet(name = "Activate", urlPatterns = {"/activate"})
public class Activate extends HttpServlet {

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
    
    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            
        try{
            DbConfig db = DbConfig.getInstance();
            Connection con = db.getConnecton();
        
            String token = request.getParameter("token");
            
            String query = "SELECT * FROM email_activation WHERE token='"+token+"' AND ack=0";
            PreparedStatement stmt=con.prepareStatement(query);  
            ResultSet rs=stmt.executeQuery();
            
            String email ;
            
            while(rs.next()){
                 email = rs.getString("email");
                String query2 ="UPDATE email_activation SET ack=1 WHERE token='"+token+"'";
                String query3 ="UPDATE users SET status=1 WHERE email='"+email+"'";
                 PreparedStatement stmt1=con.prepareStatement(query2);
                 PreparedStatement stmt2=con.prepareStatement(query3);
                 int rs1 = stmt1.executeUpdate();
                 int rs2 = stmt2.executeUpdate();
                 
                 
            }
            
            con.close();
        }catch(Exception e){
            
        }
        response.sendRedirect("login.jsp");
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
