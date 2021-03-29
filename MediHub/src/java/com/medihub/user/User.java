package com.medihub.user;
import com.google.gson.Gson;
import com.medihub.db.*;
import com.medihub.patient.Channelling;
import com.medihub.patient.Patient;
import com.medihub.doctor.Doctor;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author tharshan
 */
public class User {
    
    public int id;
    public String firstName;
    public String lastName;
    public String displayName;
    public String fullNameWithEmail;
    public String email;
    protected String password;
    public int userType;
    public String gender;
    public String nic;
    public int city;
    public String address1;
    public String address2;
    public String landNumber;
    public String mobileNumber;
    public String dob;
    public String lastLogin;
    public String description;
    public int status;
    public String createdAt;
    public String updatedAt;
    public int createdBy;
    public int updatedBy;
    public String profilePicPath;
    public String absoluteProfilePicPath;
    public String districtStr;
    public int district;
    public String cityStr;
    public int channelingId;
    
    public static String getDashboard(int userType) {
        if(userType==0){
            return ("adminDashboard.jsp");
        }
        else if(userType==1){
            return ("patientDashboard.jsp");
        }
        else if(userType==2){
            return ("doctorDashboard.jsp");
        }
        else if(userType==3){
            return ("hospitalDashboard.jsp");
        }
        else if(userType==4){
            return ("pharmacyDashboard.jsp");
        }
        else {
            return ("invalid.html");
        }
        
    }

    public User(int hospitalAdminId) {
        this.id = hospitalAdminId;
    }
    public User(){
        
    }
    public String getAbsPath(){
        String query = "select absolute_pp_path from users where id="+this.id;
        String absPath="";
        try{
         DbConfig db = DbConfig.getInstance();
            Connection con = db.getConnecton();
            
            PreparedStatement pst = con.prepareStatement(query);
            ResultSet rs = pst.executeQuery();
            while(rs.next()) { 
                absPath = rs.getString("absolute_pp_path");
            }
            return absPath;
        }
         catch(Exception e)
        {
            e.toString();
            return null;        
        }
        
            
    }
    public String getAbsPath(int id){
        int userId = id;
        String query = "select absolute_pp_path from users where id="+userId;
        String absPath="";
        try{
         DbConfig db = DbConfig.getInstance();
            Connection con = db.getConnecton();
            
            PreparedStatement pst = con.prepareStatement(query);
            ResultSet rs = pst.executeQuery();
            while(rs.next()) { 
                absPath = rs.getString("absolute_pp_path");
            }
            return absPath;
        }
         catch(Exception e)
        {
            e.toString();
            return null;        
        }
        
            
    }
    public User getProfile(){
        //sql query
        String q_select="select u.*, c.name_en as city_name, d.name_en as district_name,u.profile_pic_path,u.absolute_pp_path, d.id as district from users u ";
        String q_join_c="join cities c on c.id=u.city ";
        String q_join_d="join districts d on d.id=c.district_id ";
        String q_where="where u.status=1 and u.id="+this.id;
        String query=q_select + q_join_c + q_join_d + q_where;
  
        try
        {
            DbConfig db = DbConfig.getInstance();
            Connection con = db.getConnecton();
            
            PreparedStatement pst = con.prepareStatement(query);
            ResultSet rs = pst.executeQuery();
            
            while(rs.next()) { 
                this.firstName=rs.getString("first_name");
                this.lastName=rs.getString("last_name");
                this.displayName=rs.getString("display_name");
                this.id = rs.getInt("id"); 
                this.gender = rs.getString("gender"); 
                this.email = rs.getString("email"); 
                this.nic = rs.getString("nic"); 
                this.district = rs.getInt("district"); 
                this.districtStr = rs.getString("district_name"); 
                this.city = rs.getInt("city"); 
                this.cityStr = rs.getString("city_name"); 
                this.address1 = rs.getString("address_1"); 
                this.address2 = rs.getString("address_2"); 
                this.mobileNumber = rs.getString("mobile_number"); 
                this.landNumber = rs.getString("land_number"); 
                this.dob = rs.getString("dob"); 
                this.description = rs.getString("description"); 
                this.createdAt = rs.getString("created_at");
                this.updatedAt = rs.getString("updated_at");
                this.profilePicPath = rs.getString("profile_pic_path");
                this.absoluteProfilePicPath = rs.getString("absolute_pp_path");
                
            }
            
            con.close();
            return this;
        }
        catch(Exception e)
        {
            e.toString();
            return null;        
        }
    }
    
