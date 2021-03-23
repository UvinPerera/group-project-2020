/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.medihub.hospital;

import com.medihub.hospital.*;
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
@WebServlet(name = "UpdateReviewH", urlPatterns = {"/updateReviewH"})
public class UpdateReviewH extends HttpServlet {

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
            HttpSession session = request.getSession();
            int patientId =Integer.parseInt(session.getAttribute("userid").toString());
            int usertype = Integer.parseInt(session.getAttribute("usertype").toString());
        
            if(usertype==1){
                PrintWriter out = response.getWriter();
                    try
                    {
                        int getRating=Integer.parseInt(request.getParameter("rating"));
                        int getId=Integer.parseInt(request.getParameter("id"));
                        int getHospital=Integer.parseInt(request.getParameter("hospital"));
                        String description=request.getParameter("review");

                        HospitalReview dr = new HospitalReview();
//                        out.print(dr.insertReview(getId,patientId,getRating,description));
                        int dd=dr.updateReview(getId,patientId,getRating,description);
                        if(dd>0){
                            session.setAttribute("alert", "success");
                            session.setAttribute("message", "Review Successfully Updated !");
                        }
                        else{
                            session.setAttribute("alert", "error");
                            session.setAttribute("message", "Review Unsuccessful !");
                        }
                        
                        response.sendRedirect("BrowseHospital?search=1&hospital="+getHospital);
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
