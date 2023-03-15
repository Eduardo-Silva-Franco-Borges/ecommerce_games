package br.com.projetoles.controle;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.projetoles.command.ICommand;
import br.com.projetoles.domain.EntidadeDominio;
import br.com.projetoles.domain.Result;
import br.com.projetoles.viewHelper.IViewHelper;
import br.com.projetoles.viewHelper.VHUsuarioLogin;




@WebServlet(urlPatterns = { "/usuarioCriacaoLogin","/usuarioLeituraLogin","/usuarioAtualizacaoLogin"})
public class usuarioControllerLogin extends HttpServletController {
	private static final long serialVersionUID = 1L;
       
    
    public usuarioControllerLogin() {
        super("usuario", new VHUsuarioLogin());
        
    }
    
    
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ICommand command = null;
		Result result = null;
		EntidadeDominio entity = null;
		

		String uri = req.getRequestURI();
		
		IViewHelper vhUsuario = getViewHelpers().get(getRequestURI(uri));
		
		String action = uri.substring(uri.lastIndexOf('/') + 1).replace("usuario", "").replace("Login", "");
		
		
		
		if(!(req.getParameter("txtName") == null)) {
			entity = vhUsuario.getEntidade(req, action);
			command = this.getCommands().get(action);
			result = command.executar(entity);
			
		}else if(action.equals("Leitura")) {
			
			entity = vhUsuario.getEntidade(req, action);
			command = this.getCommands().get(action);
			result = command.executar(entity);
		}
		
		
		
		
		
		
		
		vhUsuario.setView(result, req, resp, action);
	}

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}
	
	private String getRequestURI(String uri) {
		return uri.replace("Login", "");
	}

}
