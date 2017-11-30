package classes;
import java.util.Date;

public class Produit {
	private int    idProduit;
	private String codeProduit;
	private String   design;
	
	
	public Produit() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Produit(int idProduit, String codeProduit, String design) {
		super();
		this.idProduit = idProduit;
		this.codeProduit = codeProduit;
		this.design = design;
	}




	public int getIdProduit() {
		return idProduit;
	}


	public void setIdProduit(int idProduit) {
		this.idProduit = idProduit;
	}


	public String getCodeProduit() {
		return codeProduit;
	}


	public void setCodeProduit(String codeProduit) {
		this.codeProduit = codeProduit;
	}


	public String getDesign() {
		return design;
	}


	public void setDesign(String design) {
		this.design = design;
	}
	
}
