package br.com.sysprojsp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import br.com.sysprojsp.classes.model.Usuario;
import br.com.sysprojsp.connection.SingleConnection;

public class DaoUsuario {
	
	private Connection connection;
	
	public DaoUsuario() {
		connection = SingleConnection.getConnection();
	}
	
	public void save(Usuario usuario) {
		
		try {
			
			String sql = "";
			
		} catch (Exception e) {
			e.printStackTrace();
			
			try {
				connection.rollback();
			} catch (Exception ex) {
				ex.printStackTrace();
			}
		}
		
	}
	
	public boolean validarLogin(String login) {
		try {
			
			String sql = "SELECT COUNT(1) AS qtd FROM usuario WHERE login = '" + login + "'";
			PreparedStatement statement = connection.prepareStatement(sql);
			ResultSet rs = statement.executeQuery();
			
			if (rs.next()) {
				return rs.getInt("qtd") <= 0;//se for true
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

}
