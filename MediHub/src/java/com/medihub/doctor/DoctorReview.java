/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.medihub.doctor;

import com.medihub.db.DbConfig;
import com.medihub.user.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.lang.*;
import com.google.gson.Gson; 

/**
 *
 * @author tharshan
 */
public class DoctorReview {
    
    public int id;
    public int patientId ;
    public int doctorId ;
    public String doctorName;
    public String PatientFirstName;
    public String PatientLastName;
    public String PatienProfilePicPath;
    public int rating;
    public int[] star=new int[3];
    public int status;
    public String description;
    public String titles;
    public String degress;
//    public int approvedBy;
//    public String approvedAt;
    public int updatedBy;
    public String updatedAt;
    public int createdBy;
    public String createdAt;
    
    public List<DoctorReview> getDoctorReviews(int dId, String climit) {
        
        String q_order = " ORDER BY created_at DESC";
        String q_limit = " limit "+climit+",11";
        
        String query="SELECT dr.id, dr.patient_id, dr.rating, dr.description, dr.status, dr.created_at, u.first_name, u.last_name, u.profile_pic_path FROM doctor_reviews dr "
                + "JOIN users u ON u.id=dr.patient_id "
                + "WHERE u.status=1 AND dr.status=1 AND dr.doctor_id="+dId + q_order + q_limit;
        
        try
        {
            DbConfig db = DbConfig.getInstance();
            Connection con = db.getConnecton();
            
            PreparedStatement pst = con.prepareStatement(query);
            ResultSet rs = pst.executeQuery();
            
            List<DoctorReview> ddr = new ArrayList<DoctorReview>();
            int[] star=new int[3];
            double f,rating=0;
            int c=5;
            
            while(rs.next()) { 
                
                c=5;
                
                DoctorReview dr = new DoctorReview();
                dr.id = rs.getInt("id");
                dr.patientId = rs.getInt("patient_id");
                dr.rating = rs.getInt("rating");
                dr.status = rs.getInt("status");
                dr.description = rs.getString("description");
                dr.createdAt = rs.getString("created_at");
                dr.PatientFirstName = rs.getString("first_name");
                dr.PatientLastName = rs.getString("last_name");
                dr.PatienProfilePicPath = rs.getString("profile_pic_path");
                
                rating=dr.rating;
                
                f=Math.floor(rating);
                c=c-(int)f;

                dr.star[0]=(int)f;

                if(rating>f){
                    dr.star[1]=1;
                    dr.star[2]=c-1;
                }
                else{
                    dr.star[1]=0;
                    dr.star[2]=c;
                }
                
                ddr.add(dr);
            }
            
            con.close();
            
            return ddr;
        }
        catch(Exception e)
        {
            e.printStackTrace();
            return null;        
        }
    }
    
