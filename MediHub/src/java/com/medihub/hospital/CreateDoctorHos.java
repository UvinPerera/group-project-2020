/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.medihub.hospital;

import com.medihub.db.DbConfig;
import com.medihub.location.District;
import com.medihub.resources.SecureUtils;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author uvinp
 */
@WebServlet(name = "CreateDoctorHos", urlPatterns = {"/createdoctorhos"})
public class CreateDoctorHos extends HttpServlet {
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
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
   

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response 
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         District d = new District();
        
        try{
            List<District> returnData =new ArrayList<District>();
            returnData=d.getAllDistricts();
            request.setAttribute("districts", returnData); //directly get districts
        
        }
        catch(Exception e){
        
           
                    
        }
        
        request.getRequestDispatcher("linkDoctor.jsp").forward(request, response);
       
            
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
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
            String nic="";
            String password="";
            int district=0;
            int city=0;
            int spec1=0;
            int spec2=0;
            String degrees="";
            String titles="";
            String slmc="";
            
            
            
            String randomString = getSaltString();
            String extension = ".jpg";//filepath.substring(filepath.length()-4, filepath.length()-1);
            String absolutePath = randomString+extension;
         
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
                      else if(name.compareTo("password")==0){
                          password=value;
                      }
                       else if(name.compareTo("city")==0){
                          city=Integer.parseInt(value);
                      }
                      else if(name.compareTo("district")==0){
                          district=Integer.parseInt(value);
                      }
                      else if(name.compareTo("spec1")==0){
                          spec1=Integer.parseInt(value);
                      }
                      else if(name.compareTo("spec2")==0){
                          spec2=Integer.parseInt(value);
                      }
                      else if(name.compareTo("titles")==0){
                          titles=value;
                      }
                      else if(name.compareTo("degrees")==0){
                          degrees=value;
                      }
                      else if(name.compareTo("slmc")==0){
                          slmc=value;
                      }

                    } else {
                        String fieldName = item.getFieldName();
                        String fileName = item.getName();
                        String contentType = item.getContentType();
                        boolean isInMemory = item.isInMemory();
                        long sizeInBytes = item.getSize();
                        
                        
                        filepath=fileName;
                                    
                            
                            file = new File(getServletContext().getRealPath("public/storage/slmc/").replace('\\', '/')+"/"+absolutePath) ;
                      
                            item.write( file ) ;
                        }}
                
                response.sendRedirect("createdoctorhos");
            }
            
            catch(Exception e){
                e.printStackTrace();
            
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
