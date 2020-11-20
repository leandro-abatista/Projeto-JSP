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
	 * Faz alguma coisa quando a aplicação é derrubada
	 */
	@Override
	public void destroy() {
	}

	/**
	 * Intercepta todas as páginas JSP do sistema
	 */
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		//capturar o usuário para verificar se ele estar logado com usuário e senha na sessão
		HttpServletRequest hsr = (HttpServletRequest) request;
		HttpSession sessao = hsr.getSession();
		
		String urlParaAutenticar = hsr.getServletPath();
		Usuario usuarioLogado = (Usuario) sessao.getAttribute("usuario");
		
		//retorna null caso não esteja logado
		if (usuarioLogado == null && !urlParaAutenticar.equalsIgnoreCase("/pages/servletAutenticar")) {//usuario não logado
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("/autenticacao.jsp?url=" + urlParaAutenticar);
			dispatcher.forward(request, response);
			return;//para o processo, para redirecionar
			
		}
		
		try {
			/**
			 * Executa as ações de request e response
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
	 * Executa alguma coisa quando a aplicação é iniciada
	 */
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		connection = SingleConnection.getConnection();
	}

}
