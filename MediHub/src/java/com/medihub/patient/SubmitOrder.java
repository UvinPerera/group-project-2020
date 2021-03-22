/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.medihub.patient;
import java.sql.*; 
import com.medihub.db.DbConfig;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author Yash
 */

@WebServlet(name = "SubmitOrder", urlPatterns = {"/submitorder"})
@MultipartConfig
public class SubmitOrder extends HttpServlet {
    
 protected String getSaltString() {
        String SALTCHARS = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890";
        StringBuilder salt = new StringBuilder();
        Random rnd = new Random();
        while (salt.length() < 30) { // length of the random string.
            int index = (int) (rnd.nextFloat() * SALTCHARS.length());
            salt.append(SALTCHARS.charAt(index));
        }
        String saltStr = salt.toString();
        return saltStr;

    }
   
  
 @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            PrintWriter out = response.getWriter();
        try
        {
            
            //getting from DbConfig class
            DbConfig db = DbConfig.getInstance();
            Connection con = db.getConnecton();
            
            HttpSession session = request.getSession();
            int patientId =Integer.parseInt(session.getAttribute("userid").toString());
                    
            String description=request.getParameter("description");
            String filepath=request.getParameter("file_path");
            String date = request.getParameter("date");
            int pharmacyid=Integer.parseInt(request.getParameter("pharmacy"));
            int id;
            String status="Pending";
            String randomString = getSaltString();
            String extension = ".pdf"; 
            String absolutePath = randomString+extension;
            
            String query="INSERT INTO pharmacy_orders (id,pharmacy_id,status,created_at,updated_at,created_by,order_status,expected_delivery_date) VALUES(NULL,'"+pharmacyid+"',1,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'"+patientId+"','"+status+"','"+date+"')";
            PreparedStatement stmt=con.prepareStatement(query);  
            int rs=stmt.executeUpdate();
            
            String query2="INSERT INTO order_items (id,order_id,file_path,absolute_path,description,status,created_at,updated_at,created_by) VALUES(NULL,LAST_INSERT_ID(),'"+filepath+"','"+absolutePath+"','"+description+"',1,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'"+patientId+"')";
            PreparedStatement stmt2=con.prepareStatement(query2);  
            int rs2=stmt2.executeUpdate();
//            Part filePart = request.getPart("file");
//            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // MSIE fix.
//            InputStream fileContent = filePart.getInputStream();
//            out.println("fileName");
           response.sendRedirect("patient");
            con.close();  
        }
        catch(Exception e)
        { 
            out.println(e.toString());
        }  
    }
}
