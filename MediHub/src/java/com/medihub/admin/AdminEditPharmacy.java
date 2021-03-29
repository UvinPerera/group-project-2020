/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.medihub.admin;

import com.medihub.location.City;
import com.medihub.location.District;
import com.medihub.pharmacy.Pharmacy;
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
@WebServlet(name = "AdminEditPharmacy", urlPatterns = {"/admineditpharmacy"})
public class AdminEditPharmacy extends HttpServlet {


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
            int pharmacyId = Integer.parseInt(request.getParameter("pId"));
            PrintWriter out = response.getWriter();
             
            
       
             try
            {
                
                Pharmacy pharmacy = new Pharmacy();
                pharmacy.setId(pharmacyId);
                District d = new District();
                
                City c = new City();
                
                request.setAttribute("cities", c.getAllCities()); //directly get districts
                request.setAttribute("districts", d.getAllDistricts()); //directly get districts
                request.setAttribute("pharmacyprofile", pharmacy.getPharmacyProfile());
                request.getRequestDispatcher("AdminEditPharmacy.jsp").forward(request, response);
            }
             catch(Exception e){
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
