package classes;
import java.util.Date;

public class Stoma {

	private int 	ID_Stoma;
	private String 	Nom_stoma;
	private String 	Prenom_stoma;
	private Date 	Date_Naissance_stoma;
	private String 	Adresse;
	private String 	Telephone1;
	private String 	Telephone2;
	private String 	Email;
	private String  Photo_stoma	;
	
	


	public Stoma(int iD_Stoma, String nom_stoma, String prenom_stoma, Date date_Naissance_stoma, String adresse,
			String telephone1, String telephone2, String email, String photo_stoma) {
		super();
		ID_Stoma = iD_Stoma;
		Nom_stoma = nom_stoma;
		Prenom_stoma = prenom_stoma;
		Date_Naissance_stoma = date_Naissance_stoma;
		Adresse = adresse;
		Telephone1 = telephone1;
		Telephone2 = telephone2;
		Email = email;
		Photo_stoma = photo_stoma;
	}


	public Stoma() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public int getID_Stoma() {
		return ID_Stoma;
	}


	public void setID_Stoma(int iD_Stoma) {
		ID_Stoma = iD_Stoma;
	}


	public String getNom_stoma() {
		return Nom_stoma;
	}


	public void setNom_stoma(String nom_stoma) {
		Nom_stoma = nom_stoma;
	}


	public String getPrenom_stoma() {
		return Prenom_stoma;
	}


	public void setPrenom_stoma(String prenom_stoma) {
		Prenom_stoma = prenom_stoma;
	}


	public Date getDate_Naissance_stoma() {
		return Date_Naissance_stoma;
	}


	public void setDate_Naissance_stoma(Date date_Naissance_stoma) {
		Date_Naissance_stoma = date_Naissance_stoma;
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


	public String getPhoto_stoma() {
		return Photo_stoma;
	}


	public void setPhoto_stoma(String photo_stoma) {
		Photo_stoma = photo_stoma;
	}

	
	
}
