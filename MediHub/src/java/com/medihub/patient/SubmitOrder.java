/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.medihub.patient;
import java.sql.*; 
import com.medihub.db.DbConfig;
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
 * @author Yash
 */
@WebServlet(name = "SubmitOrder", urlPatterns = {"/submitorder"})
public class SubmitOrder extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
   
  
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
                    
            String itemDescription=request.getParameter("descriptions");
            String filepath=request.getParameter("file_path");
            int pharmacyid=Integer.parseInt(request.getParameter("pharmacy"));
            int id;
            String status="Pending";

            String query="INSERT INTO pharmacy_orders (id,pharmacy_id,status,created_at,updated_at,created_by,description) VALUES(NULL,'"+pharmacyid+"',1,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'"+patientId+"','"+status+"')";
            PreparedStatement stmt=con.prepareStatement(query);  
            int rs=stmt.executeUpdate();
            
            String query2="INSERT INTO order_items (id,order_id,file_path,description,status,created_at,updated_at,created_by) VALUES(NULL,LAST_INSERT_ID(),'"+filepath+"','"+itemDescription+"',1,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'"+patientId+"')";
            PreparedStatement stmt2=con.prepareStatement(query2);  
            int rs2=stmt2.executeUpdate();
            
            response.sendRedirect("patient");
            con.close();  
        }
        catch(Exception e)
        { 
            out.println(e.toString());
        }  
    }
}
