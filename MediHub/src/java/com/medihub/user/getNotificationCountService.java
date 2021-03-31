/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.medihub.user;

import com.medihub.user.Notifications;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.google.gson.Gson; 
import com.google.gson.GsonBuilder; 

/**
 *
 * @author tharshan
 */
@WebServlet(name = "getNotificationCountService", urlPatterns = {"/getNotificationCountService"})
public class getNotificationCountService extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
                PrintWriter out = response.getWriter();
//                response.setContentType("application/json");
                
                try
                {
                    int q=Integer.parseInt(request.getParameter("idd"));
                    int r=Integer.parseInt(request.getParameter("ut"));
                    Notifications n = new Notifications();
                    int returnData=n.getServiceNotificationsCount(q,r);
//                    response.setContentType("text/html;charset=UTF-8");
//                    response.setContentType("application/json");
//                    System.out.println(q);
//                    System.out.println(returnData);
                    out.print(returnData);

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
