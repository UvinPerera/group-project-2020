/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.medihub.admin;

import com.medihub.user.User;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author DELL
 */
@WebServlet(name = "AdminViewDoctor", urlPatterns = {"/adminviewdoctor"})
public class AdminViewDoctor extends HttpServlet {



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
        int doctorId = Integer.parseInt(request.getParameter("dId"));
        
        User doctor = new User();
        doctor.setId(doctorId); 
        
         try
            {
            
               
                request.setAttribute("profile", doctor.getProfile());
                request.getRequestDispatcher("adminviewdoctor.jsp").forward(request, response);
                }catch(Exception e){
                   e.printStackTrace();
                }
        
       
    }

    

}
