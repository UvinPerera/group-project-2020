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
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author uvinp
 */
public class PrescriptionItem {
    
    public int id;
    public int pres_id;
    public String genericName;
    public String tradeName;
    public int intervalId;
    public String dosage;
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
    
    
}
