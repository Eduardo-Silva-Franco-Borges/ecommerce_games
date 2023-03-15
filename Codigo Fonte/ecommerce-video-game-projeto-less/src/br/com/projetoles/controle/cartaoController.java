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
import br.com.projetoles.dao.CartaoDAO;
import br.com.projetoles.domain.Cartao;
import br.com.projetoles.domain.Cliente;
import br.com.projetoles.domain.Endereco;
import br.com.projetoles.domain.EntidadeDominio;
import br.com.projetoles.domain.Pessoa;
import br.com.projetoles.domain.Result;
import br.com.projetoles.viewHelper.IViewHelper;
import br.com.projetoles.viewHelper.VHCartao;
import br.com.projetoles.viewHelper.VHUsuarioLogin;


@WebServlet(urlPatterns = { "/cartaoCriacao","/cartaoLeitura","/cartaoAtualizacao","/cartaoCriacaoFecharPedido"})
public class cartaoController extends HttpServletController {
	private static final long serialVersionUID = 1L;
       
    
    public cartaoController() {
        super("cartao" ,new VHCartao());
        
    }

    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ICommand command = null;
		Result result = null;
		List<EntidadeDominio> resultado = new ArrayList<>();
		EntidadeDominio entity = null;
		

		String uri = req.getRequestURI();
		
		IViewHelper vhCartao = getViewHelpers().get(getRequestURI(uri));
		
		String action = uri.substring(uri.lastIndexOf('/') + 1).replace("cartao", "").replace("Login", "");
		
		
		
		if(action.equals("Criacao")) {
			entity = vhCartao.getEntidade(req, action);
			command = this.getCommands().get(action);
			
			result = command.executar(entity);
			vhCartao.setView(result, req, resp, action);
		}
		if(action.equals("Atualizacao")) {
			entity = vhCartao.getEntidade(req, action);
			command = this.getCommands().get(action);
			
			result = command.executar(entity);
			vhCartao.setView(result, req, resp, action);
		}
		else if(action.equals("CriacaoFecharPedido")) {
			
			entity = vhCartao.getEntidade(req, "Criacao");
			command = this.getCommands().get("Criacao");
			result = command.executar(entity);
			vhCartao.setView(result, req, resp, "CriacaoFecharPedido");
		}
		
		else if(action.equals("Leitura")) {
			
			entity = vhCartao.getEntidade(req, "Leitura");
			command = this.getCommands().get("Leitura");
			CartaoDAO cartaoDAO = new CartaoDAO();
			Cartao cartao = new Cartao();
			cartao = (Cartao)entity;
			Pessoa pessoa = new Pessoa();
			Cliente cliente = new Cliente();
			cliente.setId_cli(cartao.getCli_id());
			pessoa.setCliente(cliente);
			resultado = cartaoDAO.consultar(pessoa);
			
			
			req.setAttribute("result", resultado);
			req.getRequestDispatcher("/WEB-INF/EditarCartoes.jsp").forward(req, resp);
		}
		
		
		
	}
    
    
    
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}
	
	private String getRequestURI(String uri) {
		return uri.replace("Login", "").replace("FecharPedido", "");
	}

}
