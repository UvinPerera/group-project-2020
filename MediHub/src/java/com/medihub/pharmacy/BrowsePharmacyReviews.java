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
@WebServlet(name = "BrowsePharmacyReviews", urlPatterns = {"/BrowsePharmacyReviews"})
public class BrowsePharmacyReviews extends HttpServlet {

   

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
            
            if(usertype==1){
             PrintWriter out = response.getWriter();
                    try
                    {
                        Pharmacy h = new Pharmacy();
                        if(request.getParameter("search")!=null){
                            if(request.getParameter("search").equalsIgnoreCase("1")){
                                if(request.getParameter("pharmacy")!=null){
    //                                out.print(request.getParameter("search"));
                                    int getPharmacy=Integer.parseInt(request.getParameter("pharmacy"));
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

                                    
                                    PharmacyReview hr = new PharmacyReview();
                                    request.setAttribute("pharmacy", h.getPharmacy(getPharmacy));
//                                    out.print(dr.getPharmacyReviews(getPharmacy, getLimit));
                                    request.setAttribute("reviews", hr.getPharmacyReviews(getPharmacy, getLimit));
                                    request.setAttribute("star", hr.getPharmacyRating(getPharmacy));
                                }
                            }
                        }
//                            out.print("jhfvgj");
                        request.setAttribute("allPharmacies", h.getAllActivePharmacies());
                        request.getRequestDispatcher("pharmacyReviews.jsp").forward(request, response);
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
