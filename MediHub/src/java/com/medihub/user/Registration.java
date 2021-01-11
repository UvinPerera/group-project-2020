package com.medihub.user;


import com.medihub.db.*;
import java.sql.*; 
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.medihub.user.*;
import com.medihub.resources.*;

/**
 *
 * @author Yash
 */
@WebServlet(urlPatterns = {"/registration"})
public class Registration extends HttpServlet {
   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            PrintWriter out = response.getWriter();
        try
        {
            //date and time foramtting
//            java.util.Date date = Calendar.getInstance().getTime();  
//            DateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd HH:mm:ss");  
//            String strDate = dateFormat.format(date);
            
            //getting from DbConfig class
            DbConfig db = DbConfig.getInstance();
            Connection con = db.getConnecton();
            // check  parameter empty or null
            String first_name=request.getParameter("first_name");
            String last_name=request.getParameter("last_name");
            String display_name=request.getParameter("display_name");
            String nic=request.getParameter("nic_no");
            String dob=request.getParameter("dob");
            String gender=request.getParameter("gender");
            String email=request.getParameter("email");
            //start generate password hash
                //  check password parameter value is empty before generate 
                //  bcz if password is empty SecureUtils.generatePasswordHash(password) will return a null
                //  validate every required parameters before the insert query.
            String password= SecureUtils.generatePasswordHash(request.getParameter("password"));
            //end generate password hash
            String address1=request.getParameter("address_1");
            String address2=request.getParameter("address_2");
            String mobile=request.getParameter("mobile");
            String land_line=request.getParameter("land_line");
//            int district=Integer.parseInt(request.getParameter("district"));
            int city=Integer.parseInt(request.getParameter("city"));
            int type=Integer.parseInt(request.getParameter("type"));
//            String zip_code=request.getParameter("zip_code");
            
//            User user=new User();
//            user.setEmail(email);
            
            String query="INSERT INTO users (first_name,last_name,display_name,nic,dob,gender,email,address_1,address_2,city,mobile_number,land_number,password,user_type,status,created_at,updated_at) VALUES('"+first_name+"','"+last_name+"','"+display_name+"','"+nic+"','"+dob+"','"+gender+"','"+email+"','"+address1+"','"+address2+"',"+city+",'"+mobile+"','"+land_line+"','"+password+"',"+type+",1,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP)";
            PreparedStatement stmt=con.prepareStatement(query);  
            int rs=stmt.executeUpdate();
            
            response.sendRedirect("login.jsp");
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
