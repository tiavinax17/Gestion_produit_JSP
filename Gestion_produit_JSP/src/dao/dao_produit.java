package dao;
import java.util.List;
import model.model_produit;
public interface dao_produit {
	public List<model_produit> getListaffichage_produit();
	public void ajout_prod(model_produit p);
	public void modif_prod(model_produit p);
	public void suppr_prod(int numProduit);
}
