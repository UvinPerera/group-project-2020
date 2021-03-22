/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.medihub.user;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.medihub.db.DbConfig;
import com.mysql.cj.protocol.Resultset;
import com.mysql.cj.xdevapi.PreparableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.medihub.email.*;
import java.util.Random;

/**
 *
 * @author uvinp
 */
@WebServlet(name = "PassReset", urlPatterns = {"/passreset"})
public class PassReset extends HttpServlet {

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
        String token = request.getParameter("token");
        try{
            DbConfig db = DbConfig.getInstance();
            Connection con = db.getConnecton();
            
            String query="SELECT email FROM password_reset WHERE token='"+token+"' AND ack=0";
            PreparedStatement stm = con.prepareStatement(query);
            ResultSet rs = stm.executeQuery();
            
            String email="";
            
            while(rs.next()){
                email = rs.getString("email");
            
            }
            
            if(!email.isEmpty()){
            
                request.setAttribute("email", email);
                request.getRequestDispatcher("verificationCode.jsp").forward(request, response);
            }
            
        }
        catch(Exception e){
        
        
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
        try{
            DbConfig db = DbConfig.getInstance();
            Connection con = db.getConnecton();
        String email = request.getParameter("email");
        String query = "SELECT first_name FROM users WHERE email='"+email+"'";
            PreparedStatement stm = con.prepareStatement(query);
            ResultSet rs = stm.executeQuery();
            
            String check ="";
            while(rs.next()){
                check=rs.getString("first_name");
            }
            
            if(!check.isEmpty()){
                String token =getSaltString();
                String query2="INSERT INTO password_reset(email,token) values('"+email+"','"+token+"')";
                EMail em = new EMail();
                EmailData ed = new EmailData();
                String link = "http://localhost:8080/MediHub/passreset?token="+token;
                PreparedStatement stm1 = con.prepareStatement(query2);
                int rs1 = stm1.executeUpdate();
                em.send(email, "Password Reset", ed.resetEmail.replaceFirst("#resetLink", link).replaceFirst("#Name", check));
                
            }
            
            con.close();
        }
        catch(Exception e){
        e.printStackTrace();
        }
        response.sendRedirect("forgetPassword.jsp?status=1");
        
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    
     protected String getSaltString() {
        String SALTCHARS = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890";
        StringBuilder salt = new StringBuilder();
        Random rnd = new Random();
        while (salt.length() < 18) { // length of the random string.
            int index = (int) (rnd.nextFloat() * SALTCHARS.length());
            salt.append(SALTCHARS.charAt(index));
        }
        String saltStr = salt.toString();
        return saltStr;

    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
