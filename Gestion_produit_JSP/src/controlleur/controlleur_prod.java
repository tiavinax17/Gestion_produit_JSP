package controlleur;

import model.model_produit;
import dao.dao_produit;
import dao.dao_impl_produit;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.annotation.WebServlet;


@WebServlet("/controlleur_prod")
public class controlleur_prod extends HttpServlet {
	private static final long serialVersionUID = 1L;
	dao_produit dao = new dao_impl_produit();
   
    public controlleur_prod() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<model_produit> liste_a_afficher = dao.getListaffichage_produit();
		request.setAttribute("liste_des_produits", liste_a_afficher);
		this.getServletContext().getRequestDispatcher("/WEB-INF/accueil.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String numProd_str = request.getParameter("btn_supp");
		    String design = request.getParameter("design");
		    String prix_str = request.getParameter("prix");
		    String quantite_str = request.getParameter("quantite");
		    String numProd_str_2 = request.getParameter("numProduit");
		    System.out.println("numProd_str: " + numProd_str_2);
            System.out.println("design: " + design);
            System.out.println("prix_str: " + prix_str);
            System.out.println("quantite_str: " + quantite_str);
		    // Suppression
		    if (numProd_str != null) {
		        int numProd = Integer.parseInt(numProd_str);
		        dao.suppr_prod(numProd);
		    }

		    // Ajout 
		    if (numProd_str_2 == null || numProd_str_2.isEmpty()) {
		        if (prix_str != null && !prix_str.isEmpty() && quantite_str != null && !quantite_str.isEmpty()) {
		            try {
		                int prix = Integer.parseInt(prix_str);
		                int quantite = Integer.parseInt(quantite_str);
		                model_produit prod = new model_produit();
		                prod.setDesign(design);
		                prod.setPrix(prix);
		                prod.setQuantite(quantite);
		                System.out.println("numProd_str: " + numProd_str);
		                System.out.println("design: " + design);
		                System.out.println("prix_str: " + prix_str);
		                System.out.println("quantite_str: " + quantite_str);

		                dao.ajout_prod(prod);
		            } catch (NumberFormatException e) {
		                
		                request.setAttribute("error", "Prix ou quantité invalides");
		            }
		        } else {
		            
		            request.setAttribute("error", "Les champs Prix et Quantité sont obligatoires.");
		        }
		    } else { //Modif
		        try {
		            int numProd = Integer.parseInt(numProd_str_2);
		            if (prix_str != null && !prix_str.isEmpty() && quantite_str != null && !quantite_str.isEmpty()) {
		                int prix = Integer.parseInt(prix_str);
		                int quantite = Integer.parseInt(quantite_str);
		                model_produit prod = new model_produit();
		                prod.setDesign(design);
		                prod.setPrix(prix);
		                prod.setQuantite(quantite);
		                prod.setNumProduit(numProd);
		                System.out.println("numProd_str: " + numProd_str_2);
		                System.out.println("design: " + prod.getDesign());
		                System.out.println("prix_str: " + prix_str);
		                System.out.println("quantite_str: " + quantite_str);

		                dao.modif_prod(prod);
		            } else {
		                
		                request.setAttribute("error", "Les champs Prix et Quantité sont obligatoires.");
		            }
		        } catch (NumberFormatException e) {
		           
		            request.setAttribute("error", "Numéro du produit invalide.");
		        }
		    }

		
		    List<model_produit> liste_a_afficher = dao.getListaffichage_produit();
		    request.setAttribute("liste_des_produits", liste_a_afficher);
		    this.getServletContext().getRequestDispatcher("/WEB-INF/accueil.jsp").forward(request, response);
	}

}
