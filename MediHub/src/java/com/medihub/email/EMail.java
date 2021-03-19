/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.medihub.email;

/**
 *
 * @author diabalo
 */

import java.util.Properties;    
import javax.mail.*;    
import javax.mail.internet.*;  


public class EMail{  
    
    public  void send(String to,String sub,String msg){  
          //Get properties object  
         final String username = "medihub54@gmail.com";
        final String password = "ucsc@123";
          
         Properties props = new Properties();    
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "465");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.socketFactory.port", "465");
        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory"); 
        //props.put("mail.smtp.starttls.enable","true");
        //props.put("mail.smtp.user",username);
        //props.put("mail.smtp.password",password);
        //props.put("mail.smtp.socketFactory.fallback", "false");
        props.put("mail.smtp.ssl.enable", "true");
        
          //get Session   
          Session session = Session.getInstance(props,    
           new javax.mail.Authenticator() {    
           @Override
           protected PasswordAuthentication getPasswordAuthentication() {    
           return new PasswordAuthentication(username,password);  
           }    
          });    
          //compose message    
          try {    
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress("medihub54@gmail.com"));
            message.setRecipients(
                    Message.RecipientType.TO,
                    InternetAddress.parse(to)
            );
            message.setSubject(sub);
            message.setContent(msg,"text/html");

            Transport.send(message);

           // System.out.println("Done");   
           // System.out.println("message sent successfully");    
          }  catch (MessagingException e) {
            e.printStackTrace();
        }  
             
    }  
       public static void main(String args[]){

           //EMail.send("uvininduwaraperera@gmail.com","Welcome to Medihub","Hello by Medihub"); 

    }
}  
    



         //Mailer.send("medihub54@gmail.com","ucsc@123","2018cs126@stu.ucsc.cmb.ac.lk","Welcome to Medihub","Hello by Medihub"); 
     
    
