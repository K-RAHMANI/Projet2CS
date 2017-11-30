package classes;
import java.util.Date;

public class Assistant {
	private int 	ID_Assistant;
	private String 	Nom_assistant;
	private String 	Prenom_assistant;
	private Date 	Date_Naissance;
	private String 	Adresse;
	private String 	Telephone1;
	private String 	Telephone2;
	private String 	Email;
	private String Photo_assistant;
	public Assistant() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Assistant(int iD_Assistant, String nom_assistant, String prenom_assistant, Date date_Naissance,
			String adresse, String telephone1, String telephone2, String email, String photo_assistant) {
		super();
		ID_Assistant = iD_Assistant;
		Nom_assistant = nom_assistant;
		Prenom_assistant = prenom_assistant;
		Date_Naissance = date_Naissance;
		Adresse = adresse;
		Telephone1 = telephone1;
		Telephone2 = telephone2;
		Email = email;
		Photo_assistant = photo_assistant;
	}
	public int getID_Assistant() {
		return ID_Assistant;
	}
	public void setID_Assistant(int iD_Assistant) {
		ID_Assistant = iD_Assistant;
	}
	public String getNom_assistant() {
		return Nom_assistant;
	}
	public void setNom_assistant(String nom_assistant) {
		Nom_assistant = nom_assistant;
	}
	public String getPrenom_assistant() {
		return Prenom_assistant;
	}
	public void setPrenom_assistant(String prenom_assistant) {
		Prenom_assistant = prenom_assistant;
	}
	public Date getDate_Naissance() {
		return Date_Naissance;
	}
	public void setDate_Naissance(Date date_Naissance) {
		Date_Naissance = date_Naissance;
	}
	public String getAdresse() {
		return Adresse;
	}
	public void setAdresse(String adresse) {
		Adresse = adresse;
	}
	public String getTelephone1() {
		return Telephone1;
	}
	public void setTelephone1(String telephone1) {
		Telephone1 = telephone1;
	}
	public String getTelephone2() {
		return Telephone2;
	}
	public void setTelephone2(String telephone2) {
		Telephone2 = telephone2;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public String getPhoto_assistant() {
		return Photo_assistant;
	}
	public void setPhoto_assistant(String photo_assistant) {
		Photo_assistant = photo_assistant;
	}
	
	
	
	
	
}
