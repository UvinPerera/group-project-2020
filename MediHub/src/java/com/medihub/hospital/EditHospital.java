/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.medihub.hospital;

import com.medihub.db.DbConfig;
import com.medihub.location.City;
import com.medihub.location.District;
import com.medihub.user.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
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
@WebServlet(name = "EditHospital", urlPatterns = {"/edithospital"})
public class EditHospital extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
             HttpSession session = request.getSession();
            int hospitalAdminId =Integer.parseInt(session.getAttribute("userid").toString());
             PrintWriter out = response.getWriter();
            
       
             try
            {
                DbConfig db = DbConfig.getInstance();
                Connection con = db.getConnecton();
                Statement stmt=con.createStatement();
                
                ResultSet rs=stmt.executeQuery("SELECT hospital_id FROM hospital_admins WHERE user_id="+hospitalAdminId);
                int hospitalId=1;
                while(rs.next()){
                        hospitalId=rs.getInt("hospital_id");
                }
                
                Hospital h = new Hospital(hospitalId); 
                User u = new User(hospitalAdminId);
                District d = new District();
                City c = new City();
                
                request.setAttribute("cities", c.getAllCities()); //directly get districts
                request.setAttribute("districts", d.getAllDistricts()); //directly get districts
                request.setAttribute("profile", u.getProfile());
                request.setAttribute("hospitalprofile", h.getHospital(hospitalId));
                request.getRequestDispatcher("edithospital.jsp").forward(request, response);
            }
             catch(Exception e){
                    out.println(e.toString());
                }
                
    }

}
