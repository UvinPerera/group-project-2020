
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
        String q_select="select c.id, h.name, d.titles, u.first_name, d.degrees, c.appointment_no, da.date, da.start_time, c.description from channeling c ";
        String q_join_da="join doctor_availability da on c.doctor_availability_id=da.id ";
        String q_join_d="join doctors d on da.doctor_id=d.id ";
        String q_join_u="join users u on d.id=u.id ";
        String q_join_h="join hospitals h on da.hospital_id=h.id ";
        String q_where="where c.status=1 and patient_id="+this.id+" and da.date>='"+strDate+"' and da.start_time>'"+strTime+"'";
        String query=q_select + q_join_da + q_join_d + q_join_u + q_join_h + q_where;
        
        try
        {
            DbConfig db = DbConfig.getInstance();
            Connection con = db.getConnecton();
            
            PreparedStatement pst = con.prepareStatement(query);
            ResultSet rs = pst.executeQuery();
            
            int numRows=0;
            int i=0;
            
            //get the total row size
//            if (rs.last()) 
//            {
//                numRows = rs.getRow();
//                rs.beforeFirst(); 
//            }
            
            //create channelling object array
//            Channelling[] ch = new Channelling[numRows];
            List<Channelling> c =new ArrayList<Channelling>();
            Channelling ch = new Channelling(); 
            
            while(rs.next()) { 
                ch.id = rs.getInt("id"); 
                ch.appointmentNo = rs.getInt("appointment_no"); 
                ch.description = rs.getString("description"); 
                ch.hospital = rs.getString("name"); 
                ch.date = rs.getString("date"); 
                ch.time = rs.getString("start_time"); 
                ch.doctor = rs.getString("titles")+". "+rs.getString("first_name")+" "+rs.getString("degrees"); 
                
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

