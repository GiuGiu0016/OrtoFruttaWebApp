<!DOCTYPE html>
<html>
<title>OrtoFrutta</title>
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
	<form action="MenuPrincipale.jsp">
	<input style="background-color: red;color: black;padding: 1%;font-size: 30px" type="submit" value="Vai al menu Principale">
	</form>
	</div>
	<%
		} else {
	%>
<!-- Sidebar -->
<div class="w3-sidebar w3-light-gray w3-bar-block" style="width:15%;">
	<h3 class="w3-bar-item">Menu</h3>
	<a href="RegistraUtente.jsp" class="w3-bar-item w3-button">Registrati</a>
	<a href="Login.jsp" class="w3-bar-item w3-button">Accedi</a>
	<a href="Info.jsp" class="w3-bar-item w3-button">Info</a>
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
		<p>Salve a tutti, vi mostro il mio sito di Frutta e Verdura virtuale, spero possa piacervi.</p>
		<p>Per continuare Registrati o Accedi per entrare nello Store ufficiale di OrtofruttaWebApp</p>
		<p>Un grosso e caloroso abraccio dallo Staff !!</p>
		
	</div>
</div>
</div>
<% } %>
</body>
</html>
