package classes;
import java.util.Date;

public class Medecin {
	
	private int 	ID_Medecin;
	private String 	Nom_medecin;
	private String 	Prenom_medecin;
	private Date 	Date_Naissance_medecin;
	private String 	Adresse;
	private String 	Telephone1;
	private String 	Telephone2;
	private String 	Email;
	private String  Photo_medecin	;
	public Medecin() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Medecin(int iD_Medecin, String nom_medecin, String prenom_medecin, Date date_Naissance_medecin,
			String adresse, String telephone1, String telephone2, String email, String photo_medecin) {
		super();
		ID_Medecin = iD_Medecin;
		Nom_medecin = nom_medecin;
		Prenom_medecin = prenom_medecin;
		Date_Naissance_medecin = date_Naissance_medecin;
		Adresse = adresse;
		Telephone1 = telephone1;
		Telephone2 = telephone2;
		Email = email;
		Photo_medecin = photo_medecin;
	}
	public int getID_Medecin() {
		return ID_Medecin;
	}
	public void setID_Medecin(int iD_Medecin) {
		ID_Medecin = iD_Medecin;
	}
	public String getNom_medecin() {
		return Nom_medecin;
	}
	public void setNom_medecin(String nom_medecin) {
		Nom_medecin = nom_medecin;
	}
	public String getPrenom_medecin() {
		return Prenom_medecin;
	}
	public void setPrenom_medecin(String prenom_medecin) {
		Prenom_medecin = prenom_medecin;
	}
	public Date getDate_Naissance_medecin() {
		return Date_Naissance_medecin;
	}
	public void setDate_Naissance_medecin(Date date_Naissance_medecin) {
		Date_Naissance_medecin = date_Naissance_medecin;
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
	public String getPhoto_medecin() {
		return Photo_medecin;
	}
	public void setPhoto_medecin(String photo_medecin) {
		Photo_medecin = photo_medecin;
	}
	
	
	
	
}
