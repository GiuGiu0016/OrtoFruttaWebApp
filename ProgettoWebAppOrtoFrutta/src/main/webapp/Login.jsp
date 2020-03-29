<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
</head>
<body>
<!-- in caso di accesso manuale ad altre pagine -->
	<%
		String messaggio = (String) request.getAttribute("messaggio");
		if (messaggio != null) {
	%>
	<div style="text-align: center; background-color: black;padding: 3%;margin-top: 15%;">
	<h1 style="color: red;">ERRORE</h1>
	<h2 style="color: red;"><%=messaggio%></h2>
	<h2 style="color: red;"></h2>
	<form action="Login.jsp">
	<input style="background-color: red;color: black;padding: 1%;font-size: 30px" type="submit" value="Vai al menu Principale">
	</form>
	</div>
	<%
		} else {
	%>
<h3 style="text-align: center; background-color: black; color: white;margin-top: 10%;padding: 10px;">Richiesta dati per il Login</h3>

<form action="login" method="post" style="text-align: center;">
<label for="user">Inserisci Username:</label>
<input type="text" placeholder="MarioRossi99" name="user" id="user"><br>
<label for="pass">Inserisci Password:</label>
<input style="margin-top:0.5%;" type="Password" placeholder="**Pass**" name="pass" id="pass"><br>		
<input style="padding: 8px;margin-left:15%;margin-top:0.5%;" type="submit" value="===>" >
</form> 

<form action="MenuPrincipale.jsp">
<input style="margin-left:54%;margin-top:0.5%;padding: 8px;" type="submit" value="<===">
</form>
<% } %>
</body>
</html>