package active;

import com.sun.source.doctree.DocCommentTree;

public class Channelling {
    public int id;
    public int patientId;
    public int doctorAvalabilityId;
    public int appointmentNo;
    public String description;
    public int status;
    public String createdAt;
    public String updatedAt;
    public int createdBy;
    public int updatedBy;
    
    public String date;
    public String time;
    public String doctor;
    public String hospital;

//    flow by doctor
//         send DoctorSpecialisation.getAllDoctorSpecialisation(); to front
//            get selected doctor_specialisation id as specialisation
//                send Doctor.getAllDoctorsBySpecialisation(specialisation) to front
//                    get selected doctor id as doctorId and date as date
//                        send DoctorAvailability.getDoctorSpecialisationByDoctor(doctorID,date) to front *final table


//    flow by hospital
//         send Province.getAllProvinces(); to front
//            get selected province id as cProvince
//                 send District.getAllDistrictsByProvince(cProvince); to front
//                      get selected district id as cDistrict
//                          send City.getAllCitiesByDistrict(cDistrict); to front
//                              get selected city id as cCity
//                                  send Hospital.getAllHospitalsByCity(cCity); to front
//                                      get selected hospital id as hospitalId
//                                          send Doctor.getAllDoctorSpecialisation() to front
//                                              get selected doctor specialisation id as specialisation and date as date
//                                                  send DoctorAvailability.getDoctorSpecialisationByHospital(doctorID,specialisation,date) to front *final table

//    inserting a new channelling
//      id is auto incrementing so need
//            every other field is as usual
//                createdAt and updatedAt are current timestamp
//                createdBy and updatedBy are active logged in user_id from session
//                   no need payment coz cash is the only option for now

//    cancelling channelling
//            if (session->userId==channelling.patientId where channelling.id=id of the crct channelling toggled)
//            {
//                if((DoctorAvalability.startTime where DoctorAvailability.id = channelling.doctorAvailabilityId)-currentTime < 2 hrs)
//                {
//                    make request to admin
//                }
//                else
//                {
//                    channelling.status=1;
//                }
//            }
//            else
//            {
//                access error
//            }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getPatientId() {
        return patientId;
    }

    public void setPatientId(int patientId) {
        this.patientId = patientId;
    }

    public int getDoctorAvalabilityId() {
        return doctorAvalabilityId;
    }

    public void setDoctorAvalabilityId(int doctorAvalabilityId) {
        this.doctorAvalabilityId = doctorAvalabilityId;
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
