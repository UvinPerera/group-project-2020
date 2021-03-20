/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.medihub.pharmacy;

import java.io.IOException;
import java.io.PrintWriter;
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
        int pharmacyId = Integer.parseInt(session.getAttribute("userid").toString());
        
        if(userType==4){
                Pharmacy p = new Pharmacy(pharmacyId); //create a pharmacy object
                

                request.setAttribute("orders", p.getAllOrders()); //directly get all order details
                request.setAttribute("completedOrders", p.getCompletedOrders()); //directly get all completed order details
                request.setAttribute("pendingOrders", p.getPendingOrders()); //directly get all pending order details
                request.getRequestDispatcher("pharmacyDashboard.jsp").forward(request, response);
        }
        else{
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
