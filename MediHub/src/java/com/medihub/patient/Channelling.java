
package com.medihub.patient;
//import java.util.Date;

import com.medihub.db.DbConfig;
import com.medihub.doctor.DoctorAvailability;
import com.medihub.location.District;
import java.sql.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;



/**
 *
 * @author tharshan
 */
public class Channelling {
    public int id;
    public int patientId;
    public int doctorAvalabilityId;
    public int appointmentNo;
    public String description;
    public int status;
    public String createdAt;
    public String updatedAt;
    public int createdBy;
    public int updatedBy;
    
    public String specialisation_1;
    public String specialisation_2;
    public String date;
    public String start_time;
    public String end_time;
    public String doctor;
    public String hospital;
    public String payment_method;
    public float payment_amount;
    public float paid_amount;
    public int payment_status;
    public String payment_description;

//    flow by doctor
//         send DoctorSpecialisation.getAllDoctorSpecialisation(); to front
//            get selected doctor_specialisation id as specialisation
//                send Doctor.getAllDoctorsBySpecialisation(specialisation) to front
//                    get selected doctor id as doctorId and date as date
//                        send DoctorAvailability.getDoctorSpecialisationByDoctor(doctorID,date) to front *final table


//    flow by hospital
//         send Province.getAllProvinces(); to front
//            get selected province id as cProvince
//                 send District.getAllDistrictsByProvince(cProvince); to front
//                      get selected district id as cDistrict
//                          send City.getAllCitiesByDistrict(cDistrict); to front
//                              get selected city id as cCity
//                                  send Hospital.getAllHospitalsByCity(cCity); to front
//                                      get selected hospital id as hospitalId
//                                          send Doctor.getAllDoctorSpecialisation() to front
//                                              get selected doctor specialisation id as specialisation and date as date
//                                                  send DoctorAvailability.getDoctorSpecialisationByHospital(doctorID,specialisation,date) to front *final table

//    inserting a new channelling
//      id is auto incrementing so need
//            every other field is as usual
//                createdAt and updatedAt are current timestamp
//                createdBy and updatedBy are active logged in user_id from session
//                   no need payment coz cash is the only option for now

//    cancelling channelling
//            if (session->userId==channelling.patientId where channelling.id=id of the crct channelling toggled)
//            {
//                if((DoctorAvalability.startTime where DoctorAvailability.id = channelling.doctorAvailabilityId)-currentTime < 2 hrs)
//                {
//                    make request to admin
//                }
//                else
//                {
//                    channelling.status=1;
//                }
//            }
//            else
//            {
//                access error
//            }
    
