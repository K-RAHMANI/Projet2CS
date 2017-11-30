package classes;
import java.util.Date;

public class DemandeAssistance {
	
	private int 	ID_Demande_ass; 
	private int 	Patient; 
	private String 	Type_Assistance; 
	private String 	Motif_Assistance; 
	private String 	Date_Assistance;
	public DemandeAssistance() {
		super();
		// TODO Auto-generated constructor stub
	}
	public DemandeAssistance(int iD_Demande_ass, int patient, String type_Assistance, String motif_Assistance,
			String date_Assistance) {
		super();
		ID_Demande_ass = iD_Demande_ass;
		Patient = patient;
		Type_Assistance = type_Assistance;
		Motif_Assistance = motif_Assistance;
		Date_Assistance = date_Assistance;
	}
	public int getID_Demande_ass() {
		return ID_Demande_ass;
	}
	public void setID_Demande_ass(int iD_Demande_ass) {
		ID_Demande_ass = iD_Demande_ass;
	}
	public int getPatient() {
		return Patient;
	}
	public void setPatient(int patient) {
		Patient = patient;
	}
	public String getType_Assistance() {
		return Type_Assistance;
	}
	public void setType_Assistance(String type_Assistance) {
		Type_Assistance = type_Assistance;
	}
	public String getMotif_Assistance() {
		return Motif_Assistance;
	}
	public void setMotif_Assistance(String motif_Assistance) {
		Motif_Assistance = motif_Assistance;
	}
	public String getDate_Assistance() {
		return Date_Assistance;
	}
	public void setDate_Assistance(String date_Assistance) {
		Date_Assistance = date_Assistance;
	} 
	
	
	
	

}
