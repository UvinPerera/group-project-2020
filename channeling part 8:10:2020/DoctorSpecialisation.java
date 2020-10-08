package active;

public class DoctorSpecialisation {
    public int id;
    public String name;
    public String description;
    public int status;
    public String createdAt;
    public String updatedAt;
    public String createdBy;
    public String updatedBy;

    //return all available active doctor specialisations
    public DoctorSpecialisation[] getAllDoctorSpecialisation() {
        String query="SELECT * from doctor_specialisation WHERE status=0";
        PreparedStatement st = conn.prepareStatement(query);
        ResultSet rs = st.executeQuery();
        rs.last();
        int size=rs.getRow();
        DoctorSpecialisation doctorSpecialisationObjectArray[] = new DoctorSpecialisation[size];
        rs.beforeFirst();
        for(int i=0; i<size; i++) {
            doctorSpecialisationObjectArray[i] = rs.next();
        }
        return doctorSpecialisationObjectArray;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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

    public String getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy;
    }

    public String getUpdatedBy() {
        return updatedBy;
    }

    public void setUpdatedBy(String updatedBy) {
        this.updatedBy = updatedBy;
    }
}
