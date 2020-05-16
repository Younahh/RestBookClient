package dbi;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.Livre;
import beans.Panier;
import beans.User;
import utils.GestionClient;

@WebServlet("/Recherche")
public class Recherche extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Recherche() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			int id = Integer.parseInt(request.getParameter("nom"));
			Livre livre = GestionClient.chercherLivreId(id);
			
			HttpSession ses=request.getSession();
			User user = (User)ses.getAttribute("user");
	    	
	    	if(user==null){
	    		request.getRequestDispatcher("/Authentification.jsp?id="+request.getParameter("nom")).forward(request, response);
	    	}else {
	    		Panier panier = new Panier();
	    		panier.setIdd(user.getId());
	    		panier.setNom(livre.getNom());
	    		panier.setAuteur(livre.getAuteur());
	    		panier.setPrix(livre.getPrix());
	    		panier.setImage(livre.getImage());
	    		GestionClient.ajouterPanier(panier);
			}		

		request.getRequestDispatcher("/Panier.jsp").forward(request, response);
	}

}
