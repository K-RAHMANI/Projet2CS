package classes;
import java.util.Date;

public class Document {
	private int idDoc;
	private int idPatient;
	private String 	type_doc;
	private String 	date_depote;
	private String 	url;
	private String 	nom_doc;
	
	public Document() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Document(int idDoc, int idPatient, String type_doc, String date_depote, String url) {
		super();
		this.idDoc = idDoc;
		this.idPatient = idPatient;
		this.type_doc = type_doc;
		this.date_depote = date_depote;
		this.url = url;
	}
	
	

	public String getNom_doc() {
		return nom_doc;
	}

	public void setNom_doc(String nom_doc) {
		this.nom_doc = nom_doc;
	}

	public int getIdDoc() {
		return idDoc;
	}

	public void setIdDoc(int idDoc) {
		this.idDoc = idDoc;
	}

	public int getIdPatient() {
		return idPatient;
	}

	public void setIdPatient(int idPatient) {
		this.idPatient = idPatient;
	}

	public String getType_doc() {
		return type_doc;
	}

	public void setType_doc(String type_doc) {
		this.type_doc = type_doc;
	}

	public String getDate_depote() {
		return date_depote;
	}

	public void setDate_depote(String date_depote) {
		this.date_depote = date_depote;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}
	
	
	
}
