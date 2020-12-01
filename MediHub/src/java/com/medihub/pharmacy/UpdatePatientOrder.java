/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.medihub.pharmacy;

import com.medihub.db.DbConfig;
import com.medihub.db.*;
import java.sql.*; 
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
@WebServlet(name = "UpdatePatientOrder", urlPatterns = {"/updatepatientorder"})
public class UpdatePatientOrder extends HttpServlet {

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
             HttpSession session = request.getSession();
             int pharmacyId =Integer.parseInt(session.getAttribute("userid").toString());
             String description=request.getParameter("orderdescription");
             int orderId=Integer.parseInt(request.getParameter("orderid"));
             
             
             try{
                    DbConfig db = DbConfig.getInstance();
                    Connection con = db.getConnecton();
                    
                    Statement stmt=con.createStatement(); 
                   
                   int rs=stmt.executeUpdate("UPDATE pharmacy_orders SET description='"+description+"' WHERE id ="+ orderId);
                    
                  response.sendRedirect("pharmacy");
                    }catch(Exception e){
                       out.println(e.toString());
                   }
               
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