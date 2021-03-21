package com.medihub.patient;


import com.medihub.user.*;
import com.medihub.db.*;
import com.medihub.resources.SecureUtils;
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
 * @author Yash
 */
@WebServlet(urlPatterns = {"/changepasswordupdate"})
public class ChangePasswordUpdate extends HttpServlet {

  

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            PrintWriter out = response.getWriter();
            
             HttpSession session = request.getSession();
            int patientId =Integer.parseInt(session.getAttribute("userid").toString());
            
        try
        {
            
            //getting from DbConfig class
            DbConfig db = DbConfig.getInstance();
            Connection con = db.getConnecton();
                    
            String curentPassword=SecureUtils.generatePasswordHash(request.getParameter("current_password"));
            String newPassword=SecureUtils.generatePasswordHash(request.getParameter("new_password"));
            String newPasswordConfirmation=SecureUtils.generatePasswordHash(request.getParameter("new_password_confirmation"));
            
            String query="SELECT password FROM users WHERE status=1 AND id="+patientId;
            
            PreparedStatement stmt=con.prepareStatement(query);  
            ResultSet rs=stmt.executeQuery();
            
            String checkPassword="";
            
            while(rs.next()) { 
                checkPassword = rs.getString("password");
            }
            int rss=0;
//            out.println(checkPassword);
//            out.println(curentPassword);
            if(checkPassword.equals(curentPassword)){
                
                if(newPassword.equals(newPasswordConfirmation)) {
                    query="UPDATE users SET password='"+newPassword+"', updated_at=CURRENT_TIMESTAMP, updated_by='"+patientId+"' WHERE status=1 AND id="+patientId;
                    
                    stmt=con.prepareStatement(query);
                    rss=stmt.executeUpdate();
                    
                    if(rss>0){
                        session.setAttribute("alert", "success");
                        session.setAttribute("message", "Password Update Successful !");
                    }
                    else{
//                        out.println("subbb");
                        session.setAttribute("alert", "error");
                        session.setAttribute("message", "Password Update Unsuccessful !");
                    }
                }
                else
                {
//                    out.println("sub");
                    session.setAttribute("alert", "error");
                    session.setAttribute("message", "New Passwords Didn't Match !");
                }
            }
            else
            {
//                out.println("main");
                session.setAttribute("alert", "error");
                session.setAttribute("message", "Passwords Error !");
            }
            
            response.sendRedirect("changepassword");
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
