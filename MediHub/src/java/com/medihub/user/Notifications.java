/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.medihub.user;

import com.medihub.db.DbConfig;
import com.medihub.patient.Channelling;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
//import java.lang.*;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
/**
 *
 * @author tharshan
 */
public class Notifications {
    public int id;
    public int fromId;
    public int userType;
    public int toId;
    public String fromName;
    public String description;
    public int status;
    public String created_at;
    public String updated_at;
//    public int created_by;
//    public int updated_by;
    
    public int getUserNotificationsCount(int userId) {
        
        //sql query
        String q_select="SELECT count(n.id) as ccount FROM notifications n ";
        String q_join_u="JOIN users u ON n.from_id=u.id ";
        String q_join_d="LEFT JOIN doctors d ON u.id=d.id ";
        String q_join_ha="LEFT JOIN hospital_admins ha on u.id=ha.user_id ";
        String q_join_h="LEFT JOIN hospitals h on ha.hospital_id=h.id ";
        String q_join_pa="LEFT JOIN pharmacy_admins pa on u.id=pa.user_id ";
        String q_join_p="LEFT JOIN pharmacies p on pa.pharmacy_id=p.id ";
        String q_where="WHERE n.to_id="+userId+" AND n.status=1 ";
        String q_order="ORDER BY n.created_at DESC ";
        String query=q_select + q_join_u + q_join_d + q_join_ha + q_join_h + q_join_pa + q_join_p + q_where + q_order ;
  
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
    
    public int getServiceNotificationsCount(int userId, int user_type) {
       
        //sql query
        String q_select="SELECT count(n.id) as ccount FROM notifications n ";
        String q_join_u="JOIN users u ON n.from_id=u.id ";
        String q_join_d="LEFT JOIN doctors d ON u.id=d.id ";
        String q_join_ha="LEFT JOIN hospital_admins ha on u.id=ha.user_id ";
        String q_join_h="LEFT JOIN hospitals h on ha.hospital_id=h.id ";
        String q_join_pa="LEFT JOIN pharmacy_admins pa on u.id=pa.user_id ";
        String q_join_p="LEFT JOIN pharmacies p on pa.pharmacy_id=p.id ";
        
        //selecting the service provider 
        String qq_join_hh="LEFT JOIN hospitals s on n.to_id=s.id ";
        String qq_join_haa="LEFT JOIN hospital_admins saa on s.id=saa.hospital_id ";   
        String qq_join_pp="LEFT JOIN pharmacies s on n.to_id=s.id ";
        String qq_join_paa="LEFT JOIN pharmacy_admins saa on s.id=saa.pharmacy_id ";
        
        String q_join_sa="";
        String q_join_s="";
        String q_where="";

        if(user_type==3) {
            q_join_s=qq_join_hh;
            q_join_sa=qq_join_haa;
            q_where="WHERE saa.user_id="+userId+" AND n.status=2 ";
        }
        if(user_type==4) {
            q_join_s=qq_join_pp;
            q_join_sa=qq_join_paa;
            q_where="WHERE saa.user_id="+userId+" AND n.status=3 ";
        }
        
        String q_order="ORDER BY n.created_at DESC ";
        String query=q_select + q_join_u + q_join_d + q_join_ha + q_join_h + q_join_pa + q_join_p + q_join_s + q_join_sa + q_where + q_order ;
  
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
    
    public List<Notifications> getUserNotifications(int userId, String climit) {
        
        //sql query
        String q_select="SELECT n.*, u.user_type, u.first_name, u.last_name, d.titles, d.degrees, h.display_name as h_name, p.display_name as p_name FROM notifications n ";
        String q_join_u="JOIN users u ON n.from_id=u.id ";
        String q_join_d="LEFT JOIN doctors d ON u.id=d.id ";
        String q_join_ha="LEFT JOIN hospital_admins ha on u.id=ha.user_id ";
        String q_join_h="LEFT JOIN hospitals h on ha.hospital_id=h.id ";
        String q_join_pa="LEFT JOIN pharmacy_admins pa on u.id=pa.user_id ";
        String q_join_p="LEFT JOIN pharmacies p on pa.pharmacy_id=p.id ";
        String q_where="WHERE n.to_id="+userId+" AND (n.status=1 OR n.STATUS=0) ";
        String q_order="ORDER BY n.created_at DESC ";
        String q_limit = "limit "+climit+",11";
        String query=q_select + q_join_u + q_join_d + q_join_ha + q_join_h + q_join_pa + q_join_p + q_where + q_order + q_limit;
  
        try
        {
            DbConfig db = DbConfig.getInstance();
            Connection con = db.getConnecton();
            
            PreparedStatement pst = con.prepareStatement(query);
            ResultSet rs = pst.executeQuery();
            
          
            List<Notifications> nn =new ArrayList<Notifications>();
                        
            while(rs.next()) { 
                Notifications n = new Notifications(); 
                n.id = rs.getInt("id");
                n.fromId = rs.getInt("from_id");
                n.description = rs.getString("description");
                n.status = rs.getInt("status");
                n.created_at = rs.getString("created_at");
                n.updated_at = rs.getString("updated_at");
                n.fromName = rs.getString("first_name") + " " + rs.getString("last_name");
                
                n.userType = rs.getInt("user_type");
                
                if(n.userType==0) {
                    n.fromName = "System Admin";
                }
                else if(n.userType==2) {
                    n.fromName = rs.getString("titles") + " " + n.fromName + " " + rs.getString("degrees");
                }
                else if(n.userType==3) {
                    n.fromName = rs.getString("h_name");
                }
                else if(n.userType==4) {
                    n.fromName = rs.getString("p_name");
                }
                
                nn.add(n);
            }
            
            con.close();
            return nn;
        }
        catch(Exception e)
        {
            e.printStackTrace();
            return null;        
        }
    }
    
    public List<Notifications> getServiceNotifications(int userId, int user_type, String climit) {
        
        //sql query
        String q_select="SELECT n.*, u.user_type, u.first_name, u.last_name, d.titles, d.degrees, h.display_name as h_name, p.display_name as p_name FROM notifications n ";
        String q_join_u="JOIN users u ON n.from_id=u.id ";
        String q_join_d="LEFT JOIN doctors d ON u.id=d.id ";
        String q_join_ha="LEFT JOIN hospital_admins ha on u.id=ha.user_id ";
        String q_join_h="LEFT JOIN hospitals h on ha.hospital_id=h.id ";
        String q_join_pa="LEFT JOIN pharmacy_admins pa on u.id=pa.user_id ";
        String q_join_p="LEFT JOIN pharmacies p on pa.pharmacy_id=p.id ";
        
        //selecting the service provider 
        String qq_join_hh="LEFT JOIN hospitals s on n.to_id=s.id ";
        String qq_join_haa="LEFT JOIN hospital_admins saa on s.id=saa.hospital_id ";   
        String qq_join_pp="LEFT JOIN pharmacies s on n.to_id=s.id ";
        String qq_join_paa="LEFT JOIN pharmacy_admins saa on s.id=saa.pharmacy_id ";
        
        String q_join_sa="";
        String q_join_s="";
        String q_where="";

        if(user_type==3) {
            q_join_s=qq_join_hh;
            q_join_sa=qq_join_haa;
            q_where="WHERE saa.user_id="+userId+" AND (n.status=2 OR n.STATUS=0) ";
        }
        if(user_type==4) {
            q_join_s=qq_join_pp;
            q_join_sa=qq_join_paa;
            q_where="WHERE saa.user_id="+userId+" AND (n.status=3 OR n.STATUS=0) ";
        }
        
        String q_order="ORDER BY n.created_at DESC ";
        String q_limit = "limit "+climit+",11";
        String query=q_select + q_join_u + q_join_d + q_join_ha + q_join_h + q_join_pa + q_join_p + q_join_s + q_join_sa + q_where + q_order + q_limit;
  
        try
        {
            DbConfig db = DbConfig.getInstance();
            Connection con = db.getConnecton();
            
            PreparedStatement pst = con.prepareStatement(query);
            ResultSet rs = pst.executeQuery();
            
          
            List<Notifications> nn =new ArrayList<Notifications>();
                        
            while(rs.next()) { 
                Notifications n = new Notifications(); 
                n.id = rs.getInt("id");
                n.fromId = rs.getInt("from_id");
                n.description = rs.getString("description");
                n.status = rs.getInt("status");
                n.created_at = rs.getString("created_at");
                n.updated_at = rs.getString("updated_at");
                n.fromName = rs.getString("first_name") + " " + rs.getString("last_name");
                
                n.userType = rs.getInt("user_type");
                
                if(n.userType==0) {
                    n.fromName = "System Admin";
                }
                else if(n.userType==2) {
                    n.fromName = rs.getString("titles") + " " + n.fromName + " " + rs.getString("degrees");
                }
                else if(n.userType==3) {
                    n.fromName = rs.getString("display_name");
                }
                else if(n.userType==4) {
                    n.fromName = rs.getString("display_name");
                }
                
                nn.add(n);
            }
            
            con.close();
            return nn;
        }
        catch(Exception e)
        {
            e.printStackTrace();
            return null;        
        }
    }
    
    //type ===> anyUser: 1, hospital: 2, pharmacy: 3 (this is to define the 'to')
    //from ===> system: 0, users or service providors: userId
    public int createNotification(int from, int to, String msg, int type) {
        
        //sql query
        String query="INSERT INTO notifications "
                + "(from_id,to_id,description,status,created_at,updated_at,created_by,updated_by) "
                + "VALUES("+from+","+to+",'"+msg+"',"+type+",CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,"+from+","+from+")";
  
        try
        {
            DbConfig db = DbConfig.getInstance();
            Connection con = db.getConnecton();
            
            PreparedStatement pst = con.prepareStatement(query);
            int rs = pst.executeUpdate();
            
            con.close();
            return rs;
        }
        catch(Exception e)
        {
            e.printStackTrace();
            return 0;        
        }
    }
    
    public int readNotification(int nId) {
        
        //sql query
        String query="UPDATE notifications SET status=0 WHERE id="+nId;
  
        try
        {
            DbConfig db = DbConfig.getInstance();
            Connection con = db.getConnecton();
            
            PreparedStatement pst = con.prepareStatement(query);
            int rs = pst.executeUpdate();
            
            con.close();
            return rs;
        }
        catch(Exception e)
        {
            e.printStackTrace();
            return 0;        
        }
    }
    
    
}
