/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.medihub.user;

import com.medihub.doctor.*;
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
@WebServlet(name = "MarkAsReadNotifications", urlPatterns = {"/markAsReadNotifications"})
public class MarkAsReadNotifications extends HttpServlet {

   

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
            int userId =Integer.parseInt(session.getAttribute("userid").toString());
            int usertype = Integer.parseInt(session.getAttribute("usertype").toString());
        
                PrintWriter out = response.getWriter();
                    try
                    {
                        int getId=Integer.parseInt(request.getParameter("id"));
//                        System.out.println("hgfd");
                        Notifications n = new Notifications();
//                        out.print(dr.insertReview(patientId,getDoctor,getRating,description));
                        int nn=n.readNotification(getId);
                        if(nn>0){
                            out.print("success");
                        }
                        else{
                            out.print("err");
                        }
                        
                    }
                    catch(Exception e)
                    {
                        out.println(e.toString());
                        out.print("jhfvgj");
                    }
            
    }

    
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
