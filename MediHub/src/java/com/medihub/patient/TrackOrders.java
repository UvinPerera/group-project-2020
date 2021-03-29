/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.medihub.patient;

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
@WebServlet(name = "TrackOrders", urlPatterns = {"/TrackOrders"})
public class TrackOrders extends HttpServlet {
@Override
        protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            HttpSession session = request.getSession();
            int patientId =Integer.parseInt(session.getAttribute("userid").toString());
            PrintWriter out = response.getWriter();   
            
            
            try
            {
                //getting from DbConfig class
                DbConfig db = DbConfig.getInstance();
                Connection con = db.getConnecton();
                
                Statement stmt=con.createStatement();
                if(Integer.parseInt(request.getParameter("search"))==0){
                ResultSet rs=stmt.executeQuery("SELECT po.id, po.pharmacy_id, p.name,po.expected_delivery_date,po.order_status, oi.file_path, oi.description,oi.absolute_path FROM pharmacy_orders po JOIN pharmacies p ON p.id=po.pharmacy_id JOIN order_items oi ON oi.order_id=po.id WHERE po.status = 1 and po.created_by="+patientId);
                
                //out.println(pharmacyId);
                ArrayList records = new ArrayList();
                while(rs.next()){
                        ArrayList row = new ArrayList();
                        for (int i = 1; i <= 8 ; i++){
                            row.add(rs.getString(i));
                        }
                        records.add(row);
                }
                
                request.setAttribute("orders", records);
                }
                else{
                    String Pharmacy=request.getParameter("pharmacy");
                    String orderStatus=request.getParameter("status");
                    
                    
                        ResultSet rs=stmt.executeQuery("SELECT po.id, po.pharmacy_id, p.name,po.expected_delivery_date,po.order_status, oi.file_path, oi.description,oi.absolute_path FROM pharmacy_orders po JOIN pharmacies p ON p.id=po.pharmacy_id JOIN order_items oi ON oi.order_id=po.id WHERE po.status = 1 and po.created_by="+patientId+" and (p.name='"+Pharmacy+"' or po.order_status='"+orderStatus+"')");

                        //out.println(pharmacyId);
                        ArrayList Orders = new ArrayList();
                        while(rs.next()){
                                ArrayList row = new ArrayList();
                                for (int i = 1; i <= 8 ; i++){
                                    row.add(rs.getString(i));
                                }
                                Orders.add(row);
                        }
                        request.setAttribute("orders", Orders);
                    
                }
                request.getRequestDispatcher("trackOrder(pat).jsp").forward(request, response);
                }catch(Exception e){
                    out.println(e.toString());
                }
    }
   
     
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
