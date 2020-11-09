package br.com.sysprojsp.filter;

import java.io.IOException;

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

@WebFilter(urlPatterns = "/pages/*")
public class FilterAutenticacao implements Filter{
	
	//faz alguma coisa quando a aplicação é derrubada
	@Override
	public void destroy() {
	}

	//intercepta todas as requisições
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain filtroCorrente) throws IOException, ServletException {
		
		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession sessao = req.getSession();
		
		String urlParaAutenticar = req.getServletPath();
		
		Usuario usuarioLogado = (Usuario) sessao.getAttribute("usuario");
		
		if (usuarioLogado == null && !urlParaAutenticar.equalsIgnoreCase("/pages/servletAutenticacao")) {//usuario não logado
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("/autenticar.jsp?url="+urlParaAutenticar);
			dispatcher.forward(request, response);
			return;// para o processo para redirecionar
			
		}
		
		filtroCorrente.doFilter(request, response);
		
	}
	
	// executa alguma coisa quando a aplicação é iniciada
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		
	}

	
}
