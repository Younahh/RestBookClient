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

@WebServlet("/Connexion")
public class Connexion extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Connexion() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

			String Nom = request.getParameter("id");
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			User users = GestionClient.authentifierUser(email, password);
			if (users != null) {
			if (Nom.equals("null")) {
				
				HttpSession ses=request.getSession();				 
				ses.setAttribute("user", users);
				
				request.getRequestDispatcher("/Accueil.jsp").forward(request, response);
			}else {
				
				HttpSession ses=request.getSession();
				ses.setAttribute("user", users);

				try {
					User user = (User)ses.getAttribute("user");
				    int id = Integer.parseInt(Nom);
				    Livre livre = GestionClient.chercherLivreId(id);
				    Panier panier = new Panier();
				    panier.setIdd(user.getId());
				    panier.setNom(livre.getNom());
				    panier.setAuteur(livre.getAuteur());
				    panier.setPrix(livre.getPrix());
				    panier.setImage(livre.getImage());
				    GestionClient.ajouterPanier(panier);
				}catch (Exception e) {}				
					request.getRequestDispatcher("/Accueil.jsp").forward(request, response);					
				}}else{
					request.getRequestDispatcher("/Authentification_pr.jsp").forward(request, response);
				}
		
	}
}
