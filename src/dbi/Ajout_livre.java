package dbi;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.Livre;
import beans.User;
import utils.GestionClient;

@WebServlet("/Ajout_livre")
public class Ajout_livre extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Ajout_livre() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			Livre livre = new Livre();
			livre.setCategorie(request.getParameter("categorie"));
			livre.setNom(request.getParameter("nom"));
			livre.setAuteur(request.getParameter("auteur"));
			livre.setDescription(request.getParameter("description"));
			livre.setPrix(Integer.parseInt(request.getParameter("prix")));
			livre.setImage(request.getParameter("image"));
			livre.setNbr(Integer.parseInt(request.getParameter("nbr")));
		
			HttpSession ses=request.getSession();
			User user = (User)ses.getAttribute("user");
    	
			GestionClient.ajouterLivre(livre);
			request.getRequestDispatcher("/Accueil.jsp").forward(request, response);
					
	}

}
