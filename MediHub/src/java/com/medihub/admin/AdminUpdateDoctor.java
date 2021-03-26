/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.medihub.admin;

import com.medihub.db.DbConfig;
import com.medihub.user.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author DELL
 */
@WebServlet(name = "AdminUpdateDoctor", urlPatterns = {"/adminupdatedoctor"})
public class AdminUpdateDoctor extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            HttpSession session = request.getSession();
            int adminId =Integer.parseInt(session.getAttribute("userid").toString());
            PrintWriter out = response.getWriter();
            
        try
        {

            DbConfig db = DbConfig.getInstance();
            Connection con = db.getConnecton();
            int doctorId = Integer.parseInt(request.getParameter("dId"));
            User doctor = new User();
            doctor.setId(doctorId); 
            request.setAttribute("profile", doctor.getProfile());
            
            String first_name=request.getParameter("first_name");
            String last_name=request.getParameter("last_name");
            String display_name=request.getParameter("display_name");
            String address1=request.getParameter("address_1");
            String address2=request.getParameter("address_2");
            String mobile=request.getParameter("mobile_number");
            String land_line=request.getParameter("land_number");
            int city=Integer.parseInt(request.getParameter("city"));

            
            
            
            String query="UPDATE users SET "
                    + "first_name='"+first_name+"',"
                    + "last_name='"+last_name+"',"
                    + "display_name='"+display_name+"',"
                    + "address_1='"+address1+"',"
                    + "address_2='"+address2+"',"
                    + "city="+city+","
                    + "mobile_number='"+mobile+"',"
                    + "land_number='"+land_line+"',"
                    + "updated_by="+adminId+","
                    + "updated_at=CURRENT_TIMESTAMP "
                    + "where id="+adminId;


            PreparedStatement stmt=con.prepareStatement(query);  
            int rs=stmt.executeUpdate();
            
        response.sendRedirect("admineditdoctor");
            con.close();  
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
