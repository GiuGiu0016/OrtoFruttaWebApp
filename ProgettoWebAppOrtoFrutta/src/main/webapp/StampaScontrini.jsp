<!DOCTYPE html>
<%@page import="it.dstech.models.Scontrino"%>
<%@page import="it.dstech.database.GestioneScontriniCarrelli"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="it.dstech.database.GestioneProdottiDB"%>
<%@page import="it.dstech.models.Prodotto"%>
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
		<form action="MenuPrincipaleClienti.jsp" style="text-align: right;">
		<input type="hidden" name="user" id="user" value="<%=user%>">
		<input style="margin-left:23%;margin-top:0.5%;padding: 8px;" type="submit" value="<===">
	</div>
	<%
		} else {
	%>
<!-- Page Content -->
<div >


<div class="w3-container" style="background-color: black;color: white;">
  <h1 style="font-family: cursive;">Ortofrutta WebApp</h1>
</div>

<div class="w3-container">
	<h2>Benvenuti nel mio WebStore Online</h2>
	<div style="text-decoration: underline; ">
		<p>Salve a tutti vi mostro il mio sito di Frutta e Verdura virtuale, Spero possa piacervi.</p>
		<p>Ci scusiamo per l'assenza ma con questo CoronaVirus le verdure vanno a rubaaa!!</p>
		<p>Speriamo di esservi il più possibile d'aiuto.</p>
		<p>A destra troverete un Menu con le possibili scelte...</p>
		<p>Un grosso e caloroso abraccio dallo Staff a tutti voi momelli !!</p>
	</div>
		
	<div>
		<h2>Lista Scontrini</h2>
	
	    <%
			GestioneScontriniCarrelli gestioneScontriniCarrelli = new GestioneScontriniCarrelli();
		%>
		<%
			List<Scontrino> listaScontrini = (List<Scontrino>) new ArrayList<>(gestioneScontriniCarrelli.mappaScontrini().values());
		%>
	
		<table>
			<tr>
				<th>iD-Scontrino</th>
				<th>Data</th>
				<th>Costo</th>
				<th>User</th>
			</tr>
			<%
				for (Scontrino s : listaScontrini) {
					if(s.getUser().equals(user)){
			%>
			<tr>
				<td><%=s.getId()%></td>
				<td><%=s.getData()%></td>
				<td><%=s.getSommaPrezzo()%>&#x20ac</td>
				<td><%=s.getUser()%></td>
			</tr>
			<%
					}
				}
			%>
		</table>
	</div>
	</div>
</div>
	<form action="MenuPrincipaleClienti.jsp" style="text-align: right;">
		<input type="hidden" name="user" id="user" value="<%=user%>">
		<input style="margin-left:23%;margin-top:0.5%;padding: 8px;" type="submit" value="<===">
</div>
<% } %>
</body>
</html>