      public List<User> getAllPatient(){
        
        String query = "select p.*,d.name_en as district_name,c.name_en as city_name FROM users p inner join cities c on p.city =c.id INNER JOIN districts d on d.id=c.district_id where p.user_type=1 ";
        
        try
        {
            DbConfig db = DbConfig.getInstance();
            Connection con = db.getConnecton();
            
            PreparedStatement pt = con.prepareStatement(query);
            ResultSet rs = pt.executeQuery();
            
            List<User> p =new ArrayList<User>();
                        
            while(rs.next()) { 
                User ph = new User();
                ph.id=rs.getInt("id");
                ph.firstName=rs.getString("first_name");
                ph.lastName=rs.getString("last_name");
                ph.displayName=rs.getString("display_name");
                ph.districtStr=rs.getString("district_name");
                ph.cityStr=rs.getString("city_name");
                ph.status=rs.getInt("status");
                p.add(ph);
                
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
    
    public  List<User> getAllDoctor(){
        
        String query = "select p.*,d.name_en as district_name,c.name_en as city_name FROM users p inner join cities c on p.city =c.id INNER JOIN districts d on d.id=c.district_id where p.user_type=2 ";
        
        try
        {
            DbConfig db = DbConfig.getInstance();
            Connection con = db.getConnecton();
            
            PreparedStatement pst = con.prepareStatement(query);
            ResultSet rs = pst.executeQuery();
            
            List<User> h =new ArrayList<User>();
                        
            while(rs.next()) { 
                User doc = new User();
                doc.id=rs.getInt("id");
                doc.firstName=rs.getString("first_name");
                doc.lastName=rs.getString("last_name");
                doc.displayName=rs.getString("display_name");
                doc.districtStr=rs.getString("district_name");
                doc.cityStr=rs.getString("city_name");
                doc.status=rs.getInt("status");
                
                h.add(doc);
            }
            
            con.close();
            return h;
        }
        catch(Exception e)
        {
            e.printStackTrace();
            return null;        
        }
        
    }
    public void DeleteUser(){
    
        String query = "UPDATE users SET status=0 WHERE id="+this.id;
        
        try
        {
            DbConfig db = DbConfig.getInstance();
            Connection con = db.getConnecton();
            
            PreparedStatement pst = con.prepareStatement(query);
            int rs = pst.executeUpdate();
            

            
            con.close();
         
        }
        catch(Exception e)
        {
          e.printStackTrace();
                 
        }
    
    }
    
    public List<User> getPatientsByAvailability(int availabilityId){
        String query = "select u.first_name,u.last_name,c.id,u.email FROM users u "
                + "INNER JOIN channelling c ON c.patient_id=u.id "
                + "INNER JOIN doctor_availability da ON da.id = c.doctor_availability_id "
                + "WHERE da.id="+availabilityId;
        
        List<User> p = new ArrayList<User>();
        
        try{
            DbConfig db = DbConfig.getInstance();
            Connection con = db.getConnecton();
            
            PreparedStatement pst = con.prepareStatement(query);
            ResultSet rs = pst.executeQuery();
            
            while(rs.next()){
            
                User pat = new User();
                
                pat.id = rs.getInt("id");
                pat.email = rs.getString("email");
                pat.firstName = rs.getString("first_name");
                pat.lastName = rs.getString("last_name");
                
                p.add(pat);
            
            }
            
            con.close();
        
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return p;
    
    }
    
    public String searchUser(String q){
    
    String query = "SELECT id,first_name,last_name,email FROM users "
            + "WHERE (first_name LIKE '%"+q+"%' OR last_name LIKE '%"+q+"%' ) AND user_type=1";
    
    try
        {
            DbConfig db = DbConfig.getInstance();
            Connection con = db.getConnecton();
            
            PreparedStatement pst = con.prepareStatement(query);
            ResultSet rs = pst.executeQuery();
            
            List<User> us = new ArrayList<User>();
                        
            while(rs.next()) { 
                
                User u = new User();
                
                u.id = rs.getInt("id");
                u.fullNameWithEmail = rs.getString("first_name") + " " + rs.getString("last_name") + " (" + rs.getString("email")+")";
                
                us.add(u);
            }
            
            con.close();
            
            Gson gson = new Gson();
            String json = gson.toJson(us);
            
            return json;
        }
        catch(Exception e)
        {
            e.printStackTrace();
            return null;
                
        }
    
    }
    public void register() {

    }

    public void login() {

    }

    public void logout() {

    }

    public void viewDoctorReview() {

    }

    public void viewHospitalReview() {

    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    protected String getPassword() {
        return password;
    }

    protected void setPassword(String password) {
        this.password = password;
    }

    public int getUserType() {
        return userType;
    }

    public void setUserType(int userType) {
        this.userType = userType;
    }

    public String getNic() {
        return nic;
    }

    public void setNic(String nic) {
        this.nic = nic;
    }

    public int getCity() {
        return city;
    }

    public void setCity(int city) {
        this.city = city;
    }

    public String getAddress1() {
        return address1;
    }

    public void setAddress1(String address1) {
        this.address1 = address1;
    }

    public String getAddress2() {
        return address2;
    }

    public void setAddress2(String address2) {
        this.address2 = address2;
    }

    public String getLandNumber() {
        return landNumber;
    }

    public void setLandNumber(String landNumber) {
        this.landNumber = landNumber;
    }

    public String getMobileNumber() {
        return mobileNumber;
    }

    public void setMobileNumber(String mobileNumber) {
        this.mobileNumber = mobileNumber;
    }

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public String getLastLogin() {
        return lastLogin;
    }

    public void setLastLogin(String lastLogin) {
        this.lastLogin = lastLogin;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(String createdAt) {
        this.createdAt = createdAt;
    }

    public String getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(String updatedAt) {
        this.updatedAt = updatedAt;
    }

    public int getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(int createdBy) {
        this.createdBy = createdBy;
    }

    public int getUpdatedBy() {
        return updatedBy;
    }

    public void setUpdatedBy(int updatedBy) {
        this.updatedBy = updatedBy;
    }
}