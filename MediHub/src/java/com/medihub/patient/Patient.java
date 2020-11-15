
package com.medihub.patient;

import com.medihub.db.*;
import com.medihub.user.*;
import java.sql.Connection;
import java.util.List;
/**
 *
 * @author tharshan
 */

public class Patient extends User {
    
    public List getPendingAppointments(int id){
        try
        {
            DbConfig db = DbConfig.getInstance();
            Connection con = db.getConnecton();
            con.close();
            return null;
        }
        catch(Exception e)
        {
            e.printStackTrace();
            return null;        
        }
        
        
        
        
        
      
    }
    
    public void makeAppointment() {

    }

    public void cancelAppointment() {

    }

    public void uploadRecord() {

    }

    public void deleteRecord() {

    }

    public void postHospitalReview() {

    }

    public void deleteHospitalReview() {

    }

    public void postDoctorReview() {

    }

    public void deleteDoctorReview() {

    }

    public void makeOnlinePayment() {

    }

    public void placePharmacyOrder() {

    }

    public void cancelPharmacyOrder() {

    }

    public void trackPharmacyOrder() {

    }

}

