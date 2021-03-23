/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.medihub.pharmacy;

import com.medihub.db.DbConfig;
import com.medihub.location.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Yash
 */
@WebServlet(name = "EditPharmacy", urlPatterns = {"/editpharmacy"})
public class EditPharmacy extends HttpServlet {

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            PrintWriter out = response.getWriter();
            
            HttpSession session = request.getSession();
            int pharmacistId =Integer.parseInt(session.getAttribute("userid").toString());
            
            
       
             try
            {
                DbConfig db = DbConfig.getInstance();
                Connection con = db.getConnecton();
                
                Statement stmt=con.createStatement();
                ResultSet rs=stmt.executeQuery("SELECT pharmacy_id FROM pharmacy_admins WHERE user_id="+pharmacistId);
                int pharmacyId=0;
                while(rs.next()){
                        pharmacyId=rs.getInt("pharmacy_id");
                }
                
                Pharmacist ps = new Pharmacist(pharmacistId);
                Pharmacy p = new Pharmacy(pharmacyId);
                
                District d = new District();
                
                City c = new City();
                
                request.setAttribute("cities", c.getAllCities()); //directly get districts
                request.setAttribute("districts", d.getAllDistricts()); //directly get districts
                request.setAttribute("pharmacyprofile", p.getPharmacyProfile());
                request.getRequestDispatcher("editpharmacy.jsp").forward(request, response);
            }
             catch(Exception e){
                    out.println(e.toString());
                }
                
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
