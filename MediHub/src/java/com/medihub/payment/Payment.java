/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.medihub.payment;

import com.medihub.db.DbConfig;
import com.medihub.location.District;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author tharshan
 */
public class Payment {
    public int id;
    public String name;
    public String description;
    public int status;
    public String created_at;
    public String updated_at;
    public int created_by;
    public int updated_by;
    
    public List<Payment> getPaymentMethods()
    {
        String query = "select id, name from payment_methods where status=1";
        
        try
        {
            DbConfig db = DbConfig.getInstance();
            Connection con = db.getConnecton();
            
            PreparedStatement pst = con.prepareStatement(query);
            ResultSet rs = pst.executeQuery();
            
            List<Payment> p =new ArrayList<Payment>();
                        
            while(rs.next()) { 
                Payment pm = new Payment(); 
                pm.id = rs.getInt("id"); 
                pm.name = rs.getString("name");
                
                p.add(pm);
            }
            
            con.close();
            return p;
        }
        catch(Exception e)
        {
            e.printStackTrace();
            return null;        
        }
    }
}
