/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.medihub.prescription;

import com.medihub.db.DbConfig;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author uvinp
 */
public class Prescription {

    public int id;
    public int channeling_id;
    public String docName;
    public String date;
    public List<PrescriptionItem> presItems;

    public List<Prescription> getPrescriptionPatient(int patId) {

        String query = "SELECT p.id,ch.id AS channel_id,concat(u.first_name,\" \",u.last_name) AS doc_name,da.date FROM prescriptions p "
                + "INNER JOIN channelling ch ON p.channeling_id=ch.id "
                + "INNER JOIN doctor_availability da ON da.id=ch.doctor_availability_id "
                + "INNER JOIN users u ON u.id=da.doctor_id "
                + "JOIN users pat ON pat.id = ch.patient_id WHERE pat.id=" + patId;
        List<Prescription> prescriptions = new ArrayList<Prescription>();

        try {
            DbConfig db = DbConfig.getInstance();
            Connection con = db.getConnecton();

            PreparedStatement pst = con.prepareStatement(query);
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {

                PrescriptionItem pi = new PrescriptionItem();
                Prescription p = new Prescription();

                p.id = rs.getInt("id");
                p.channeling_id = rs.getInt("channel_id");
                p.date = rs.getString("date");
                p.docName = rs.getString("doc_name");
                p.presItems = pi.getPresItems(p.id);

                prescriptions.add(p);

            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return prescriptions;
    }

    public Prescription getPrescriptionById(int presId) {

        Prescription p = new Prescription();
        String query = "SELECT p.id,ch.id AS channel_id,concat(u.first_name,\" \",u.last_name) AS doc_name,da.date FROM prescriptions p "
                + "INNER JOIN channelling ch ON p.channeling_id=ch.id "
                + "INNER JOIN doctor_availability da ON da.id=ch.doctor_availability_id "
                + "INNER JOIN users u ON u.id=da.doctor_id "
                + "JOIN users pat ON pat.id = ch.patient_id WHERE p.id=" + presId;
        

        try {
            DbConfig db = DbConfig.getInstance();
            Connection con = db.getConnecton();

            PreparedStatement pst = con.prepareStatement(query);
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {

                PrescriptionItem pi = new PrescriptionItem();
               

                p.id = rs.getInt("id");
                p.channeling_id = rs.getInt("channel_id");
                p.date = rs.getString("date");
                p.docName = rs.getString("doc_name");
                p.presItems = pi.getPresItems(p.id);

                

            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return p;
    }
}
