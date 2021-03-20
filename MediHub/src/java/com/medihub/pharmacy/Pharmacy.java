/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.medihub.pharmacy;
import com.medihub.user.*;
import com.medihub.db.DbConfig;
import com.medihub.hospital.Hospital;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import java.text.DateFormat;  
import java.text.SimpleDateFormat;  
import java.util.Date;  
import java.util.Calendar;  


/**
 *
 * @author Yash
 */
public class Pharmacy extends User {
    public int id;
    public String name;
    private int licenseNumber;
    private String licenseProofLocation;
    public String displayName;
    public int pharmacistId;
    public int pharmacyId;
    public int patientId;
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
    public Pharmacy(){
        
    }
    public Pharmacy(int id){
        this.id=id;
    }
    public int getLicenseNumber(){
        return licenseNumber;
    }
    
     public List<Orders> getAllOrders(){
        
        //date and time formatting
        Date date = Calendar.getInstance().getTime();  
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");  
        DateFormat timeFormat = new SimpleDateFormat("HH:mm:ss");  
        String strDate = dateFormat.format(date);
        String strTime = timeFormat.format(date);
               
        //sql query
        String query="select o.id,o.pharmacy_id,o.expected_delivery_date,o.order_status, o.description, o.status,o.created_at,o.updated_at,o.created_by,o.updated_by from pharmacy_orders o where pharmacy_id="+this.id;
        
        try
        {
            DbConfig db = DbConfig.getInstance();
            Connection con = db.getConnecton();
            
            PreparedStatement pst = con.prepareStatement(query);
            ResultSet rs = pst.executeQuery();
            
            String query2 = "select p.id,p.first_name,p.last_name,p.mobile_number,p.land_number,p.address_1,p.address_2 from users where p.id="+rs.getInt("created_by");
            PreparedStatement pst2 = con.prepareStatement(query2);
            ResultSet rs2 = pst2.executeQuery();
            List<Orders> o = new ArrayList<Orders>();
            
                        
            while(rs.next()) { 
                Orders ord = new Orders(); 
                ord.description = rs.getString("description"); 
                ord.status = rs.getInt("status");
                ord.patientId = rs.getInt("created_by");
                ord.patientFirstName = rs2.getString("first_name");
                ord.patientLastName = rs2.getString("last_name");
                ord.patientAddress1= rs2.getString("address_1");
                ord.patientAddress2 = rs2.getString("address_2");
                ord.patientLandNumber = rs2.getString("land_number");
                ord.patientMobileNumber = rs2.getString("mobile_number");
                ord.expectedDeliveryDate = rs.getString("expected_delivery_date");
                ord.orderStatus = rs.getString("order_status");
                o.add(ord);
            }
            
            con.close();
            return o;
        }
        catch(Exception e)
        {
            e.printStackTrace();
            return null;        
        }
      
    }
     
     public List<Orders> getPendingOrders(){
        
        //date and time formatting
        Date date = Calendar.getInstance().getTime();  
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");  
        DateFormat timeFormat = new SimpleDateFormat("HH:mm:ss");  
        String strDate = dateFormat.format(date);
        String strTime = timeFormat.format(date);
               
        //sql query
        String query="select o.id,o.pharmacy_id, o.description, o.status,o.created_at,o.updated_at,o.created_by,o.updated_by,o.expected_delivery_date from pharmacy_orders,o.order_status o where pharmacy_id="+this.id+" and o.created_at < CURRENT_TIMESTAMP and expected_delivery_date => CURRENT_TIMESTAMP";
        
        try
        {
            DbConfig db = DbConfig.getInstance();
            Connection con = db.getConnecton();
            
            PreparedStatement pst = con.prepareStatement(query);
            ResultSet rs = pst.executeQuery();
            
            String query2 = "select p.id,p.first_name,p.last_name,p.mobile_number,p.land_number,p.address_1,p.address_2 from users where p.id="+rs.getInt("created_by");
            PreparedStatement pst2 = con.prepareStatement(query2);
            ResultSet rs2 = pst2.executeQuery();
            List<Orders> o = new ArrayList<Orders>();
            
                        
            while(rs.next()) { 
                Orders ord = new Orders(); 
                ord.description = rs.getString("description"); 
                ord.status = rs.getInt("status");
                ord.patientId = rs.getInt("created_by");
                ord.patientFirstName = rs2.getString("first_name");
                ord.patientLastName = rs2.getString("last_name");
                ord.patientAddress1= rs2.getString("address_1");
                ord.patientAddress2 = rs2.getString("address_2");
                ord.patientLandNumber = rs2.getString("land_number");
                ord.patientMobileNumber = rs2.getString("mobile_number");
                ord.expectedDeliveryDate = rs.getString("expected_delivery_date");
                ord.orderStatus = rs.getString("order_status");
                o.add(ord);
            }
            
            con.close();
            return o;
        }
        catch(Exception e)
        {
            e.printStackTrace();
            return null;        
        }
      
    }
     
    public List<Orders> getCompletedOrders(){
        
        //date and time formatting
        Date date = Calendar.getInstance().getTime();  
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");  
        DateFormat timeFormat = new SimpleDateFormat("HH:mm:ss");  
        String strDate = dateFormat.format(date);
        String strTime = timeFormat.format(date);
               
        //sql query
        String query="select o.id,o.pharmacy_id, o.description, o.status,o.created_at,o.updated_at,o.created_by,o.updated_by,o.expected_delivery_date from pharmacy_orders,o.order_status o where pharmacy_id="+this.id+" and o.order_status = 'completed' ORDER BY o.expected_delivery_date DESC";
        
        try
        {
            DbConfig db = DbConfig.getInstance();
            Connection con = db.getConnecton();
            
            PreparedStatement pst = con.prepareStatement(query);
            ResultSet rs = pst.executeQuery();
            
            String query2 = "select p.id,p.first_name,p.last_name,p.mobile_number,p.land_number,p.address_1,p.address_2 from users where p.id="+rs.getInt("created_by");
            PreparedStatement pst2 = con.prepareStatement(query2);
            ResultSet rs2 = pst2.executeQuery();
            List<Orders> o2 = new ArrayList<Orders>();
            
                        
            while(rs.next()) { 
                Orders ord2 = new Orders(); 
                ord2.description = rs.getString("description"); 
                ord2.status = rs.getInt("status");
                ord2.patientId = rs.getInt("created_by");
                ord2.patientFirstName = rs2.getString("first_name");
                ord2.patientLastName = rs2.getString("last_name");
                ord2.patientAddress1= rs2.getString("address_1");
                ord2.patientAddress2 = rs2.getString("address_2");
                ord2.patientLandNumber = rs2.getString("land_number");
                ord2.patientMobileNumber = rs2.getString("mobile_number");
                ord2.expectedDeliveryDate = rs.getString("expected_delivery_date");
                ord2.orderStatus = rs.getString("order_status");
                o2.add(ord2);
            }
            
            con.close();
            return o2;
        }
        catch(Exception e)
        {
            e.printStackTrace();
            return null;        
        }
      
    }
     
    
}
