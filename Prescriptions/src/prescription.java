import java.util.ArrayList;
import java.util.Scanner;

public class prescription {

    static int count = 0;
    private int ID;
    private int ChannelingId;
    private int status;

    public void increment(){
        count++;
    }
    public prescription(int inputChannelingId,int inputStatus){
        increment();
        setID();
        setChannelingId(inputChannelingId);
        setStatus(inputStatus);
    }
    public void setID(){
        this.ID=count;
    }

    public void setChannelingId(int input_Channeling_Id){
        this.ChannelingId =input_Channeling_Id;
    }

    public void setStatus(int input_status){
        this.ChannelingId =input_status;
    }

    public int getID(){
        return this.ID;
    }

    public int getChannelingId(){
        return this.ChannelingId;
    }

    public int getStatus(){
       return this.status;
    }
}

public class Main {
    public static void main(String[] args){
        Scanner sc=new Scanner(System.in);
        ArrayList <prescription> prescriptionList= new ArrayList <prescription>();

        public static void createPrescription(){
            System.out.println("Enter Channeling ID : ");
            int inputChannelingId=sc.nextInt();
            System.out.println("Enter Status : ");
            int inputStatus=sc.nextInt();
            prescriptionList.add( new prescription(inputChannelingId,inputStatus));
        }

        public static void readPrescription(){
            System.out.println("Enter ID : ");
            int inputId=sc.nextInt();
            prescription prescription1 = prescriptionList.get(inputId);
            int ChannelingId = prescription1.getChannelingId();
            int status = prescription1.getStatus();
            System.out.print("Prescription Id : "+inputId+"\nChanneling Id : "+ChannelingId+"\nStatus : "+status);
        }

        public static void displayAllPrescriptions() {
            int inputId = 0;
            for (inputId; inputId < prescriptionList.size(); inputId++) {
                prescription prescription1 = prescriptionList.get(inputId);
                int ChannelingId = prescription1.getChannelingId();
                int status = prescription1.getStatus();
                System.out.print("Prescription Id : " + inputId + "\nChanneling Id : " + ChannelingId + "\nStatus : " + status+"\n\n");
            }
        }

        public static void updatePrescription(){
            System.out.println("Enter ID : ");
            int inputId=sc.nextInt();
            prescription prescription1 = prescriptionList.get(inputId);
            System.out.println("Enter new Channeling ID : ");
            int inputChannelingId=sc.nextInt();
            System.out.println("Enter new Status : ");
            int inputStatus=sc.nextInt();
            prescription1.setChannelingId(inputChannelingId);
            prescription1.setStatus(inputStatus);
        }

        public static void deletePrescription(){
            System.out.println("Enter ID : ");
            int inputId=sc.nextInt();
            prescription prescription1 = prescriptionList.get(inputId);
            prescriptionList.remove(inputId);
        }
    }
}
