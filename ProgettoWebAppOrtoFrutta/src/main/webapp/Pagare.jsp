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
		</form>
	</div>
	<%
		} else {
	%>
<!-- Page Content -->
<div >


	<div class="w3-container" style="background-color: black;color: white;">
	  <h1 style="font-family: cursive;text-align: center;">Ortofrutta WebApp</h1>
	</div>
	
	<div class="w3-container" style="text-align: center;">
		<div>
		    <%
				GestioneScontriniCarrelli gestioneScontriniCarrelli = new GestioneScontriniCarrelli();
				long ultimo = gestioneScontriniCarrelli.ultimoScontrino(user);
				Scontrino s = gestioneScontriniCarrelli.mappaScontrini().get(ultimo);
				if(gestioneScontriniCarrelli.PagatoONon(user)){
				%>
				<h1>Hai già pagato tutto niente debiti...</h1>
					<form action="MenuPrincipaleClienti.jsp" style="text-align: right;">
		<input type="hidden" name="user" id="user" value="<%=user%>">
		<input style="margin-left:23%;margin-top:0.5%;padding: 8px;" type="submit" value="<===">
	</form>
				<%
				}else{
				gestioneScontriniCarrelli.aggiornaPagamento(user);
			%>
			<h1>Hai pagato ben:</h1>
			<h1>"<%=s.getSommaPrezzo()%>&#x20ac"</h1>
			<h2>Scontrino n°<%=s.getId()%>, creato il: "<%=s.getData()%>"</h2>
			<h2>Grazie "<%=user%>", di aver comprato da noi, speriamo di rivederti al più presto;</h2>
		</div>
	</div>
	<form action="MenuPrincipaleClienti.jsp" style="text-align: right;">
		<input type="hidden" name="user" id="user" value="<%=user%>">
		<input style="margin-left:23%;margin-top:0.5%;padding: 8px;" type="submit" value="<===">
	</form>
</div>
<% } }%>
</body>
</html>