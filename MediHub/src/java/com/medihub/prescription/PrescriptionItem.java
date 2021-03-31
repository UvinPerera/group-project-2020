/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.medihub.prescription;

import com.medihub.db.DbConfig;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 *
 * @author uvinp
 */
public class PrescriptionItem {
    
    public int id;
    public int pres_id;
    public int doctorId;
    public String genericName;
    public String tradeName;
    public int intervalId;
    public String dosage;
    public String doctorName;
    public int mealPref;
    public int duration;
    
    
    public List<PrescriptionItem> getPresItems(int presId){
    
        String query="SELECT * FROM prescription_items pi WHERE pi.prescription_id="+presId;
        List<PrescriptionItem> pi = new ArrayList<PrescriptionItem>();
        
        try{
            DbConfig db = DbConfig.getInstance();
            Connection con = db.getConnecton();

            PreparedStatement pst = con.prepareStatement(query);
            ResultSet rs = pst.executeQuery();
            
            while(rs.next()){
            
                PrescriptionItem p = new PrescriptionItem();
                p.id=rs.getInt("id");
                p.pres_id = rs.getInt("prescription_id");
                p.genericName = rs.getString("generic_name");
                p.tradeName = rs.getString("trade_name");
                p.dosage = rs.getString("dosage");
                p.intervalId = rs.getInt("interval_id");
                p.mealPref = rs.getInt("meal_preference");
                p.duration = rs.getInt("duration");
                pi.add(p);
                
            }
        }
        
        catch(Exception e){
        
            e.printStackTrace();
        }
    
        return pi;
    }
    
    public int getRemindersCount(int patient) {
        
        String query="SELECT count(pi.id) as ccount FROM prescription_items pi "
                + "JOIN prescriptions p ON p.id=pi.prescription_id "
                + "JOIN channelling c ON c.id=p.channeling_id "
                + "JOIN doctor_availability da ON c.doctor_availability_id=da.id "
                + "JOIN doctors d ON da.doctor_id=d.id "
                + "JOIN users u ON d.id=u.id "
                + "WHERE pi.status=1 AND DATE_ADD(pi.created_at, INTERVAL pi.duration DAY)>=CURRENT_DATE AND c.patient_id="+patient+""
                + "ORDER BY d.id";
        
        try
        {
            DbConfig db = DbConfig.getInstance();
            Connection con = db.getConnecton();
            
            PreparedStatement pst = con.prepareStatement(query);
            ResultSet rs = pst.executeQuery();
            
            int ccount=0;
            
            while(rs.next()) { 
                       
               ccount = rs.getInt("ccount");
                
            }
            
            con.close();
            
            return ccount;
            
        }
        catch(Exception e)
        {
            e.toString();
            return 0;        
        }
    }
    
    public List<PrescriptionItem> getReminders(int patient){
    
        String query="SELECT pi.*, d.id as did, d.titles, u.first_name, u.last_name, d.degrees FROM prescription_items pi "
                + "JOIN prescriptions p ON p.id=pi.prescription_id "
                + "JOIN channelling c ON c.id=p.channeling_id "
                + "JOIN doctor_availability da ON c.doctor_availability_id=da.id "
                + "JOIN doctors d ON da.doctor_id=d.id "
                + "JOIN users u ON d.id=u.id "
                + "WHERE pi.status=1 AND DATE_ADD(pi.created_at, INTERVAL pi.duration DAY)>=CURRENT_DATE AND c.patient_id="+patient+" "
                + "ORDER BY d.id";
        
        List<PrescriptionItem> pi = new ArrayList<PrescriptionItem>();
        
        try{
            DbConfig db = DbConfig.getInstance();
            Connection con = db.getConnecton();

            PreparedStatement pst = con.prepareStatement(query);
            ResultSet rs = pst.executeQuery();
            
            while(rs.next()){
            
                PrescriptionItem p = new PrescriptionItem();
                p.id=rs.getInt("id");
                p.pres_id = rs.getInt("prescription_id");
                p.doctorId = rs.getInt("did");
                p.genericName = rs.getString("generic_name");
                p.tradeName = rs.getString("trade_name");
                p.dosage = rs.getString("dosage");
                p.intervalId = rs.getInt("interval_id");
                p.mealPref = rs.getInt("meal_preference");
                p.duration = rs.getInt("duration");
                p.doctorName = rs.getString("titles")+". "+rs.getString("first_name")+" "+rs.getString("degrees"); 
                pi.add(p);
                
            }
        }
        
        catch(Exception e){
        
            e.printStackTrace();
        }
    
        return pi;
    }
    
    
}
