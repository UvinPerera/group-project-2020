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
    public static String password="passwords";
=======
    public static String password="password";
>>>>>>> 71bb731ad41ed1e9d690fa4b20c6f4b825a7b20c
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
