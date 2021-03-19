/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.medihub.pharmacy;
import com.medihub.db.DbConfig;
import com.medihub.location.District;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;


/**
 *
 * @author Yash
 */
public class Orders {
    
    public int id;
    public int pharmacyId;
    public String description;
    public int status;
    public String createdAt;
    public String orderStatus;
    public String updatedAt;
    public int createdBy;
    public int updatedBy;
    public String expectedDeliveryDate;
    public int patientId;
    public String patientFirstName;
    public String patientLastName;
    public String patientAddress1;
    public String patientAddress2;
    public String patientMobileNumber;
    public String patientLandNumber;
    
    public int getId() {
        return id;
    }

}

  