/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.medihub.records;

import com.medihub.db.DbConfig;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author uvinp
 */
public class MedicalRecords {
    public int id;
    public String name;
    public int category_id;
    public int channelingId;
    public String path;
    public int patientId;
    public String description;
    public String patientName;
    public int doctorId;
    public int status;
    
    public List<MedicalRecords> getReocrdsByDoctorAndPatient(int docId,int patId){
    
        String query = "SELECT medical_records.*,users.first_name,users.last_name FROM medical_records "
                + "INNER JOIN record_premissions ON medical_records.id = record_premissions.record_id "
                + "INNER JOIN users ON users.id=medical_records.patient_id  "
                + "WHERE record_premissions.doctor_id="+docId+" AND medical_records.patient_id="+patId;
         List<MedicalRecords> mrl = new ArrayList<MedicalRecords>();
        try{
            
            DbConfig db = DbConfig.getInstance();
            Connection con = db.getConnecton();
            
            PreparedStatement pst = con.prepareStatement(query);
            ResultSet rs = pst.executeQuery();
            
           
            
            while(rs.next()){
            
                MedicalRecords mr = new MedicalRecords();
                mr.id = rs.getInt("id");
                mr.name = rs.getString("name");
                mr.path = rs.getString("path");
                mr.patientId = rs.getInt("patient_id");
                mr.patientName = rs.getString("first_name")+" "+rs.getString("last_name");
                mr.description = rs.getString("description");
                
                mrl.add(mr);
                
            
            }
            
            
            return mrl;
        
        }
        
        catch(Exception e){
        
            e.printStackTrace();
            return null;
        }
    
    
    }
    
    
    public List<MedicalRecords> getRecordsByPatient(int patId){
    
        String query = "SELECT * from medical_records where status = 1 and patient_id="+patId+" order by created_at DESC";
        try{
            
            DbConfig db = DbConfig.getInstance();
            Connection con = db.getConnecton();
            
            PreparedStatement pst = con.prepareStatement(query);
            ResultSet rs = pst.executeQuery();
            
            List<MedicalRecords> mrl = new ArrayList<MedicalRecords>();
            
            while(rs.next()){
            
                MedicalRecords mr = new MedicalRecords();
                mr.id = rs.getInt("id");
                mr.name = rs.getString("name");
                mr.path = rs.getString("path");
                mr.patientId = rs.getInt("patient_id");
                mr.description = rs.getString("description");
                mr.status=rs.getInt("status");
                mrl.add(mr);
                
            
            }
            
            
            return mrl;
        
        }
        
        catch(Exception e){
        
            e.printStackTrace();
            return null;
        }
}
}
