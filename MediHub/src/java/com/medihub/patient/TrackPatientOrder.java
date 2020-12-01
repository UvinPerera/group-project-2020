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
@WebServlet(name = "TrackPatientOrder", urlPatterns = {"/trackpatientorder"})
public class TrackPatientOrder extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
   
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
   
        @Override
        protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            HttpSession session = request.getSession();
            int pharmacyId =Integer.parseInt(session.getAttribute("userid").toString());
            PrintWriter out = response.getWriter();   
            
            
            try
            {
                //getting from DbConfig class
                DbConfig db = DbConfig.getInstance();
                Connection con = db.getConnecton();
                
                Statement stmt=con.createStatement();
                //ResultSet rs=stmt.executeQuery("SELECT oi.order_id, po.created_by, u.display_name, po.created_at,po.description FROM pharmacy_orders po JOIN order_items oi ON po.id= oi.order_id JOIN users u ON oi.created_by=u.id WHERE oi.status=1 and po.pharmacy_id="+pharmacyId);
                ResultSet rs=stmt.executeQuery("SELECT oi.order_id, po.created_by, u.display_name, po.created_at,po.description as order_description, oi.file_path, oi.description FROM pharmacy_orders po JOIN order_items oi ON po.id= oi.order_id JOIN users u ON po.created_by=u.id WHERE po.status=1 and po.pharmacy_id=1");
                
                //out.println(pharmacyId);
                ArrayList Orders = new ArrayList();
                while(rs.next()){
                        ArrayList row = new ArrayList();
                        for (int i = 1; i <= 7 ; i++){
                            row.add(rs.getString(i));
                        }
                        Orders.add(row);
                }
               
                request.setAttribute("orders", Orders);
                request.getRequestDispatcher("trackOrder(phar).jsp").forward(request, response);
                }catch(Exception e){
                    out.println(e.toString());
                }
    }
    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
