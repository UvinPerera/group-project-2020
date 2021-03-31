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
    public int doctorSpecialisation1Id;
    public int doctorSpecialisation2Id;
    public String doctorSpecialisation1Name;
    public String doctorSpecialisation2Name;
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
        String q_join_h = "join hospitals h on h.id=da.hospital_id ";
        String q_join_d = "join doctors d on d.id=da.doctor_id ";
        String q_join_u = "join users u on d.id=u.id ";
        String q_where = "where da.status=1 and h.id=" + cHospital + " and da.date='" + cDate + "' and (d.specialisation_1='" + cSpecialisation + "' or d.specialisation_2='" + cSpecialisation + "') and da.count<da.max_count and ((da.date='" + strDate + "' and da.start_time>'" + strTime + "') or da.date>'" + strDate + "')";
        String q_order = "order by da.doctor_id";
        String query = q_select + q_join_h + q_join_d + q_join_u + q_where + q_order;

        try {
            DbConfig db = DbConfig.getInstance();
            Connection con = db.getConnecton();

            PreparedStatement pst = con.prepareStatement(query);
            ResultSet rs = pst.executeQuery();

            String d = "";
            String da = "";
            int old = 0; //for group result

            while (rs.next()) {
                this.id = rs.getInt("id");
                this.doctorId = rs.getInt("doctor_id");
                String Name = rs.getString("titles") + " " + rs.getString("first_name") + " " + rs.getString("last_name") + rs.getString("degrees");
                this.startTime = rs.getString("start_time");
                this.payment = rs.getFloat("payment");

                if (doctorId != old && old == 0) {
                    da = "<tr row_id=\"" + doctorId + "\"><td class=\"Row\" value=\"" + doctorId + "\">" + Name + "</td><td colspan='4' class=\"datatd\" value=\"" + id + "\">" + startTime + "&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Rs " + payment + "<br><button class=\"style chanel\" onclick=\"confirmChannelling(" + id + ");\" da-id=\"" + id + "\">Channel</button></td>";
                } else if (doctorId != old && old != 0) {
                    da = "</tr><tr row_id=\"" + doctorId + "\"><td class=\"Row\" value=\"" + doctorId + "\">" + Name + "</td><td colspan='4' class=\"datatd\" value=\"" + id + "\">" + startTime + "&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Rs " + payment + "<br><button class=\"style chanel\" onclick=\"confirmChannelling(" + id + ");\" da-id=\"" + id + "\">Channel</button></td>";
                } else {
                    da = "<td colspan='4' class=\"datatd\" value=\"" + id + "\">" + startTime + "&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Rs " + payment + "<br><button class=\"style chanel\" onclick=\"confirmChannelling(" + id + ");\" da-id=\"" + id + "\">Channel</button></td>";
                }

                old = doctorId; //assigning current doc id to old

                d += da;
            }

//            d+="</tr>"; //closing last row
            con.close();
//            return d;

            if (d == "") {
                return d;
            } else {
                return d + "</tr>";
            }

        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }

    }

    public List<DoctorAvailability> getDoctorAvailabilitiesChanneling(String cDoctor, String cHospital, String cSpecialisation, String cDate, String climit) {

        //date and time foramtting
        Date date = Calendar.getInstance().getTime();
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        DateFormat timeFormat = new SimpleDateFormat("HH:mm:ss");
        String strDate = dateFormat.format(date);
        String strTime = timeFormat.format(date);

        String q_select = "select h.display_name, ds.id as special_id_1, dss.id as special_id_2, ds.name as special_name_1, dss.name as special_name_2, da.*, d.titles, u.first_name, u.last_name, d.degrees from doctor_availability da ";
        String q_join_h = "join hospitals h on h.id=da.hospital_id ";
        String q_join_d = "join doctors d on d.id=da.doctor_id ";
        String q_join_ds = "join doctor_specialisation ds on ds.id=d.specialisation_1 ";
        String q_join_dss = "join doctor_specialisation dss on dss.id=d.specialisation_2 ";
        String q_join_u = "join users u on d.id=u.id ";

        String q_where_hos = "and h.id=" + cHospital + " ";
        if (cHospital == null || cHospital.equalsIgnoreCase("")) {
            q_where_hos = "";
        }
//        String q_where_doc = "and (u.first_name LIKE '%"+cDoctor+"%' or u.last_name LIKE '%"+cDoctor+"%') "; 
        String q_where_doc = "and (u.id=" + cDoctor + ") ";
        if (cDoctor == null || cDoctor.equalsIgnoreCase("")) {
            q_where_doc = "";
        }
        String q_where_special = "and (d.specialisation_1=" + cSpecialisation + " or d.specialisation_2=" + cSpecialisation + ") ";
        if (cSpecialisation == null || cSpecialisation.equalsIgnoreCase("")) {
            q_where_special = "";
        }
        if (cDate == null || cDate.equalsIgnoreCase("")) {
            cDate = strDate;
        }

        String q_where = "where da.status=1 and da.count<da.max_count and da.date='" + cDate + "' and ((da.date='" + strDate + "' and da.start_time>'" + strTime + "') or da.date>'" + strDate + "') ";

        String q_order = "order by h.id ASC, d.id ASC";

        String q_limit = " limit " + climit + ",11";
        String query = q_select + q_join_h + q_join_d + q_join_ds + q_join_dss + q_join_u + q_where + q_where_hos + q_where_doc + q_where_special + q_order + q_limit;
//        return query;

        try {
            DbConfig db = DbConfig.getInstance();
            Connection con = db.getConnecton();

            PreparedStatement pst = con.prepareStatement(query);
            ResultSet rs = pst.executeQuery();

            List<DoctorAvailability> d = new ArrayList<DoctorAvailability>();

            while (rs.next()) {

                DoctorAvailability da = new DoctorAvailability();
                da.id = rs.getInt("id");
                da.doctorId = rs.getInt("doctor_id");
                da.doctorName = rs.getString("titles") + " " + rs.getString("first_name") + " " + rs.getString("last_name") + " " + rs.getString("degrees");
                da.hospitalId = rs.getInt("hospital_id");
                da.hospitalName = rs.getString("display_name");
                da.doctorSpecialisation1Id = rs.getInt("special_id_1");
                da.doctorSpecialisation2Id = rs.getInt("special_id_2");
                da.doctorSpecialisation1Name = rs.getString("special_name_1");
                da.doctorSpecialisation2Name = rs.getString("special_name_2");
                da.count = rs.getInt("count");
                da.maxCount = rs.getInt("max_count");
                da.date = rs.getString("date");
                da.startTime = rs.getString("start_time");
                da.endTime = rs.getString("end_time");
                da.payment = rs.getFloat("payment");

                d.add(da);
            }

            con.close();
            return d;

        } catch (Exception e) {
//            e.printStackTrace();
            return null;
        }

    }

    public DoctorAvailability getDoctorAvailability(int doctorAvailabilityId) {

        String q_select = "select h.name, d.titles, u.first_name, u.last_name, d.degrees, da.date, da.start_time, da.payment, da.count, da.max_count from doctor_availability da ";
        String q_join_h = "join hospitals h on h.id=da.hospital_id ";
        String q_join_d = "join doctors d on d.id=da.doctor_id ";
        String q_join_u = "join users u on d.id=u.id ";
        String q_where = "where da.status=1 and da.id=" + doctorAvailabilityId + " ";
        String query = q_select + q_join_h + q_join_d + q_join_u + q_where;

        try {
            DbConfig db = DbConfig.getInstance();
            Connection con = db.getConnecton();

            PreparedStatement pst = con.prepareStatement(query);
            ResultSet rs = pst.executeQuery();

            DoctorAvailability da = new DoctorAvailability();

            while (rs.next()) {
                da.id = doctorAvailabilityId;
                da.hospitalName = rs.getString("name");
//                da.doctorId = rs.getInt("doctor_id");
                da.doctorName = rs.getString("titles") + " " + rs.getString("first_name") + " " + rs.getString("last_name") + rs.getString("degrees");
                da.date = rs.getString("date");
                da.startTime = rs.getString("start_time");
                da.payment = rs.getFloat("payment");
                da.maxCount = rs.getInt("max_count");
                da.count = rs.getInt("count");

            }

            con.close();

            if (da.count >= da.maxCount) {
                return null;
            } else {
                return da;
            }

        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }

    }    

    public List<DoctorAvailability> getCurrentAvailabilities(int docId, String climit) {

        String q_limit = " limit "+climit+",11";
        String query = "SELECT da.*,h.name FROM `doctor_availability` da INNER JOIN doctors d on d.id=da.doctor_id INNER JOIN hospitals h ON h.id=da.hospital_id WHERE Date(date)>=CURRENT_DATE AND da.status=1 AND d.id=" + docId + q_limit;
        List<DoctorAvailability> daList = new ArrayList<DoctorAvailability>();
        try {
            DbConfig db = DbConfig.getInstance();
            Connection con = db.getConnecton();
            PreparedStatement pst = con.prepareStatement(query);
            ResultSet rs = pst.executeQuery();
            
            while(rs.next()){
                
            DoctorAvailability da = new DoctorAvailability();
            da.hospitalName=rs.getString("name");
            da.id = rs.getInt("id");
            da.startTime = rs.getString("start_time");
            da.endTime = rs.getString("end_time");
            da.maxCount = rs.getInt("max_count");
            da.count = rs.getInt("count");
            da.payment = rs.getFloat("payment");
            da.date = rs.getString("date");
            
            daList.add(da);
            
            
            }
            
            

        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return daList;
        
    }
    public List<DoctorAvailability> getCurrentAvailabilities(int docId, String climit,String search) {

        String q_limit = " limit "+climit+",11";
        String query = "SELECT da.*,h.name FROM `doctor_availability` da INNER JOIN doctors d on d.id=da.doctor_id INNER JOIN hospitals h ON h.id=da.hospital_id WHERE h.name LIKE '%"+search+"%' AND Date(date)>=CURRENT_DATE AND da.status=1 AND d.id=" + docId + q_limit;
        List<DoctorAvailability> daList = new ArrayList<DoctorAvailability>();
        try {
            DbConfig db = DbConfig.getInstance();
            Connection con = db.getConnecton();
            PreparedStatement pst = con.prepareStatement(query);
            ResultSet rs = pst.executeQuery();
            
            while(rs.next()){
                
            DoctorAvailability da = new DoctorAvailability();
            da.hospitalName=rs.getString("name");
            da.id = rs.getInt("id");
            da.startTime = rs.getString("start_time");
            da.endTime = rs.getString("end_time");
            da.maxCount = rs.getInt("max_count");
            da.count = rs.getInt("count");
            da.payment = rs.getFloat("payment");
            da.date = rs.getString("date");
            
            daList.add(da);
            
            
            }
            
            

        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return daList;
        
    }
    public List<DoctorAvailability> getCurrentAvailabilities(int docId) {

        String query = "SELECT da.*,h.name FROM `doctor_availability` da INNER JOIN doctors d on d.id=da.doctor_id INNER JOIN hospitals h ON h.id=da.hospital_id WHERE Date(date)>=CURRENT_DATE AND da.status=1 AND d.id=" + docId;
        List<DoctorAvailability> daList = new ArrayList<DoctorAvailability>();
        try {
            DbConfig db = DbConfig.getInstance();
            Connection con = db.getConnecton();
            PreparedStatement pst = con.prepareStatement(query);
            ResultSet rs = pst.executeQuery();
            
            while(rs.next()){
                
            DoctorAvailability da = new DoctorAvailability();
            da.hospitalName=rs.getString("name");
            da.id = rs.getInt("id");
            da.startTime = rs.getString("start_time");
            da.endTime = rs.getString("end_time");
            da.maxCount = rs.getInt("max_count");
            da.count = rs.getInt("count");
            da.payment = rs.getFloat("payment");
            da.date = rs.getString("date");
            
            daList.add(da);
            
            
            }
            
            

        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return daList;
    }
    
    public List<DoctorAvailability> getCurrentAvailabilitiesCurrent(int docId) {

        String query = "SELECT da.*,h.name FROM `doctor_availability` da INNER JOIN doctors d on d.id=da.doctor_id INNER JOIN hospitals h ON h.id=da.hospital_id WHERE Date(date)=CURRENT_DATE AND da.status=1 AND d.id=" + docId;
        List<DoctorAvailability> daList = new ArrayList<DoctorAvailability>();
        try {
            DbConfig db = DbConfig.getInstance();
            Connection con = db.getConnecton();
            PreparedStatement pst = con.prepareStatement(query);
            ResultSet rs = pst.executeQuery();
            
            while(rs.next()){
                
            DoctorAvailability da = new DoctorAvailability();
            da.hospitalName=rs.getString("name");
            da.id = rs.getInt("id");
            da.startTime = rs.getString("start_time");
            da.endTime = rs.getString("end_time");
            da.maxCount = rs.getInt("max_count");
            da.count = rs.getInt("count");
            da.payment = rs.getFloat("payment");
            da.date = rs.getString("date");
            
            daList.add(da);
            
            
            }
            
            

        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return daList;
    }
    public List<DoctorAvailability> getCurrentAvailabilitiesHos(int docId,int hosId) {

        String query = "SELECT da.*,h.name FROM `doctor_availability` da INNER JOIN doctors d on d.id=da.doctor_id INNER JOIN hospitals h ON h.id=da.hospital_id WHERE Date(date)=CURRENT_DATE AND da.status=1 AND d.id=" + docId;
        List<DoctorAvailability> daList = new ArrayList<DoctorAvailability>();
        try {
            DbConfig db = DbConfig.getInstance();
            Connection con = db.getConnecton();
            PreparedStatement pst = con.prepareStatement(query);
            ResultSet rs = pst.executeQuery();
            
            while(rs.next()){
                
            DoctorAvailability da = new DoctorAvailability();
            da.hospitalName=rs.getString("name");
            da.hospitalId = rs.getInt("hospital_id");
            da.id = rs.getInt("id");
            da.startTime = rs.getString("start_time");
            da.endTime = rs.getString("end_time");
            da.maxCount = rs.getInt("max_count");
            da.count = rs.getInt("count");
            da.payment = rs.getFloat("payment");
            da.date = rs.getString("date");
            
            daList.add(da);
            
            
            }
            
            

        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return daList;
    }
    
    public List<DoctorAvailability> getAllDoctorAvailability(int hosId,String climit) {
        
        
        String q_select = "select da.id, h.name, d.titles, u.first_name, u.last_name, d.degrees, da.date, da.start_time, da.end_time ,da.payment, da.count, da.max_count from doctor_availability da ";
        String q_join_h = "join hospitals h on h.id=da.hospital_id ";
        String q_join_d = "join doctors d on d.id=da.doctor_id ";
        String q_join_u = "join users u on d.id=u.id ";
        String q_where = "where da.status=1 order by da.date desc";
        String q_limit = " limit "+climit+",11";
        String query = q_select + q_join_h + q_join_d + q_join_u + q_where +q_limit;
        List<DoctorAvailability> daList = new ArrayList<DoctorAvailability>();
        try {
            DbConfig db = DbConfig.getInstance();
            Connection con = db.getConnecton();

            PreparedStatement pst = con.prepareStatement(query);
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                DoctorAvailability da = new DoctorAvailability();
                da.id = rs.getInt("id");
                da.hospitalName = rs.getString("name");
//                da.doctorId = rs.getInt("doctor_id");
                da.doctorName = rs.getString("titles") + " " + rs.getString("first_name") + " " + rs.getString("last_name") + rs.getString("degrees");
                da.date = rs.getString("date");
                da.startTime = rs.getString("start_time");
                da.endTime = rs.getString("end_time");
                da.payment = rs.getFloat("payment");
                da.maxCount = rs.getInt("max_count");
                da.count = rs.getInt("count");
                daList.add(da);

            }

            con.close();

        } catch (Exception e) {
            e.printStackTrace();

        }
        return daList;
    }
    
     public List<DoctorAvailability> getAllDoctorAvailability(int hosId,String climit,String search) {
        
        
        String q_select = "select da.id, h.name, d.titles, u.first_name, u.last_name, d.degrees, da.date, da.start_time, da.end_time ,da.payment, da.count, da.max_count from doctor_availability da ";
        String q_join_h = "join hospitals h on h.id=da.hospital_id ";
        String q_join_d = "join doctors d on d.id=da.doctor_id ";
        String q_join_u = "join users u on d.id=u.id ";
        String q_where = "where da.status=1 and (u.first_name like '%"+search+"%' or u.last_name like '%"+search+"%')  order by da.date desc";
        String q_limit = " limit "+climit+",11";
        String query = q_select + q_join_h + q_join_d + q_join_u + q_where +q_limit;
        List<DoctorAvailability> daList = new ArrayList<DoctorAvailability>();
        try {
            DbConfig db = DbConfig.getInstance();
            Connection con = db.getConnecton();

            PreparedStatement pst = con.prepareStatement(query);
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                DoctorAvailability da = new DoctorAvailability();
                da.id = rs.getInt("id");
                da.hospitalName = rs.getString("name");
//                da.doctorId = rs.getInt("doctor_id");
                da.doctorName = rs.getString("titles") + " " + rs.getString("first_name") + " " + rs.getString("last_name") + rs.getString("degrees");
                da.date = rs.getString("date");
                da.startTime = rs.getString("start_time");
                da.endTime = rs.getString("end_time");
                da.payment = rs.getFloat("payment");
                da.maxCount = rs.getInt("max_count");
                da.count = rs.getInt("count");
                daList.add(da);

            }

            con.close();

        } catch (Exception e) {
            e.printStackTrace();

        }
        return daList;
    }
    
    public List<DoctorAvailability> getAllDoctorAvailability(int hosId) {
        
        
        String q_select = "select da.id, h.name, d.titles, u.first_name, u.last_name, d.degrees, da.date, da.start_time, da.end_time ,da.payment, da.count, da.max_count from doctor_availability da ";
        String q_join_h = "join hospitals h on h.id=da.hospital_id ";
        String q_join_d = "join doctors d on d.id=da.doctor_id ";
        String q_join_u = "join users u on d.id=u.id ";
        String q_where = "where da.status=1 order by da.date desc";
        String query = q_select + q_join_h + q_join_d + q_join_u + q_where;
        List<DoctorAvailability> daList = new ArrayList<DoctorAvailability>();
        try {
            DbConfig db = DbConfig.getInstance();
            Connection con = db.getConnecton();

            PreparedStatement pst = con.prepareStatement(query);
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                DoctorAvailability da = new DoctorAvailability();
                da.id = rs.getInt("id");
                da.hospitalName = rs.getString("name");
//                da.doctorId = rs.getInt("doctor_id");
                da.doctorName = rs.getString("titles") + " " + rs.getString("first_name") + " " + rs.getString("last_name") + rs.getString("degrees");
                da.date = rs.getString("date");
                da.startTime = rs.getString("start_time");
                da.endTime = rs.getString("end_time");
                da.payment = rs.getFloat("payment");
                da.maxCount = rs.getInt("max_count");
                da.count = rs.getInt("count");
                daList.add(da);

            }

            con.close();

        } catch (Exception e) {
            e.printStackTrace();

        }
        return daList;
    }

}
