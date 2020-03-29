package it.dstech.gestioneutenti;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.dstech.database.AccessoDataBaseGestioneUtenti;

public class ReindirizzamentoCliente extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("messaggio", "hai tentato di accedere manualmente");
		req.getRequestDispatcher("MenuPrincipale.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		AccessoDataBaseGestioneUtenti aDB = new AccessoDataBaseGestioneUtenti();
		String user = req.getParameter("user");
		String pass = req.getParameter("pass");
		try {
			if(aDB.AccessoCorretto(user, pass)) {
				if(user.equals("admin")) {
				req.getRequestDispatcher("MenuDipendente.jsp").forward(req, resp);
				}else {
				req.getRequestDispatcher("MenuPrincipaleClienti.jsp").forward(req, resp);
				}
			}else {
				req.setAttribute("messaggio", "Possibile errore nell'Inserimento Dati riprova");
				req.getRequestDispatcher("Login.jsp").forward(req, resp);
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}

}
