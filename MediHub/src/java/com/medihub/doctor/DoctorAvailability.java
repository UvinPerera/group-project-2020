/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.medihub.doctor;

import com.medihub.db.DbConfig;
import com.medihub.patient.Channelling;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 *
 * @author tharshan
 */
public class DoctorAvailability {
    public int id;
    public int doctorId;
    public String doctorName;
    public int hospitalId;
    public String hospitalName;
    public String date;
    public String startTime;
    public String endTime;
    public int maxCount;
    public float payment;
    public int count;
    public int status;
    public String createdAt;
    public String updatedAt;
    public int createdBy;
    public int updatedBy;
    
    
    public String getAllDoctorAvailabilitiesByHospital(int cHospital, int cSpecialisation, String cDate) {
        //date and time foramtting
        Date date = Calendar.getInstance().getTime();  
        DateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd");  
        DateFormat timeFormat = new SimpleDateFormat("HH:mm:ss");  
        String strDate = dateFormat.format(date);
        String strTime = timeFormat.format(date);
        
        String q_select = "select da.id, da.doctor_id, d.titles, u.first_name, u.last_name, d.degrees, da.start_time, da.payment from doctor_availability da ";
        String q_join_h  = "join hospitals h on h.id=da.hospital_id ";
        String q_join_d  = "join doctors d on d.id=da.doctor_id ";
        String q_join_u  = "join users u on d.id=u.id ";
        String q_where  = "where da.status=1 and h.id="+cHospital+" and da.date='"+cDate+"' and (d.specialisation_1='"+cSpecialisation+"' or d.specialisation_2='"+cSpecialisation+"' and da.count<da.max_count) and ((da.date='"+strDate+"' and da.start_time>'"+strTime+"') or da.date>'"+strDate+"')";
        String q_order  = "order by da.doctor_id";
        String query = q_select + q_join_h + q_join_d + q_join_u + q_where + q_order;
        
        try
        {
            DbConfig db = DbConfig.getInstance();
            Connection con = db.getConnecton();
            
            PreparedStatement pst = con.prepareStatement(query);
            ResultSet rs = pst.executeQuery();
            
            String d = "";
            String da = ""; 
            int old=0; //for group result
                        
            while(rs.next()) { 
                this.id = rs.getInt("id");
                this.doctorId = rs.getInt("doctor_id");
                String Name = rs.getString("titles") + " " + rs.getString("first_name") + " " + rs.getString("last_name") + rs.getString("degrees");
                this.startTime = rs.getString("start_time");
                this.payment = rs.getFloat("payment");
                
                if(doctorId!=old && old==0)
                {
                    da="<tr row_id=\""+doctorId+"\"><td class=\"Row\" value=\""+doctorId+"\">"+Name+"</td><td value=\""+id+"\">"+startTime+"<br>Rs "+payment+"<br><button class=\"btn\" onclick=\"confirmChannelling("+id+");\" da-id=\""+id+"\">Channel</button></td>";
                }
                else if(doctorId!=old && old!=0)
                {
                    da="</tr><tr row_id=\""+doctorId+"\"><td class=\"Row\" value=\""+doctorId+"\">"+Name+"</td><td value=\""+id+"\">"+startTime+"<br>Rs "+payment+"<br><button class=\"btn\" onclick=\"confirmChannelling("+id+");\" da-id=\""+id+"\">Channel</button></td>";
                }
                else
                {
                    da="<td class=\"Row\" value=\""+id+"\">"+startTime+"<br>Rs "+payment+"<br><button class=\"btn\" onclick=\"confirmChannelling("+id+");\" da-id=\""+id+"\">Channel</button></td>";
                }
                
                old=doctorId; //assigning current doc id to old
                
                d+=da;
            }
            
//            d+="</tr>"; //closing last row
            
            con.close();
//            return d;

            if (d=="")
            {
                return d;
            }
            else
            {
                return d+"</tr>";
            }
            
        }
        catch(Exception e)
        {
            e.printStackTrace();
            return null;        
        }
        
    }
    
    public DoctorAvailability getDoctorAvailability(int doctorAvailabilityId) {
       
        String q_select = "select h.name, d.titles, u.first_name, u.last_name, d.degrees, da.date, da.start_time, da.payment, da.count, da.max_count from doctor_availability da ";
        String q_join_h  = "join hospitals h on h.id=da.hospital_id ";
        String q_join_d  = "join doctors d on d.id=da.doctor_id ";
        String q_join_u  = "join users u on d.id=u.id ";
        String q_where  = "where da.status=1 and da.id="+doctorAvailabilityId+" ";
        String query = q_select + q_join_h + q_join_d + q_join_u + q_where ;
        
        try
        {
            DbConfig db = DbConfig.getInstance();
            Connection con = db.getConnecton();
            
            PreparedStatement pst = con.prepareStatement(query);
            ResultSet rs = pst.executeQuery();
                        
            DoctorAvailability da = new DoctorAvailability();
            
            while(rs.next()) { 
                da.id = doctorAvailabilityId;
                da.hospitalName = rs.getString("name");
//                da.doctorId = rs.getInt("doctor_id");
                da.doctorName = rs.getString("titles") + " " + rs.getString("first_name") + " " + rs.getString("last_name") + rs.getString("degrees");
                da.date = rs.getString("date");
                da.startTime = rs.getString("start_time");
                da.payment = rs.getFloat("payment");
                da.maxCount= rs.getInt("max_count");
                da.count= rs.getInt("count");
                
                
            }
            
            con.close();

            if(da.count>=da.maxCount)
            {
                return null;
            }
            else
            {
                return da;
            }
            
        }
        catch(Exception e)
        {
            e.printStackTrace();
            return null;        
        }
        
    }
    
    
    
}
