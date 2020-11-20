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
import br.com.sysprojsp.dao.DaoAutenticar;

@WebServlet("/pages/servletAutenticar")
public class ServletAutenticar extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private DaoAutenticar daoAutenticar = new DaoAutenticar();

	public ServletAutenticar() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		if (Boolean.parseBoolean(request.getParameter("deslogar"))) {
			HttpServletRequest hsr = (HttpServletRequest) request;
			HttpSession sessao = hsr.getSession();
			sessao.invalidate();
			// redireciona para a página de index para realizar o login novamente, para ter
			// acesso ao sistema
			response.sendRedirect("../index.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String login = request.getParameter("login");
		String senha = request.getParameter("senha");

		String url = request.getParameter("url");

		Usuario usuarioLogado = new Usuario();

		if (login != null || !login.isEmpty() && senha != null || !senha.isEmpty()) {

			if (daoAutenticar.validarLoginSenha(login, senha)) {

				HttpServletRequest hsr = (HttpServletRequest) request;
				HttpSession sessao = hsr.getSession();
				sessao.setAttribute("usuario", usuarioLogado);

				RequestDispatcher dispatcher = request.getRequestDispatcher(url);
				dispatcher.forward(request, response);

			} else {//se o login e senha forem inválidos

				RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/acessoNegado.jsp");
				dispatcher.forward(request, response);

			}

		}

	}

}
