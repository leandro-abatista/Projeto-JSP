package br.com.sysprojsp.filter;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import br.com.sysprojsp.classes.model.Usuario;
import br.com.sysprojsp.connection.SingleConnection;

@WebFilter(urlPatterns = {"/pages/*"})
public class FilterAutenticacao implements Filter {
	
	private static Connection connection;
	
	/**
	 * Faz alguma coisa quando a aplica��o � derrubada
	 */
	@Override
	public void destroy() {
	}

	/**
	 * Intercepta todas as p�ginas JSP do sistema
	 */
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		//capturar o usu�rio para verificar se ele estar logado com usu�rio e senha na sess�o
		HttpServletRequest hsr = (HttpServletRequest) request;
		HttpSession sessao = hsr.getSession();
		
		String urlParaAutenticar = hsr.getServletPath();
		Usuario usuarioLogado = (Usuario) sessao.getAttribute("usuario");
		
		//retorna null caso n�o esteja logado
		if (usuarioLogado == null && !urlParaAutenticar.equalsIgnoreCase("/pages/servletAutenticar")) {//usuario n�o logado
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("/autenticacao.jsp?url=" + urlParaAutenticar);
			dispatcher.forward(request, response);
			return;//para o processo, para redirecionar
			
		}
		
		try {
			/**
			 * Executa as a��es de request e response
			 */
			chain.doFilter(request, response);
			connection.commit();
		} catch (SQLException e) {
			e.printStackTrace();
			
			try {
				connection.rollback();
			} catch (Exception ex) {
				ex.printStackTrace();
			}
		}
	}
	
	/**
	 * Executa alguma coisa quando a aplica��o � iniciada
	 */
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		connection = SingleConnection.getConnection();
	}

}
