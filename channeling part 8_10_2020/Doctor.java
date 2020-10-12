package active;

public class Doctor extends User {
    private int slmc;
    private String slmcCardProofLocation;
    public int specialisation1;
    public int specialisation2;
    public String titles;
    public String degress;
    public int approvedBy;
    public String approvedAt;

    //return all available active doctors
    public Doctor[] getAllDoctors() {
        String query="SELECT * from doctors WHERE status=0";
        PreparedStatement st = conn.prepareStatement(query);
        ResultSet rs = st.executeQuery();
        rs.last();
        int size=rs.getRow();
        Doctor doctorObjectArray[] = new Doctor[size];
        rs.beforeFirst();
        for(int i=0; i<size; i++) {
            doctorObjectArray[i] = rs.next();
        }
        return doctorObjectArray;
    }
    //return custom active doctors
    public Doctor[] getAllDoctorsBySpecialisation(int specialisation) {
        String query="SELECT * from doctors WHERE status=0 AND (specialisation1="+specialisation+" or specialisation2="+specialisation+")";
        PreparedStatement st = conn.prepareStatement(query);
        ResultSet rs = st.executeQuery();
        rs.last();
        int size=rs.getRow();
        Doctor doctorObjectArray[] = new Doctor[size];
        rs.beforeFirst();
        for(int i=0; i<size; i++) {
            doctorObjectArray[i] = rs.next();
        }
        return doctorObjectArray;
    }

    public void createPrescription() {

    }

    public void deletePrescription() {

    }

    public int getSlmc() {
        return slmc;
    }

    public void setSlmc(int slmc) {
        this.slmc = slmc;
    }

    public String getSlmcCardProofLocation() {
        return slmcCardProofLocation;
    }

    public void setSlmcCardProofLocation(String slmcCardProofLocation) {
        this.slmcCardProofLocation = slmcCardProofLocation;
    }

    public int getSpecialisation1() {
        return specialisation1;
    }

    public void setSpecialisation1(int specialisation1) {
        this.specialisation1 = specialisation1;
    }

    public int getSpecialisation2() {
        return specialisation2;
    }

    public void setSpecialisation2(int specialisation2) {
        this.specialisation2 = specialisation2;
    }

    public String getTitles() {
        return titles;
    }

    public void setTitles(String titles) {
        this.titles = titles;
    }

    public String getDegress() {
        return degress;
    }

    public void setDegress(String degress) {
        this.degress = degress;
    }

    public int getApprovedBy() {
        return approvedBy;
    }

    public void setApprovedBy(int approvedBy) {
        this.approvedBy = approvedBy;
    }

    public String getApprovedAt() {
        return approvedAt;
    }

    public void setApprovedAt(String approvedAt) {
        this.approvedAt = approvedAt;
    }
}
