<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="beans.*" %>
<%@ page import="utils.*"%>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/panier.css">
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
            <%	} %>
            <a style= "text-decoration: none" id="search-bt" type="submit" href="Accueil.jsp">Accueil</a>
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
<h2>Panier</h2>
<%try{
	int idd = userInf.getId();
	List<Panier> panier = GestionClient.chercherPanier(idd);
	request.getSession().setAttribute("panier", panier);
	for (int i=0; i < panier.size(); i++ ){
	%>
<div>
<table class="li" width="80%">	
	<tr><th>IMAGE</th><th>NOM</th><th>PRIX</th></tr>	
	<tr>
		<th class="li">
        	<img src="img/<%=panier.get(i).getImage() %>" /><br></th>    
        <th>          <%=panier.get(i).getNom() %> <br> <%=panier.get(i).getAuteur() %><br> </th>
        <th>          <%=panier.get(i).getPrix() %> </th>
<%}}catch(Exception e){
	response.sendRedirect("PanierVide.jsp");}%>
	</tr>
</table>
<table width="80%">
     <tr>
     	<th class="hh"><a href="./Effectue"><button id="registerNew" >Terminer achats</button></a></th>
     </tr>
</table>     
</div>
<div class="mc">
	<h2> <center><div class="footercontent">Mon Site est le MEILLEUR <a href="#">privacy Notice</a> | <a href="#">Conditions of Use</a></div></center></h2>
</div>
</body>
</html>