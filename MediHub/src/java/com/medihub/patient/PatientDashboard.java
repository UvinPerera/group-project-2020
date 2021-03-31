package com.medihub.patient;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import com.medihub.db.DbConfig;
import com.medihub.prescription.PrescriptionItem;
import com.medihub.user.Notifications;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
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
@WebServlet(name = "Patient", urlPatterns = {"/patient"})
public class PatientDashboard extends HttpServlet {

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
            int patientId =Integer.parseInt(session.getAttribute("userid").toString());
            int userType = Integer.parseInt(session.getAttribute("usertype").toString());
             PrintWriter out = response.getWriter();
            if(userType==1){
               
            try
            {
                
//                get pending appointments from patient class
                Patient p = new Patient(patientId); //create patient object
                
                
                String absolutePath = p.getAbsPath();
                request.setAttribute("absolutePath",absolutePath);
                request.setAttribute("appointments", p.getPendingAppointments()); //directly get appointments
                request.setAttribute("cappointments", p.getPendingAppointmentsCount()); //directly get appointments
                
                
                
                DbConfig db = DbConfig.getInstance();
                Connection con = db.getConnecton();
                Statement stmt=con.createStatement();
                ResultSet rs=stmt.executeQuery("SELECT po.id, po.pharmacy_id, p.name,po.expected_delivery_date,po.order_status, oi.file_path, oi.description,oi.absolute_path FROM pharmacy_orders po "
                                            + "JOIN pharmacies p ON p.id=po.pharmacy_id "
                                            + "JOIN order_items oi ON oi.order_id=po.id "
                                            + "WHERE po.status = 1 and po.created_by="+patientId+" and po.order_status='Pending'"
                                            + "ORDER BY po.created_at DESC LIMIT 6");
                
                //get orders;
                ArrayList records = new ArrayList();
                while(rs.next()){
                        ArrayList row = new ArrayList();
                        for (int i = 1; i <= 8 ; i++){
                            row.add(rs.getString(i));
                        }
                        records.add(row);
                }
                
                rs=stmt.executeQuery("SELECT count(po.id) as ccount FROM pharmacy_orders po "
                                            + "JOIN pharmacies p ON p.id=po.pharmacy_id "
                                            + "JOIN order_items oi ON oi.order_id=po.id "
                                            + "WHERE po.status = 1 and po.created_by="+patientId+" and po.order_status='Pending'"
                                            + "ORDER BY po.created_at DESC");
                
                //get orders;
                int  ccorders = 0;
                while(rs.next()){
                        ccorders=rs.getInt("ccount");
                }
                
                Notifications n =new Notifications();
                request.setAttribute("cnotifications", n.getUserNotificationsCount(patientId));
                
                
                request.setAttribute("orders", records);
                
                request.setAttribute("corders", ccorders);
                
                PrescriptionItem pi = new PrescriptionItem();
                request.setAttribute("creminders", pi.getRemindersCount(patientId)); 
                
                
                
//                System.out.println(p.getPendingAppointments());
                request.getRequestDispatcher("patientDashboard.jsp").forward(request, response);
                }
            catch(Exception e)
            {
                out.println(e.toString());
            }
        }else{
                request.getRequestDispatcher("403.jsp").forward(request, response);
            }
           
    }

    
    
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
