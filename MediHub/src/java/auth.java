import com.medihub.db.DbConfig;
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
@WebServlet(urlPatterns = {"/auth"})
public class auth extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                PrintWriter out = response.getWriter();
                try{Class.forName("com.mysql.jdbc.Driver");  
                Connection con=DriverManager.getConnection(DbConfig.dbUrl,DbConfig.username,DbConfig.password);
                Statement stmt=con.createStatement(); 
                String email=request.getParameter("email");
                String password=request.getParameter("userpassword");
                ResultSet rs=stmt.executeQuery("Select * from users where email='"+email+"' and password='"+password+"'"); 
                String displayName="";
                int userType=1;
                
                while(rs.next())
                {
                    displayName=rs.getString("display_name");
                    userType=rs.getInt("user_type");
                    
                }
                
                
                
                //String actualUsername = "Yashithi";
                //String actualPassword ="kay";
                if(!displayName.isEmpty()){
                    if(userType==0){
                        response.sendRedirect("adminDashboard.jsp");
                        HttpSession session = request.getSession();
                        session.setAttribute("username", displayName);
                    }
                    else if(userType==1){
                        response.sendRedirect("patientDashboard.jsp");
                        HttpSession session = request.getSession();
                        session.setAttribute("username", displayName);
                    }
                    else if(userType==2){
                        response.sendRedirect("doctorDashboard.jsp");
                        HttpSession session = request.getSession();
                        session.setAttribute("username",displayName);
                    }
                    else if(userType==3){
                        response.sendRedirect("hospitalDashboard.jsp");
                        HttpSession session = request.getSession();
                        session.setAttribute("username",displayName);
                    }
                    else if(userType==4){
                        response.sendRedirect("pharmacyDashboard.jsp");
                        HttpSession session = request.getSession();
                        session.setAttribute("username",displayName);
                    }
                }
                else{
                    response.sendRedirect("invalid.html");
                }
                }catch(Exception e){
                    out.println(e.toString());
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
