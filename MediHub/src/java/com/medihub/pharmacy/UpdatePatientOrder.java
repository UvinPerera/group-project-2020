/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.medihub.pharmacy;

import com.medihub.db.DbConfig;
import com.medihub.db.*;
import com.medihub.user.Notifications;
import java.io.File;
import java.sql.*; 
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author Yash
 */
@WebServlet(name = "UpdatePatientOrder", urlPatterns = {"/updatepatientorder"})
@MultipartConfig
public class UpdatePatientOrder extends HttpServlet {

    private boolean isMultipart;
   private int maxFileSize = 15 * 1024*1024; //max upload size in  bytes
   private File file ;

   
 protected String getSaltString() {
        String SALTCHARS = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890";
        StringBuilder salt = new StringBuilder();
        Random rnd = new Random();
        while (salt.length() < 30) { // length of the random string.
            int index = (int) (rnd.nextFloat() * SALTCHARS.length());
            salt.append(SALTCHARS.charAt(index));
        }
        String saltStr = salt.toString();
        return saltStr;

    }
   
  
 @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            PrintWriter out = response.getWriter();
        try
        {
            
            //getting from DbConfig class
            DbConfig db = DbConfig.getInstance();
            Connection con = db.getConnecton();
            
            String description="";//=request.getParameter("description");
            String filepath="";//=request.getParameter("file_path");
            String date="" ;//= request.getParameter("date");
            int pharmacyId=0;
            
             
            HttpSession session = request.getSession();
            int patientId =Integer.parseInt(session.getAttribute("userid").toString());
            
            
            
            int orderId=0; 
         
            DiskFileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);
            upload.setSizeMax( maxFileSize );
            
            
            String randomString = getSaltString();
            String extension = ".pdf";//filepath.substring(filepath.length()-4, filepath.length()-1);
            String absolutePath = randomString+extension;
            boolean flag=false;
            
            try{
                List fileItems = upload.parseRequest(request);
                Iterator iter = fileItems.iterator();
                
                while (iter.hasNext()) {
                    FileItem item = (FileItem) iter.next();

                    if (item.isFormField()) {

                      String name = item.getFieldName();//text1
                      String value = item.getString();
                      
                      if(name.compareTo("orderdescription")==0){
                          description=value;
                      }
                      
                      else if(name.compareTo("deliverydate")==0){
                          if(!value.isEmpty())
                                date = value;
                          else
                              flag=true;
                              
                      }
                      else if(name.compareTo("orderid")==0){
                          orderId = Integer.parseInt(value);
                      }
                      else if(name.compareTo("pharmacyId")==0){
                          pharmacyId = Integer.parseInt(value);
                      }
                      
                  
                      

                    } else {
                        String fieldName = item.getFieldName();
                        String fileName = item.getName();
                        String contentType = item.getContentType();
                        boolean isInMemory = item.isInMemory();
                        long sizeInBytes = item.getSize();
                        
                        filepath=fileName;
                        
                            
                            file = new File(getServletContext().getRealPath("public/storage/pres/").replace('\\', '/')+"/"+absolutePath) ;
                        
                             
                         
                            item.write( file ) ;
                              }
                          }
                
            String query;
            if(!flag){
                query= "UPDATE pharmacy_orders SET updated_at=CURRENT_TIMESTAMP,updated_by="+patientId+", expected_delivery_date='"+date+"' WHERE id ="+ orderId;
            }else{
                query= "UPDATE pharmacy_orders SET updated_at=CURRENT_TIMESTAMP,updated_by="+patientId+" WHERE id ="+ orderId;}
            PreparedStatement stmt=con.prepareStatement(query);  
            int rs=stmt.executeUpdate();
            
            String query2="UPDATE order_items SET updated_at=CURRENT_TIMESTAMP,file_path='"+filepath+"',absolute_path='"+absolutePath+"', updated_by="+patientId+",description='"+description+"' WHERE order_id ="+ orderId;
            PreparedStatement stmt2=con.prepareStatement(query2);  
            int rs2=stmt2.executeUpdate();
            
            }
            catch(Exception e){
                e.printStackTrace();
            }
            
              
            Notifications n = new Notifications(); 
            n.createNotification(patientId,pharmacyId,"Pharmacy Order has been updated", 3);
           
            response.sendRedirect("patient");
            con.close();  
        }
        catch(Exception e)
        { 
            out.println(e.toString());
        }  
    }
}

    ////////////////////////////////////
      
   
            