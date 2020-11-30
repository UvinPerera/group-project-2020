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
<<<<<<< HEAD
    public static String password="password";
=======
    public static String password="passwords";
=======
    public static String password="";
>>>>>>> 371c5b63b9b97d1646c2a47562d5403db22e6f2d

>>>>>>> 3ca8818aee77a260904ea364645d865ee45d43cc
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
