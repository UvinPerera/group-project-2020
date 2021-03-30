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

    public int slmc;
    public String slmcCardProofLocation;
    public String doctorName;
    public int specialisation1;
    public int specialisation2;
    public String strSpecialisation_1;
    public String strSpecialisation_2;
    public String titles;
    public String degress;
    public int approvedBy;
    public String approvedAt;

    public String searchDoctors(String q) {
        String query = "SELECT d.id,d.titles,u.first_name,u.last_name,d.degrees FROM doctors d "
                + "LEFT JOIN users u ON u.id=d.id "
                + "WHERE (first_name LIKE '%" + q + "%' OR last_name LIKE '%" + q + "%') AND u.user_type=2";

        try {
            DbConfig db = DbConfig.getInstance();
            Connection con = db.getConnecton();

            PreparedStatement pst = con.prepareStatement(query);
            ResultSet rs = pst.executeQuery();

            List<Doctor> ds = new ArrayList<Doctor>();

            while (rs.next()) {

                Doctor d = new Doctor();

                d.id = rs.getInt("id");
                d.doctorName = rs.getString("titles") + " " + rs.getString("first_name") + " " + rs.getString("last_name") + " " + rs.getString("degrees");

                ds.add(d);
            }

            con.close();

            Gson gson = new Gson();
            String json = gson.toJson(ds);

            return json;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public Doctor getDoctor(int cId) {
        String query = "SELECT d.id,d.titles,u.first_name,u.last_name,d.degrees,ds.name as specialisation_1,dss.name as specialisation_2,d.slmc FROM doctors d "
                + "JOIN users u ON u.id=d.id "
                + "JOIN doctor_specialisation ds ON ds.id=d.specialisation_1 "
                + "JOIN doctor_specialisation dss ON dss.id=d.specialisation_2 "
                + "WHERE u.status=1 AND u.id=" + cId;

        try {
            DbConfig db = DbConfig.getInstance();
            Connection con = db.getConnecton();

            PreparedStatement pst = con.prepareStatement(query);
            ResultSet rs = pst.executeQuery();

            Doctor d = new Doctor();

            while (rs.next()) {

                d.id = rs.getInt("id");
                d.slmc = rs.getInt("slmc");
                d.strSpecialisation_1 = rs.getString("specialisation_1");
                d.strSpecialisation_2 = rs.getString("specialisation_2");
                d.titles = rs.getString("titles");
                d.degress = rs.getString("degrees");
                d.doctorName = rs.getString("titles") + " " + rs.getString("first_name") + " " + rs.getString("last_name") + " " + rs.getString("degrees");

            }

            con.close();

            return d;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public Doctor getDoctorWithHos(int cId) {
        String query = "SELECT d.id,d.titles,u.first_name,u.last_name,d.degrees,ds.name as specialisation_1,dss.name as specialisation_2,d.slmc,dh.hospital_id "
                + "FROM doctors d "
                + "JOIN users u ON u.id=d.id JOIN doctor_specialisation ds ON ds.id=d.specialisation_1 "
                + "JOIN doctor_specialisation dss ON dss.id=d.specialisation_2 "
                + "LEFT JOIN doctor_hospital dh ON dh.doctor_id=d.id "
                + "WHERE u.status=1 AND u.id=" + cId;

        try {
            DbConfig db = DbConfig.getInstance();
            Connection con = db.getConnecton();

            PreparedStatement pst = con.prepareStatement(query);
            ResultSet rs = pst.executeQuery();

            Doctor d = new Doctor();

            while (rs.next()) {

                d.id = rs.getInt("id");
                d.slmc = rs.getInt("slmc");
                d.strSpecialisation_1 = rs.getString("specialisation_1");
                d.strSpecialisation_2 = rs.getString("specialisation_2");
                d.titles = rs.getString("titles");
                d.degress = rs.getString("degrees");
                d.doctorName = rs.getString("titles") + " " + rs.getString("first_name") + " " + rs.getString("last_name") + " " + rs.getString("degrees");

            }

            con.close();

            return d;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public boolean checkDoctorWithHos(int cId, int docId) {

        String query = "SELECT * FROM doctors d LEFT JOIN doctor_hospital dh ON d.id=dh.doctor_id "
                + "WHERE d.id=" + docId + " AND dh.hospital_id=" + cId;
        boolean flag = false;

        try {

            DbConfig db = DbConfig.getInstance();
            Connection con = db.getConnecton();

            PreparedStatement pst = con.prepareStatement(query);
            ResultSet rs = pst.executeQuery();

            int count = 0;

            while (rs.next()) {
                //count++;
                flag = true;

            }
            System.out.println(count);

        } catch (Exception e) {
            e.printStackTrace();

        }

        return flag;

    }

    public void linkDoctor(int hosId, int docId) {

        String query = "INSERT INTO doctor_hospital(doctor_id,hospital_id) VALUES("+docId+","+hosId+")";

        try {
            DbConfig db = DbConfig.getInstance();
            Connection con = db.getConnecton();

            PreparedStatement pst = con.prepareStatement(query);
            int rs = pst.executeUpdate();
            
            

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public String getAllDoctorsByHospitalAndSpecialisationAsString(int cHospital, int cSpecialisation) {

        String q_select = "select u.id, u.first_name, u.last_name from hospitals h ";
        String q_join_dh = "join doctor_hospital dh on h.id=dh.id ";
        String q_join_d = "join doctors d on d.id=dh.id ";
        String q_join_u = "join users u on d.id=u.id ";
        String q_where = "where u.status=1 and h.id=" + cHospital;
        String query = q_select + q_join_dh + q_join_d + q_join_u + q_where;

        try {
            DbConfig db = DbConfig.getInstance();
            Connection con = db.getConnecton();

            PreparedStatement pst = con.prepareStatement(query);
            ResultSet rs = pst.executeQuery();

            String s = "";
            String sp = "";

            while (rs.next()) {
                int Id = rs.getInt("id");
                String Name = rs.getString("first_name") + " " + rs.getString("last_name");
                sp = "<option value=\"" + Id + "\">" + Name + "</option>";

                s += sp;
            }

            con.close();
            return s;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }

    }

    public List<Doctor> getAllDoctorsByHospital(int cHospital) {

        String query = "select u.id, u.first_name, u.last_name,d.titles,d.degrees from hospitals h "
                + "join doctor_hospital dh on h.id=dh.hospital_id "
                + "join doctors d on d.id=dh.doctor_id "
                + "join users u on d.id=u.id w"
                + "here u.status=1 and h.id=" + cHospital;

        try {
            DbConfig db = DbConfig.getInstance();
            Connection con = db.getConnecton();

            PreparedStatement pst = con.prepareStatement(query);
            ResultSet rs = pst.executeQuery();

            List<Doctor> doc = new ArrayList<Doctor>();

            while (rs.next()) {
                Doctor d = new Doctor();
                d.id = rs.getInt("id");
                d.titles = rs.getString("titles");
                d.degress = rs.getString("degrees");
                d.doctorName = rs.getString("titles") + " " + rs.getString("first_name") + " " + rs.getString("last_name") + " " + rs.getString("degrees");
                doc.add(d);

            }

            con.close();
            return doc;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }

    }

//    public Doctor(int id) {
//        this.id=id;
//    }
//    
//    public Doctor() {
//        
//    }
    public int getSLMC() {
        return slmc;
    }

    public Doctor(int id) {
        this.id = id;
    }

    public Doctor() {

    }
}
