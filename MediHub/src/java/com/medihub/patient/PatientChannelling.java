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
@WebServlet(name = "PatientChannelling", urlPatterns = {"/PatientChannelling"})
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
                PrintWriter out = response.getWriter();
                response.setContentType("application/json");
                 
                try
                {
                    //getting city data
                    if(request.getParameter("stage")=="district")
                    {
                        int districtId=Integer.parseInt(request.getParameter("district"));
                        City c = new City();
                        String returnData=c.getAllCitiesByDistrictAsString(districtId);
//                        request.setAttribute("data", returnData); //directly get cities
                        response.setContentType("text/html;charset=UTF-8");
                        response.getWriter().write(returnData);
                    }
                    
                    //getting hospital data
                    else if(request.getParameter("stage")=="city")
                    {
                        int cityId=Integer.parseInt(request.getParameter("city"));
                        Hospital h = new Hospital();
                        String returnData=h.getAllHospitalsByCityAsString(cityId);
//                        request.setAttribute("data", returnData); //directly get cities
                        response.setContentType("text/html;charset=UTF-8");
                        response.getWriter().write(returnData);
                    }
                    
                    //getting speciality data
                    else if(request.getParameter("stage")=="hospital")
                    {
                        int hospitalId=Integer.parseInt(request.getParameter("hospital"));
                        DoctorSpecialisation ds = new DoctorSpecialisation();
                        String returnData=ds.getAllSpecialisationsByHospitalAsString(hospitalId);
//                        request.setAttribute("data", returnData); //directly get cities
                        response.setContentType("text/html;charset=UTF-8");
                        response.getWriter().write(returnData);
                    }
                    
                    //getting doctor data
                    else if(request.getParameter("stage")=="special")
                    {
                        int hospitalId=Integer.parseInt(request.getParameter("hospital"));
                        int doctorSpecialisationId=Integer.parseInt(request.getParameter("doctorSpecialisation"));
                        String date=request.getParameter("date");
                        DoctorAvailability da = new DoctorAvailability();
                        String returnData=da.getAllDoctorAvailabilitiesByHospital(hospitalId,doctorSpecialisationId,date);
//                        request.setAttribute("data", returnData); //directly get cities
                        response.setContentType("text/html;charset=UTF-8");
                        response.getWriter().write(returnData);
                    }
                    
                    //returning district data by default
                    else
                    {
                        District d = new District();
                        List<District> returnData =new ArrayList<District>();
                        returnData=d.getAllDistricts();
                        request.setAttribute("district", returnData); //directly get districts
                        request.getRequestDispatcher("channelling.jsp").forward(request, response);
                    }

                }
                
                catch(Exception e)
                {
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
