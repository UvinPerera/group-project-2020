/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.medihub.hospital;

import com.medihub.db.DbConfig;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
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
@WebServlet(name = "HospitalUpdate", urlPatterns = {"/hospitalupdate"})
@MultipartConfig
public class HospitalUpdate extends HttpServlet {

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
            int hospitalAdminId =Integer.parseInt(session.getAttribute("userid").toString());
            
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
            String hospital_display_name = "";
            String hospital_display_pic_path = "";
            String hospital_land_number = "";
            String hospital_fax = "";
            String hospital_email = "";
            String hospital_address = "";
            
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
                      else if(name.compareTo("hospital_display_name")==0){
                          hospital_display_name=value;
                      }
                      else if(name.compareTo("hospital_land_number")==0){
                          hospital_land_number=value;
                      }
                      else if(name.compareTo("hospital_fax")==0){
                          hospital_fax=value;
                      }
                      else if(name.compareTo("hospital_email")==0){
                          hospital_email=value;
                      }
                      else if(name.compareTo("hospital_address")==0){
                          hospital_address=value;
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
            String query="UPDATE users SET first_name='"+first_name+"', last_name='"+last_name+"', display_name='"+display_name+"',profile_pic_path='"+filepath+"',absolute_pp_path='"+absolutePath+"', address_1='"+address1+"',address_2='"+address2+"',city="+city+",mobile_number='"+mobile+"',land_number='"+land_line+"',updated_by="+hospitalAdminId+",updated_at=CURRENT_TIMESTAMP where id="+hospitalAdminId;   
            int rs=stmt.executeUpdate(query);
            
            Statement stmt2=con.createStatement();
                ResultSet rs2=stmt2.executeQuery("SELECT hospital_id FROM hospital_admins WHERE user_id="+hospitalAdminId);
                int hospitalId=1;
                while(rs2.next()){
                        hospitalId=rs2.getInt("hospital_id");
                }
                
            Statement stmt3=con.createStatement(); 
            String query3="UPDATE hospitals SET display_name='"+hospital_display_name+"',land_number='"+hospital_land_number+"', fax='"+hospital_fax+"',email='"+hospital_email+"',address_1='"+hospital_address+"',updated_by="+hospitalAdminId+",updated_at=CURRENT_TIMESTAMP where id="+hospitalId;   
            int rs3=stmt3.executeUpdate(query);

            }
                catch(Exception e){
                e.printStackTrace();
            }
      
            
            response.sendRedirect("hospital");
            con.close();  
        }
        catch(Exception e)
        { 
            out.println(e.toString());
        }  
    }

    
}
