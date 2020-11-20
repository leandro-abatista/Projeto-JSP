package br.com.sysprojsp.connection;

import java.sql.Connection;
import java.sql.DriverManager;

public class SingleConnection {
	
	private static String bancodedados = "jdbc:postgresql://localhost:5433/db_sistema_projsp?autoReconnect=true";
	private static String user = "postgres";
	private static String password = "admin";
	private static Connection connection = null;

	static {
		conectar();
	}

	public SingleConnection() {
		conectar();
	}

	private static void conectar() {
		try {

			if (connection == null) {

				Class.forName("org.postgresql.Driver");
				connection = DriverManager.getConnection(bancodedados, user, password);
				connection.setAutoCommit(false);
			}

		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("Erro ao conectar com o banco de dados!");
		}
	}

	public static Connection getConnection() {
		return connection;
	}
	
	public void fecharConexao() {
		try {
			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("Erro ao tentar fechar conexão com o banco de dados!");
		}
	}

}
