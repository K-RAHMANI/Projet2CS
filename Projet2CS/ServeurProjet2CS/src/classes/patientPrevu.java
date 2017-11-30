package classes;

public class patientPrevu {

	private int idPatientPrevu;
	private String nom;
	private String prenom;
	private String dateNai;
	
	private String wilaya;
	private String tel1;

	private String hopital;
	
	public patientPrevu() {
		super();
	}

	public patientPrevu( String nom, String prenom, String dateNai, String wilaya, String tel1,
			String hopital) {
		super();
		//this.idPatientPrevu = idPatientPrevu;
		this.nom = nom;
		this.prenom = prenom;
		this.dateNai = dateNai;
		this.wilaya = wilaya;
		this.tel1 = tel1;
		this.hopital = hopital;
	}

	public int getIdPatientPrevu() {
		return idPatientPrevu;
	}

	public void setIdPatientPrevu(int idPatientPrevu) {
		this.idPatientPrevu = idPatientPrevu;
	}

	public String getNom() {
		return nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public String getPrenom() {
		return prenom;
	}

	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}

	public String getDateNai() {
		return dateNai;
	}

	public void setDateNai(String dateNai) {
		this.dateNai = dateNai;
	}

	public String getWilaya() {
		return wilaya;
	}

	public void setWilaya(String wilaya) {
		this.wilaya = wilaya;
	}

	public String getTel1() {
		return tel1;
	}

	public void setTel1(String tel1) {
		this.tel1 = tel1;
	}

	public String getHopital() {
		return hopital;
	}

	public void setHopital(String hopital) {
		this.hopital = hopital;
	}
	
	
}
