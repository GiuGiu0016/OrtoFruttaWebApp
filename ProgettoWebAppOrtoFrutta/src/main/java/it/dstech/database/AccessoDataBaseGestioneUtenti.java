package it.dstech.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import it.dstech.models.Utente;

public class AccessoDataBaseGestioneUtenti {

	public Connection con() throws ClassNotFoundException, SQLException {
		ConnessioneDataBase con = new ConnessioneDataBase();
		return con.con();
	}
	
	public HashMap<String, Utente> creaMappa() throws ClassNotFoundException, SQLException {
		HashMap<String, Utente> mappaUtenti = new HashMap<>();
		String query = "Select * from utenti ; ";
		Statement statement = con().createStatement();
		ResultSet resultSet = statement.executeQuery(query);
		while (resultSet.next()) {
		String username = resultSet.getString("Username");
		String nome = resultSet.getString("nome");
		String cognome = resultSet.getString("cognome");
		String eta = resultSet.getString("eta");
		String pass= resultSet.getString("pass");
		Utente u = new Utente(nome, cognome, username, eta,pass);
		mappaUtenti.put(username, u);
		}
		return mappaUtenti;
	}
	
	public boolean controlloEsistenzaUtente(String userUtente) throws ClassNotFoundException, SQLException {
		if(creaMappa().containsKey(userUtente)) {
			return true;
		}else {
			return false;
		}
	}
	
	public boolean aggiuntaUtenteAlDatabase(Utente u) throws ClassNotFoundException, SQLException {
		if(!(controlloEsistenzaUtente(u.getUsername()))) {
		String query = "Insert into utenti (Username,nome,cognome,eta,pass) values (?,?,?,?,?) ;";
		PreparedStatement preparedStatement = con().prepareStatement(query);
		preparedStatement.setString(1, u.getUsername());
		preparedStatement.setString(2, u.getNome());
		preparedStatement.setString(3, u.getCognome());
		preparedStatement.setString(4, u.getEta());
		preparedStatement.setString(5, u.getPass());
		preparedStatement.execute();
		return true;
		}else {
			return false;
		}
	}
	
	public boolean AccessoCorretto(String user,String pass) throws ClassNotFoundException, SQLException {
		if(creaMappa().containsKey(user)) {
			if(creaMappa().get(user).getPass().equals(pass)){
				return true;
			}
		}
		return false;
	}
}
