package br.com.sysprojsp.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.sysprojsp.classes.model.Usuario;
import br.com.sysprojsp.dao.UsuarioDao;



/**
 * Servlet implementation class ServletUsuario
 */
@WebServlet("/pages/servletUsuario")
public class ServletUsuario extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	private UsuarioDao dao = new UsuarioDao();
       
   
    public ServletUsuario() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String acao = request.getParameter("acao");
		String user = request.getParameter("user");
		
		if (acao != null && acao.equalsIgnoreCase("consultar")) {
			Usuario usuario = dao.consultarU(user);
			
			RequestDispatcher view = request.getRequestDispatcher("/pages/cadastrousuarios.jsp");
			request.setAttribute("user", usuario);
			view.forward(request, response);
			
		} else if (acao != null && acao.equalsIgnoreCase("delete")) {
			dao.deleteU(user);
			
			RequestDispatcher view = request.getRequestDispatcher("/pages/cadastrousuarios.jsp");
			request.setAttribute("usuarios", dao.listarTodos());
			view.forward(request, response);
			
		} else if(acao != null && acao.equalsIgnoreCase("update")){
			Usuario acessoJsp = dao.consultarU(user);
			
			RequestDispatcher view = request.getRequestDispatcher("/pages/cadastrousuarios.jsp");
			request.setAttribute("user", acessoJsp);
			view.forward(request, response);
			
		} else if(acao != null && acao.equalsIgnoreCase("listartodos")){
	
			RequestDispatcher view = request.getRequestDispatcher("/pages/cadastrousuarios.jsp");
			request.setAttribute("usuarios", dao.listarTodos());
			view.forward(request, response);
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String acao = request.getParameter("acao");
		
		if (acao != null && acao.equalsIgnoreCase("reset")) {
			
			RequestDispatcher view = request.getRequestDispatcher("/pages/cadastrousuarios.jsp");
			request.setAttribute("usuarios", dao.listarTodos());
			view.forward(request, response);
			
		} else {
			
			String id = request.getParameter("id");
			String primeironome = request.getParameter("primeironome");
			String sobrenome = request.getParameter("sobrenome");
			String ultimonome = request.getParameter("ultimonome");
			String login = request.getParameter("login");
			String senha = request.getParameter("senha");
			String telefone = request.getParameter("telefone");
			String email = request.getParameter("email");
			String perfil = request.getParameter("perfil");
			
			Usuario acesso = new Usuario();
			acesso.setId(!id.isEmpty() ? Long.parseLong(id) : 0);
			acesso.setPrimeironome(primeironome);
			acesso.setSobrenome(sobrenome);
			acesso.setUltimonome(ultimonome);
			acesso.setLogin(login);
			acesso.setSenha(senha);
			acesso.setTelefone(telefone);
			acesso.setEmail(email);
			
			if (request.getParameter("ativo") != null && request.getParameter("ativo").equalsIgnoreCase("on")) {
				acesso.setAtivo(true);
			} else {
				acesso.setAtivo(false);
			}
			
			acesso.setPerfil(perfil);
			
			
			String msg;
			boolean podeInserir = true;
			
			
			
			if (id == null || id.isEmpty() && !dao.validarUsuario(login)) {/*isso quando for usuário novo*/
				msg = "Já existe cadastro com este usuário!";
				podeInserir = false;
				
				if (msg != null || !msg.isEmpty()) {
						request.setAttribute("msg", msg);
				}
				
			} 
			
			/*quando for salvar ou atualizar*/
			if (id == null || id.isEmpty() && dao.validarUsuario(login) && podeInserir) {
				dao.salvarU(acesso);
				msg = "Registro salvo com sucesso!";
				
				if (msg != null || !msg.isEmpty()) {
					request.setAttribute("msg", msg);
				}
				
			} else if(id != null && !id.isEmpty() && podeInserir) {
				dao.updateU(acesso);
				msg = "Registro atualizado com sucesso!";
				
				if (msg != null || !msg.isEmpty()) {
					request.setAttribute("msg", msg);
				}
			}
			
			
			RequestDispatcher view = request.getRequestDispatcher("/pages/cadastrousuarios.jsp");
			request.setAttribute("usuarios", dao.listarTodos());
			view.forward(request, response);
			
		}
	}

}
