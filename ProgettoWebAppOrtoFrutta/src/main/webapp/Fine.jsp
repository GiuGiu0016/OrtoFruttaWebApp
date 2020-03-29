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
	<%
		String messaggio = (String) request.getAttribute("messaggio");
	%>
<!-- Page Content -->
<div >

	<div class="w3-container" style="background-color: black;color: white; text-align: center;">
	  <h1 style="font-family: cursive;">Ortofrutta WebApp</h1>
	</div>
	
	<div class="w3-container" style="text-align: center;">
		<h2>Grazie di aver usato il sito:</h2>
		<div>
			<h2><%=messaggio%></h2>
			<form action="MenuDipendente.jsp">
			<input type="submit" value="Vai al menu Principale">
			</form>
		</div>
	</div>

</div>
</body>
</html>