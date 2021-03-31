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
@WebServlet(name = "updatePermissions", urlPatterns = {"/updatePermissions"})
public class updatePermissions extends HttpServlet {
@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            PrintWriter out = response.getWriter();
        try
        {
                HttpSession session = request.getSession();
                int patientId =Integer.parseInt(session.getAttribute("userid").toString());
                DbConfig db = DbConfig.getInstance();
                Connection con = db.getConnecton();
                int flag = 0;
                String description=request.getParameter("description");
                int status=Integer.parseInt(request.getParameter("status"));
                int doctorId=Integer.parseInt(request.getParameter("doctorId"));
                Statement stmt=con.createStatement();
                ResultSet rs=stmt.executeQuery("SELECT status FROM record_premissions WHERE patient_id="+patientId+" and doctor_id="+doctorId);
                
                if(rs.next()!=false){
                    flag=1;
                }
                
             try{
                 if(flag==1){
                     Statement stmt2=con.createStatement(); 
                    
                    int rs2=stmt2.executeUpdate("UPDATE record_premissions SET updated_at=CURRENT_TIMESTAMP,updated_by='"+patientId+"', status="+status+", description='"+description+"'WHERE patient_id="+patientId+" and doctor_id="+doctorId);
                  
                  }
                 else{
                     Statement stmt2=con.createStatement(); 
                    
                    int rs2=stmt2.executeUpdate("INSERT INTO record_premissions (doctor_id,patient_id,description,status,created_at,created_by) VALUES ("+doctorId+","+patientId+",'"+description+"',"+status+",CURRENT_TIMESTAMP,"+patientId+")");
                  
                 } 
                 Notifications n = new Notifications();
                 n.createNotification(patientId, doctorId, "Viewing Permissions have been updated", 1);
                  response.sendRedirect("patient");
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
