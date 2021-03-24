/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.medihub.admin;

import com.medihub.pharmacy.Pharmacist;
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
@WebServlet(name = "AdminViewPharmacist", urlPatterns = {"/adminviewpharmacist"})
public class AdminViewPharmacist extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                   HttpSession session = request.getSession();
            int pharmacistId =Integer.parseInt(session.getAttribute("userid").toString());
            PrintWriter out = response.getWriter();   
            
            
            try
            {
                Pharmacist p = new Pharmacist(pharmacistId);
//                out.println(p.getProfile().id);
                request.setAttribute("profile", p.getProfile());
                request.getRequestDispatcher("AdminViewPharmacist.jsp").forward(request, response);
                }catch(Exception e){
                    out.println(e.toString());
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
