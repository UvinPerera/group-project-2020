/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.medihub.admin;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Scanner;
import com.medihub.db.DbConfig;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Ifra
 */
public class ManagePharmacy{
  public static void main(String[] args){
   Scanner sc = new Scanner(System.in);
   ManagePharmacy p = new ManagePharmacy();
   int Choice;
   do{
   System.out.println("1.Create");
   System.out.println("2.Read");
   System.out.println("3.Update");
   System.out.println("4.Delete");

   Choice = sc.nextInt();

   switch(Choice)
   {
     case 1 :
 	p.Createpharmacy();
        break;

     case 2 :
   	p.ReadPharmacy();
        break;

     case 3 :
       p.UpdatePharmacy();
       break;

     case 4 :
       p.DeletePharmacy();
       break;


     default:
       System.out.println("Exit");
       break;
   }
  }while(Choice!=4);

}

public void Createpharmacy(){
      
       Scanner sc = new Scanner(System.in);
       Pharmacy i = new Pharmacy();
       
       System.out.println("Enter Pharmacy Name:");
       String iName=sc.next();
       i.setName(iName);

       System.out.println("Enter Pharmacy License No:");
       int iLicense_no=sc.nextInt();
       i.setLicense_no(iLicense_no);

       System.out.println("Enter License Proof Location:");
       String iLicense_Proof_Location=sc.next();
       i.setLicense_Proof_Location(iLicense_Proof_Location);
       
       System.out.println("Enter Pharmacist Id:");
       int iPharmacist_Id=sc.nextInt();
       i.setPharmacist_Id(iPharmacist_Id);

       System.out.println("Enter Pharmacist Proof Location:");
       String iPharmacist_Proof_Location=sc.next();
       i.setPharmacist_Proof_Location(iPharmacist_Proof_Location);
       
       System.out.println("Enter Pharmacy Display Name:");
       String iDisplay_Name=sc.next();
       i.setDisplay_Name(iDisplay_Name);
       
       System.out.println("Enter Land Number:");
       String iLand_Number=sc.next();
       i.setLand_Number(iLand_Number);

       System.out.println("Enter Fax:");
       String iFax=sc.next();
       i.setFax(iFax);
       
       System.out.println("Enter Email:");
       String iEmail=sc.next();
       i.setEmail(iEmail);

       System.out.println("Enter Address1:");
       String iAddress1=sc.next();
       i.setAddress1(iAddress1);
       
       System.out.println("Enter Address2:");
       String iAddress2=sc.next();
       i.setAddress2(iAddress2);
       
       System.out.println("Enter City:");
       int iCity=sc.nextInt();
       i.setCity(iCity);
       
       
       System.out.println("Enter Status:");
       int iStatus=sc.nextInt();
       i.setStatus(iStatus);

       System.out.println("Enter Created By :");
       int iCreated_By=sc.nextInt();
       i.setCreated_By(iCreated_By);


      try{
          DbConfig db = DbConfig.getInstance();
          Connection con = db.getConnecton();
           Statement stmt=con.createStatement(); 
           int rs=stmt.executeUpdate("insert into pharmacies(name,license_number,license_proof_location,pharmacist_id,pharmacist_id_proof_location,display_name,land_number,fax,email,address_1,address_2,city,status,created_by) values('City Pharmacy',111,'Colombo',7,'Colombo','C_Pharmacy','011-1231231','011-9879879','citypharamcy@gmial.com','No.65,First Cross Street','Reid Place',3,1,1)");

      }catch(Exception e){
          
           e.printStackTrace();
      }
       
  }
  public void ReadPharmacy(){
  }

  public void UpdatePharmacy(){

  }
  public void DeletePharmacy(){
      
  }
}

class Pharmacy{
  private String Name;
  private int License_no;
  private String License_Proof_Location;
  private int Pharmacist_Id;
  private String Pharmacist_Proof_Location;
  private String Display_Name;
  private String Land_Number;
  private String Fax;
  private String Email;
  private String Address1;
  private String Address2;
  private int City;
  private int Status;
  private int Created_By;


  public String getName(){
    return Name;
  }
  public void setName(String Name){
    this.Name = Name;
  }

  public int getLicense_no(){
    return License_no;
  }
  public void setLicense_no(int License_no){
    this.License_no = License_no;
  }

  public String getLicense_Proof_Location(){
    return License_Proof_Location;
  }
  public void setLicense_Proof_Location(String License_Proof_Location){
    this.License_Proof_Location = License_Proof_Location;
  }
  
  public int getPharmacist_Id(){
    return Pharmacist_Id;
  }
  public void setPharmacist_Id(int Pharmacist_Id){
    this.Pharmacist_Id = Pharmacist_Id;
  }
  
  public String getPharmacist_Proof_Location(){
    return Pharmacist_Proof_Location;
  }
  public void setPharmacist_Proof_Location(String Pharmacist_Proof_Location){
    this.Pharmacist_Proof_Location = Pharmacist_Proof_Location;
  }
  
  public String getDisplay_Name(){
    return Display_Name;
  }
  public void setDisplay_Name(String Name){
    this.Display_Name = Display_Name;
  }
  
  public String getLand_Number(){
    return Land_Number;
  }
  public void setLand_Number(String Land_Number){
    this.Land_Number = Land_Number;
  }

  public String getFax(){
    return Fax;
  }
  public void setFax(String Fax){
    this.Fax = Fax;
  }
  
  public String getEmail(){
    return Email;
  }
  public void setEmail(String Email){
    this.Email = Email;
  }
  
  public String getAddress1(){
    return Address1;
  }
  public void setAddress1(String Address1){
    this.Address1 = Address1;
  }
  
  public String getAddress2(){
    return Address2;
  }
  public void setAddress2(String Address2){
    this.Address2 = Address2;
  }
  
  public int getCity(){
    return City;
  }
  public void setCity(int City){
    this.City = City;
  }
  
  public int getStatus(){
    return Status;
  }
  public void setStatus(int Status){
    this.Status = Status;
  }
  
  public int getCreated_By(){
    return Created_By;
  }
  public void setCreated_By(int Created_By){
    this.Created_By = Created_By;
  }
}