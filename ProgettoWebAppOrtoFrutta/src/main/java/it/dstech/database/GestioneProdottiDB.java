package it.dstech.database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;

import it.dstech.models.Prodotto;
import it.dstech.models.Utente;

public class GestioneProdottiDB {

	public Connection con() throws ClassNotFoundException, SQLException {
		ConnessioneDataBase con = new ConnessioneDataBase();
		return con.con();
	}
	
	public HashMap<Long, Prodotto> creaMappa() throws ClassNotFoundException, SQLException {
		HashMap<Long, Prodotto> mappaProdotti = new HashMap<>();
		String query = "Select * from prodotti ; ";
		Statement statement = con().createStatement();
		ResultSet resultSet = statement.executeQuery(query);
		while (resultSet.next()) {
		long id = resultSet.getLong("idProdotto");
		String nome = resultSet.getString("Nome");
		double prezzo = resultSet.getDouble("Prezzo");
		int quantita = resultSet.getInt("Quantita");
		String descrizione= resultSet.getString("Descrizione");
		Long key = id;
		Prodotto p = new Prodotto(nome, id, prezzo, descrizione, quantita);
		mappaProdotti.put(key, p);
		}
		return mappaProdotti;
	}
	
	public boolean controlloEsistenzaProdotto(Long iD) throws ClassNotFoundException, SQLException {
		if(creaMappa().containsKey(iD)) {
			return true;
		}else {
			return false;
		}
	}
	
	public boolean aggiuntaProdottoAlDb(Prodotto p) throws ClassNotFoundException, SQLException {
		if(controlloEsistenzaProdotto(p.getiD())) {
			return false;
		}else {
		String query = "Insert into prodotti (idProdotto,Nome,Prezzo,Quantita,Descrizione) values (?,?,?,?,?) ;";
		PreparedStatement preparedStatement = con().prepareStatement(query);
		preparedStatement.setLong(1, p.getiD());
		preparedStatement.setString(2, p.getNome());
		preparedStatement.setDouble(3, p.getPrezzo());
		preparedStatement.setInt(4, p.getQuantita());
		preparedStatement.setString(5, p.getDescrizione());
		preparedStatement.execute();
		return true;
		}
	}
	
	public boolean rimuoviProdotto(long idProdotto) throws ClassNotFoundException, SQLException {
		if(controlloEsistenzaProdotto(idProdotto)) {
			String query = "delete from prodotti where idProdotto=?;";
			PreparedStatement preparedStatement = con().prepareStatement(query);
			preparedStatement.setLong(1, idProdotto);
			preparedStatement.execute();
			return true;
		}else {
			return false;
		}
	}
	
	public boolean modificaPrezzo(long idProdotto,double prezzo) throws ClassNotFoundException, SQLException {
		if(controlloEsistenzaProdotto(idProdotto)) {
			String query = "update prodotti set Prezzo = ? where idProdotto = ? ;";
			PreparedStatement preparedStatement = con().prepareStatement(query);
			preparedStatement.setDouble(1, prezzo);
			preparedStatement.setLong(2, idProdotto);
			preparedStatement.execute();
			return true;
		}else {
			return false;
		}
	}
	
	public boolean modificaDescrizione(long idProdotto,String descrizione) throws ClassNotFoundException, SQLException {
		if(controlloEsistenzaProdotto(idProdotto)) {
			String query = "update prodotti set Descrizione = ? where idProdotto = ? ;";
			PreparedStatement preparedStatement = con().prepareStatement(query);
			preparedStatement.setString(1, descrizione);
			preparedStatement.setLong(2, idProdotto);
			preparedStatement.execute();
			return true;
		}else {
			return false;
		}
	}
	
	public int quantitaAttuale(long idProdotto) throws SQLException, ClassNotFoundException {
		String query = "Select * from prodotti where idProdotto = \""+idProdotto+"\" ;";
		Statement statement = con().createStatement();
		ResultSet resultSet = statement.executeQuery(query);
		while(resultSet.next()) {
			return resultSet.getInt("Quantita");
		}
		return 0;
	}
	
	public boolean modificaQuantita(long idProdotto,int quantita) throws ClassNotFoundException, SQLException {
		if(controlloEsistenzaProdotto(idProdotto)) {
			int inv = quantitaAttuale(idProdotto)+quantita;
			String query = "update prodotti set Quantita = ? where idProdotto = ? ;";
			PreparedStatement preparedStatement = con().prepareStatement(query);
			preparedStatement.setInt(1, inv);
			preparedStatement.setLong(2, idProdotto);
			preparedStatement.execute();
			return true;
		}else {
			return false;
		}
	}

}
