package it.dstech.gestioneacquisti;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import it.dstech.database.GestioneScontriniCarrelli;

public class AggiungiCarello extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("messaggio", "hai tentato di accedere manualmente");
		req.getRequestDispatcher("MenuPrincipaleClienti.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	GestioneScontriniCarrelli gest = new GestioneScontriniCarrelli();
	String user =	req.getParameter("user");
	long iD = Long.parseLong(req.getParameter("iD"));
	int quantita = Integer.parseInt(req.getParameter("Quantita"));
	String data = req.getParameter("Data");
	try {
		if(gest.PagatoONon(user)) {
			if(gest.creaScontrino(user, quantita, iD, data)) {
				req.getRequestDispatcher("MenuPrincipaleClienti.jsp").forward(req, resp);
			}else {
				req.setAttribute("messaggio", "Possibile errore nel iserimento dati controlla e riprova");
				req.getRequestDispatcher("AggiungiProdottoalCarrello.jsp").forward(req, resp);
			}
		}else {
			if(gest.aggiornaScontrino(iD, quantita, user)) {
				req.getRequestDispatcher("MenuPrincipaleClienti.jsp").forward(req, resp);
			}else {
				req.setAttribute("messaggio", "Possibile errore nel iserimento dati controlla e riprova");
				req.getRequestDispatcher("AggiungiProdottoalCarrello.jsp").forward(req, resp);
			}
		}
	} catch (ClassNotFoundException | SQLException e) {
		e.printStackTrace();
	}
	}
	
}
