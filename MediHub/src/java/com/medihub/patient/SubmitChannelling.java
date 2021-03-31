package com.medihub.patient;


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
import com.medihub.user.*;
import com.medihub.doctor.DoctorAvailability;
import javax.servlet.http.HttpSession;


/**
 *
 * @author Yash
 */
@WebServlet(name = "SubmitChannelling" ,urlPatterns = {"/submitchannelling"})
public class SubmitChannelling extends HttpServlet {

  

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
            HttpSession session = request.getSession();
            int patientId =Integer.parseInt(session.getAttribute("userid").toString());
       
            PrintWriter out = response.getWriter();
        try
        {
            
            
//            DoctorAvailability da = new DoctorAvailability();
            
            int id = Integer.parseInt(request.getParameter("id"));
            String description = request.getParameter("description");
            
            Channelling c = new Channelling();
//            out.print(c.submitChannelling(id,patientId,description));
                String lastId=c.submitChannelling(id,patientId,description);
                
                int paymentMethod = Integer.parseInt(request.getParameter("payment_method"));
                String captureId = request.getParameter("captureId");
                String payerId = request.getParameter("payerId");
                String transactionId =request.getParameter("transactionId");
                String payement = request.getParameter("price");
                String payementDis="";
                
                if(paymentMethod==1){
                    payementDis="Payement Not received";
                
                }
                else{
                    payementDis="Full Payement Done";
                }
                
                String query="INSERT INTO channelling_payments(channelling_id,payerId,captureId,transactionId,payment_amount,payment_method,description,status)"
                        + " values("+lastId+",'"+payerId+"','"+captureId+"','"+transactionId+"',"+payement+","+paymentMethod+",'"+payementDis+"',1)";
                
                try{
                    DbConfig db = DbConfig.getInstance();
                    Connection con = db.getConnecton();
                    
                    PreparedStatement pst = con.prepareStatement(query);
                    int rs = pst.executeUpdate();
                    
                    String msg ="Channeling Confrirmed!\n Payement Status - "+payementDis+"\nPayement Amount - "+payement;
                    Notifications n = new Notifications();
                    n.createNotification(0, patientId, msg, 1);
                }
                catch(Exception e){
                    e.printStackTrace();
                }
                
                
            
//            request.setAttribute("channelling", lastId); //directly get appointment status
//            request.getRequestDispatcher("channellingresult").forward(request, response);
            response.sendRedirect("channellingresult?id="+lastId);  
            
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
