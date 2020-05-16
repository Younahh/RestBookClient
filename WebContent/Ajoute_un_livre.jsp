<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="beans.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/ajoutlivre.css">
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
            	
            <a id="search-bt" type="submit" href="Authentification.jsp">Connexion</a>
            <a id="search-bt" type="submit" href="Inscription.jsp">Inscription</a><br><br><br>
            		
            	<%
            	
            	}
            	else{
            		%>
            		<a id="search-bt" type="submit" href="Panier.jsp"><%=userInf.getNom() %></a>
            		<a id="search-bt" type="submit" href="./Disconnect">Disconnect</a>
            <%	}
            %>
            <a id="search-bt" type="submit" href="Panier.jsp">Panier</a>
            </form>
          </div>
       </th>
    </tr>
</table>
</div>
<div id="registration">
  <h2>Ajouter un Livre</h2> 
  <form id="RegisterUserForm" action="./Ajout_livre" method="get">
     <table >
       <tr><td><label for="cat">Categorie :</label> </td><td><input type="radio" name="categorie" value="arabe" checked> Arabe
                                                            <input type="radio" name="categorie" value="francais"> Francais
                                                            <input type="radio" name="categorie" value="anglais"> Anglais
                                                            <input type="radio" name="categorie" value="PDF"> PDF </td></tr>                                                      
       <tr><td><label for="name">Nom :</label> </td><td> <input class="text" id="name" type="text" name="nom" /></td></tr>
       <tr><td><label for="namea">Auteur :</label> </td><td> <input class="text" id="namea" type="text" name="auteur" /></td></tr>
       <tr><td><label for="des">Description :</label> </td><td> <input class="text" id="des" type="text" name="description" /></td><td><br><br>
       <tr><td><label for="dh">Prix :</label> </td><td> <input class="text" id="dh" type="text" name="prix" /></td><td><br><br>
       <tr><td><label for="che">Image :</label> </td><td> <input class="text" id="che" type="text" name="image" /></td><td><br><br>
        <tr><td><label for="nb">Nbr :</label> </td><td> <input class="text" id="nb" type="text" name="nbr" value="0"/></td><td><br><br>
     </table>
     <table>
       <tr>
          <td class="nn"><button id="registerNew" type="submit">Enregistrer</button></td>
       </tr>
     </table>
  </form>
</div>
<div class="mc">
<h2>footer</h2>
</div>
</body>
</html>