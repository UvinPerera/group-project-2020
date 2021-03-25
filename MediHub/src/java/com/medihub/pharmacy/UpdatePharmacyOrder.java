/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.medihub.pharmacy;

import com.medihub.db.DbConfig;
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
@WebServlet(name = "UpdatePharmacyOrder", urlPatterns = {"/updatepharmacyorder"})
public class UpdatePharmacyOrder extends HttpServlet {

@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            PrintWriter out = response.getWriter();
        try
        {
             HttpSession session = request.getSession();
             int pharmacistId =Integer.parseInt(session.getAttribute("userid").toString());
             String orderStatus=request.getParameter("orderstatus");
             int orderId=Integer.parseInt(request.getParameter("orderid"));
             String date = request.getParameter("deliverydate");
             
             
             try{
                    DbConfig db = DbConfig.getInstance();
                    Connection con = db.getConnecton();
                    
                    Statement stmt=con.createStatement(); 
                    if(date.isEmpty()){
                        int rs=stmt.executeUpdate("UPDATE pharmacy_orders SET updated_at=CURRENT_TIMESTAMP,updated_by='"+pharmacistId+"',order_status='"+orderStatus+"' WHERE id ="+ orderId);
                    }
                    else{
                    int rs=stmt.executeUpdate("UPDATE pharmacy_orders SET updated_at=CURRENT_TIMESTAMP,updated_by='"+pharmacistId+"', expected_delivery_date='"+date+"',order_status='"+orderStatus+"' WHERE id ="+ orderId);
                    }
                  // int rs2=stmt.executeUpdate("UPDATE order_items SET updated_at=CURRENT_TIMESTAMP, updated_by='"+pharmacistId+"',description='"+description+"' WHERE order_id ="+ orderId);
                    
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
}
