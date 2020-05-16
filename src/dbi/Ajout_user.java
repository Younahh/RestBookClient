package dbi;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.User;
import utils.GestionClient;

@WebServlet("/Ajout_user")
public class Ajout_user extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Ajout_user() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			User users = new User();
			users.setNom(request.getParameter("nom"));
			users.setPrenom(request.getParameter("prenom"));
			users.setPhone(Integer.parseInt(request.getParameter("telephone")));
			users.setEmail(request.getParameter("email"));
			users.setPassword(request.getParameter("password"));
			
			HttpSession ses=request.getSession();
			User user = (User)ses.getAttribute("user");
			
			GestionClient.ajouterUser(users);
			request.getRequestDispatcher("/Authentification.jsp").forward(request, response);
			
	}

}
