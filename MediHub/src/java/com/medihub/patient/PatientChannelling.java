/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.medihub.patient;

import com.medihub.location.*;
import com.medihub.hospital.*;
import com.medihub.doctor.*;
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
@WebServlet(name = "PatientChannelling", urlPatterns = {"/channelling"})
public class PatientChannelling extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    

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
                int userType = Integer.parseInt(session.getAttribute("usertype").toString());
                PrintWriter out = response.getWriter();
                
                if(userType==1){
                    
                    try
                    {
                        Hospital h = new Hospital();
                        DoctorSpecialisation ds = new DoctorSpecialisation();
//                        out.print(h.getAllActiveHospitals().get(0).displayName);
                        if(request.getParameter("search")!=null){
                            if(request.getParameter("search").equalsIgnoreCase("1")){
//                                out.print(request.getParameter("search"));
                                String getDoctor=request.getParameter("doctor");
                                String getHospital=request.getParameter("hospital");
                                String getSpecialisation=request.getParameter("specialisation");
                                String getDate=request.getParameter("date");
                                String getLimit="0";
                                if(request.getParameter("limit")!=null){
                                    getLimit=request.getParameter("limit");
                                }

                                DoctorAvailability da = new DoctorAvailability();
//                                out.print(da.getDoctorAvailabilitiesChanneling(getDoctor, getHospital, getSpecialisation, getDate, getLimit));
                                request.setAttribute("availabilities", da.getDoctorAvailabilitiesChanneling(getDoctor, getHospital, getSpecialisation, getDate, getLimit));
                            }
                        }
                        request.setAttribute("hospitals", h.getAllActiveHospitals()); //directly get districts
                        request.setAttribute("specialisations", ds.getAllActiveSpecialisations()); //directly get districts
                        request.getRequestDispatcher("channelling.jsp").forward(request, response);
                    }
                    catch(Exception e)
                    {
                        out.println(e.toString());
                    }
                    
                }
                else{
                    request.getRequestDispatcher("403.jsp").forward(request, response);
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
