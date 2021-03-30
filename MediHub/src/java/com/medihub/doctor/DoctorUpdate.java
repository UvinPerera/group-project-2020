/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.medihub.doctor;

import com.medihub.db.DbConfig;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Statement;
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
@WebServlet(name = "DoctorUpdate", urlPatterns = {"/doctorupdate"})
@MultipartConfig
public class DoctorUpdate extends HttpServlet {

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
            HttpSession session = request.getSession();
            int doctorId =Integer.parseInt(session.getAttribute("userid").toString());
            
              //getting from DbConfig class
            DbConfig db = DbConfig.getInstance();
            Connection con = db.getConnecton();
            
            DiskFileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);
            upload.setSizeMax( maxFileSize );
            
            String first_name="";
            String last_name="";
            String display_name="";
            String address1="";
            String address2="";
            String mobile="";
            String land_line="";
            String filepath="";
            int city=0;
            //date and time foramtting
//            java.util.Date date = Calendar.getInstance().getTime();  
//            DateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd HH:mm:ss");  
//            String strDate = dateFormat.format(date);
            
           
            String randomString = getSaltString();
          
            String absolutePath = "";
            
            
               try{
                                 
                List fileItems = upload.parseRequest(request);
                Iterator iter = fileItems.iterator();

                while (iter.hasNext()) {
                                    
                
                    FileItem item = (FileItem) iter.next();

                    if (item.isFormField()) {

                      String name = item.getFieldName();//text1
                      String value = item.getString();
                      if(name.compareTo("first_name")==0){
                          first_name=value;
                       }
                                      
                      else if(name.compareTo("last_name")==0){
                          last_name = value;
                      }
                      else if(name.compareTo("display_name")==0){
                          display_name=value;
                      }
                      else if(name.compareTo("address_1")==0){
                          address1=value;
                      }
                      else if(name.compareTo("address_2")==0){
                          address2=value;
                      }
                      else if(name.compareTo("mobile_number")==0){
                          mobile=value;
                      }
                      else if(name.compareTo("land_number")==0){
                          land_line=value;
                      }
                       else if(name.compareTo("city")==0){
                          city=Integer.parseInt(value);
                      }

                    } else {
                        String fieldName = item.getFieldName();
                        String fileName = item.getName();
                        String contentType = item.getContentType();
                        boolean isInMemory = item.isInMemory();
                        long sizeInBytes = item.getSize();
                        filepath = fileName;
                        int length = filepath.length();
                        String extension = filepath.substring(length - 5, length - 1);

                         absolutePath = randomString + extension;
                                    
                            
                            file = new File(getServletContext().getRealPath("public/storage/pp/").replace('\\', '/')+"/"+absolutePath) ;
                      
                            item.write( file ) ;
                        }}
                    
             
            Statement stmt=con.createStatement(); 
            String query="UPDATE users SET first_name='"+first_name+"', last_name='"+last_name+"', display_name='"+display_name+"',profile_pic_path='"+filepath+"',absolute_pp_path='"+absolutePath+"', address_1='"+address1+"',address_2='"+address2+"',city="+city+",mobile_number='"+mobile+"',land_number='"+land_line+"',updated_by="+doctorId+",updated_at=CURRENT_TIMESTAMP where id="+doctorId;   
              
              int rs=stmt.executeUpdate(query);

            }
                catch(Exception e){
                e.printStackTrace();
            }
      
            
            response.sendRedirect("EditDoctor");
            con.close();  
        }
        catch(Exception e)
        { 
            out.println(e.toString());
        }  
    }

    
}
