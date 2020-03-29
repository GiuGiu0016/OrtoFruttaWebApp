package it.dstech.models;

public class Prodotto {

	private String nome;
	private long iD;
	private double prezzo;
	private String descrizione;
	private int quantita;
	public Prodotto(String nome, long iD, double prezzo, String descrizione, int quantita) {
		super();
		this.nome = nome;
		this.iD = iD;
		this.prezzo = prezzo;
		this.descrizione = descrizione;
		this.quantita = quantita;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public long getiD() {
		return iD;
	}
	public void setiD(long iD) {
		this.iD = iD;
	}
	public double getPrezzo() {
		return prezzo;
	}
	public void setPrezzo(double prezzo) {
		this.prezzo = prezzo;
	}
	public String getDescrizione() {
		return descrizione;
	}
	public void setDescrizione(String descrizione) {
		this.descrizione = descrizione;
	}
	public int getQuantita() {
		return quantita;
	}
	public void setQuantita(int quantita) {
		this.quantita = quantita;
	}
	
	
	
}
