package it.dstech.models;

public class Utente {

	private String nome;
	private String cognome;
	private String username;
	private String pass;
	private String eta;
	
	public Utente(String nome, String cognome, String username, String eta,String pass) {
		this.nome = nome;
		this.cognome = cognome;
		this.username = username;
		this.eta = eta;
		this.pass = pass;
	}
	
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getCognome() {
		return cognome;
	}
	public void setCognome(String cognome) {
		this.cognome = cognome;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getEta() {
		return eta;
	}
	public void setEta(String eta) {
		this.eta = eta;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}
}

