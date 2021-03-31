/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.medihub.pharmacy;

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
 * @author hp
 */
@WebServlet(name = "Pharmacy", urlPatterns = {"/pharmacy"})
public class PharmacyDashboard extends HttpServlet {

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
            int userType = Integer.parseInt(session.getAttribute("usertype").toString());
            int pharmacistId = Integer.parseInt(session.getAttribute("userid").toString());
            PrintWriter out = response.getWriter(); 
        if(userType==4){
             try
            {
                DbConfig db = DbConfig.getInstance();
                Connection con = db.getConnecton();
                
                Statement stmt=con.createStatement();
                ResultSet rs=stmt.executeQuery("SELECT pharmacy_id FROM pharmacy_admins WHERE user_id="+pharmacistId);
                int pharmacyId=-1;
                while(rs.next()){
                        pharmacyId=rs.getInt("pharmacy_id");
                }
                
                Pharmacy p = new Pharmacy(pharmacyId); //create a pharmacy object
  
                   Notifications n =new Notifications();
                request.setAttribute("anotifications", n.getUserNotificationsCount(pharmacyId));
                 
                request.setAttribute("pnotifications", n.getServiceNotificationsCount(pharmacistId, userType));
                String absolutePath = p.getAbsPath(pharmacistId);
                
                request.setAttribute("absolutePath",absolutePath);
                //request.setAttribute("orders", p.getAllOrders()); //directly get all order details
                request.setAttribute("completedOrders", p.getCompletedOrders()); //directly get all completed order details
                request.setAttribute("pendingOrders", p.getPendingOrders()); //directly get all pending order details
                request.setAttribute("noPending", p.getnoPendingOrders());
                request.setAttribute("noCompleted", p.getnoCompletedOrders());
                request.getRequestDispatcher("pharmacyDashboard.jsp").forward(request, response);
                }
            catch(Exception e)
            {
                out.println(e.toString());
            }
        }else{
                request.getRequestDispatcher("403.jsp").forward(request, response);
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
