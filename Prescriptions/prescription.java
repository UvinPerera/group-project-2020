
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



