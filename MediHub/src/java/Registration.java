
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
            //getting from DbConfig class
            DbConfig db = DbConfig.getInstance();
            Connection con = db.getConnecton();
                    
            Statement stmt=con.createStatement();  
            String first_name=request.getParameter("first_name");
            String last_name=request.getParameter("last_name");
            String display_name=request.getParameter("display_name");
            String nic=request.getParameter("nic_no");
            String dob=request.getParameter("dob");
            String gender=request.getParameter("gender");
            String email=request.getParameter("email");
            String password=request.getParameter("password");
            String address1=request.getParameter("address_1");
            String address2=request.getParameter("address_2");
            String district=request.getParameter("district");
            String zip_code=request.getParameter("zip_code");
            
            
            
            int user_type=1;
            
            User user=new User();
            user.setEmail(email);
            
            int rs=stmt.executeUpdate("INSERT INTO users (first_name,last_name,display_name,nic,dob,gender,email,address_1,address_2,district,zip_code,mobile,land_line,password,user_type) VALUES('"+first_name+"','"+last_name+"','"+display_name+"','"+nic+"','"+dob+"','"+gender+"','"+user.getEmail()+"','"+address1+"','"+address2+"','"+district+"','"+zip_code+"','"+password+"',"+user_type+")");  
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
