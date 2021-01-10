/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.medihub.patient;

import com.medihub.doctor.*;
import com.medihub.payment.Payment;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
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
@WebServlet(name = "ConfirmChannelling", urlPatterns = {"/confirmchannelling"})
public class ConfirmChannelling extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
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
                PrintWriter out = response.getWriter();
//                response.setContentType("application/json");

                String check=request.getParameter("check");
                int doctorAvalabilityId;
                
                if(check==null)
                {
                    try
                    {
                        doctorAvalabilityId=Integer.parseInt(request.getParameter("doctorAvailabilityId"));
                        DoctorAvailability da = new DoctorAvailability();
//                        DoctorAvailability returnData =new DoctorAvailability();
//                        returnData=da.getDoctorAvailability(doctorAvalabilityId);
                        Payment p = new Payment();
                        request.setAttribute("payments", p.getPaymentMethods()); //directly get avail
                        request.setAttribute("doctorAvalability", da.getDoctorAvailability(doctorAvalabilityId)); 
                        request.getRequestDispatcher("confirmChannelling.jsp").forward(request, response);
                    }
                    catch(Exception e)
                    {
                        out.println(e.toString()+"000");
                    }
                }
                    
                else
                {
                    if(Integer.parseInt(check)==0)
                    {
                        try
                        {
                            doctorAvalabilityId=Integer.parseInt(request.getParameter("doctorAvailabilityId"));
                            Channelling c = new Channelling();
                            String returnData=c.checkDuplication(doctorAvalabilityId,patientId);
                            response.setContentType("text/html;charset=UTF-8");
                            out.write(returnData);
                        }
                        catch(Exception e)
                        {
                            out.println(e.toString()+"111");
                        }
                    }
                    else
                    {
                        try
                        {
                            doctorAvalabilityId=Integer.parseInt(request.getParameter("doctorAvailabilityId"));
                            DoctorAvailability da = new DoctorAvailability();
//                            DoctorAvailability returnData =new DoctorAvailability();
                            Payment p = new Payment();
                            
//                            returnData=da.getDoctorAvailability(doctorAvalabilityId);
                            request.setAttribute("doctorAvalability", da.getDoctorAvailability(doctorAvalabilityId)); //directly get avail
//                            out.print(returnData.id);
                            request.setAttribute("payments", p.getPaymentMethods()); //directly get avail
                            request.setAttribute("check", "1"); //check
                            request.getRequestDispatcher("confirmChannelling.jsp").forward(request, response);
                        }
                        catch(Exception e)
                        {
                            out.println(e.toString()+"222");
                        }
                    }
                    
                }
                    

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
   

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
