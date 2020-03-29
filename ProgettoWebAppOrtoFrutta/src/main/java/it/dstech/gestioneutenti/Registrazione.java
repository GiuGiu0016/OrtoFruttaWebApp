package it.dstech.gestioneutenti;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.dstech.database.AccessoDataBaseGestioneUtenti;
import it.dstech.models.Utente;

public class Registrazione extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("messaggio", "hai tentato di accedere manualmente");
		req.getRequestDispatcher("MenuPrincipale.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String eta = req.getParameter("Eta");
		String nome = req.getParameter("Nome");
		String cognome = req.getParameter("Cognome");
		String user = req.getParameter("user");
		String pass = req.getParameter("pass");
		Utente u = new Utente(nome, cognome, user, eta, pass);
		AccessoDataBaseGestioneUtenti adbgu = new AccessoDataBaseGestioneUtenti();
		try {
			if(adbgu.aggiuntaUtenteAlDatabase(u)) {
				req.getRequestDispatcher("Login.jsp").forward(req, resp);
			}else {
				req.setAttribute("messaggio", "Possibili errori:\n-Username gia utilizzato prova a cambiarlo\n-Possibile errore con l'inserimento dati");
				req.getRequestDispatcher("RegistraUtente.jsp").forward(req, resp);
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}
	
}
