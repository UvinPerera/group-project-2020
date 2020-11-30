/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.medihub.location;

import com.medihub.db.DbConfig;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author tharshan
 */
public class City {
    public int id;
    public int district;
    public String nameEn;
    public String nameSi;
    public String nameTa;
    public String postCode;
    public double latitude;
    public double longitude;
    public int status;
    public String description;
    public String createdAt;
    public String updatedAt;
    public int createdBy;
    public int updatedBy;
    
    
    public List<City> getAllCitiesByDistrict(int cDistrict) {
        
        String query = "select id, name_en from cities where status=1 and district_id="+cDistrict;
        
        try
        {
            DbConfig db = DbConfig.getInstance();
            Connection con = db.getConnecton();
            
            PreparedStatement pst = con.prepareStatement(query);
            ResultSet rs = pst.executeQuery();
            
            List<City> c =new ArrayList<City>();
                        
            while(rs.next()) { 
                City ci = new City(); 
                ci.id = rs.getInt("id"); 
                ci.nameEn = rs.getString("name_en");
                
                c.add(ci);
            }
            
            con.close();
            return c;
        }
        catch(Exception e)
        {
            e.printStackTrace();
            return null;        
        }
        
    }
    
    public String getAllCitiesByDistrictAsString(int cDistrict) {
        
        String query = "select id, name_en from cities where status=1 and district_id="+cDistrict;
        
        try
        {
            DbConfig db = DbConfig.getInstance();
            Connection con = db.getConnecton();
            
            PreparedStatement pst = con.prepareStatement(query);
            ResultSet rs = pst.executeQuery();
            
            String c = "";
            String ci = ""; 
                        
            while(rs.next()) { 
                int Id = rs.getInt("id");
                String nameEng = rs.getString("name_en");
                ci="<option value=\""+Id+"\">"+nameEng+"</option>"; 
                
                c+=ci;
            }
            
            con.close();
            return c;
        }
        catch(Exception e)
        {
            e.printStackTrace();
            return e.toString();        
        }
        
    }
    
    public List<City> getAllCities() {
        
        String query = "select id, name_en from cities where status=1";
        
        try
        {
            DbConfig db = DbConfig.getInstance();
            Connection con = db.getConnecton();
            
            PreparedStatement pst = con.prepareStatement(query);
            ResultSet rs = pst.executeQuery();
            
            List<City> c =new ArrayList<City>();
                        
            while(rs.next()) { 
                City ci = new City(); 
                ci.id = rs.getInt("id"); 
                ci.nameEn = rs.getString("name_en");
                
                c.add(ci);
            }
            
            con.close();
            return c;
        }
        catch(Exception e)
        {
            e.printStackTrace();
            return null;        
        }
        
    }
    
    
}
