/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.medihub.doctor;

import com.medihub.db.DbConfig;
import com.medihub.user.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import com.google.gson.Gson; 
import com.google.gson.GsonBuilder; 

/**
 *
 * @author tharshan
 */
public class Doctor extends User {
    
    private int slmc;
    private String slmcCardProofLocation;
    public String doctorName;
    public int specialisation1;
    public int specialisation2;
    public String titles;
    public String degress;
    public int approvedBy;
    public String approvedAt;
    
    public String searchDoctors(String q) {
        String query="SELECT d.id,d.titles,u.first_name,u.last_name,d.degrees FROM doctors d "
                + "LEFT JOIN users u ON u.id=d.id "
                + "WHERE (first_name LIKE '%"+q+"%' OR last_name LIKE '%"+q+"%') AND u.user_type=2";
        
        try
        {
            DbConfig db = DbConfig.getInstance();
            Connection con = db.getConnecton();
            
            PreparedStatement pst = con.prepareStatement(query);
            ResultSet rs = pst.executeQuery();
            
            List<Doctor> ds = new ArrayList<Doctor>();
            
            
                        
            while(rs.next()) { 
                
                Doctor d = new Doctor();
                
                d.id = rs.getInt("id");
                d.doctorName = rs.getString("titles") + " " + rs.getString("first_name") + " " + rs.getString("last_name") + " " + rs.getString("degrees");
                
                ds.add(d);
            }
            
            con.close();
            
            Gson gson = new Gson();
            String json = gson.toJson(ds);
            
            return json;
        }
        catch(Exception e)
        {
            e.printStackTrace();
            return null;        
        }
    }
    
    public String getAllDoctorsByHospitalAndSpecialisationAsString(int cHospital, int cSpecialisation) {
        
        String q_select = "select u.id, u.first_name, u.last_name from hospitals ";
        String q_join_dh  = "join doctor_hospital dh on h.id=dh.id ";
        String q_join_d  = "join doctors d on d.id=dh.id ";
        String q_join_u  = "join users u on d.id=u.id ";
        String q_where  = "where u.status=1 and h.id="+cHospital ;
        String query = q_select + q_join_dh + q_join_d + q_join_u + q_where;
        
        try
        {
            DbConfig db = DbConfig.getInstance();
            Connection con = db.getConnecton();
            
            PreparedStatement pst = con.prepareStatement(query);
            ResultSet rs = pst.executeQuery();
            
            String s = "";
            String sp = ""; 
                        
            while(rs.next()) { 
                int Id = rs.getInt("id");
                String Name = rs.getString("first_name") + " " + rs.getString("last_name");
                sp="<option value=\""+Id+"\">"+Name+"</option>"; 
                
                s+=sp;
            }
            
            con.close();
            return s;
        }
        catch(Exception e)
        {
            e.printStackTrace();
            return null;        
        }
        
    }
    
}
