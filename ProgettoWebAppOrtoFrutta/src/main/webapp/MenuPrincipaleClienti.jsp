<!DOCTYPE html>
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
		String messaggio = (String) request.getAttribute("messaggio");
		if (messaggio != null) {
	%>
	<div style="text-align: center; background-color: black;padding: 3%;margin-top: 15%;">
	<h1 style="color: red;">ERRORE</h1>
	<h2 style="color: red;"><%=messaggio%></h2>
	<h2 style="color: red;"></h2>
	<form action="MenuPrincipaleClienti.jsp">
	<input style="background-color: red;color: black;padding: 1%;font-size: 30px" type="submit" value="Vai al menu Principale">
	</form>
	</div>
	<%
		} else {
	%>
<!-- Sidebar -->
<div class="w3-sidebar w3-light-gray w3-bar-block" style="width:15%;">
	<h3 class="w3-bar-item">Menu</h3>
	<a href="RegistraUtente.jsp" class="w3-bar-item w3-button">Aggiungi prodotto al carrello</a>
	<a href="Login.jsp" class="w3-bar-item w3-button">Rimuovi prodotto dal carrello</a>
	<a href="Info.jsp" class="w3-bar-item w3-button">Stampa carrello</a>
	<a href="Info.jsp" class="w3-bar-item w3-button">Stampa scontrini</a>
	<a href="MenuPrincipale.jsp" class="w3-bar-item w3-button">Esci</a>
	<div style="text-align: center;margin-top:150%;">
		<img src="https://i.ibb.co/72fjqFm/Logo-Sample-By-Tailor-Brandspng.png">
	</div>
</div>
 
<!-- Page Content -->
<div >

<div class="w3-container" style="background-color: black;color: white;margin-left: 15%;">
  <h1 style="font-family: cursive;">Ortofrutta WebApp</h1>
</div>

<div class="w3-container" style="margin-left: 15%;">
	<h2>Benvenuti nel mio WebStore Online</h2>
	<div style="text-decoration: underline; ">
		<p>Salve a tutti vi mostro il mio sito di Frutta e Verdura virtuale, Spero possa piacervi.</p>
		<p>Ci scusiamo per l'assenza ma con questo CoronaVirus le verdure vanno a rubaaa!!</p>
		<p>Speriamo di esservi il più possibile d'aiuto.</p>
		<p>A destra troverete un Menu con le possibili scelte...</p>
		<p>Un grosso e caloroso abraccio dallo Staff a tutti voi momelli !!</p>
	</div>
		<div>
		<h2>Lista dei prodotti ortofrutticoli</h2>
	
	    <%
			GestioneProdottiDB gs = new GestioneProdottiDB();
		%>
		<%
			List<Prodotto> listaProdotti = (List<Prodotto>) new ArrayList<>(gs.creaMappa().values());
		%>
	
		<table>
			<tr>
				<th>iD-Prodotto</th>
				<th>Nome</th>
				<th>Quantit&#224</th>
				<th>Prezzo</th>
				<th>Informazioni</th>
			</tr>
			<%
				for (Prodotto p : listaProdotti) {
			%>
			<tr>
				<td><%=p.getiD()%></td>
				<td><%=p.getNome().toUpperCase()%></td>
				<td><%=p.getQuantita()%>pz</td>
				<td><%=p.getPrezzo()%>&#x20ac</td>
				<td><%=p.getDescrizione().toLowerCase()%></td>
			</tr>
			<%
				}
			%>
		</table>
	</div>
	</div>
</div>

</div>
<% } %>
</body>
</html>