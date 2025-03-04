package model;

public class model_produit{
	
	private int numProduit;
	private String design;
	private int prix;
	private int quantite;

	public model_produit() {
		
	}
	public model_produit(int numProduit,String design,int prix,	int quantite) {
		this.numProduit = numProduit;
		this.design = design;
		this.prix = prix;
		this.quantite = quantite;
	}
	public int getNumProduit() {
		return numProduit;
	}
	public void setNumProduit(int numProduit) {
		this.numProduit = numProduit;
	}
	public String getDesign() {
		return design;
	}
	public void setDesign(String design) {
		this.design = design;
	}
	public int getPrix() {
		return prix;
	}
	public void setPrix(int prix) {
		this.prix = prix;
	}
	public int getQuantite() {
		return quantite;
	}
	public void setQuantite(int quantite) {
		this.quantite = quantite;
	}

}
