package br.com.projetoles.controle;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.projetoles.command.ICommand;
import br.com.projetoles.dao.EnderecoDAO;
import br.com.projetoles.domain.Cliente;
import br.com.projetoles.domain.Endereco;
import br.com.projetoles.domain.EntidadeDominio;
import br.com.projetoles.domain.Pessoa;
import br.com.projetoles.domain.Result;
import br.com.projetoles.viewHelper.IViewHelper;
import br.com.projetoles.viewHelper.VHEnderecoCompras;
import br.com.projetoles.viewHelper.VHUsuarioLogin;


@WebServlet(urlPatterns = { "/enderecoCriacaoCobrancaLogin", "/enderecoCriacaoEntregaLogin","/enderecoFecharPedidoCriacaoEntregaLogin","/enderecoLeituraLogin","/enderecoAtualizacaoLogin"})
public class enderecoController extends HttpServletController {
	private static final long serialVersionUID = 1L;
       
    
    public enderecoController() {
    	super("endereco", new VHEnderecoCompras());
        
    }
    
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ICommand command = null;
		Result result = null;
		List<EntidadeDominio> resultado = new ArrayList<>();
		EntidadeDominio entity = null;
		
		

		String uri = req.getRequestURI();
		
		IViewHelper vhUsuario = getViewHelpers().get(getRequestURI(uri));
		
		String action = uri.substring(uri.lastIndexOf('/') + 1).replace("endereco", "").replace("Login", "");
		
		
		
		if(action.equals("CriacaoCobranca")) {
			entity = vhUsuario.getEntidade(req, action);
			command = this.getCommands().get(getRequestURI(action));
			result = command.executar(entity);
			vhUsuario.setView(result, req, resp, getRequestURI(action));
		}else if(action.equals("CriacaoEntrega")) {
			entity = vhUsuario.getEntidade(req, action);
			command = this.getCommands().get(getRequestURI(action));
			result = command.executar(entity);
			vhUsuario.setView(result, req, resp, getRequestURI(action));
		}
		else if(action.equals("FecharPedidoCriacaoEntrega")) {
			entity = vhUsuario.getEntidade(req, "CriacaoEntrega");
			command = this.getCommands().get(getRequestURI("CriacaoEntrega"));
			result = command.executar(entity);
			vhUsuario.setView(result, req, resp, "FecharPedidoCriacaoEntrega");
		}else if(action.equals("Leitura")) {
			entity = vhUsuario.getEntidade(req, "");
			EnderecoDAO enderecoDAO = new EnderecoDAO();
			Pessoa pessoa = new Pessoa();
			Cliente cliente = new Cliente();
			cliente.setEndereco((Endereco)entity);
			cliente.setId_cli(Integer.parseInt(cliente.getEndereco().getCli_id()));
			pessoa.setCliente(cliente);
			command = this.getCommands().get(getRequestURI("Leitura"));
			resultado = enderecoDAO.consultar(pessoa);
			req.setAttribute("result", resultado);
			req.getRequestDispatcher("/WEB-INF/EditarEnderecos.jsp").forward(req, resp);
		}else if(action.equals("Atualizacao")) {
			entity = vhUsuario.getEntidade(req, "Entrega");
			
			EnderecoDAO enderecoDAO = new EnderecoDAO();
			Pessoa pessoa = new Pessoa();
			Cliente cliente = new Cliente();
			cliente.setEndereco((Endereco)entity);
			cliente.setId_cli(Integer.parseInt(cliente.getEndereco().getCli_id()));
			pessoa.setCliente(cliente);
			command = this.getCommands().get(getRequestURI("Atualizacao"));
			enderecoDAO.alterar(pessoa);
			
			req.getRequestDispatcher("/usuarioLeituraLogin").forward(req, resp);
			
			
			
			
			
//			vhUsuario.setView(result, req, resp, "FecharPedidoCriacaoEntrega");
		}
		
		
	}

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}
	
	private String getRequestURI(String uri) {
		return uri.replace("Login", "").replace("Cobranca", "").replace("Entrega", "").replace("FecharPedido", "");
	}
	
}
