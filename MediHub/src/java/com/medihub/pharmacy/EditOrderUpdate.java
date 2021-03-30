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
@WebServlet(name = "EditOrderUpdate", urlPatterns = {"/editorderupdate"})
public class EditOrderUpdate extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs*/
   

    @Override
            protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
             HttpSession session = request.getSession();
            int pharmacyId =Integer.parseInt(session.getAttribute("userid").toString());
            int orderId = Integer.parseInt(request.getParameter("orderid"));
            PrintWriter out = response.getWriter();
            
            try{
                DbConfig db = DbConfig.getInstance();
                Connection con = db.getConnecton();
                
                Statement stmt=con.createStatement(); 
                ResultSet rs =stmt.executeQuery("SELECT oi.order_id,po.created_by, u.display_name, po.created_at,oi.description , oi.file_path, po.order_status,po.expected_delivery_date,po.pharmacy_id FROM pharmacy_orders po JOIN order_items oi ON po.id= oi.order_id JOIN users u ON po.created_by=u.id WHERE po.status=1 and po.id="+orderId);
                
                //out.println(pharmacyId);
                ArrayList Orders = new ArrayList();
                while(rs.next()){
                        ArrayList row = new ArrayList();
                        for (int i = 1; i <= 9 ; i++){
                            row.add(rs.getString(i));
                        }
                        Orders.add(row);
                }
               
                request.setAttribute("orders", Orders);
                request.getRequestDispatcher("update_order.jsp").forward(request, response);
                }catch(Exception e){
                    out.println(e.toString());
                }
                
    }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
