package classes;

import java.util.Date;

public class Patient {
	private int id;
	private String nom;
	private String prenom;
	private String dateNai;
	private String adr;
	private String commune;
	private String wilaya;
	private String tel1;
	private String tel2;
	private String mail;
	private String nomProche;
	private String prenomProche;
	private String mailProche;
	private String tel1Proche;
	private String tel2Proche;
	private String relationPatient;
	private String hopital;
	private String nss;
	private String caisse;
	
	public Patient() {
		super();
	}
	public Patient(String nom, String prenom, String dateNai, String adr, String commune, String wilaya, String tel1,
			String tel2, String mail, String nomProche, String prenomProche, String mailProche, String tel1Proche,
			String tel2Proche, String relationPatient, String hopital) {
		super();
		this.nom = nom;
		this.prenom = prenom;
		this.dateNai = dateNai;
		this.adr = adr;
		this.commune = commune;
		this.wilaya = wilaya;
		this.tel1 = tel1;
		this.tel2 = tel2;
		this.mail = mail;
		this.nomProche = nomProche;
		this.prenomProche = prenomProche;
		this.mailProche = mailProche;
		this.tel1Proche = tel1Proche;
		this.tel2Proche = tel2Proche;
		this.relationPatient = relationPatient;
		this.hopital = hopital;
	}



	public Patient(int id, String nom, String prenom, String dateNai, String adr, String commune, String wilaya,
			String tel1, String tel2, String mail, String nomProche, String prenomProche, String mailProche,
			String tel1Proche, String tel2Proche, String relationPatient, String hopital) {
		super();
		this.id = id;
		this.nom = nom;
		this.prenom = prenom;
		this.dateNai = dateNai;
		this.adr = adr;
		this.commune = commune;
		this.wilaya = wilaya;
		this.tel1 = tel1;
		this.tel2 = tel2;
		this.mail = mail;
		this.nomProche = nomProche;
		this.prenomProche = prenomProche;
		this.mailProche = mailProche;
		this.tel1Proche = tel1Proche;
		this.tel2Proche = tel2Proche;
		this.relationPatient = relationPatient;
		this.hopital = hopital;
	}
	
	public Patient(String nom, String prenom, String dateNai, String adr, String commune, String wilaya,
			String tel1, String tel2, String mail, String nomProche, String prenomProche, String mailProche,
			String tel1Proche, String tel2Proche, String relationPatient, String hopital, String nss, String caisse) {
		super();
		///this.id = id;
		this.nom = nom;
		this.prenom = prenom;
		this.dateNai = dateNai;
		this.adr = adr;
		this.commune = commune;
		this.wilaya = wilaya;
		this.tel1 = tel1;
		this.tel2 = tel2;
		this.mail = mail;
		this.nomProche = nomProche;
		this.prenomProche = prenomProche;
		this.mailProche = mailProche;
		this.tel1Proche = tel1Proche;
		this.tel2Proche = tel2Proche;
		this.relationPatient = relationPatient;
		this.hopital = hopital;
		this.nss = nss;
		this.caisse = caisse;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
	public String getAdr() {
		return adr;
	}
	public void setAdr(String adr) {
		this.adr = adr;
	}
	public String getCommune() {
		return commune;
	}
	public void setCommune(String commune) {
		this.commune = commune;
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
	public String getTel2() {
		return tel2;
	}
	public void setTel2(String tel2) {
		this.tel2 = tel2;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public String getNomProche() {
		return nomProche;
	}
	public void setNomProche(String nomProche) {
		this.nomProche = nomProche;
	}
	public String getPrenomProche() {
		return prenomProche;
	}
	public void setPrenomProche(String prenomProche) {
		this.prenomProche = prenomProche;
	}
	public String getMailProche() {
		return mailProche;
	}
	public void setMailProche(String mailProche) {
		this.mailProche = mailProche;
	}
	public String getTel1Proche() {
		return tel1Proche;
	}
	public void setTel1Proche(String tel1Proche) {
		this.tel1Proche = tel1Proche;
	}
	public String getTel2Proche() {
		return tel2Proche;
	}
	public void setTel2Proche(String tel2Proche) {
		this.tel2Proche = tel2Proche;
	}
	public String getRelationPatient() {
		return relationPatient;
	}
	public void setRelationPatient(String relationPatient) {
		this.relationPatient = relationPatient;
	}
	public String getHopital() {
		return hopital;
	}
	public void setHopital(String hopital) {
		this.hopital = hopital;
	}

	public String getNss() {
		return nss;
	}

	public void setNss(String nss) {
		this.nss = nss;
	}

	public String getCaisse() {
		return caisse;
	}

	public void setCaisse(String caisse) {
		this.caisse = caisse;
	}	
	
}
