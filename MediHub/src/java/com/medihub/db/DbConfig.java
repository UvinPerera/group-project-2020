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

<<<<<<< HEAD
    public static String password="";

=======


    public static String password="";
>>>>>>> 64002ee3272eaa37754df7e2afa9263161e970cb
>>>>>>> 850522b93dbac25b61addd2d7732bc7f5fb250bb
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
