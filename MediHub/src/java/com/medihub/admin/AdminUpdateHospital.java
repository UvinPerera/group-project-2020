/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.medihub.admin;

import com.medihub.db.DbConfig;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
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
@WebServlet(name = "AdminUpdateHospital", urlPatterns = {"/adminupdatehospital"})
public class AdminUpdateHospital extends HttpServlet {



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
            
        try
        {

            DbConfig db = DbConfig.getInstance();
            Connection con = db.getConnecton();
            
            
            String hospitalId = request.getParameter("hId");
          //  System.out.println(doctorId+"\n");
            String Name=request.getParameter("name");
            String displayName=request.getParameter("display_name");
         //   System.out.println(display_name+"\n");
            String address1=request.getParameter("address_1");
         //   System.out.println(address1+"\n");
            String address2=request.getParameter("address_2");
        //    System.out.println(address2+"\n");
         //   String mobile=request.getParameter("mobile_number");
         //   System.out.println(mobile+"\n");
            String landNumber=request.getParameter("land_number");
         //   System.out.println(land_line+"\n");
            int city=Integer.parseInt(request.getParameter("city"));
        //    System.out.println(city);
            //System.out.println(doctorId+" "+first_name+" "+last_name+" "+display_name+" "+address1+" "+address2+" "+mobile+" "+land_line+" "+city);
            
            
            
            String query="UPDATE hospitals SET "
                    + "name='"+Name+"',"
                    + "display_name='"+displayName+"',"
                    + "address_1='"+address1+"',"
                    + "address_2='"+address2+"',"
                    + "city="+city+","
                  //  + "mobile_number='"+mobile+"',"
                    + "land_number='"+landNumber+"',"
                    + "updated_by="+adminId+","
                    + "updated_at=CURRENT_TIMESTAMP "
                    + "where id="+hospitalId;


            PreparedStatement stmt=con.prepareStatement(query);  
            int rs=stmt.executeUpdate();
            
        //    if(rs>0) {
          //      System.out.println("success");
       //     }
         //   else {
           //     System.out.println("error");
          //  }
            
        response.sendRedirect("adminedithospital?hId="+hospitalId);
            con.close();  
        }
        catch(Exception e)
        { 
            out.println(e.toString());
            e.printStackTrace();
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
