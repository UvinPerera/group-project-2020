package com.medihub.patient;
import java.io.*;
import java.util.*;



import com.medihub.db.DbConfig;
import java.io.IOException;

import java.io.PrintWriter;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.output.*;

/**
 *
 * @author Yash
 */

@WebServlet(name = "addRecord", urlPatterns = {"/addrecord"})
@MultipartConfig
public class addRecord extends HttpServlet {
    
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
            String recordname="" ;//= request.getParameter("date");
            
            HttpSession session = request.getSession();
            int patientId =Integer.parseInt(session.getAttribute("userid").toString());
             
            DiskFileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);
            upload.setSizeMax( maxFileSize );
            
            
           
            String randomString = getSaltString();
            String extension = ".pdf";//filepath.substring(filepath.length()-4, filepath.length()-1);
            String absolutePath = randomString+extension;
            
            try{
                List fileItems = upload.parseRequest(request);
                Iterator iter = fileItems.iterator();
                
                while (iter.hasNext()) {
                    FileItem item = (FileItem) iter.next();

                    if (item.isFormField()) {

                      String name = item.getFieldName();//text1
                      String value = item.getString();
                      if(name.compareTo("description")==0){
                          description=value;
                      }
                      
                      else if(name.compareTo("recordName")==0){
                          recordname = value;
                      }
                      

                    } else {
                        String fieldName = item.getFieldName();
                        String fileName = item.getName();
                        String contentType = item.getContentType();
                        boolean isInMemory = item.isInMemory();
                        long sizeInBytes = item.getSize();
                        
                        filepath=fileName;
                        
                            
                            file = new File(getServletContext().getRealPath("public/storage/rec/").replace('\\', '/')+"/"+absolutePath) ;
                        
                            
                         
                            item.write( file ) ;
                              }
                          }
            
            String query="INSERT INTO medical_records (id,name,path,patient_id,description,status,created_at,created_by) VALUES(NULL,'"+recordname+"','"+absolutePath+"',"+patientId+",'"+description+"',1,CURRENT_TIMESTAMP,'"+patientId+"')";
            PreparedStatement stmt=con.prepareStatement(query);  
            int rs=stmt.executeUpdate();
            
           
            }
            catch(Exception e){
                e.printStackTrace();
            }
            
            response.sendRedirect("patient");
            con.close();  
        }
        catch(Exception e)
        { 
            out.println(e.toString());
        }  
    }
}
