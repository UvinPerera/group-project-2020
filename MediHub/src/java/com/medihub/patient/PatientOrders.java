/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.medihub.patient;

import com.medihub.db.*;
import java.sql.*;
import com.medihub.location.*;
import com.medihub.hospital.*;
import com.medihub.pharmacy.*;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.medihub.patient.*;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Yash
 */
@WebServlet(name = "PatientOrders", urlPatterns = {"/patientorders"})
public class PatientOrders extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
                HttpSession session = request.getSession();
                int patientId =Integer.parseInt(session.getAttribute("userid").toString());
                PrintWriter out = response.getWriter();
//                response.setContentType("application/json");

                    String stage= request.getParameter("stage");

                        try
                        {
                            District d = new District();
                            List<District> returnData =new ArrayList<District>();
                            returnData=d.getAllDistricts();
                            request.setAttribute("districts", returnData); //directly get districts
                            request.getRequestDispatcher("placeOrder.jsp").forward(request, response);
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
