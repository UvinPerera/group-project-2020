/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.medihub.doctor;

import com.medihub.db.DbConfig;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author tharshan
 */
public class DoctorSpecialisation {
    
    public int id;
    public String name;
    public String description;
    public int status;
    public String createdAt;
    public String updatedAt;
    public String createdBy;
    public String updatedBy;
    
    public String getAllSpecialisationsByHospitalAsString(int cHospital) {
        
        String q_select = "select ds.id, ds.name from hospitals ";
        String q_join_dh  = "join doctor_hospital dh on h.id=dh.id ";
        String q_join_d  = "join doctors d on d.id=dh.id ";
        String q_join_u  = "join users u on d.id=u.id ";
        String q_join_ds  = "join doctor_specialisation ds on d.specialisation_1=ds.id or d.specialisation_2=ds.id ";
        String q_where  = "where u.status=1 and h.id="+cHospital;
        String query = q_select + q_join_dh + q_join_d + q_join_ds + q_where;
        
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
                String Name = rs.getString("name");
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
