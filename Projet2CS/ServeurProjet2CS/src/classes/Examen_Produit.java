package classes;

public class Examen_Produit {

	private int 	ID_Examen_Produit ;
	private int 	Produit ;
	private int 	Examen ;
	public Examen_Produit() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Examen_Produit(int iD_Examen_Produit, int produit, int examen) {
		super();
		ID_Examen_Produit = iD_Examen_Produit;
		Produit = produit;
		Examen = examen;
	}
	public int getID_Examen_Produit() {
		return ID_Examen_Produit;
	}
	public void setID_Examen_Produit(int iD_Examen_Produit) {
		ID_Examen_Produit = iD_Examen_Produit;
	}
	public int getProduit() {
		return Produit;
	}
	public void setProduit(int produit) {
		Produit = produit;
	}
	public int getExamen() {
		return Examen;
	}
	public void setExamen(int examen) {
		Examen = examen;
	}

	
}
