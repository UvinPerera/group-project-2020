package com.medihub.user;
import com.medihub.db.*;

/**
 *
 * @author tharshan
 */
public class User {
    
    public int id;
    public String email;
    protected String password;
    public int userType;
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
