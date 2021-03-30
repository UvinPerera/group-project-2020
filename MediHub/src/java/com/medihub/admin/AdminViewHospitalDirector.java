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
import javax.servlet.http.HttpSession;

/**
 *
 * @author DELL
 */
@WebServlet(name = "AdminViewHospitalDirector", urlPatterns = {"/adminviewhospitaldirector"})
public class AdminViewHospitalDirector extends HttpServlet {


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
            PrintWriter out = response.getWriter();
         try
            {
                int userId = Integer.parseInt(request.getParameter("hid"));
                
                User h = new User();
               
                h.id=userId;
                //out.println(p.getProfile().districtStr);
                request.setAttribute("profile", h.getProfile());
                //out.print(p.firstName);
               request.getRequestDispatcher("adminviewhospitaldirector.jsp").forward(request, response);
                }catch(Exception e){
                    e.printStackTrace();
                }
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
