package br.com.projetoles.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.TimeZone;

public class Conexao {
	
	private static String driver;
	private static String url;
	private static String user;
	private static String password;

	public static Connection getConnectionMySQL() throws ClassNotFoundException, SQLException {
		String serverName = "localhost"; // caminho do servidor do BD
		String mydatabase = "dbecommerce_video_game"; // nome do seu banco de dados
		driver = "com.mysql.cj.jdbc.Driver";
		url = "jdbc:mysql://" + serverName + "/" + mydatabase+"?&serverTimezone="+ TimeZone.getDefault().getID();
		user = "root";// nome de um usu�rio de seu BD
		password = "casa1080";// sua senha de acesso
		
		Connection connection = null; // atributo do tipo Connection

		try {

			// Carregando o JDBC Driver padr�o

			String driverName = "com.mysql.cj.jdbc.Driver";

			Class.forName(driverName);

			// Configurando a nossa conex�o com um banco de dados//

			
			connection = DriverManager.getConnection(url, user, password);

			return connection;

		} catch (ClassNotFoundException e) { 
			
			// Driver n�o encontrado
			System.out.println(e);
			System.out.println("O driver expecificado nao foi encontrado.");

			return null;

		} catch (SQLException e) {

		//N�o conseguindo se conectar ao banco
			System.out.println(e);
			System.out.println("Nao foi possivel conectar ao Banco de Dados.");

			return null;

		}
		

	}

	public static Connection getConnectionH2() throws ClassNotFoundException, SQLException {
		driver = "org.h2.Driver";
		url = "jdbc:h2:~/test";	
		user = "sa";
		password = "";
		return getConnection();

	}

	private static Connection getConnection() throws ClassNotFoundException, SQLException {

		Class.forName(driver);
		Connection conn = DriverManager.getConnection(url, user, password);

		return conn;

	}

}
