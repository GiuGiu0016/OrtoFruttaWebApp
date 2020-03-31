<!DOCTYPE html>
<%@page import="it.dstech.models.Carrello"%>
<%@page import="it.dstech.database.GestioneScontriniCarrelli"%>
<%@page import="it.dstech.models.Scontrino"%>
<%@page import="it.dstech.models.Prodotto"%>
<%@page import="it.dstech.database.GestioneProdottiDB"%>
<%@page import="it.dstech.database.ConnessioneDataBase"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="it.dstech.models.Utente"%>
<%@page import="java.util.HashMap"%>
<%@page import="it.dstech.database.AccessoDataBaseGestioneUtenti"%>
<html>
<title>OrtoFrutta</title>
<style>
table {
  border-collapse: collapse;
  width: 100%;
}

th, td {
  text-align: left;
  padding: 8px;
}

tr:nth-child(even){background-color: #f2f2f2}

th {
  background-color: #ffbf00;
  color: white;
}
</style>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<body class="OrtoFruttaPage" >
<!-- in caso di accesso manuale ad altre pagine -->
	<%
		String user = request.getParameter("user");
		String messaggio = (String) request.getAttribute("messaggio");
		if (messaggio != null) {
	%>
	<div style="text-align: center; background-color: black;padding: 3%;margin-top: 15%;">
	<h1 style="color: red;">ERRORE</h1>
	<h2 style="color: red;"><%=messaggio%></h2>
	<h2 style="color: red;"></h2>
			<form action="MenuPrincipaleClienti.jsp" style="text-align:center;">
		<input type="hidden" name="user" id="user" value="<%=user%>">
		<input style="margin-left:23%;margin-top:0.5%;padding: 8px;" type="submit" value="<===">
	</div>
	<%
		} else {
	%>
<!-- Page Content -->
<div >
    	<%
    		long id = Long.parseLong(request.getParameter("iD"));
			GestioneScontriniCarrelli gestioneScontriniCarrelli = new GestioneScontriniCarrelli();
			List<Carrello> listaCarrello = gestioneScontriniCarrelli.Carrello(id);
		%>


	<div class="w3-container" style="background-color: black;color: white; text-align: center;">
	  <h1 style="font-family: cursive;">Ortofrutta WebApp</h1>
	</div>
		
	<div style="text-align: center;margin-top: 2%;">
		<label  for="user">Username: "<%=user%>";</label>
		<h2>Lista prodotti, iD-Scontrino:"<%=id%>";</h2>
	
	
		<table>
			<tr>
				<th>Nome Prodotto</th>
				<th>Quantita Acquistata</th>
				<th>Prezzo Articolo * Quantita</th>
			</tr>
			<%
				for (Carrello c : listaCarrello) {
			%>
			<tr>
				<td><%=c.getNome()%></td>
				<td><%=c.getQuantita()%></td>
				<td><%=c.getPrezzo()%></td>
			</tr>
			<%
				}
			%>
		</table>
		<form action="StampaCarrello.jsp" method="Post">
			<input type="hidden" name="user" id="user" value="<%=user%>">							
		<input style=" padding: 8px;margin-top: 0.5%;margin-left: 80%; " type="submit" value="<===">
		</form>
	</div>
	
</div>
<% } %>
</body>
</html>