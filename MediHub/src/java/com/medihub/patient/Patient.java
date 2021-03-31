
package com.medihub.patient;

import com.google.gson.Gson;
import java.text.DateFormat;  
import java.text.SimpleDateFormat;  
import java.util.Date;  
import java.util.Calendar;  

import com.medihub.db.*;
import com.medihub.doctor.Doctor;
import com.medihub.user.*;
import java.sql.*;
import java.util.*;
/**
 *
 * @author tharshan
 */

public class Patient extends User {

    private Patient() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    public String searchPatients(String q) {
        String query = "SELECT u.id,u.first_name, u.last_name, u.display_name, u.email FROM users u "
                + "WHERE display_name LIKE '%" + q + "%' AND u.user_type=1";

        try {
            DbConfig db = DbConfig.getInstance();
            Connection con = db.getConnecton();

            PreparedStatement pst = con.prepareStatement(query);
            ResultSet rs = pst.executeQuery();

            List<Patient> pp = new ArrayList<Patient>();

            while (rs.next()) {

                Patient p = new Patient(0);

                p.id = rs.getInt("id");
                p.displayName = rs.getString("display_name");
                p.email = rs.getString("email");

                pp.add(p);
            }

            con.close();

            Gson gson = new Gson();
            String json = gson.toJson(pp);

            return json;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    
    public int getPendingAppointmentsCount() {
        
        //date and time foramtting
        Date date = Calendar.getInstance().getTime();  
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");  
        DateFormat timeFormat = new SimpleDateFormat("HH:mm:ss");  
        String strDate = dateFormat.format(date);
        String strTime = timeFormat.format(date);
               
        //sql query
        String q_select="select count(c.id) as ccount from channelling c ";
        String q_join_da="join doctor_availability da on c.doctor_availability_id=da.id ";
        String q_join_d="join doctors d on da.doctor_id=d.id ";
        String q_join_u="join users u on d.id=u.id ";
        String q_join_h="join hospitals h on da.hospital_id=h.id ";
        String q_join_cp="left join channelling_payments cp on cp.channelling_id=c.id ";
        String q_join_pm="left join payment_methods pm on cp.payment_method=pm.id ";
        String q_where="where c.status=1 and da.status=1 and patient_id="+this.id+" and ((da.date='"+strDate+"' and da.start_time>'"+strTime+"') or da.date>'"+strDate+"')";
        String query=q_select + q_join_da + q_join_d + q_join_u + q_join_h + q_join_cp + q_join_pm + q_where;
        
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
    
    public List<Channelling> getPendingAppointments(){
        
        //date and time foramtting
        Date date = Calendar.getInstance().getTime();  
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");  
        DateFormat timeFormat = new SimpleDateFormat("HH:mm:ss");  
        String strDate = dateFormat.format(date);
        String strTime = timeFormat.format(date);
               
        //sql query
        String q_select="select c.id, h.name, d.titles, u.first_name, d.degrees, c.appointment_no, da.date, da.start_time, da.end_time, c.description, da.payment, pm.name as payment_method, cp.payment_amount as paid_amount, cp.description as payment_description, cp.status as payment_status from channelling c ";
        String q_join_da="join doctor_availability da on c.doctor_availability_id=da.id ";
        String q_join_d="join doctors d on da.doctor_id=d.id ";
        String q_join_u="join users u on d.id=u.id ";
        String q_join_h="join hospitals h on da.hospital_id=h.id ";
        String q_join_cp="left join channelling_payments cp on cp.channelling_id=c.id ";
        String q_join_pm="left join payment_methods pm on cp.payment_method=pm.id ";
        String q_where="where c.status=1 and da.status=1 and patient_id="+this.id+" and ((da.date='"+strDate+"' and da.start_time>'"+strTime+"') or da.date>'"+strDate+"') limit 10";
        String query=q_select + q_join_da + q_join_d + q_join_u + q_join_h + q_join_cp + q_join_pm + q_where;
  
        try
        {
            DbConfig db = DbConfig.getInstance();
            Connection con = db.getConnecton();
            
            PreparedStatement pst = con.prepareStatement(query);
            ResultSet rs = pst.executeQuery();
            
          
            List<Channelling> c =new ArrayList<Channelling>();
            
                        
            while(rs.next()) { 
                Channelling ch = new Channelling(); 
                ch.id = rs.getInt("id"); 
                ch.appointmentNo = rs.getInt("appointment_no"); 
                ch.description = rs.getString("description"); 
                ch.hospital = rs.getString("name"); 
                ch.date = rs.getString("date"); 
                ch.start_time = rs.getString("start_time"); 
                ch.end_time = rs.getString("end_time"); 
                ch.doctor = rs.getString("titles")+". "+rs.getString("first_name")+" "+rs.getString("degrees"); 
                ch.payment_method = rs.getString("payment_method"); 
                ch.payment_amount = rs.getFloat("payment"); 
                ch.paid_amount = rs.getFloat("paid_amount"); 
                ch.payment_description = rs.getString("payment_description"); 
                ch.payment_status = rs.getInt("payment_status"); 
                
                c.add(ch);
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
    
    public List<Channelling> getChannellingRecords(String cStatus, String cDoctor, String cHospital, String cSpecialisation, String cStartDate,String cEndDate, String climit) {
        
        //date and time foramtting
        java.util.Date date = Calendar.getInstance().getTime();  
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");  
        DateFormat timeFormat = new SimpleDateFormat("HH:mm:ss");  
        String strDate = dateFormat.format(date);
        String strTime = timeFormat.format(date);
        
        //sql query
        String q_select="select c.id, c.status as cstatus, h.name, d.titles, u.first_name, d.degrees, ds.name as special_name_1, dss.name as special_name_2, c.appointment_no, da.date, da.start_time, da.end_time, c.description, da.payment, pm.name as payment_method, cp.payment_amount as paid_amount, cp.description as payment_description, cp.status as payment_status from channelling c ";
        String q_join_da="join doctor_availability da on c.doctor_availability_id=da.id ";
        String q_join_d="join doctors d on da.doctor_id=d.id ";
        String q_join_ds  = "join doctor_specialisation ds on ds.id=d.specialisation_1 ";
        String q_join_dss  = "join doctor_specialisation dss on dss.id=d.specialisation_2 ";
        String q_join_u="join users u on d.id=u.id ";
        String q_join_h="join hospitals h on da.hospital_id=h.id ";
        String q_join_cp="left join channelling_payments cp on cp.channelling_id=c.id ";
        String q_join_pm="left join payment_methods pm on cp.payment_method=pm.id ";
        
        String q_where_status = " "; 
        
        if(cStatus.equalsIgnoreCase("0") || cStatus==null || cStatus.equalsIgnoreCase("")) {
            q_where_status=" ";
        }
        else if(cStatus.equalsIgnoreCase("1")){
            q_where_status=" and c.status=1 and ((da.date='"+strDate+"' and da.start_time>'"+strTime+"') or da.date>'"+strDate+"') ";
        }
        else if(cStatus.equalsIgnoreCase("2")){
            q_where_status=" and (c.status=1 OR c.status=2) and ((da.date='"+strDate+"' and da.start_time<'"+strTime+"') or da.date<'"+strDate+"') ";
        }
        else if(cStatus.equalsIgnoreCase("3")){
            q_where_status=" and c.status=0 ";
        }
        
        String q_where_hos = "and h.id="+cHospital+" "; 
        if(cHospital==null || cHospital.equalsIgnoreCase("")){
            q_where_hos="";
        }
//        String q_where_doc = "and (u.first_name LIKE '%"+cDoctor+"%' or u.last_name LIKE '%"+cDoctor+"%') "; 
        String q_where_doc = "and (u.id="+cDoctor+") "; 
        if(cDoctor==null || cDoctor.equalsIgnoreCase("")){
            q_where_doc="";
        }
        String q_where_special = "and (d.specialisation_1="+cSpecialisation+" or d.specialisation_2="+cSpecialisation+") "; 
        if(cSpecialisation==null || cSpecialisation.equalsIgnoreCase("")){
            q_where_special="";
        }
        if(cStartDate==null || cStartDate.equalsIgnoreCase("")){
            cStartDate=strDate;
        }
        if(cEndDate==null || cEndDate.equalsIgnoreCase("")){
            cEndDate=strDate;
        }
        
        String q_where="where patient_id="+ this.id + q_where_status + q_where_hos + q_where_doc + q_where_special + "AND date BETWEEN '"+cStartDate+"' AND '"+cEndDate+"'";
  
        String q_limit = " limit "+climit+",11";
        String query=q_select + q_join_da + q_join_d + q_join_u + q_join_ds + q_join_dss + q_join_h + q_join_cp + q_join_pm + q_where + q_limit;
//        return query;
        
        try
        {
            DbConfig db = DbConfig.getInstance();
            Connection con = db.getConnecton();
            
            PreparedStatement pst = con.prepareStatement(query);
            ResultSet rs = pst.executeQuery();
            
            List<Channelling> c =new ArrayList<Channelling>();
                        
            while(rs.next()) { 
                
                Channelling ch = new Channelling(); 
                ch.id = rs.getInt("id"); 
                ch.status = rs.getInt("cstatus"); 
                ch.appointmentNo = rs.getInt("appointment_no"); 
                ch.description = rs.getString("description"); 
                ch.hospital = rs.getString("name"); 
                ch.date = rs.getString("date"); 
                ch.start_time = rs.getString("start_time"); 
                ch.end_time = rs.getString("end_time"); 
                ch.doctor = rs.getString("titles")+". "+rs.getString("first_name")+" "+rs.getString("degrees"); 
                ch.specialisation_1 = rs.getString("special_name_1"); 
                ch.specialisation_2 = rs.getString("special_name_2"); 
                ch.payment_method = rs.getString("payment_method"); 
                ch.payment_amount = rs.getFloat("payment"); 
                ch.paid_amount = rs.getFloat("paid_amount"); 
                ch.payment_description = rs.getString("payment_description"); 
                ch.payment_status = rs.getInt("payment_status"); 
                
                if(ch.status==1 && ((ch.date.compareTo(strDate)==0 && ch.start_time.compareTo(strTime)>0) || ch.date.compareTo(strDate)>0)) {
                    ch.status=1;
                }
                else if((ch.status==1 || ch.status==2) && ((ch.date.compareTo(strDate)==0 && ch.start_time.compareTo(strTime)<0) || ch.date.compareTo(strDate)<0)) {
                    ch.status=2;
                }
                else if(ch.status==0){
                    ch.status=0;
                }
                
                c.add(ch);
            }
                        
            con.close();
            return c;

            
        }
        catch(Exception e)
        {
//            e.printStackTrace();
            return null;        
        }
        
    }
    
    
    
    public Patient(int id){
        this.id=id;
    }
        
    public void makeAppointment() {

    }

    public void cancelAppointment() {

    }

    public void uploadRecord() {

    }

    public void deleteRecord() {

    }

    public void postHospitalReview() {

    }

    public void deleteHospitalReview() {

    }

    public void postDoctorReview() {

    }

    public void deleteDoctorReview() {

    }

    public void makeOnlinePayment() {

    }

    public void placePharmacyOrder() {

    }

    public void cancelPharmacyOrder() {

    }

    public void trackPharmacyOrder() {

    }

}

