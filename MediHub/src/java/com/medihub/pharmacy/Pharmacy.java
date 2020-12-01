/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.medihub.pharmacy;

import com.medihub.db.DbConfig;
import com.medihub.hospital.Hospital;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author tharshan
 */
public class Pharmacy {
    public int id;
    public String name;
    private int licenseNumber;
    private String licenseProofLocation;
    public String displayName;
    public int pharmacistId;
    public int status;
    public String landNumber;
    public String email;
    public String fax;
    public String address1;
    public String address2;
    public int city;
    public int district;
    public float longitude;
    public double latitude;
    public String description;
    public String lastLogin;
    public int lastLoginBy;
    public String createdAt;
    public String updatedAt;
    public int createdBy;
    public int updatedBy;
    public int approvedBy;
    public String approvedAt;
    
    public String cityStr;
    public String districtStr;
    public String pharmacist;
    public String lastLogger;
    public String creator;
    public String updater;
    public String approver;
    public String statusStr;
    
    
    public String getAllPharmaciesByCityAsString(int cCity) {
        
        String query = "select id, display_name from pharmacies where status=1 and city="+cCity;
        
        try
        {
            DbConfig db = DbConfig.getInstance();
            Connection con = db.getConnecton();
            
            PreparedStatement pst = con.prepareStatement(query);
            ResultSet rs = pst.executeQuery();
            
            String h = "";
            String ho = ""; 
                        
            while(rs.next()) { 
                int Id = rs.getInt("id");
                String DisplayName = rs.getString("display_name");
                ho="<option value=\""+Id+"\">"+DisplayName+"</option>"; 
                
                h+=ho;
            }
            
            con.close();
            return h;
        }
        catch(Exception e)
        {
            e.printStackTrace();
            return null;        
        }
    }
    
    public List<Pharmacy> getAllPharmacies(){
        
        String query = "select p.*, c.name_en as city_name, d.name_en as district, u.display_name as pharmacist from pharmacies p "
                + "join cities c on c.id=p.city "
                + "join districts d on d.id=c.district_id "
                + "left join users u on u.id=p.pharmacist_id ";
//                + "left join users ul on u.id=p.last_login_by "
//                + "left join users uc on u.id=p.created_by "
//                + "left join users uu on u.id=p.updated_by "
//                + "left join users ua on u.id=p.approved_by ";
        
        try
        {
            DbConfig db = DbConfig.getInstance();
            Connection con = db.getConnecton();
            
            PreparedStatement pst = con.prepareStatement(query);
            ResultSet rs = pst.executeQuery();
            
            List<Pharmacy> p =new ArrayList<Pharmacy>();
                        
            while(rs.next()) { 
                Pharmacy ph = new Pharmacy();
                ph.id=rs.getInt("id");
                ph.licenseNumber=rs.getInt("license_number");
                ph.displayName=rs.getString("display_name");
                ph.pharmacist=rs.getString("pharmacist");
                ph.districtStr=rs.getString("district");
                ph.cityStr=rs.getString("city_name");
                ph.status=rs.getInt("status");
                
                p.add(ph);
            }
            
            con.close();
            return p;
        }
        catch(Exception e)
        {
            e.printStackTrace();
            return null;        
        }
        
    }
    
    public int getLicenseNumber(){
        return licenseNumber;
    }
    
}
