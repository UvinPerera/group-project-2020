/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.medihub.pharmacy;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.medihub.user.*;
import com.medihub.location.District;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.annotation.WebServlet;

import javax.servlet.http.HttpSession;


/**
 *
 * @author Yash
 */
@WebServlet(name = "ChangePasswordPharmacy", urlPatterns = {"/changepasswordpharmacy"})
public class ChangePasswordPharmacy extends HttpServlet {

    
 

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
                HttpSession session = request.getSession();
                PrintWriter out = response.getWriter();
//                response.setContentType("application/json");
                
                try
                {
                    if(session.getAttribute("alert")!=null) {
//                        out.print(session.getAttribute("message"));
                        request.setAttribute("alert", session.getAttribute("alert"));
                        request.setAttribute("message", session.getAttribute("message"));
                        session.removeAttribute("alert");
                        session.removeAttribute("message");
                    }
                    request.getRequestDispatcher("changePasswordPharmacy.jsp").forward(request, response);
                }
                catch(Exception e)
                {
                    out.println(e.toString());
                }
                    
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
