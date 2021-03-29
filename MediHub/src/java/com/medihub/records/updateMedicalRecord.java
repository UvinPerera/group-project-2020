/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.medihub.records;

import com.medihub.db.DbConfig;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author Yash
 */
@WebServlet(name = "updateMedicalRecord", urlPatterns = {"/updateMedicalRecord"})
public class updateMedicalRecord extends HttpServlet {

@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            PrintWriter out = response.getWriter();
        try
        {
           
             HttpSession session = request.getSession();
            
             int recordId =Integer.parseInt(request.getParameter("recordid"));
             int patientId =Integer.parseInt(session.getAttribute("userid").toString());
             String name=request.getParameter("name");
             String description = request.getParameter("description");
             
             
             try{
                    DbConfig db = DbConfig.getInstance();
                    Connection con = db.getConnecton();
                    
                    Statement stmt=con.createStatement(); 
                 
                 
                    int rs=stmt.executeUpdate("UPDATE medical_records SET updated_at=CURRENT_TIMESTAMP,updated_by="+patientId+",name='"+name+"',description='"+description+"' WHERE id = "+ recordId);
                 
                    response.sendRedirect("viewmedicalrecords");
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