    public String checkDuplication(int doctorAvalabilityId,int userId)
    {
        String query = "select id, patient_id from channelling where status=1 and doctor_availability_id="+doctorAvalabilityId+" and patient_id="+userId;
        
        try
        {
            DbConfig db = DbConfig.getInstance();
            Connection con = db.getConnecton();
            
            PreparedStatement pst = con.prepareStatement(query);
            ResultSet rs = pst.executeQuery();
            
            int flag=0;
            
            if(rs.next()==true)
            {
                flag=1;
            }
                                    
//            while(rs.next()) { 
//                District di = new District(); 
//                di.id = rs.getInt("id"); 
//                di.nameEn = rs.getString("name_en");
//                
//                d.add(di);
//            }
            
            con.close();
            return Integer.toString(flag);
        }
        catch(Exception e)
        {
            e.printStackTrace();
            return null;        
        }
    }
    
    
    public String submitChannelling(int doctorAvailabilityId, int patientId, String description)
    {
        
            this.doctorAvalabilityId=doctorAvailabilityId;
            this.patientId=patientId;
            String n = "Self";
            if(description!=null)
            {
                n=description;
            }
            this.description="Booked for "+n;
            
            
        String query = "select id, count, max_count from doctor_availability where status=1 and id="+doctorAvalabilityId;
        
        try
        {
            DbConfig db = DbConfig.getInstance();
            Connection con = db.getConnecton();
            
            PreparedStatement pst = con.prepareStatement(query);
            ResultSet rs = pst.executeQuery();
            
            
            int count=0;
            int maxCount=0;
            
            while(rs.next()) {
            
                count = rs.getInt("count");
                maxCount = rs.getInt("max_count");
                
            }
            
            if (count>=maxCount)
            {
                return "1";
            }
            else
            {
                count++;
                query="update doctor_availability set count="+count+" where id="+doctorAvailabilityId;
                pst = con.prepareStatement(query);
                int up = pst.executeUpdate();
                //check update
                if (up==0)
                {
                    return "2";
                }
                
                query="insert into channelling (patient_id, doctor_availability_id, appointment_no, description, status, created_at, updated_at, created_by, updated_by) "
                                    + "values ("+patientId+","+doctorAvailabilityId+","+count+",'"+this.description+"',1,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,"+patientId+","+patientId+")";
                pst = con.prepareStatement(query,Statement.RETURN_GENERATED_KEYS);
                int cr = pst.executeUpdate();
                
//                check channelling update
                if (cr==0)
                {
//                    rolling back
                    up=0;
                    while(up>0)
                    {
                    query="update doctor_availability set count=count-1 where id="+doctorAvailabilityId;
                    pst = con.prepareStatement(query);
                    up = pst.executeUpdate();
                    }

                    return "3";
                }
                
                //get last id
                try (ResultSet generatedKeys = pst.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        this.id=generatedKeys.getInt(1);
                         
                    }
                    else {
//                        throw new SQLException("No ID obtained.");
                          return "4";
                    }
                }
                catch(Exception e)
                {
                    e.printStackTrace();
                }
                
                
                
            }

            
            con.close();
            
            return Integer.toString(this.id);
            
        }
        catch(Exception e)
        {
            e.printStackTrace();
            return "5";
        }
    }
    
    public Channelling getChannelling(int Id)
    {
        
        //sql query
        String q_select="select c.id, c.patient_id, h.name, d.titles, u.first_name, d.degrees, c.appointment_no, da.date, da.start_time, da.end_time, c.description, da.payment, pm.name as payment_method, cp.payment_method as paid_amount, cp.description as payment_description, cp.status as payment_status from channelling c ";
        String q_join_da="join doctor_availability da on c.doctor_availability_id=da.id ";
        String q_join_d="join doctors d on da.doctor_id=d.id ";
        String q_join_u="join users u on d.id=u.id ";
        String q_join_h="join hospitals h on da.hospital_id=h.id ";
        String q_join_cp="left join channelling_payments cp on cp.channelling_id=c.id ";
        String q_join_pm="left join payment_methods pm on cp.payment_method=pm.id ";
        String q_where="where c.status=1 and c.id="+Id;
        String query=q_select + q_join_da + q_join_d + q_join_u + q_join_h + q_join_cp + q_join_pm + q_where;

        
        try{
            
            DbConfig db = DbConfig.getInstance();
            Connection con = db.getConnecton();

            PreparedStatement pst = con.prepareStatement(query);
            ResultSet rs = pst.executeQuery();
        
        
        
        
            pst = con.prepareStatement(query);
            rs = pst.executeQuery();

            while(rs.next()) { 
                this.id = rs.getInt("id"); 
                this.patientId = rs.getInt("patient_id"); 
                
                this.appointmentNo = rs.getInt("appointment_no"); 
                this.description = rs.getString("description"); 
                this.hospital = rs.getString("name"); 
                this.date = rs.getString("date"); 
                this.start_time = rs.getString("start_time"); 
                this.end_time = rs.getString("end_time"); 
                this.doctor = rs.getString("titles")+". "+rs.getString("first_name")+" "+rs.getString("degrees"); 
                this.payment_method = rs.getString("payment_method"); 
                this.payment_amount = rs.getFloat("payment"); 
                this.paid_amount = rs.getFloat("paid_amount"); 
                this.payment_description = rs.getString("payment_description"); 
                this.payment_status = rs.getInt("payment_status"); 

            }
        }
        catch(Exception e)
        {
            e.toString();
//            return null;
        }
        
        return this;
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getPatientId() {
        return patientId;
    }

    public void setPatientId(int patientId) {
        this.patientId = patientId;
    }

    public int getDoctorAvalabilityId() {
        return doctorAvalabilityId;
    }

    public void setDoctorAvalabilityId(int doctorAvalabilityId) {
        this.doctorAvalabilityId = doctorAvalabilityId;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(String createdAt) {
        this.createdAt = createdAt;
    }

    public String getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(String updatedAt) {
        this.updatedAt = updatedAt;
    }

    public int getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(int createdBy) {
        this.createdBy = createdBy;
    }

    public int getUpdatedBy() {
        return updatedBy;
    }

    public void setUpdatedBy(int updatedBy) {
        this.updatedBy = updatedBy;
    }
    
    
    
    
    
}

