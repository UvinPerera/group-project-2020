/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.medihub.hospital;

import com.medihub.db.DbConfig;
import com.medihub.location.City;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author tharshan
 */
public class Hospital {
    public int id;
    public String name;
    private int licenseNo;
    private String licenseProofLocation;
    public String displayPicLocation;
    public String displayName;
    public int directorId;
    public int status;
    public String landNumber;
    public String email;
    public String fax;
    public String address1;
    public String address2;
    public int city;
    public String strCity;
    public String strDistrict;
    public int district;
    public int province;
    public String strProvince;
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
    
    public List<Hospital> getAllActiveHospitals() {
        
        String query = "select id, display_name from hospitals where status=1";
        
        try
        {
            DbConfig db = DbConfig.getInstance();
            Connection con = db.getConnecton();
            
            PreparedStatement pst = con.prepareStatement(query);
            ResultSet rs = pst.executeQuery();
            
            List<Hospital> h =new ArrayList<Hospital>();
                        
            while(rs.next()) { 
                Hospital ho = new Hospital(); 
                ho.id = rs.getInt("id"); 
                ho.displayName = rs.getString("display_name");
                
                h.add(ho);
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
    
    public List<Hospital> getAllHospitalsByCity(int cCity) {
        
        String query = "select id, display_name from hospitals where status=1 and city="+cCity;
        
        try
        {
            DbConfig db = DbConfig.getInstance();
            Connection con = db.getConnecton();
            
            PreparedStatement pst = con.prepareStatement(query);
            ResultSet rs = pst.executeQuery();
            
            List<Hospital> h =new ArrayList<Hospital>();
                        
            while(rs.next()) { 
                Hospital ho = new Hospital(); 
                ho.id = rs.getInt("id"); 
                ho.displayName = rs.getString("display_name");
                
                h.add(ho);
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
    
    public String getAllHospitalsByCityAsString(int cCity) {
        
        String query = "select id, display_name from hospitals where status=1 and city="+cCity;
        
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
    
    public Hospital getHospital(int id) {
        
        String query = "SELECT h.id, h.name, h.display_name, h.display_pic_path, h.land_number, h.fax, h.email, h.address_1, h.address_2, c.name_en as city, d.name_en as district FROM hospitals h "
                + "JOIN cities c ON c.id=h.city "
                + "JOIN districts d ON d.id=c.district_id "
                + "WHERE h.status=1 and h.id="+id;
        
        try
        {
            DbConfig db = DbConfig.getInstance();
            Connection con = db.getConnecton();
            
            PreparedStatement pst = con.prepareStatement(query);
            ResultSet rs = pst.executeQuery();
            
            Hospital h = new Hospital(); 
                        
            while(rs.next()) { 
                
                h.id = rs.getInt("id"); 
                h.name = rs.getString("name");
                h.displayName = rs.getString("display_name");
                h.displayPicLocation = rs.getString("display_pic_path");
                h.landNumber = rs.getString("land_number");
                h.fax = rs.getString("fax");
                h.email = rs.getString("email");
                h.address1 = rs.getString("address_1");
                h.address2 = rs.getString("address_2");
                h.strCity = rs.getString("city");
                h.strDistrict = rs.getString("district");
                
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
    
}
