package utils;

import java.util.List;

import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.Entity;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.GenericType;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import beans.*;

public class GestionClient {
	static String url = "http://localhost:8989/E-CommerceRestWs/";
	static Client client = ClientBuilder.newClient();
	static WebTarget target = client.target(url);
	
	public static Livre chercherLivreId(int id) {
		return target.path("gestion/chercherLivreId/" + id).request(MediaType.APPLICATION_JSON).get(Livre.class);
	}
	
	public static Livre chercherLivre(String nom) {
		return target.path("gestion/chercherLivre/" + nom).request(MediaType.APPLICATION_JSON).get(Livre.class);
	}
	
	public static List<Livre> chercherLivreCategorie(String categorie) {
		List<Livre> livre = client.target(url).path("gestion/chercherLivreCategorie/" + categorie).request(MediaType.APPLICATION_JSON).get(Response.class).readEntity(new GenericType<List<Livre>>() {});
		return livre;
	}
	
	public static List<Livre> chercherLivreNouveautes() {
		List<Livre> livre = client.target(url).path("gestion/chercherLivreNouveautes/").request(MediaType.APPLICATION_JSON).get(Response.class).readEntity(new GenericType<List<Livre>>() {});
		return livre;
	}
	
	public static void ajouterLivre(Livre livre) {
		target.path("gestion/ajouterLivre/").request().post(Entity.entity(livre, MediaType.APPLICATION_JSON));		
	}
	
	public static User authentifierUser(String email, String password) {
		return target.path("gestion/authentifierUser/" + email + "/" + password).request(MediaType.APPLICATION_JSON).get(User.class);
	}
	
	public static User chercherUser(String email) {
		return target.path("gestion/chercherUser/" + email).request(MediaType.APPLICATION_JSON).get(User.class);
	}
	
	public static void ajouterUser(User user) {
		target.path("gestion/ajouterUser/").request().post(Entity.entity(user, MediaType.APPLICATION_JSON));		
	}
	
	public static List<Panier> chercherPanier(int idd) {
		List<Panier> panier = client.target(url).path("gestion/chercherPanier/" + idd).request(MediaType.APPLICATION_JSON).get(Response.class).readEntity(new GenericType<List<Panier>>() {});
		return panier;
	}
	
	public static void ajouterPanier(Panier panier) {
		target.path("gestion/ajouterPanier/").request().post(Entity.entity(panier, MediaType.APPLICATION_JSON));		
	}

	public static void supprimerPanierIdd(int idd) {
		target.path("gestion/supprimerPanierIdd/" + idd).request().delete(/*Entity.entity(panier, MediaType.APPLICATION_JSON)*/);		
	}
}
