<!DOCTYPE html>
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
			GestioneProdottiDB gs = new GestioneProdottiDB();
			List<Prodotto> listaProdotti = (List<Prodotto>) new ArrayList<>(gs.creaMappa().values());
		%>

		<div class="w3-container" style="background-color: black;color: white; text-align: center;">
		  <h1 style="font-family: cursive;">Ortofrutta WebApp</h1>
		</div>
		
		<div class="w3-container" style="text-align: center;">
			<h2>Aggiungi un prodotto al carrello:</h2>
			<div style="text-decoration: underline; ">
			<p>Inserisci i dati richiesti.</p>
		</div>
		
		<form action="AggiungiCarello" method="Post">
			<label for="user">Username:<%=user%></label>
			<input type="hidden" name="user" id="user" value="<%=user%>"><br>		
			<label for="Data">Inserisci quantita da aggiungere:</label>
			<input style="margin-top:0.5%;" type="date" name="Data" id="Data"  ><br>		
			<label style="margin-top: 0.5%;" for="iD">iD-prodotto:</label>
			<select style="margin-top: 0.5%;" name = "iD">
			<% for (Prodotto p : listaProdotti){%>
			  <option value="<%=p.getiD()%>"><%=p.getiD()%>.<%=p.getNome().toUpperCase()%></option>
			  <% } %>
			</select><br>
			<label for="Quantita">Inserisci quantita da aggiungere:</label>
			<input style="margin-top:0.5%;" type="number" placeholder="1/1+" name="Quantita" id="Quantita" min="1"><br>					
			<input style="padding: 8px;margin-left:24%;margin-top:0.5%;" type="submit" value="===>" >
		</form> 

		<form action="MenuPrincipaleClienti.jsp">
		<input type="hidden" name="user" id="user" value="<%=user%>">
		<input style="margin-left:23%;margin-top:0.5%;padding: 8px;" type="submit" value="<===">
		</form>
	</div>
	<div style="text-align: center;margin-top: 2%;">
		<h2>Lista dei prodotti ortofrutticoli</h2>
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
<% } %>
</body>
</html>