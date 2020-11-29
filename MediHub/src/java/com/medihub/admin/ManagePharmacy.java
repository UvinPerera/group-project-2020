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
import com.medihub.db.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Ifra
 */
public class ManagePharmacy{
  public static void main(String[] args) throws SQLException{
   Scanner sc = new Scanner(System.in);
   ManagePharmacy p = new ManagePharmacy();
   int Choice;
   do{
   System.out.println("...Enter Your Choice...");
   System.out.println("1.Create");
   System.out.println("2.Read");
   System.out.println("3.Update");
   System.out.println("4.Delete");

   Choice = sc.nextInt();

   switch(Choice)
   {
     case 1 :
 	p.CreatePharmacy();
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
  
  public Connect getConnection(){
      try{
          
          DriverManager.registerDriver(new com.medihub.db());
          
          Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/medihub?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC&useSSL=false","root","passwords")
          
          return con;
          
         }catch (Eception e){
          
           e.printStackTrace();
      }
      return null;
  }

  public void CreatePharmacy(){
       Scanner sc = new Scanner(System.in);
       Pharmacy i = new Pharmacy();
       
       System.out.println("Enter Pharmacy ID:");
       int iId=sc.nextInt();
       i.setId(iId);

       System.out.println("Enter Pharmacy Name:");
       String iName=sc.next();
       i.setName(iName);

       System.out.println("Enter Pharmacy License No:");
       int iLicense_no=sc.nextInt();
       i.setLicense_no(iLicense_no);

       System.out.println("Enter License Proof Location:");
       String iLicense_Proof_Location=sc.next();
       i.setLicense_Proof_Location(iLicense_Proof_Location);

       System.out.println("Enter Pharmacist Proof Location:");
       String iPharmacist_Proof_Location=sc.next();
       i.setPharmacist_Proof_Location(iPharmacist_Proof_Location);

       System.out.println("Enter Status:");
       int iStatus=sc.nextInt();
       i.setStatus(iStatus);

       System.out.println("Enter Land Number:");
       String iLand_Number=sc.next();
       i.setLand_Number(iLand_Number);

       System.out.println("Enter Fax:");
       String iFax=sc.next();
       i.setFax(iFax);

       System.out.println("Enter Address:");
       String iAddress=sc.next();
       i.setAddress(iAddress);

       System.out.println("Enter City:");
       String iCity=sc.next();
       i.setCity(iCity);

       System.out.println("Enter District:");
       String iDistrict=sc.next();
       i.setDistrict(iDistrict);

       System.out.println("Enter Approved By :");
       int iApproved_By=sc.nextInt();
       i.setApproved_By(iApproved_By);

       System.out.println("Enter Approved At:");
       int iApproved_At=sc.nextInt();
       i.setApproved_At(iApproved_At);

      try{
          Connection con =getConnecton();
            
          PreparedStatement pst = con.prepareStatement("insert into pharmacies(name,license_number,license_proof_location,pharmacist_id_proof_location,display_name,land_number,fax,email,address_1,address_2,descriptiopn,status,approved_by,approved_at) values(?,?,?,?,?,?,?,?,?,?,?,?)");
          pst.setString(1, i.getName());
          pst.setInt(2, i.getLicense_no());
          pst.setString(3,i.getLicense_Proof_Location());
          pst.setString(4,i.getPharmacist_Proof_Location());
          pst.setInt(5, i.getStatus());
          pst.setString(6,i.getLand_Number());
          pst.setString(7,i.Fax());
          pst.setString(8, i.getAddress());
          pst.setString(9,i.getCity());
          pst.setString(10, i.getDistrict());
          pst.setInt(11, i.getApproved_By());
          pst.setInt(12, i.getApproved_By());
          
      }catch(Eception e){
          
           e.printStackTrace();
      }
       
  }
  public void ReadPharmacy() throws SQLException{
      try{
          try (Connection con = getConnecton(); PreparedStatement pst = con.prepareStatement("select * from pharmacies"); ResultSet rs = pst.executeQuery()) {
              while(rs.next())
              {
                  System.out.println(rs.getString(1)+" "+rs.getInt(2)+" "+rs.getString(3)+" "+rs.getString(4)+" "+rs.getInt(5)+" "+rs.getString(6)+" "+rs.getString(7)+" "+rs.getString(8)+" "+rs.getString(9)+" " +rs.getString(10)+" "+rs.getInt(11)+" "+rs.getInt(12));
              }
          }
          
    }catch (Eception e){
          
           e.printStackTrace();
      }
  }

  public void UpdatePharmacy(){
     /*Scanner sc=new Scanner(System.in);
        System.out.println("Enter Pharmacy ID : ");
        int iId=sc.nextInt();
        Pharmacy ph = pharmacy.get(iId);

        System.out.println("Enter New Name : ");
        String iName=sc.next();
        ph.setName(iName);

        System.out.println("Enter New Pharmacy License No:");
        int iLicense_no=sc.nextInt();
        ph.setLicense_no(iLicense_no);

        System.out.println("Enter New License Proof Location:");
        String iLicense_Proof_Location=sc.next();
        ph.setLicense_Proof_Location(iLicense_Proof_Location);

        System.out.println("Enter New Pharmacist Proof Location:");
        String iPharmacist_Proof_Location=sc.next();
        ph.setPharmacist_Proof_Location(iPharmacist_Proof_Location);

        System.out.println("Enter New Status:");
        int iStatus=sc.nextInt();
        ph.setStatus(iStatus);

        System.out.println("Enter New Land Number:");
        String iLand_Number=sc.next();
        ph.setLand_Number(iLand_Number);

        System.out.println("Enter New Fax:");
        String iFax=sc.next();
        ph.setFax(iFax);

        System.out.println("Enter New Address:");
        String iAddress=sc.next();
        ph.setAddress(iAddress);

        System.out.println("Enter New City");
        String iCity=sc.next();
        ph.setCity(iCity);

        System.out.println("Enter New District:");
        String iDistrict=sc.next();
        ph.setFax(iDistrict);

        System.out.println("Enter New Approved By :");
        int iApproved_By=sc.nextInt();
        ph.setApproved_By(iApproved_By);

        System.out.println("Enter new Approved At:");
        int iApproved_At=sc.nextInt();
        ph.setApproved_At(iApproved_At);*/
  }
  public void DeletePharmacy(){
     int id;
     
  }
}

class Pharmacy{
  private int Id;
  private String Name;
  private int License_no;
  private String License_Proof_Location;
  private String Pharmacist_Proof_Location;
  private int Status;
  private String Land_Number;
  private String Fax;
  private String Address;
  private String City;
  private String District;
  private int Approved_By;
  private int Approved_At;

  //Generate set and get methods
  public int getId(){
    return Id;
  }
  public void setId(int Id){
    this.Id = Id;
  }
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

  public String getPharmacist_Proof_Location(){
    return Pharmacist_Proof_Location;
  }
  public void setPharmacist_Proof_Location(String Pharmacist_Proof_Location){
    this.Pharmacist_Proof_Location = Pharmacist_Proof_Location;
  }

  public int getStatus(){
    return Status;
  }
  public void setStatus(int Status){
    this.Status = Status;
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

  public String getAddress(){
    return Address;
  }
  public void setAddress(String Address){
    this.Address = Address;
  }

  public String getCity(){
    return City;
  }
  public void setCity(String City){
    this.City = City;
  }

  public String getDistrict(){
    return District;
  }
  public void setDistrict(String District){
    this.District = District;
  }

  public int getApproved_By(){
    return Approved_By;
  }
  public void setApproved_By(int Approved_By){
    this.Approved_By = Approved_By;
  }

  public int getApproved_At(){
    return Approved_At;
  }
  public void setApproved_At(int Approved_At){
    this.Approved_At = Approved_At;
  }

}

