/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.medihub.doctor;

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
@WebServlet(name = "DoctorReviewReport", urlPatterns = {"/doctorReviewReport"})
public class DoctorReviewReport extends HttpServlet {

   

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
        
            if(usertype==2){
                PrintWriter out = response.getWriter();
                    try
                    {
                        int getId=Integer.parseInt(request.getParameter("id"));
                        int getDoctor=Integer.parseInt(request.getParameter("doctor"));

                        DoctorReview dr = new DoctorReview();
//                        out.print(dr.insertReview(patientId,getDoctor,getRating,description));
                        int dd=dr.reportReview(getId);
                        if(dd>0){
                            session.setAttribute("alert", "success");
                            session.setAttribute("message", "Review Successfully Reported !");
                        }
                        else{
                            session.setAttribute("alert", "error");
                            session.setAttribute("message", "Review Reporting Unsuccessful !");
                        }
                        
                        response.sendRedirect("BrowseDoctorReviews?search=1&doctor="+getDoctor);
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
