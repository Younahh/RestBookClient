<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="beans.*" %>
<%@ page import="javax.servlet.http.HttpServletResponse"%>
<%@ page import="java.io.IOException"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="javax.servlet.ServletException"%>
<%@ page import="javax.servlet.annotation.WebServlet"%>
<%@ page import="javax.servlet.http.*"%>
<%@ page import="beans.*"%>
<%@ page import="utils.*"%>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/livre.css">
</head>
<body>
<div class="mr">
<table class="mr" style="width:100%">
    <tr>
       <th>
          <a href="Accueil.jsp">
             <img class="mr" src="img/images0.jpg" alt="Cinque Terre">
          </a>
       </th>
        <th class="mr">
          <div class="recherche_p">
             <form action="Recherche.jsp" id="searchthis" method="get">
             <input id="search" name="q" type="text" placeholder="Rechercher" />
             <input id="search-btn" type="submit" value="Rechercher" />
             </form>
          </div>
       </th>
       <th class="mr">
          <div class="recherche">
            <form action="/search" id="searchthi" method="get">
            <%
            	HttpSession ses=request.getSession();
            	User userInf = (User)ses.getAttribute("user");
            	if(userInf==null){
            		%>
            	
            <a style= "text-decoration: none" id="search-bt" type="submit" href="Authentification.jsp">Connexion</a>
            <a style= "text-decoration: none" id="search-bt" type="submit" href="Inscription.jsp">Inscription</a><br><br><br>
            		
            <%}else{%>
            	<a style= "text-decoration: none" id="search-bt" type="submit" href="Panier.jsp"><%=userInf.getNom() %></a>
            	<a style= "text-decoration: none" id="search-bt" type="submit" href="./Disconnect">Disconnect</a>
            <%}%>
            <a style= "text-decoration: none" id="search-bt" type="submit" href="Panier.jsp">Panier</a>
            </form>
          </div>
       </th>
    </tr>
</table>
</div>
<div class="mm">
<table class="mm" style="width:100%">
     <tr>
         <%if (userInf==null){ %>
         <th><a class="mm" href="Arabe.jsp">LIVRES AR</a></th>
         <th><a class="ml" href="Francais.jsp">LIVRES FR</a></th>
         <th><a class="ml" href="Anglais.jsp">LIVRES AN</a></th>
         <th><a class="ml" href="Pdf.jsp">LIVRES PDF</a></th>
         <th><a class="ml" href="Top.jsp">TOP</a></th>
         <th><a class="ml" href="Nouveautes.jsp">NOUVEAUTES</a></th>
         <%}else if (userInf.getId()==1){ %>
         <th><a class="mm" href="Arabe.jsp">LIVRES AR</a></th>
         <th><a class="ml" href="Francais.jsp">LIVRES FR</a></th>
         <th><a class="ml" href="Anglais.jsp">LIVRES AN</a></th>
         <th><a class="ml" href="Pdf.jsp">LIVRES PDF</a></th>
         <th><a class="ml" href="Top.jsp">TOP</a></th>
         <th><a class="ml" href="Nouveautes.jsp">NOUVEAUTES</a></th>
         <th><a class="ml" href="Ajoute_un_livre.jsp">ADD BOOK</a></th>
         <%}else{ %>
         <th><a class="mm" href="Arabe.jsp">LIVRES AR</a></th>
         <th><a class="ml" href="Francais.jsp">LIVRES FR</a></th>
         <th><a class="ml" href="Anglais.jsp">LIVRES AN</a></th>
         <th><a class="ml" href="Pdf.jsp">LIVRES PDF</a></th>
         <th><a class="ml" href="Top.jsp">TOP</a></th>
         <th><a class="ml" href="Nouveautes.jsp">NOUVEAUTES</a></th>
         <%} %>
     </tr>
</table>
</div>
<h5>Accueil > Livres AN</h5>
<h2>LIVRES ANGLAIS</h2>
<%
	String categorie = "anglais";
	List<Livre> livres = GestionClient.chercherLivreCategorie(categorie);
	request.getSession().setAttribute("livre", livres);
	for (int i=0; i < livres.size(); i++ ){%>
<div>
	<table class="li" width="80%">			
		<tr>
  			<td class="li"><img src="img/<%=livres.get(i).getImage() %>" /></td>
            <td class="li"><%=livres.get(i).getNom() %> <br> <%=livres.get(i).getAuteur() %></td>               
     		<td class="li">
     			<table>
     				<tr>
     					<td class="hh"><a href="./Panier?nom=<%=livres.get(i).getId() %>"><button id="registerNew" >Ajouter au Panier</button></a></td>
     				</tr>
     			</table>
     		</td>
			<%}%>	
 		</tr>
	</table>
</div>

<div class="mc">
	<h2> <center><div class="footercontent">Mon Site est le MEILLEUR <a href="#">privacy Notice</a> | <a href="#">Conditions of Use</a></div></center></h2>
</div>
</body>
</html>