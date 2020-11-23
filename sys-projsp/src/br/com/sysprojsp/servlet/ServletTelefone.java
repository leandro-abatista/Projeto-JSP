package br.com.sysprojsp.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.sysprojsp.classes.model.Cliente;
import br.com.sysprojsp.classes.model.Telefone;
import br.com.sysprojsp.dao.ClienteDao;
import br.com.sysprojsp.dao.TelefoneDao;

/**
 * Servlet implementation class ServletTelefone
 */
@WebServlet("/pages/servletTelefone")
public class ServletTelefone extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private ClienteDao clienteDao = new ClienteDao();

	private TelefoneDao telefoneDao = new TelefoneDao();

	public ServletTelefone() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String acao = request.getParameter("acao");
		String cli = request.getParameter("cli");
		
		if (cli != null) {
			
		if (acao.equalsIgnoreCase("addTelefone")) {
			
			Cliente cliente = clienteDao.consultaC(cli);

			request.getSession().setAttribute("clienteSelecionado", cliente);
			request.setAttribute("clienteSelecionado", cliente);

			
			RequestDispatcher view = request.getRequestDispatcher("/pages/cadastrotelefones.jsp");
			request.setAttribute("telefone", telefoneDao.listarTodos(cliente.getId()));
			view.forward(request, response);
			
		} else
			
		if (acao.equalsIgnoreCase("delete")) {
			
			String foneId = request.getParameter("foneId");
			telefoneDao.deleteT(foneId);
			
			Cliente cliente = (Cliente) request.getSession().getAttribute("clienteSelecionado");
			
			RequestDispatcher view = request.getRequestDispatcher("/pages/cadastrotelefones.jsp");
			request.setAttribute("telefone", telefoneDao.listarTodos(cliente.getId()));
			view.forward(request, response);
			
		}
		
		} else {
			
			RequestDispatcher view = request.getRequestDispatcher("/pages/cadastroclientes.jsp");
			request.setAttribute("clientes", clienteDao.listarTodos());
			view.forward(request, response);
			
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String acao = request.getParameter("acao");

		if (acao != null && acao.equalsIgnoreCase("reset")) {

			Cliente cliente = (Cliente) request.getSession().getAttribute("clienteSelecionado");

			RequestDispatcher view = request.getRequestDispatcher("/pages/cadastrotelefones.jsp");
			request.setAttribute("telefone", telefoneDao.listarTodos(cliente.getId()));
			view.forward(request, response);

		} else {

			Cliente cliente = (Cliente) request.getSession().getAttribute("clienteSelecionado");

			String id = request.getParameter("idT");
			String numero = request.getParameter("numero");
			String tipo = request.getParameter("tipo");

			Telefone telefone = new Telefone();
			telefone.setId(!id.isEmpty() ? Long.parseLong(id) : 0);
			telefone.setNumero(numero);
			telefone.setTipo(tipo);
			telefone.setCliente(cliente.getId());

			if (id == null || id.isEmpty()) {

				telefoneDao.saveT(telefone);

				request.getSession().setAttribute("clienteSelecionado", cliente);
				request.setAttribute("clienteSelecionado", cliente);

				RequestDispatcher view = request.getRequestDispatcher("/pages/cadastrotelefones.jsp");
				request.setAttribute("telefone", telefoneDao.listarTodos(cliente.getId()));
				view.forward(request, response);

			}

		}

	}

}
