package br.com.sysprojsp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import br.com.sysprojsp.connection.SingleConnection;

public class DaoAutenticar {
	
	private Connection connection;
	
	public DaoAutenticar() {
		connection = SingleConnection.getConnection();
	}
	
	public boolean validarLoginSenha(String login, String senha) {
		try {
			
			String sql = "SELECT * FROM tbl_usuario WHERE login = '" + login + "' AND senha = '" + senha + "'";
			PreparedStatement statement = connection.prepareStatement(sql);
			ResultSet rs = statement.executeQuery();
			
			if (rs.next()) {
				return true;//retorna true se possuir usuário
			} else {
				return false;//retorna false se possuir usuário
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

}
