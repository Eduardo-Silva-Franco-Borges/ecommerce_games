package br.com.projetoles.controle;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.projetoles.dao.CarrinhoDAO;
import br.com.projetoles.dao.CupomDAO;
import br.com.projetoles.dao.ItemPedidoDAO;
import br.com.projetoles.dao.PedidoDAO;
import br.com.projetoles.dao.PessoaDAO;
import br.com.projetoles.domain.Carrinho;
import br.com.projetoles.domain.Cupom;
import br.com.projetoles.domain.EntidadeDominio;
import br.com.projetoles.domain.Pessoa;


@WebServlet(urlPatterns = { "/fecharPedido"})
public class fecharPedidoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public fecharPedidoController() {
        super();
    }
    
    
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    	String uri = req.getRequestURI();
    	String action = uri.substring(uri.lastIndexOf('/') + 1).replace("usuario", "").replace("Login", "");
    	
    	if(action.equals("fecharPedido")) {
    		CarrinhoDAO carrinhoDAO = new CarrinhoDAO();
    		Carrinho carrinho = new Carrinho();
    		Carrinho carri = new Carrinho();
    		Cupom cupp = new Cupom();
    		int idPedido = 0;
    		int valorDesconto = 0;
    		List<EntidadeDominio> resultCarrinho  = carrinhoDAO.consultar(carrinho);
    		
    		for (EntidadeDominio cart : resultCarrinho) {
    			carri = (Carrinho) cart;
    			idPedido = carri.getId();
    		}
    		cupp.setIdPedido(idPedido);
    		
    		
    		
    		
    		
    		PessoaDAO pessoaDAO = new PessoaDAO();
    		Pessoa pessoa = new Pessoa();
    		List<EntidadeDominio> resultPessoa  = pessoaDAO.consultar(pessoa);
    		
    		
    		Pessoa pessoaCupom = new Pessoa();
			
//			for (EntidadeDominio person : resultPessoa) {
//				pessoaCupom = (Pessoa) person;
//			}
    		
				pessoaCupom = (Pessoa) resultPessoa.get(0);
			
    		CupomDAO cupomDAO = new CupomDAO();
    		Cupom cupom = new Cupom();
    		List<EntidadeDominio> resultCupons = cupomDAO.consultar(pessoaCupom);
    		
//    		System.out.println(resultCupons);
    		
    		PedidoDAO pedidoDAO = new PedidoDAO();
    		valorDesconto = pedidoDAO.consultarValorDesconto(cupp);
    		
    		
    		req.setAttribute("resultCarrinho", resultCarrinho);
    		req.setAttribute("resultPessoa", resultPessoa);
    		req.setAttribute("resultCupons", resultCupons);
    		req.setAttribute("valorDesconto", valorDesconto);
    		
    		
    		req.getRequestDispatcher("/WEB-INF/checkOut_pedido.jsp").forward(req, resp);
    	}
    	
    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
