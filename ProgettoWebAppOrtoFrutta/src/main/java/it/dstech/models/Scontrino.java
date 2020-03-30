package it.dstech.models;

public class Scontrino {
	private long id;
	private String user;
	private double sommaPrezzo;
	private String data;
	public Scontrino(String user, double sommaPrezzo, String data) {
		super();
		this.user = user;
		this.sommaPrezzo = sommaPrezzo;
		this.data = data;
	}
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public double getSommaPrezzo() {
		return sommaPrezzo;
	}
	public void setSommaPrezzo(double sommaPrezzo) {
		this.sommaPrezzo = sommaPrezzo;
	}
	public String getData() {
		return data;
	}
	public void setData(String data) {
		this.data = data;
	}
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	
}
