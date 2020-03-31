package it.dstech.database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import it.dstech.models.Carrello;
import it.dstech.models.Prodotto;
import it.dstech.models.Scontrino;

public class GestioneScontriniCarrelli {

	public Connection con() throws ClassNotFoundException, SQLException {
		ConnessioneDataBase con = new ConnessioneDataBase();
		return con.con();
	}
	
	public boolean PagatoONon(String username) throws ClassNotFoundException, SQLException {
	long maxScontrino = ultimoScontrino(username);
	String query = "SELECT * FROM scontrini where idscontrini="+maxScontrino+";";
	Statement statement = con().createStatement();
	ResultSet resultSet = statement.executeQuery(query);
	while(resultSet.next()) {
		if(resultSet.getString("Status").equals("Non Pagato")) {
			return false;
		}else {
			return true;
		}
	}
	return true;
	}

	public long ultimoScontrino(String username) throws SQLException, ClassNotFoundException {
		String query = "SELECT max(idscontrini) FROM scontrini where Username=\""+username+"\" ;";
		Statement statement = con().createStatement();
		ResultSet resultSet = statement.executeQuery(query);
		while(resultSet.next()) {
			long maxScontrino = resultSet.getInt("max(idscontrini)");
			return maxScontrino;
		}
		return 0;
	}
	
	public boolean creaScontrino(String user,int quantita,long idProdotto, String data) throws ClassNotFoundException, SQLException {
		GestioneProdottiDB gestioneProdottiDB = new GestioneProdottiDB();
		if(gestioneProdottiDB.quantitaAttuale(idProdotto)-quantita<0) {
			return false;
		}
		gestioneProdottiDB.modificaQuantita(idProdotto, (-1)*quantita);
		Scontrino  scontrino = new Scontrino(user, (gestioneProdottiDB.creaMappa().get(idProdotto).getPrezzo()*quantita), data);
		String query = "Insert into scontrini (Username,PrezzoComplessivo,Data) values (?,?,?) ;";
		PreparedStatement preparedStatement = con().prepareStatement(query);
		preparedStatement.setString(1, scontrino.getUser());
		preparedStatement.setDouble(2, scontrino.getSommaPrezzo());
		preparedStatement.setString(3, scontrino.getData());
		preparedStatement.execute();
		double prezzo = gestioneProdottiDB.creaMappa().get(idProdotto).getPrezzo()*quantita;
		aggiungiCarrello(gestioneProdottiDB.creaMappa().get(idProdotto).getNome(), quantita, prezzo, ultimoScontrino(user));
		return true;
	}
	
	public boolean aggiornaScontrino(long idProdotto,int quantita,String user) throws ClassNotFoundException, SQLException {
		GestioneProdottiDB gestioneProdottiDB = new GestioneProdottiDB();
		if(gestioneProdottiDB.quantitaAttuale(idProdotto)-quantita<0) {
			return false;
		}
		gestioneProdottiDB.modificaQuantita(idProdotto, (-1)*quantita);
		String query = "update scontrini set PrezzoComplessivo = ? where idscontrini = ? ;";
		PreparedStatement preparedStatement = con().prepareStatement(query);
		preparedStatement.setDouble(1, prezzoAggiunto(user, idProdotto, quantita) );
		preparedStatement.setLong(2, ultimoScontrino(user));
		preparedStatement.execute();
		double prezzo = gestioneProdottiDB.creaMappa().get(idProdotto).getPrezzo()*quantita;
		aggiungiCarrello(gestioneProdottiDB.creaMappa().get(idProdotto).getNome(), quantita, prezzo, ultimoScontrino(user));
		return true;
	}
	
	public boolean aggiungiCarrello(String idProdotto,int quantita,double prezzo,long idScontrino) throws SQLException, ClassNotFoundException {
		String query = "Insert into carrelli (Prodotto,Quantita,PrezzoProdotto,iDScontrino) values (?,?,?,?) ;";
		PreparedStatement preparedStatement = con().prepareStatement(query);
		preparedStatement.setString(1, idProdotto);
		preparedStatement.setInt(2, quantita);
		preparedStatement.setDouble(3, prezzo);
		preparedStatement.setLong(4, idScontrino);
		preparedStatement.execute();
		return true;
	}
	
	public double prezzoAggiunto(String user,long idProdotto,int quantita) throws ClassNotFoundException, SQLException {
	GestioneProdottiDB gestP = new GestioneProdottiDB();
	HashMap<Long, Prodotto> mappaProdotti = gestP.creaMappa();
	Prodotto p = mappaProdotti.get(idProdotto);
	Scontrino scontrino = mappaScontrini().get(ultimoScontrino(user));
	double tot = (p.getPrezzo()*quantita)+scontrino.getSommaPrezzo();
	return tot;
	}
	
	public HashMap<Long, Scontrino> mappaScontrini() throws ClassNotFoundException, SQLException{
		HashMap<Long, Scontrino> mappa = new HashMap<>();
		String query = "select * from scontrini ";
		Statement statement = con().createStatement();
		ResultSet resultSet = statement.executeQuery(query);
		while(resultSet.next()) {
		Long idScontrino = resultSet.getLong("idscontrini");
		String user = resultSet.getString("Username");
		double somma = resultSet.getDouble("PrezzoComplessivo");
		String data = resultSet.getString("Data");
		Scontrino scontrino = new Scontrino(user, somma, data);
		scontrino.setId(idScontrino);
		mappa.put(idScontrino, scontrino);
		}
		return mappa;
	}
	
	public List<Carrello> Carrello(long idScontrino) throws ClassNotFoundException, SQLException{
		GestioneProdottiDB gest = new GestioneProdottiDB();
		List<Carrello> carrello = new ArrayList<>();
		String query = "SELECT * FROM ortofrutta.carrelli where iDScontrino = "+idScontrino+";";
		Statement statement = con().createStatement();
		ResultSet resultSet = statement.executeQuery(query);
		while(resultSet.next()) {
			String nome = resultSet.getString("Prodotto");
			int quantita = resultSet.getInt("Quantita");
			double prezzo = resultSet.getDouble("PrezzoProdotto");
			Carrello c = new Carrello(nome, prezzo, quantita);
			carrello.add(c);
		}
		return carrello;
	}
	
	public boolean aggiornaPagamento(String user) throws ClassNotFoundException, SQLException {
		String query = "update scontrini set Status = ? where idscontrini = ? ;";
		PreparedStatement preparedStatement = con().prepareStatement(query);
		preparedStatement.setString(1, "Pagato");
		preparedStatement.setLong(2, ultimoScontrino(user));
		preparedStatement.execute();
		return true;
	}
	
}
