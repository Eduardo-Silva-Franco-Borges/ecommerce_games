package br.com.projetoles.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class TesteConexao {
	
	public static String status;

	public static void main(String[] args) {
		try {
			Connection connection = Conexao.getConnectionMySQL();
			// Testa sua conexão//

					if (connection != null) {

						status = ("STATUS--->Conectado com sucesso!");
						System.out.println(status);
						
						
//						String sql = "insert into cliente (nome)"+"values(?)";
//				        PreparedStatement stmt = connection.prepareStatement(sql);
//				        stmt.setString(1,"teste");
//				        stmt.execute();
//				        stmt.close();

					} else {

						status = ("STATUS--->Não foi possivel realizar conexão");
						System.out.println(status);

					}
		
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}				

	}

}
