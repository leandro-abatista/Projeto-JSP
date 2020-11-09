package br.com.sysprojsp.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import br.com.sysprojsp.classes.model.Usuario;

/**
 * Servlet implementation class ServletAutenticacao
 */
@WebServlet("/servletAutenticacao")
public class ServletAutenticacao extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	
       
    public ServletAutenticacao() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String login = request.getParameter("login");
		String senha = request.getParameter("senha");
		
		String url = request.getParameter("url");
		
		/**
		 * neste momento pode ser feito uma validação no banco de dados
		 */
		if (login != null || !login.isEmpty() && login.equalsIgnoreCase("admin") 
				&& senha != null || !senha.isEmpty() && senha.equalsIgnoreCase("123")) {//isso se o login for bem sucedido
			
			Usuario user = new Usuario();
			user.setLogin(login);
			user.setSenha(senha);
			
			/**
			 * adiciona o user logado na sessão atual
			 */
			HttpServletRequest req = request;
			HttpSession sessao = req.getSession();
			sessao.setAttribute("usuario", user);
			
			/**
			 * redireciona para o sistema e autoriza
			 */
			RequestDispatcher dispatcher = request.getRequestDispatcher(url);
			dispatcher.forward(request, response);
			
		} else {
			
			/**
			 * caso o login e senha seja inválidos
			 */
			RequestDispatcher dispatcher = request.getRequestDispatcher("/autenticar.jsp");
			dispatcher.forward(request, response);
			
		}
		
	}

}
