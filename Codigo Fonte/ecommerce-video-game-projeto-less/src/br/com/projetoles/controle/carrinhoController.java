package br.com.projetoles.controle;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.jasper.tagplugins.jstl.core.Out;

import br.com.projetoles.dao.CarrinhoDAO;
import br.com.projetoles.dao.ItemPedidoDAO;
import br.com.projetoles.domain.Carrinho;
import br.com.projetoles.domain.EntidadeDominio;


@WebServlet(urlPatterns = { "/carrinho","/alterarQuantidadeCarrinho","/exluirQuantidadeCarrinho"})
public class carrinhoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public carrinhoController() {
        super();
        
    }
    
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	
    	
    	String uri = req.getRequestURI();
    	String action = uri.substring(uri.lastIndexOf('/') + 1).replace("usuario", "").replace("Login", "");
    	if(action.equals("carrinho")) {
    		
    		CarrinhoDAO carrinhoDAO = new CarrinhoDAO();
    		Carrinho carrinho = new Carrinho();
    		List<EntidadeDominio> result  = carrinhoDAO.consultar(carrinho);
    		req.setAttribute("result", result);
    		   		
    		req.getRequestDispatcher("/WEB-INF/cart.jsp").forward(req, resp);
    	}else if(action.equals("fecharPedido")) {
    		req.getRequestDispatcher("/WEB-INF/checkOut_pedido.jsp").forward(req, resp);
    	}else if(action.equals("alterarQuantidadeCarrinho")) {
    		
    		
    		Carrinho carrinho = new Carrinho();
    		ItemPedidoDAO itemPedidoDAO = new ItemPedidoDAO();
    		carrinho.setIdItemPedido(Integer.parseInt(req.getParameter("idItemPedido")));
    		carrinho.setQuantidade_selecionada(Integer.parseInt(req.getParameter("quantidadeEscolhidaItem")));
    		itemPedidoDAO.alterar(carrinho);
    	}
    	else if(action.equals("exluirQuantidadeCarrinho")) {
    		
    		
    		Carrinho carrinho = new Carrinho();
    		ItemPedidoDAO itemPedidoDAO = new ItemPedidoDAO();
    		carrinho.setIdItemPedido(Integer.parseInt(req.getParameter("idItemPedido")));
    		itemPedidoDAO.excluir(carrinho);
    	}
    	
		
	
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
