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
import javax.servlet.http.HttpSession;

/**
 *
 * @author tharshan
 */
@WebServlet(name = "PharmacyReviewReport", urlPatterns = {"/pharmacyReviewReport"})
public class PharmacyReviewReport extends HttpServlet {

   

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
            int patientId =Integer.parseInt(session.getAttribute("userid").toString());
            int usertype = Integer.parseInt(session.getAttribute("usertype").toString());
        
            if(usertype==4){
                PrintWriter out = response.getWriter();
                    try
                    {
                        int getId=Integer.parseInt(request.getParameter("id"));
                        int getPharmacy=Integer.parseInt(request.getParameter("pharmacy"));

                        PharmacyReview dr = new PharmacyReview();
//                        out.print(dr.insertReview(patientId,getPharmacy,getRating,description));
                        int dd=dr.reportReview(getId);
                        if(dd>0){
                            session.setAttribute("alert", "success");
                            session.setAttribute("message", "Review Successfully Reported !");
                        }
                        else{
                            session.setAttribute("alert", "error");
                            session.setAttribute("message", "Review Reporting Unsuccessful !");
                        }
                        
                        response.sendRedirect("BrowsePharmacyReviews?search=1&pharmacy="+getPharmacy);
                    }
                    catch(Exception e)
                    {
                        out.println(e.toString());
                        out.print("jhfvgj");
                    }
            }else{
                request.getRequestDispatcher("403.jsp").forward(request, response);
            }
    }

    
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
