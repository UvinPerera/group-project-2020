/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.medihub.pharmacy;

import com.medihub.db.DbConfig;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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
    public int province;
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
}
