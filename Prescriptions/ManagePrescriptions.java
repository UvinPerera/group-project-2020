import java.util.ArrayList;
import java.util.Scanner;

public class ManagePrescriptions {
    ArrayList<prescription> prescriptionList= new ArrayList <prescription>();

    public static void createPrescription(ArrayList <prescription> prescriptionList){
        Scanner sc=new Scanner(System.in);
        System.out.println("Enter Channeling ID : ");
        int inputChannelingId=sc.nextInt();
        System.out.println("Enter Status : ");
        int inputStatus=sc.nextInt();
        prescriptionList.add( new prescription(inputChannelingId,inputStatus));
    }

    public static void readPrescription(ArrayList <prescription> prescriptionList){
        Scanner sc=new Scanner(System.in);
        System.out.println("Enter ID : ");
        int inputId=sc.nextInt();
        prescription prescription1 = prescriptionList.get(inputId);
        int ChannelingId = prescription1.getChannelingId();
        int status = prescription1.getStatus();
        System.out.print("Prescription Id : "+inputId+"\nChanneling Id : "+ChannelingId+"\nStatus : "+status);
    }

    public static void displayAllPrescriptions(ArrayList <prescription> prescriptionList) {
        Scanner sc=new Scanner(System.in);
        int inputId;
        for (inputId=0; inputId < prescriptionList.size(); inputId++) {
            prescription prescription1 = prescriptionList.get(inputId);
            int ChannelingId = prescription1.getChannelingId();
            int status = prescription1.getStatus();
            System.out.print("Prescription Id : " + inputId + "\nChanneling Id : " + ChannelingId + "\nStatus : " + status+"\n\n");
        }
    }

    public static void updatePrescription(ArrayList <prescription> prescriptionList){
        Scanner sc=new Scanner(System.in);
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

    public static void deletePrescription(ArrayList <prescription> prescriptionList){
        Scanner sc=new Scanner(System.in);
        System.out.println("Enter ID : ");
        int inputId=sc.nextInt();
        prescription prescription1 = prescriptionList.get(inputId);
        prescriptionList.remove(inputId);
    }
}
