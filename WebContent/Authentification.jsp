<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="beans.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/auth.css">
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
            <a id="search-bt" type="submit" href="Inscription.jsp">Inscription</a><br><br><br>	
            	<%}else{%>
            		<a id="search-bt" type="submit" href="Panier.jsp"><%=userInf.getNom() %></a>
            		<a id="search-bt" type="submit" href="./Disconnect">Disconnect</a>
            <%	} %>
            <a id="search-bt" type="submit" href="Panier.jsp">Panier</a>
            </form>
          </div>
       </th>
    </tr>
</table>
</div>
<div id="registration">
  <h2>SIGN IN</h2> 
  <% String Nom = request.getParameter("id");%>
  <form id="RegisterUserForm" action="./Connexion" method="get">
     <table>
       <tr><td><label for="email">Email :</label> </td><td> <input class="text" id="email" type="email" name="email" /></td><td><br><br>
       <tr><td><label for="password">Password :</label> </td><td> <input class="text" id="password" type="password" name="password" /></td><td><br><br>
       <input class="text" name="id" value="<%=request.getParameter("id")%>" style="display: none" />
     </table>
   <table>
     <tr>
     <td class="hh"><button id="registerNew" type="submit">Sign In</button></td>
     </tr>
   </table>
  </form>
</div>
<div class="mc">
<h2> <center><div class="footercontent">Mon Site est le MEILLEUR <a href="#">privacy Notice</a> | <a href="#">Conditions of Use</a></div></center></h2>
</div>
</body>
</html>

  			
  			
