package it.dstech.gestioneprodotti;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.dstech.database.GestioneProdottiDB;
import it.dstech.models.Prodotto;

public class AddProdotti extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("messaggio", "hai tentato di accedere manualmente");
		req.getRequestDispatcher("MenuPrincipale.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	long iD = Long.parseLong(req.getParameter("iD"));
	String nome = req.getParameter("Nome");
	double prezzo = Double.parseDouble(req.getParameter("Prezzo"));
	int quantita = Integer.parseInt(req.getParameter("Quantita"));
	String descrizione = req.getParameter("Info");
	Prodotto p = new Prodotto(nome, iD, prezzo, descrizione, quantita);
	GestioneProdottiDB gest = new GestioneProdottiDB();
	try {
		if(gest.aggiuntaProdottoAlDb(p)) {
			req.setAttribute("messaggio", "Prodotto aggiunto correttamente...");
			req.getRequestDispatcher("Fine.jsp").forward(req, resp);
		}else {
			req.setAttribute("messaggio", "possibile errore nel inserimento dati; oppure prodotto già esistente");
			req.getRequestDispatcher("MenuDipendente.jsp").forward(req, resp);
		}
	} catch (ClassNotFoundException | SQLException e) {
		e.printStackTrace();
	}
	}
	
}
