package br.com.sysprojsp.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class FilterAutenticacao implements Filter {
	
	@Override
	public void destroy() {
	}

	/**
	 * Intercepta todas as p�ginas JSP do sistema
	 */
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		
	}
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
	}

}
