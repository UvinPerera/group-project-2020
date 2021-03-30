/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.medihub.pharmacy;
import com.medihub.user.*;
import com.medihub.db.*;
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
    public String displayPicLocation;
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
    
    public Pharmacy getPharmacy(int id) {
        
        String query = "SELECT h.id, h.name, h.display_name, h.display_pic_path, h.land_number, h.fax, h.email, h.address_1, h.address_2, c.name_en as city, d.name_en as district FROM pharmacies h "
                + "JOIN cities c ON c.id=h.city "
                + "JOIN districts d ON d.id=c.district_id "
                + "WHERE h.status=1 and h.id="+id;
        
        try
        {
            DbConfig db = DbConfig.getInstance();
            Connection con = db.getConnecton();
            
            PreparedStatement pst = con.prepareStatement(query);
            ResultSet rs = pst.executeQuery();
            
            Pharmacy h = new Pharmacy(); 
                        
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
                h.cityStr = rs.getString("city");
                h.districtStr = rs.getString("district");
                
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
    
    public List<Pharmacy> getAllActivePharmacies() {
        
        String query = "select id, display_name from pharmacies where status=1";
        
        try
        {
            DbConfig db = DbConfig.getInstance();
            Connection con = db.getConnecton();
            
            PreparedStatement pst = con.prepareStatement(query);
            ResultSet rs = pst.executeQuery();
            
            List<Pharmacy> h =new ArrayList<Pharmacy>();
                        
            while(rs.next()) { 
                Pharmacy ho = new Pharmacy(); 
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
    
    public List<Pharmacy> getAllPharmacies(){
        
        String query = "select p.*, c.name_en as city_name, d.name_en as district, u.display_name as pharmacist from pharmacies p "
                + "join cities c on c.id=p.city "
                + "join districts d on d.id=c.district_id "
                + "left join users u on u.id=p.pharmacist_id ";
        
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
                ph.name=rs.getString("name");
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
        public void DeletePharmacy(){
    
        String query = "UPDATE pharmacies SET status=0 WHERE id="+this.id;
        
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
    
    public Pharmacy(){
        
    }
    public Pharmacy(int id){
        this.id=id;
    }
    public int getLicenseNumber(){
        return licenseNumber;
    }
    public int getId(){
        return this.id;
    }
    
    public Pharmacy getPharmacyProfile(){
        
        String query = "select p.id,p.name,p.license_number,p.pharmacist_id,p.display_name,p.land_number,p.fax,p.email,p.address_1,p.address_2,p.city,c.name_en as city_name from pharmacies p join cities c on c.id=p.city where p.status=1 and p.id="+this.id;
          try{
       
            DbConfig db = DbConfig.getInstance();
            Connection con = db.getConnecton();
            
            PreparedStatement pst = con.prepareStatement(query);
            ResultSet rs = pst.executeQuery();
            
            while(rs.next()) { 
                    
                    this.name=rs.getString("name") ;
                    this.licenseNumber = rs.getInt("license_number");
                    this.displayName = rs.getString("display_name"); 
                    this.landNumber =rs.getString("land_number");
                    this.email = rs.getString("email");
                    this.fax = rs.getString("fax");
                    this.address1 = rs.getString("address_1");
                    this.address2 = rs.getString("address_2");
                    this.city = rs.getInt("city");      
                    this.cityStr = rs.getString("city_name");
                    this.pharmacistId = rs.getInt("pharmacist_id");
          
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
        String query="select p.description,p.id,p.created_by,p.expected_delivery_date,u.first_name,u.last_name,u.mobile_number,u.land_number,u.address_1,u.address_2 from pharmacy_orders p inner join users u on u.id=p.created_by where p.pharmacy_id="+this.id+" and p.order_status='Pending' and p.status=1";
         
        try
        {
            DbConfig db = DbConfig.getInstance();
            Connection con = db.getConnecton();
            
            PreparedStatement pst = con.prepareStatement(query);
            ResultSet rs = pst.executeQuery();
            
          
            
            List<Orders> orderList = new ArrayList<Orders>();
            
                        
            while(rs.next() ) { 
                Orders ord = new Orders();
                ord.id = rs.getInt("id");
                ord.description = rs.getString("description"); 
                ord.patientId = rs.getInt("created_by");
                ord.expectedDeliveryDate = rs.getString("expected_delivery_date");
                ord.patientFirstName = rs.getString("first_name");
                ord.patientLastName = rs.getString("last_name");
                ord.patientAddress1= rs.getString("address_1");
                ord.patientAddress2 = rs.getString("address_2");
                ord.patientLandNumber = rs.getString("land_number");
                ord.patientMobileNumber = rs.getString("mobile_number");
                
                ord.orderStatus = "Pending";
                orderList.add(ord);
            }
            
            con.close();
            return orderList;
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
        String query="select p.description,p.created_by,p.expected_delivery_date,p.id,u.first_name,u.last_name,u.mobile_number,u.land_number,u.address_1,u.address_2 from pharmacy_orders p inner join users u on u.id = p.created_by where p.pharmacy_id="+this.id+" and p.order_status='Completed'";
        
        try
        {
            DbConfig db = DbConfig.getInstance();
            Connection con = db.getConnecton();
            
            PreparedStatement pst = con.prepareStatement(query);
            ResultSet rs = pst.executeQuery();
            
           
            List<Orders> o2 = new ArrayList<Orders>();
            
                        
            while(rs.next()) { 
                Orders ord2 = new Orders(); 
                ord2.id = rs.getInt("id");
                ord2.description = rs.getString("description"); 
                ord2.patientId = rs.getInt("created_by");
                ord2.patientFirstName = rs.getString("first_name");
                ord2.patientLastName = rs.getString("last_name");
                ord2.patientAddress1= rs.getString("address_1");
                ord2.patientAddress2 = rs.getString("address_2");
                ord2.patientLandNumber = rs.getString("land_number");
                ord2.patientMobileNumber = rs.getString("mobile_number");
                ord2.expectedDeliveryDate = rs.getString("expected_delivery_date");
                ord2.orderStatus = "Completed";
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
    
      public int getnoCompletedOrders(){
      String query="select count(p.id) as count from pharmacy_orders p where p.pharmacy_id="+this.id+" and p.order_status='Completed'";
        
        try
        {
            DbConfig db = DbConfig.getInstance();
            Connection con = db.getConnecton();
            
            PreparedStatement pst = con.prepareStatement(query);
            ResultSet rs = pst.executeQuery();
            
           
            int i =0;
            
                        
            while(rs.next()) { 
                
                i = rs.getInt("count"); 
            }
            
            con.close();
            return i;
        }
        catch(Exception e)
        {
            e.printStackTrace();
            return -1;        
        }
      }
      public int getnoPendingOrders(){
      String query="select count(p.id) as count from pharmacy_orders p where p.pharmacy_id="+this.id+" and p.order_status='Pending'";
        
        try
        {
            DbConfig db = DbConfig.getInstance();
            Connection con = db.getConnecton();
            
            PreparedStatement pst = con.prepareStatement(query);
            ResultSet rs = pst.executeQuery();
            
           
            int i =0;
            
                        
            while(rs.next()) { 
                
                i = rs.getInt("count"); 
            }
            
            con.close();
            return i;
        }
        catch(Exception e)
        {
            e.printStackTrace();
            return -1;        
        }
      
      }
    
}
