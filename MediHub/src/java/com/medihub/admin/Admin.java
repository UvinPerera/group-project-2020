/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.medihub.admin;


import java.text.DateFormat;  
import java.text.SimpleDateFormat;  
import java.util.Date;  
import java.util.Calendar;  

import com.medihub.db.*;
import com.medihub.user.*;
import java.sql.*;
import java.util.*;
/**
 *
 * @author Ifra
 */

public class Admin extends User {
    
     
    
    public Admin(int id){
        this.id=id;
    }
    public Admin(){
        
    }
}