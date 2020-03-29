package it.dstech.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnessioneDataBase {

	public Connection con() throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		String pass = "Snoopy00Giulio00_";
		String user = "root";
		String url = "jdbc:mysql://localhost:3306/ortofrutta?useUnicode=true&useLegacyDatetimeCode=false&serverTimezone=UTC&createDatabaseIfNotExist=true&allowPublicKeyRetrieval=true&useSSL=false";
		Connection con = DriverManager.getConnection(url, user, pass);
		return con;
	}
	
}