    public List<DoctorReview> getDoctorReportedReviews(int dId, String climit) {
        
        String q_order = " ORDER BY created_at DESC";
        String q_limit = " limit "+climit+",11";
        
        String q_where_d=  " AND dr.doctor_id="+dId;
        
        if(dId==0) {
            q_where_d="";
        }
        
        String query="SELECT dr.id, dr.patient_id, dr.rating, dr.description, dr.status, dr.created_at, u.first_name, u.last_name, u.profile_pic_path, d.titles, d.degrees, du.first_name as d_first_name, du.last_name as d_last_name FROM doctor_reviews dr "
                + "JOIN users u ON u.id=dr.patient_id "
                + "JOIN doctors d ON d.id=dr.doctor_id "
                + "JOIN users du ON du.id=d.id "
                + "WHERE u.status=1 AND dr.status=5" + q_where_d + q_order + q_limit;
        
        try
        {
            DbConfig db = DbConfig.getInstance();
            Connection con = db.getConnecton();
            
            PreparedStatement pst = con.prepareStatement(query);
            ResultSet rs = pst.executeQuery();
            
            List<DoctorReview> ddr = new ArrayList<DoctorReview>();
            int[] star=new int[3];
            double f,rating=0;
            int c=5;
            
            while(rs.next()) { 
                
                c=5;
                
                DoctorReview dr = new DoctorReview();
                dr.id = rs.getInt("id");
                dr.patientId = rs.getInt("patient_id");
                dr.rating = rs.getInt("rating");
                dr.status = rs.getInt("status");
                dr.description = rs.getString("description");
                dr.createdAt = rs.getString("created_at");
                dr.doctorName = rs.getString("titles")+" "+rs.getString("d_first_name")+" "+rs.getString("d_last_name")+" "+rs.getString("degrees");
                dr.PatientFirstName = rs.getString("first_name");
                dr.PatientLastName = rs.getString("last_name");
                dr.PatienProfilePicPath = rs.getString("profile_pic_path");
                
                rating=dr.rating;
                
                f=Math.floor(rating);
                c=c-(int)f;

                dr.star[0]=(int)f;

                if(rating>f){
                    dr.star[1]=1;
                    dr.star[2]=c-1;
                }
                else{
                    dr.star[1]=0;
                    dr.star[2]=c;
                }
                
                ddr.add(dr);
            }
            
            con.close();
            
            return ddr;
        }
        catch(Exception e)
        {
            e.printStackTrace();
            return null;        
        }
    }
    
    
    public int[] getDoctorRating(int dId) {
        
        String query="SELECT AVG(rating) as ratingg FROM doctor_reviews dr "
                + "JOIN users u ON u.id=dr.patient_id "
                + "WHERE u.status=1 AND dr.status=1 AND dr.doctor_id="+dId;
        
        try
        {
            DbConfig db = DbConfig.getInstance();
            Connection con = db.getConnecton();
            
            PreparedStatement pst = con.prepareStatement(query);
            ResultSet rs = pst.executeQuery();
            
            int[] star=new int[3];
            double rating=0;
            int c=5;
            
            while(rs.next()) { 
                       
               rating = rs.getFloat("ratingg");
                
            }
            
            con.close();
//            rating=3.4;
            double f=Math.floor(rating);
            c=c-(int)f;
            
            star[0]=(int)f;
            
            if(rating>f){
                star[1]=1;
                star[2]=c-1;
            }
            else{
                star[1]=0;
                star[2]=c;
            }
            
            return star;
            
        }
        catch(Exception e)
        {
            e.toString();
            return null;        
        }
    }
    
    public int insertReview(int pId, int dId, int crating, String cdescription) {
        
        String query="INSERT INTO doctor_reviews (patient_id, doctor_id, rating, description, status, created_at, updated_at, created_by, updated_by) "
                + "VALUES("+pId+","+dId+","+crating+",'"+cdescription+"',1,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,"+pId+","+pId+")";
        
        try{
            DbConfig db = DbConfig.getInstance();
            Connection con = db.getConnecton();
            PreparedStatement stmt=con.prepareStatement(query);  
            int rs=stmt.executeUpdate();
            
            con.close();
            return rs;
            
        }
        catch(Exception e){
            e.toString();
            return 0;
        }
        
    }
    
    public int deleteReview(int id) {
        
        String query="UPDATE doctor_reviews SET status=0 WHERE id="+id;
        
        try{
            DbConfig db = DbConfig.getInstance();
            Connection con = db.getConnecton();
            PreparedStatement stmt=con.prepareStatement(query);  
            int rs=stmt.executeUpdate();
            
            con.close();
            return rs;
            
        }
        catch(Exception e){
            e.toString();
            return 0;
        }
        
    }
    
    public int reportReview(int id) {
        
        String query="UPDATE doctor_reviews SET status=5 WHERE id="+id;
        
        try{
            DbConfig db = DbConfig.getInstance();
            Connection con = db.getConnecton();
            PreparedStatement stmt=con.prepareStatement(query);  
            int rs=stmt.executeUpdate();
            
            con.close();
            return rs;
            
        }
        catch(Exception e){
            e.toString();
            return 0;
        }
        
    }
    
    public int approveReview(int id) {
        
        String query="UPDATE doctor_reviews SET status=1 WHERE id="+id;
        
        try{
            DbConfig db = DbConfig.getInstance();
            Connection con = db.getConnecton();
            PreparedStatement stmt=con.prepareStatement(query);  
            int rs=stmt.executeUpdate();
            
            con.close();
            return rs;
            
        }
        catch(Exception e){
            e.toString();
            return 0;
        }
        
    }
    
    public int updateReview(int id, int pId, int crating, String cdescription) {
        
        String query="UPDATE doctor_reviews SET rating="+crating+", description='"+cdescription+"', updated_at=CURRENT_TIMESTAMP, updated_by="+pId+" WHERE id="+id;
        
        try{
            DbConfig db = DbConfig.getInstance();
            Connection con = db.getConnecton();
            PreparedStatement stmt=con.prepareStatement(query);  
            int rs=stmt.executeUpdate();
            
            con.close();
            return rs;
            
        }
        catch(Exception e){
            e.toString();
            return 0;
        }
        
    }
    
}
