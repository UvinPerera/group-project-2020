/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.medihub.hospital;

import com.medihub.db.DbConfig;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
@WebServlet(name = "BrowseHospitalReviewsGuest", urlPatterns = {"/BrowseHospitalReviewsGuest"})
public class BrowseHospitalReviewsGuest extends HttpServlet {

   

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
        
             
             PrintWriter out = response.getWriter();
                    try
                    {
                        Hospital h = new Hospital();
                        if(request.getParameter("search")!=null){
                            if(request.getParameter("search").equalsIgnoreCase("1")){
                                if(request.getParameter("hospital")!=null){
    //                                out.print(request.getParameter("search"));
                                    int getHospital=Integer.parseInt(request.getParameter("hospital"));
                                    String getLimit="0";
                                    if(request.getParameter("limit")!=null){
                                        getLimit=request.getParameter("limit");
                                    }
                                    
                                    HospitalReview hr = new HospitalReview();
                                    request.setAttribute("hospital", h.getHospital(getHospital));
//                                    out.print(hr.getHospitalReviews(getHospital, getLimit));
                                    request.setAttribute("reviews", hr.getHospitalReviews(getHospital, getLimit));
                                    request.setAttribute("star", hr.getHospitalRating(getHospital));
                                }
                            }
                        }
//                            out.print("jhfvgj");
                        request.setAttribute("allHospitals", h.getAllActiveHospitals());
                        
                        request.getRequestDispatcher("hospitalReviewsGuest.jsp").forward(request, response);
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
