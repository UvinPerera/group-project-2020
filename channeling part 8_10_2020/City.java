package active;

public class City {
    public int id;
    public int district;
    public String name;
    public int status;
    public String description;
    public String createdAt;
    public String updatedAt;
    public int createdBy;
    public int updatedBy;

    //return all available active cities by districts
    public City[] getAllCitiesByDistrict(int cDistrict) {
        String query="SELECT * from cities WHERE status=0 AND district="+cDistrict;
        PreparedStatement st = conn.prepareStatement(query);
        ResultSet rs = st.executeQuery();
        rs.last();
        int size=rs.getRow();
        City cityObjectArray[] = new City[size];
        rs.beforeFirst();
        for(int i=0; i<size; i++) {
            cityObjectArray[i] = rs.next();
        }
        return cityObjectArray;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getDistrict() {
        return district;
    }

    public void setDistrict(int district) {
        this.district = district;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
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
