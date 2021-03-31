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
    
    public Hospital(){
        
    }
    public Hospital(int id){
        this.id=id;
    }
    
     public int getLicenseNumber(){
        return licenseNo;
    }
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
        
        String query = "SELECT h.director_id,h.id, h.name, h.display_name, h.display_pic_path, h.land_number, h.fax, h.email, h.address_1, h.address_2, c.name_en as city, d.name_en as district FROM hospitals h "
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
                h.directorId = rs.getInt("director_id");
                
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
    
        public List<Hospital> getAllHospitals(){
        
        String query = "select h.*, c.name_en as city_name, d.name_en as district, u.display_name as director from hospitals h "
                + "join cities c on c.id=h.city "
                + "join districts d on d.id=c.district_id "
                + "left join users u on u.id=h.director_id ";

        
        try
        {
            DbConfig db = DbConfig.getInstance();
            Connection con = db.getConnecton();
            
            PreparedStatement pst = con.prepareStatement(query);
            ResultSet rs = pst.executeQuery();
            
            List<Hospital> h =new ArrayList<Hospital>();
                        
            while(rs.next()) { 
                Hospital ho = new Hospital();
                ho.id=rs.getInt("id");
                ho.licenseNo=rs.getInt("license_number");
                ho.name=rs.getString("name");
                ho.displayName=rs.getString("display_name");
                ho.strCity=rs.getString("district");
                ho.strDistrict=rs.getString("city_name");
                ho.status=rs.getInt("status");
                
               
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
        
   public Hospital getHospitalProfile(){
        
        String query = "select p.id,p.name,p.license_number,p.director_id,p.display_name,p.land_number,p.fax,p.email,p.address_1,p.address_2,p.city,c.name_en as city_name from hospitals p join cities c on c.id=p.city where p.status=1 and p.id="+this.id;
          try{
       
            DbConfig db = DbConfig.getInstance();
            Connection con = db.getConnecton();
            
            PreparedStatement pst = con.prepareStatement(query);
            ResultSet rs = pst.executeQuery();
            
            while(rs.next()) { 
                    
                    this.name=rs.getString("name") ;
                    this.licenseNo = rs.getInt("license_number");
                    this.displayName = rs.getString("display_name"); 
                    this.landNumber =rs.getString("land_number");
                    this.email = rs.getString("email");
                    this.fax = rs.getString("fax");
                    this.address1 = rs.getString("address_1");
                    this.address2 = rs.getString("address_2");
                    this.city = rs.getInt("city");      
                    this.strCity = rs.getString("city_name");
                 //   this.district = rs.getInt("district");
                 //   this.strDistrict = rs.getString("district");
          
            }
            
            con.close();
            return this;
        }
        catch(Exception e)
        {
            e.toString();
            return null;        
        }
    }
   
   public void DeleteHospital(){
    
        String query = "UPDATE hospitals SET status=0 WHERE id="+this.id;
        
        try
        {
            DbConfig db = DbConfig.getInstance();
            Connection con = db.getConnecton();
            
            PreparedStatement pst = con.prepareStatement(query);
            int rs = pst.executeUpdate();
            

            
            con.close();
         
        }
        catch(Exception e)
        {
          e.printStackTrace();
                 
        }
    
    }
     
   public int getId(){
        return this.id;
    }
    
  public void setId(int Id){
    this.id = Id;
  }

}
