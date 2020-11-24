
package com.medihub.patient;

import java.text.DateFormat;  
import java.text.SimpleDateFormat;  
import java.util.Date;  
import java.util.Calendar;  

import com.medihub.db.*;
import com.medihub.user.*;
import java.sql.*;
import java.util.*;
/**
 *
 * @author tharshan
 */

public class Patient extends User {
    
    public List<Channelling> getPendingAppointments(){
        
        //date and time foramtting
        Date date = Calendar.getInstance().getTime();  
        DateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd");  
        DateFormat timeFormat = new SimpleDateFormat("hh:mm:ss");  
        String strDate = dateFormat.format(date);
        String strTime = timeFormat.format(date);
               
        //sql query
        String q_select="select c.id, h.name, d.titles, u.first_name, d.degrees, c.appointment_no, da.date, da.start_time, da.end_time, c.description, da.payment, pm.name as payment_method, cp.payment_method as paid_amount, cp.description as payment_description, cp.status as payment_status from channelling c ";
        String q_join_da="join doctor_availability da on c.doctor_availability_id=da.id ";
        String q_join_d="join doctors d on da.doctor_id=d.id ";
        String q_join_u="join users u on d.id=u.id ";
        String q_join_h="join hospitals h on da.hospital_id=h.id ";
        String q_join_cp="join channelling_payments cp on cp.channelling_id=c.id ";
        String q_join_pm="join payment_methods pm on cp.payment_method=pm.id ";
        String q_where="where c.status=1 and patient_id="+this.id+" and ((da.date='"+strDate+"' and da.start_time>'"+strTime+"') or da.date>'"+strDate+"')";
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

