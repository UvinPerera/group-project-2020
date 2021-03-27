/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.medihub.hospital;

import com.medihub.db.DbConfig;
import com.medihub.doctor.DoctorSpecialisation;
import com.medihub.location.District;
import com.medihub.resources.SecureUtils;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.servlet.ServletException;
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
 * @author uvinp
 */
@WebServlet(name = "CreateDoctorHos", urlPatterns = {"/createdoctorhos"})
public class CreateDoctorHos extends HttpServlet {

    private boolean isMultipart;
    private int maxFileSize = 15 * 1024 * 1024; //max upload size in  bytes
    private File file;

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
    
    protected int hosId(int adminId){
    
        
        int hospitalId=0;
        String query ="SELECT hospital_id FROM hospital_admins WHERE user_id="+adminId;
        try{
                
            DbConfig db = DbConfig.getInstance();
            Connection con = db.getConnecton();
            
            PreparedStatement pst = con.prepareStatement(query);
            ResultSet rs = pst.executeQuery();
            
            while(rs.next()){
                hospitalId = Integer.parseInt(rs.getString("hospital_id"));
            }
            
            }
            
            catch(Exception e){
                e.printStackTrace();
            }
        return hospitalId;
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
        DoctorSpecialisation ds = new DoctorSpecialisation();
        

        try {
            
            List<District> returnData = new ArrayList<District>();
            returnData = d.getAllDistricts();
            request.setAttribute("districts", returnData);
            request.setAttribute("specialization", ds.getAllActiveSpecialisations());//directly get districts

        } catch (Exception e) {

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
        HttpSession session = request.getSession();
            int adminId =Integer.parseInt(session.getAttribute("userid").toString());
        DbConfig db = DbConfig.getInstance();
        Connection con = db.getConnecton();
        PrintWriter out = response.getWriter();
        DiskFileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);
        upload.setSizeMax(maxFileSize);

        String first_name = "";
        String last_name = "";
        String display_name = "";
        String address1 = "";
        String address2 = "";
        String mobile = "";
        String land_line = "";
        String filepath = "";
        String nic = "";
        String password = "";
        int district = 0;
        int city = 0;
        int spec1 = 0;
        int spec2 = 0;
        String degrees = "";
        String titles = "";
        String slmc = "";
        String dob="";
        String email="";
        String gender="";
        
        int hospId = hosId(adminId);

        String randomString = getSaltString();
        String extension = ".jpg";//filepath.substring(filepath.length()-4, filepath.length()-1);
        String absolutePath = randomString + extension;

        try {

            List fileItems = upload.parseRequest(request);
            Iterator iter = fileItems.iterator();

            while (iter.hasNext()) {

                FileItem item = (FileItem) iter.next();

                if (item.isFormField()) {

                    String name = item.getFieldName();//text1
                    String value = item.getString();
                    if (name.compareTo("first_name") == 0) {
                        first_name = value;
                    } else if (name.compareTo("last_name") == 0) {
                        last_name = value;
                    } else if (name.compareTo("display_name") == 0) {
                        display_name = value;
                    } else if (name.compareTo("address_1") == 0) {
                        address1 = value;
                    } else if (name.compareTo("address_2") == 0) {
                        address2 = value;
                    } else if (name.compareTo("mobile_number") == 0) {
                        mobile = value;
                    } else if (name.compareTo("land_number") == 0) {
                        land_line = value;
                    } else if (name.compareTo("password") == 0) {
                        password = value;
                    } else if (name.compareTo("city") == 0) {
                        city = Integer.parseInt(value);
                    } else if (name.compareTo("district") == 0) {
                        district = Integer.parseInt(value);
                    } else if (name.compareTo("spec1") == 0) {
                        spec1 = Integer.parseInt(value);
                    } else if (name.compareTo("spec2") == 0) {
                        spec2 = Integer.parseInt(value);
                    } else if (name.compareTo("titles") == 0) {
                        titles = value;
                    } else if (name.compareTo("degrees") == 0) {
                        degrees = value;
                    } else if (name.compareTo("slmcNo") == 0) {
                        slmc = value;
                    }
                    else if (name.compareTo("gender") == 0) {
                        gender = value;
                    }
                    else if (name.compareTo("dob") == 0) {
                        dob = value;
                    }
                } else {
                    String fieldName = item.getFieldName();
                    String fileName = item.getName();
                    String contentType = item.getContentType();
                    boolean isInMemory = item.isInMemory();
                    long sizeInBytes = item.getSize();

                    filepath = fileName;

                    file = new File(getServletContext().getRealPath("public/storage/slmc/").replace('\\', '/') + "/" + absolutePath);

                    item.write(file);
                }
            }
            String hashpass = SecureUtils.generatePasswordHash(password);
            
            String query="INSERT INTO users (first_name,last_name,display_name,nic,dob,gender,email,address_1,address_2,city,mobile_number,land_number,password,user_type,status,created_at,updated_at) VALUES('"+first_name+"','"+last_name+"','"+display_name+"','"+nic+"','"+dob+"','"+gender+"','"+email+"','"+address1+"','"+address2+"',"+city+",'"+mobile+"','"+land_line+"','"+hashpass+"',"+2+",1,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP)";
            PreparedStatement pst = con.prepareStatement(query);
            int rs = pst.executeUpdate();
            
            String query2="insert into doctors(id,slmc,approved_by,approved_at,slmc_card_proof_location,titles,specialisation_1,specialisation_2,degrees)"
                        +  "values(LAST_INSERT_ID(),"+slmc+","+adminId+",CURRENT_TIMESTAMP,'"+absolutePath+"','"+titles+"',"+spec1+","+spec2+",'"+degrees+"')";
            PreparedStatement pst1 = con.prepareStatement(query2);
            int rs1 = pst1.executeUpdate();
            
            String query3="INSERT INTO doctor_hospital(doctor_id,hospital_id,reference_number,status) "
                    + "VALUES(LAST_INSERT_ID(),"+hospId+",+"+slmc+",1)";
            
            PreparedStatement pst2 = con.prepareStatement(query3);
            int rs3 = pst2.executeUpdate();
            
            response.sendRedirect("managedoctorhos");
            
            
        } catch (Exception e) {
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
