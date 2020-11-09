package br.com.sysjsp.excecoes;



import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/servletCapturarExcecao")
public class ServletCapturarExcecao extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       
    public ServletCapturarExcecao() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			String valor = request.getParameter("valorParam");
			
			Double.valueOf(valor);
			
			response.setStatus(200);//ok, nenhum erro detectado
			
			response.getWriter().write("Processado com sucesso!");
			
		} catch (Exception e) {
			response.setStatus(500);//erro 500 = erro interno de servidor
			
			response.getWriter().write("Erro ao Processar! " + e.getMessage());
		}
	}

}
