/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.medihub.records;

import com.medihub.db.DbConfig;
import com.medihub.user.Notifications;
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
@WebServlet(name = "managePermissions", urlPatterns = {"/managePermissions"})
public class managePermissions extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        PrintWriter out = response.getWriter();
        try
        {
             HttpSession session = request.getSession();
             int patientId =Integer.parseInt(session.getAttribute("userid").toString());
             int search=Integer.parseInt(request.getParameter("search"));
             int status=0;
             int doctorId=-1;
             try{
                    DbConfig db = DbConfig.getInstance();
                    Connection con = db.getConnecton();
                    
                    Statement stmt=con.createStatement(); 
                    if(search==1){
                         doctorId=Integer.parseInt(request.getParameter("doctor"));
//                        if(doctorId==""){ response.sendRedirect("managePermissions?search=0");}
                        ResultSet rs=stmt.executeQuery("SELECT status FROM record_premissions WHERE patient_id="+patientId+" and doctor_id = "+doctorId);
                   
                        while(rs.next()){
                                status=rs.getInt("status");
                        }
                    }
                    request.setAttribute("search", search);
                    request.setAttribute("status",status);
                    Notifications n = new Notifications(); 
                    n.createNotification(patientId,doctorId,"Record Permission Update", 1);
                    request.getRequestDispatcher("managePermissions.jsp").forward(request, response);
                   
                    
               
                    }catch(Exception e){
                       out.println(e.toString());
                   }
               
       }
         
        catch(Exception e)
        { 
            out.println(e.toString());
        }  
        
    }

}
