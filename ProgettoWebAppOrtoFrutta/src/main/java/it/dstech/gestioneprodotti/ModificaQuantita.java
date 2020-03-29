package it.dstech.gestioneprodotti;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.dstech.database.GestioneProdottiDB;

public class ModificaQuantita extends HttpServlet {


	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("messaggio", "hai tentato di accedere manualmente");
		req.getRequestDispatcher("MenuPrincipale.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		GestioneProdottiDB gest = new GestioneProdottiDB();
		long iD = Long.parseLong(req.getParameter("iD"));
		int quantita = Integer.parseInt(req.getParameter("quantita"));
		try {
			if(gest.modificaQuantita(iD, quantita)) {
				req.setAttribute("messaggio", "Quantità prodotto modificata correttamente...");
				req.getRequestDispatcher("Fine.jsp").forward(req, resp);
			}else {
				req.setAttribute("messaggio", "possibile errore nel inserimento dati; prodotto non esistente;");
				req.getRequestDispatcher("MenuDipendente.jsp").forward(req, resp);
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}
	
}
