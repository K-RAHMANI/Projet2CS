package classes;

import java.util.Date;
public class FileAttente {
	private int idFile;
	private String nomPatientAttente;
	private String prenomPatientAttente;
	
	
	public FileAttente() {
		super();
		// TODO Auto-generated constructor stub
	}


	public FileAttente(int iiD_File, String nomPatientAttente, String prenomPatientAttente) {
		super();
		this.idFile = iiD_File;
		this.nomPatientAttente = nomPatientAttente;
		this.prenomPatientAttente = prenomPatientAttente;
	}


	public int getIdFile() {
		return idFile;
	}


	public void setIdFile(int idFile) {
		this.idFile = idFile;
	}


	public String getNomPatientAttente() {
		return nomPatientAttente;
	}


	public void setNomPatientAttente(String nomPatientAttente) {
		this.nomPatientAttente = nomPatientAttente;
	}


	public String getPrenomPatientAttente() {
		return prenomPatientAttente;
	}


	public void setPrenomPatientAttente(String prenomPatientAttente) {
		this.prenomPatientAttente = prenomPatientAttente;
	}



}
