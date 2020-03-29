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
		String messaggio = (String) request.getAttribute("messaggio");
		if (messaggio != null) {
	%>
	<div style="text-align: center; background-color: black;padding: 3%;margin-top: 15%;">
	<h1 style="color: red;">ERRORE</h1>
	<h2 style="color: red;"><%=messaggio%></h2>
	<h2 style="color: red;"></h2>
	<form action="MenuDipendente.jsp">
	<input style="background-color: red;color: black;padding: 1%;font-size: 30px" type="submit" value="Vai al menu Principale">
	</form>
	</div>
	<%
		} else {
	%>
<!-- Page Content -->
<div >

	<div class="w3-container" style="background-color: black;color: white; text-align: center;">
	  <h1 style="font-family: cursive;">Ortofrutta WebApp</h1>
	</div>
	
	<div class="w3-container" style="text-align: center;">
		<h2>Aggiungi un prodotto:</h2>
		<div style="text-decoration: underline; ">
			<p>Inserisci i dati richiesti per aggiungere un prodotto.</p>
		</div>
		<form action="addP" method="Post">
		
<label for="iD">Inserisci iD-prodotto:</label>
<input style="margin-top:0.5%;" type="number" placeholder="0000" name="iD" id="iD" min="1"><br>
<label for="Nome">Inserisci Nome:</label>					
<input style="margin-top:0.5%;" type="text" placeholder="Banane" name="Nome" id="Nome"><br>
<label for="Prezzo">Inserisci prezzo:</label>	
<input style="margin-top:0.5%;" type="number" placeholder="Prezzo" name="Prezzo" id="Prezzo" step="0.01" min="0.1"><br>
<label for="Quantita">Inserisci Quantita:</label>
<input style="margin-top:0.5%;" type="number" placeholder="100" name="Quantita" id="Quantita" min="1"><br>
<label for="Info">Inserisci Descrizione:</label>			
<input style="margin-top:0.5%;" type="text" placeholder="gialle e lunghe..." name="Info" id="Info"><br>
		
<input style="padding: 8px;margin-left:24%;margin-top:0.5%;" type="submit" value="===>" >
</form> 

<form action="MenuDipendente.jsp">
<input style="margin-left:23%;margin-top:0.5%;padding: 8px;" type="submit" value="<===">
</form>

	</div>
</div>
<% } %>
</body>
</html>