import java.util.ArrayList;
import java.util.Scanner;


public class ManagePharmacy{
  public static void main(String[] args){
   Scanner sc = new Scanner(System.in);
   ManagePharmacy p = new ManagePharmacy();
   ArrayList <Pharmacy> globalPharmacy= new ArrayList <Pharmacy>();
   int Choice;
   do{
   System.out.println("...Enter Your Choice...");
   System.out.println("Press 1 for Create");
   System.out.println("Press 2 for Read");
   System.out.println("Press 3 for Update");
   System.out.println("Press 4 for Delete");

   Choice = sc.nextInt();

   switch(Choice)
   {
     case 1 :
 		   globalPharmacy.add(p.CreatePharmacy());
       System.out.println("Create Successfully");
 		   break;

     case 2 :
   		 p.ReadPharmacy(globalPharmacy);
   		 break;

     case 3 :
       p.UpdatePharmacy(globalPharmacy);
       break;

     case 4 :
       p.DeletePharmacy(globalPharmacy);
       break;


     default:
       System.out.println("Exit");
       break;
   }
  }while(Choice!=4);

  }

  public Pharmacy CreatePharmacy(){
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

       return i;

  }
  public void ReadPharmacy(ArrayList <Pharmacy> pharmacy){
    for(int i=0;i<pharmacy.size();i++){
      System.out.println(pharmacy.get(i).getId());
      System.out.println(pharmacy.get(i).getName());
      System.out.println(pharmacy.get(i).getLicense_no());
      System.out.println(pharmacy.get(i).getLicense_Proof_Location());
      System.out.println(pharmacy.get(i).getPharmacist_Proof_Location());
      System.out.println(pharmacy.get(i).getStatus());
      System.out.println(pharmacy.get(i).getLand_Number());
      System.out.println(pharmacy.get(i).getFax());
      System.out.println(pharmacy.get(i).getAddress());
      System.out.println(pharmacy.get(i).getCity());
      System.out.println(pharmacy.get(i).getDistrict());
      System.out.println(pharmacy.get(i).getApproved_By());
      System.out.println(pharmacy.get(i).getApproved_At());

    }
  }

  public void UpdatePharmacy(ArrayList <Pharmacy> pharmacy){
       Scanner sc=new Scanner(System.in);
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
        ph.setApproved_At(iApproved_At);
  }
  public void DeletePharmacy(ArrayList <Pharmacy> pharmacy){
    Scanner sc=new Scanner(System.in);
    System.out.println("Enter Pharmacy ID : ");
    int iId=sc.nextInt();
    Pharmacy ph = pharmacy.get(iId);
    pharmacy.remove(ph);
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
