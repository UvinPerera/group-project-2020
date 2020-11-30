package com.medihub.db;
import com.medihub.user.User;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author tharshan
 */
public class DbConfig {
    public static String dbUrl="jdbc:mysql://localhost:3306/medihub?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC&useSSL=false";
<<<<<<< HEAD
    public static String password="";
=======
<<<<<<< HEAD
    public static String password="passwords";
=======


    public static String password="";
>>>>>>> 991b347b7a96e4686a32b501a2a9e5e17e8636e4
>>>>>>> f8b696c2c276255f8a1bfe87a035439cdebed56b
    public static String username="root";
    
    
    
    private static DbConfig instance;
    public static DbConfig getInstance(){
        if(instance == null){
            instance = new DbConfig();
        }
        return instance;
    }
    
    
    
    
    public Connection getConnecton(){
        try
        {
            
            Class.forName("com.mysql.jdbc.Driver");  
            Connection con=DriverManager.getConnection(DbConfig.dbUrl,DbConfig.username,DbConfig.password);
            return con;
             
        }
        catch(Exception e)
        { 
            e.printStackTrace();
            return null;
        }  
    }
    
}
