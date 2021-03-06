/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.medihub.admin;

import com.medihub.user.*;
import com.medihub.db.*;
import java.sql.*; 
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
 * @author DELL
 */
@WebServlet(urlPatterns = {"/adminupdate"})
public class AdminUpdate extends HttpServlet {

   

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            PrintWriter out = response.getWriter();
            
             HttpSession session = request.getSession();
            int adminId =Integer.parseInt(session.getAttribute("userid").toString());
            
        try
        {
            //date and time foramtting
//            java.util.Date date = Calendar.getInstance().getTime();  
//            DateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd HH:mm:ss");  
//            String strDate = dateFormat.format(date);
            
            //getting from DbConfig class
            DbConfig db = DbConfig.getInstance();
            Connection con = db.getConnecton();
                    
            String first_name=request.getParameter("first_name");
            String last_name=request.getParameter("last_name");
            String display_name=request.getParameter("display_name");
//            String nic=request.getParameter("nic_no");
//            String dob=request.getParameter("dob");
//            String gender=request.getParameter("gender");
//            String email=request.getParameter("email");
//            String password=request.getParameter("password");
            String address1=request.getParameter("address_1");
            String address2=request.getParameter("address_2");
            String mobile=request.getParameter("mobile_number");
            String land_line=request.getParameter("land_number");
//            int district=Integer.parseInt(request.getParameter("district"));
            int city=Integer.parseInt(request.getParameter("city"));
//            int type=Integer.parseInt(request.getParameter("type"));
//            String zip_code=request.getParameter("zip_code");
            
            
            
            String query="UPDATE users SET "
                    + "first_name='"+first_name+"',"
                    + "last_name='"+last_name+"',"
                    + "display_name='"+display_name+"',"
//                    + "nic='"+nic+"',"
//                    + "dob='"+dob+"',"
//                    + "gender='"+gender+"',"
//                    + "email='"+email+"',"
                    + "address_1='"+address1+"',"
                    + "address_2='"+address2+"',"
                    + "city="+city+","
                    + "mobile_number='"+mobile+"',"
                    + "land_number='"+land_line+"',"
                    + "updated_by="+adminId+","
                    + "updated_at=CURRENT_TIMESTAMP "
                    + "where id="+adminId;
//                    + "'"+first_name+"','"+last_name+"','"+display_name+"','"+nic+"','"+dob+"','"+gender+"','"+email+"','"+address1+"','"+address2+"',"+city+",'"+mobile+"','"+land_line+"','"+password+"',"+type+",1,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP)";
            
//            out.print(query);

            PreparedStatement stmt=con.prepareStatement(query);  
            int rs=stmt.executeUpdate();
            
            response.sendRedirect("editadmin");
            con.close();  
        }
        catch(Exception e)
        { 
            out.println(e.toString());
        }  
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
