package classes;
import java.util.Date;



public class Examen {
	private int ID_Examen;
	private int Medecin;
	private int Patient;
	private String Date_Examen;
	private String heure_Examen;
	private String 	Type_Examen;
	private float 	poids;
	private float 	taille;
	private float 	tensionMin;
	private float 	tensionMAx;
	private String observations;
	private String quest1;private String quest2;private String quest3;
	private String quest4;private String quest5;private String quest6;
	private String quest7;
	
	private float 	Pointure;
	
	
	public Examen() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Examen( int medecin, int patient,String type_Examen, float poids, float taille, float tensionMin, float tensionMAx, float pointure) {
		super();
		Medecin = medecin;
		Patient = patient;
		Type_Examen = type_Examen;
		this.poids = poids;
		this.taille = taille;
		this.tensionMin = tensionMin;
		this.tensionMAx = tensionMAx;
		Pointure = pointure;
	}
	
	public Examen( int medecin, int patient, String date_Examen, String type_Examen, float poids,
			float taille, float tensionMin, float tensionMAx, float pointure) {
		super();
		//ID_Examen = iD_Examen;
		Medecin = medecin;
		Patient = patient;
		Date_Examen = date_Examen;
		Type_Examen = type_Examen;
		this.poids = poids;
		this.taille = taille;
		this.tensionMin = tensionMin;
		this.tensionMAx = tensionMAx;
		Pointure = pointure;
	}
	
	

	public String getQuest1() {
		return quest1;
	}



	public void setQuest1(String quest1) {
		this.quest1 = quest1;
	}



	public String getQuest2() {
		return quest2;
	}



	public void setQuest2(String quest2) {
		this.quest2 = quest2;
	}



	public String getQuest3() {
		return quest3;
	}



	public void setQuest3(String quest3) {
		this.quest3 = quest3;
	}



	public String getQuest4() {
		return quest4;
	}



	public void setQuest4(String quest4) {
		this.quest4 = quest4;
	}



	public String getQuest5() {
		return quest5;
	}



	public void setQuest5(String quest5) {
		this.quest5 = quest5;
	}



	public String getQuest6() {
		return quest6;
	}



	public void setQuest6(String quest6) {
		this.quest6 = quest6;
	}



	public String getQuest7() {
		return quest7;
	}



	public void setQuest7(String quest7) {
		this.quest7 = quest7;
	}



	public String getObservations() {
		return observations;
	}



	public void setObservations(String observations) {
		this.observations = observations;
	}



	public String getHeure_Examen() {
		return heure_Examen;
	}



	public void setHeure_Examen(String heure_Examen) {
		this.heure_Examen = heure_Examen;
	}



	public int getID_Examen() {
		return ID_Examen;
	}

	public void setID_Examen(int iD_Examen) {
		ID_Examen = iD_Examen;
	}

	public int getMedecin() {
		return Medecin;
	}

	public void setMedecin(int medecin) {
		Medecin = medecin;
	}

	public int getPatient() {
		return Patient;
	}

	public void setPatient(int patient) {
		Patient = patient;
	}

	public String getDate_Examen() {
		return Date_Examen;
	}

	public void setDate_Examen(String date_Examen) {
		Date_Examen = date_Examen;
	}

	public String getType_Examen() {
		return Type_Examen;
	}

	public void setType_Examen(String type_Examen) {
		Type_Examen = type_Examen;
	}

	public float getPoids() {
		return poids;
	}

	public void setPoids(float ppoids) {
		poids = ppoids;
	}

	public float getTaille() {
		return taille;
	}

	public void setTaille(float ttaille) {
		taille = ttaille;
	}

	public float getPointure() {
		return Pointure;
	}

	public void setPointure(float pointure) {
		Pointure = pointure;
	}



	public float getTensionMin() {
		return tensionMin;
	}



	public void setTensionMin(float tensionMin) {
		this.tensionMin = tensionMin;
	}



	public float getTensionMAx() {
		return tensionMAx;
	}



	public void setTensionMAx(float tensionMAx) {
		this.tensionMAx = tensionMAx;
	}

	
	
}
