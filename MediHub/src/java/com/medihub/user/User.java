package com.medihub.user;
import com.medihub.db.*;
import com.medihub.patient.Channelling;
import com.medihub.patient.Patient;
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
    
    public String districtStr;
    public int district;
    public String cityStr;
    
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
    
    public User getProfile(){
        //sql query
        String q_select="select u.*, c.name_en as city_name, d.name_en as district_name, d.id as district from users u ";
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
