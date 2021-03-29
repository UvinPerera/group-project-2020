/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.medihub.admin;

import com.medihub.db.DbConfig;
import com.medihub.location.District;
import com.medihub.resources.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
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
            int License_Number = Integer.parseInt(request.getParameter("license_number"));
            String Pharmacy_Display_Name = request.getParameter("pharmacy_display_name");
            String Land_Number = request.getParameter("land_number");
            String Fax = request.getParameter("fax");
            String Email = request.getParameter("email");
            String Address1 = request.getParameter("address_1");
            String Address2 = request.getParameter("address_2");
            int City = Integer.parseInt(request.getParameter("city"));
            String Description = request.getParameter("description");
            String First_Name = request.getParameter("first_name");
            String Last_Name = request.getParameter("last_name");
            String Display_Name = request.getParameter("user_display_name");
            String Pharmacist_Email = request.getParameter("pharmacyadmin_email");
            String NIC = request.getParameter("nic_no");
            String DOB = request.getParameter("dob");
            String Gender = request.getParameter("gender");
            String Mobile_Number = request.getParameter("mobile_no");
            String Password= SecureUtils.generatePasswordHash(request.getParameter("password"));
  
       
      
      try{
                DbConfig db = DbConfig.getInstance();
                Connection con = db.getConnecton();
                
                Statement stmt=con.createStatement(); 
                int rs1=stmt.executeUpdate("insert into users(first_name,last_name,display_name,email,password,user_type,nic,dob,gender,mobile_number,address_1,address_2,city,status,created_at,updated_at,created_by,updated_by) "
                        +  "values('"+First_Name+"','"+Last_Name+"','"+Display_Name+"','"+Pharmacist_Email+"','"+Password+"',4,'"+NIC+"','"+DOB+"','"+Gender+"','"+Mobile_Number+"','"+Address1+"','"+Address2+"',"+City+",1,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,"+adminId+","+adminId+") ");
                
                String query = "SELECT LAST_INSERT_ID() AS temp";
                int temp=0;
                
                try{
                    PreparedStatement pst = con.prepareStatement(query);
                    ResultSet rs = pst.executeQuery();

                    while(rs.next()) { 

                        temp = rs.getInt("temp");

                     }

                }
                catch(Exception e){
                    e.toString();
                }

               int rs2=stmt.executeUpdate("insert into pharmacies(name,license_number,pharmacist_id,display_name,land_number,fax,email,address_1,address_2,city,status,description,created_by,updated_by,created_at,updated_at) "
                        + "values('"+Pharmacy_Name+"',"+License_Number+","+temp+",'"+Pharmacy_Display_Name+"','"+Land_Number+"','"+Fax+"','"+Email+"','"+Address1+"','"+Address2+"',"+City+",1,'"+Description+"',"+adminId+","+adminId+",CURRENT_TIMESTAMP,CURRENT_TIMESTAMP)");
                
                                
                
                
                int rs3=stmt.executeUpdate("insert into pharmacy_admins(user_id,pharmacy_id,privilege,status,created_at,updated_at,created_by,updated_by)"
                        + "values("+temp+",LAST_INSERT_ID(),1,1,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,"+adminId+","+adminId+") ");
                response.sendRedirect("readpharmacy");
          
                con.close();
      
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
