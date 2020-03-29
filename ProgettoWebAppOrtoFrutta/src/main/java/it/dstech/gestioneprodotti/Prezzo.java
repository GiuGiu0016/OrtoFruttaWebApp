package it.dstech.gestioneprodotti;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.dstech.database.GestioneProdottiDB;

public class Prezzo extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("messaggio", "hai tentato di accedere manualmente");
		req.getRequestDispatcher("MenuPrincipale.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		GestioneProdottiDB gest = new GestioneProdottiDB();
		long iD = Long.parseLong(req.getParameter("iD"));
		double prezzo = Double.parseDouble(req.getParameter("prezzo"));
		try {
			if(gest.modificaPrezzo(iD, prezzo)) {
				req.setAttribute("messaggio", "Prezzo prodotto modificato correttamente...");
				req.getRequestDispatcher("Fine.jsp").forward(req, resp);
			}else {
				req.setAttribute("messaggio", "possibile errore nel inserimento dati; prodotto non esistente;");
				req.getRequestDispatcher("ModifichePrezzo.jsp").forward(req, resp);
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}
	
}
