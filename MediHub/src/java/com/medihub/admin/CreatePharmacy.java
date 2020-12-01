/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.medihub.admin;

import com.medihub.db.DbConfig;
import com.medihub.location.District;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
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
 * @author DELL
 */
@WebServlet(name = "CreatePharmacy", urlPatterns = {"/createpharmacy"})
public class CreatePharmacy extends HttpServlet {

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
                int adminId =Integer.parseInt(session.getAttribute("userid").toString());
                PrintWriter out = response.getWriter();
//                response.setContentType("application/json");

                    String stage= request.getParameter("stage");

                        try
                        {
                            District d = new District();
                            List<District> returnData =new ArrayList<District>();
                            returnData=d.getAllDistricts();
                            request.setAttribute("districts", returnData); //directly get districts
                            request.getRequestDispatcher("createpharmacy.jsp").forward(request, response);
                        }
                        catch(Exception e)
                        {
                            out.println(e.toString());
                        }
                    
                   

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
                int adminId =Integer.parseInt(session.getAttribute("userid").toString());
         
           PrintWriter out = response.getWriter();
            String Pharmacy_Name = request.getParameter("pharmacy_name");
            String Display_Name = request.getParameter("display_name");
            int License_Number = Integer.parseInt(request.getParameter("license_number"));
//            String License_Proof_Location = request.getParameter("license_proof_location");
//            int Pharmacist_Id = Integer.parseInt(request.getParameter("pharmacist_id"));
//            String Pharmacist_Proof_Location = request.getParameter("pharmacist_proof_location");
            String Land_Number = request.getParameter("land_line");
            String Fax = request.getParameter("fax");
            String Email = request.getParameter("email");
            String Address1 = request.getParameter("address_1");
            String Address2 = request.getParameter("address_2");
            int City = Integer.parseInt(request.getParameter("city"));
            String description = request.getParameter("description");
            
      // out.print(Pharmacy_Name);
      
      
      try{
               DbConfig db = DbConfig.getInstance();
                Connection con = db.getConnecton();
                
                Statement stmt=con.createStatement(); 
                int rs=stmt.executeUpdate("insert into pharmacies(name,display_name,license_number,land_number,fax,email,address_1,address_2,city,status,description,created_by,updated_by,created_at,updated_at) "
                        + "values('"+Pharmacy_Name+"','"+Display_Name+"',"+License_Number+",'"+Land_Number+"','"+Fax+"','"+Email+"','"+Address1+"','"+Address2+"',"+City+",1,'"+description+"',"+adminId+","+adminId+",CURRENT_TIMESTAMP,CURRENT_TIMESTAMP)");
                response.sendRedirect("readpharmacy");
            }
            catch(Exception e){
                e.printStackTrace();
                out.print(e.toString());
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
