/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.medihub.location;

import com.medihub.db.*;
import com.medihub.patient.Channelling;
import java.sql.*;
import java.util.*;

/**
 *
 * @author tharshan
 */

public class District {
    public int id;
    public int province;
    public String nameEn;
    public String nameSi;
    public String nameTa;
    public int status;
    public String description;
    public String createdAt;
    public String updatedAt;
    public int createdBy;
    public int updatedBy;

    //return all available active districts by province
    public List<District> getAllDistricts() {
        
        String query = "select id, name_en from districts where status=1";
        
        try
        {
            DbConfig db = DbConfig.getInstance();
            Connection con = db.getConnecton();
            
            PreparedStatement pst = con.prepareStatement(query);
            ResultSet rs = pst.executeQuery();
            
            List<District> d =new ArrayList<District>();
                        
            while(rs.next()) { 
                District di = new District(); 
                di.id = rs.getInt("id"); 
                di.nameEn = rs.getString("name_en");
                
                d.add(di);
            }
            
            con.close();
            return d;
        }
        catch(Exception e)
        {
            e.printStackTrace();
            return null;        
        }
        
    }
    
    public String getAllDistrictsAsString() {
        
        String query = "select id, name_en from districts where status=1";
        
        try
        {
            DbConfig db = DbConfig.getInstance();
            Connection con = db.getConnecton();
            
            PreparedStatement pst = con.prepareStatement(query);
            ResultSet rs = pst.executeQuery();
            
            String d ="";
            
            String di = ""; 
                        
            while(rs.next()) { 
                int Id = rs.getInt("id");
                String nameEng = rs.getString("name_en");
                di="<option value=\""+Id+"\">"+nameEng+"</option>"; 
                
                d+=di;
            }
            
            con.close();
            return d;
        }
        catch(Exception e)
        {
            e.printStackTrace();
            return null;        
        }
        
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getProvince() {
        return province;
    }

    public void setProvince(int province) {
        this.province = province;
    }

    public String getNameEn() {
        return nameEn;
    }

    public void setNameEn(String nameEn) {
        this.nameEn = nameEn;
    }

    public String getNameSi() {
        return nameSi;
    }

    public void setNameSi(String nameSi) {
        this.nameSi = nameSi;
    }

    public String getNameTa() {
        return nameTa;
    }

    public void setNameTa(String nameTa) {
        this.nameTa = nameTa;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(String createdAt) {
        this.createdAt = createdAt;
    }

    public String getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(String updatedAt) {
        this.updatedAt = updatedAt;
    }

    public int getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(int createdBy) {
        this.createdBy = createdBy;
    }

    public int getUpdatedBy() {
        return updatedBy;
    }

    public void setUpdatedBy(int updatedBy) {
        this.updatedBy = updatedBy;
    }
}
