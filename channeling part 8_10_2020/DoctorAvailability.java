package active;

public class DoctorAvailability {
    public int id;
    public int doctorId;
    public int hospitalId;
    public String date;
    public String startTime;
    public int maxCount;
    public int count;
    public int status;
    public String createdAt;
    public String updatedAt;
    public int createdBy;
    public int updatedBy;

    //return custom active doctors availabilities based on doctor data
    public DoctorAvailability[] getDoctorSpecialisationByDoctor(int doctorId, String cDate) {
        String query="SELECT * from doctor_availability WHERE status=0 AND doctor_id="+doctorId+" AND date="+cDate;
        PreparedStatement st = conn.prepareStatement(query);
        ResultSet rs = st.executeQuery();
        rs.last();
        int size=rs.getRow();
        DoctorAvailability doctorAvailabilityObjectArray[] = new DoctorAvailability[size];
        rs.beforeFirst();
        for(int i=0; i<size; i++) {
            doctorAvailabilityObjectArray[i] = rs.next();
        }
        return doctorAvailabilityObjectArray;
    }

    //return custom active doctors availabilities based on hospital and specialisation data
    public DoctorAvailability[] getDoctorSpecialisationByHospital(int hospitalId, int specialisation, String cDate) {
        String query="SELECT da.* from doctor_availability da JOIN doctors d ON da.doctor_id=d.id WHERE da.status=0 AND d.status=0 AND hospital_id="+hospitalId+" AND date="+cDate+" AND (d.specialisation1="+specialisation+" OR d.specialisation2="+specialisation+")";
        PreparedStatement st = conn.prepareStatement(query);
        ResultSet rs = st.executeQuery();
        rs.last();
        int size=rs.getRow();
        DoctorAvailability doctorAvailabilityObjectArray[] = new DoctorAvailability[size];
        rs.beforeFirst();
        for(int i=0; i<size; i++) {
            doctorAvailabilityObjectArray[i] = rs.next();
        }
        return doctorAvailabilityObjectArray;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getDoctorId() {
        return doctorId;
    }

    public void setDoctorId(int doctorId) {
        this.doctorId = doctorId;
    }

    public int getHospitalId() {
        return hospitalId;
    }

    public void setHospitalId(int hospitalId) {
        this.hospitalId = hospitalId;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
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
