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
@WebServlet(name = "UserNotifications", urlPatterns = {"/userNotifications"})
public class UserNotifications extends HttpServlet {

   

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
    //                                out.print(request.getParameter("search"));
                                    String getLimit="0";
                                    if(request.getParameter("limit")!=null){
                                        getLimit=request.getParameter("limit");
                                    }
                                    if(session.getAttribute("alert")!=null) {
                //                        out.print(session.getAttribute("message"));
                                        request.setAttribute("alert", session.getAttribute("alert"));
                                        request.setAttribute("message", session.getAttribute("message"));
                                        session.removeAttribute("alert");
                                        session.removeAttribute("message");
                                    }
                                    
                                    Notifications n = new Notifications();
                                    request.setAttribute("notifications", n.getUserNotifications(userId, getLimit));
//                                    System.out.println(n.getUserNotifications(userId, getLimit).get(0).fromName);
//                            out.print("jhfvgj");
                        request.getRequestDispatcher("userNotifications.jsp").forward(request, response);
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
