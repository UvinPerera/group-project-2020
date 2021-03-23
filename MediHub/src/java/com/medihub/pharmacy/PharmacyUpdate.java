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
@WebServlet(name = "PharmacyUpdate", urlPatterns = {"/pharmacyupdate"})
public class PharmacyUpdate extends HttpServlet {

@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            PrintWriter out = response.getWriter();
        try
        {
                HttpSession session = request.getSession();
                int pharmacistId =Integer.parseInt(session.getAttribute("userid").toString());
                DbConfig db = DbConfig.getInstance();
                Connection con = db.getConnecton();
                
                Statement stmt=con.createStatement();
                ResultSet rs=stmt.executeQuery("SELECT pharmacy_id FROM pharmacy_admins WHERE user_id="+pharmacistId);
                int pharmacyId=1;
                while(rs.next()){
                        pharmacyId=rs.getInt("pharmacy_id");
                }
                
             
             String displayName=request.getParameter("display_name");
             int city=Integer.parseInt(request.getParameter("city"));
             String address1=request.getParameter("address_1");
             String address2=request.getParameter("address_2");
             String landNumber=request.getParameter("land_number");
             ////////////////
             
               
             try{
                    Statement stmt2=con.createStatement(); 
                    
                    int rs2=stmt2.executeUpdate("UPDATE pharmacies SET updated_at=CURRENT_TIMESTAMP,updated_by='"+pharmacistId+"', display_name='"+displayName+"', address_1='"+address1+"', address_2='"+address2+"', land_number='"+landNumber+"',city='"+city+"' WHERE id ="+ pharmacyId);
                   
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
