/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.medihub.patient;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author tharshan
 */
@WebServlet(name = "ChannellingResult", urlPatterns = {"/channellingresult"})
public class ChannellingResult extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
            HttpSession session = request.getSession();
            int patientId =Integer.parseInt(session.getAttribute("userid").toString());
       
            PrintWriter out = response.getWriter();
        try
        {
            
            //getting from DbConfig class
            
            int id = Integer.parseInt(request.getParameter("id"));
            
            Channelling c = new Channelling();
            Channelling cc = new Channelling();
            
            cc=c.getChannelling(id);
//            out.print(cc.patientId);
//            out.print(c.submitChannelling(id,patientId,description));
            
            if (cc.patientId!=patientId)
            {
                response.sendRedirect("patient");
            }
            else
            {
            
            request.setAttribute("channelling", cc); //directly get appointment status
            request.getRequestDispatcher("channellingResult.jsp").forward(request, response);
            }
            
        }
        catch(Exception e)
        { 
            out.println(e.toString());
        }  
    }

   
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        
//            HttpSession session = request.getSession();
//            int patientId =Integer.parseInt(session.getAttribute("userid").toString());
//       
//            PrintWriter out = response.getWriter();
//        try
//        {
//            
//            //getting from DbConfig class
//            
//            int id = Integer.parseInt(request.getParameter("channelling"));
//            
//            Channelling c = new Channelling();
////            out.print(c.submitChannelling(id,patientId,description));
//                
//            
//            request.setAttribute("channelling", c.getChannelling(id)); //directly get appointment status
//            request.getRequestDispatcher("ChannellingResult.jsp").forward(request, response);
//            
//        }
//        catch(Exception e)
//        { 
//            out.println(e.toString());
//        }  
//    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
