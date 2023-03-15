package br.com.projetoles.controle;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.projetoles.dao.PedidoDAO;
import br.com.projetoles.dao.ProdutoDAO;
import br.com.projetoles.domain.EntidadeDominio;
import br.com.projetoles.domain.Pedido;
import br.com.projetoles.domain.Produto;


@WebServlet(urlPatterns = { "/produtosLeitura","/produtosSalvar","/produtosAtualizar","/produtosAtivar","/produtosInativar"})
public class produtosController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public produtosController() {
        super();
        
    }
    
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	String uri = req.getRequestURI();
    	String action = uri.substring(uri.lastIndexOf('/') + 1).replace("produtos", "");
		
    	
    	
    	
    	if(action.equals("Leitura")) {
    		List<EntidadeDominio> produtos = null;
    		
    		Produto produto = new Produto();
    		ProdutoDAO produtoDAO = new ProdutoDAO();
    		produtos = produtoDAO.consultar(produto);
    		
    		req.setAttribute("produtos", produtos);
    		req.getRequestDispatcher("/WEB-INF/products.jsp").forward(req, resp);
    	}else if(action.equals("Salvar")) {
    		
    		Produto produtoFront = new Produto();
        	produtoFront.setNome(req.getParameter("txtNomeProduto"));
        	produtoFront.setDescricao(req.getParameter("txtDescricao"));
        	produtoFront.setIdCategoriaProduto(req.getParameter("txtCategoria"));
        	produtoFront.setFabricante(req.getParameter("txtFabricante"));
        	produtoFront.setFornecedor(req.getParameter("txtfornecedor"));
        	produtoFront.setGrupoPrecificacao(req.getParameter("txtGrupoPrecificacao"));
        	produtoFront.setCodBarras(req.getParameter("txtCodigoBarras"));
        	produtoFront.setImg(req.getParameter("txtFotoProduto"));
        	
        	
        	produtoFront.setPrecoCusto(Double.parseDouble(req.getParameter("txtPreco")));
        	produtoFront.setQuantidade(Integer.parseInt(req.getParameter("txtQuantidade")));
        	
        	ProdutoDAO produtoDAO = new ProdutoDAO();
        	produtoDAO.salvar(produtoFront);
        	produtoDAO.salvarEstoque(produtoFront);
        	
        	
        	
    		
    		req.getRequestDispatcher("produtosLeitura").forward(req, resp);
    			
    	}
    	else if(action.equals("Atualizar")) {
    		
    		Produto produtoFront = new Produto();
        	produtoFront.setNome(req.getParameter("txtNomeProduto"));
        	produtoFront.setDescricao(req.getParameter("txtDescricao"));
        	produtoFront.setIdCategoriaProduto(req.getParameter("txtCategoria"));
        	produtoFront.setFabricante(req.getParameter("txtFabricante"));
        	produtoFront.setFornecedor(req.getParameter("txtfornecedor"));
        	produtoFront.setGrupoPrecificacao(req.getParameter("txtGrupoPrecificacao"));
        	produtoFront.setCodBarras(req.getParameter("txtCodigoBarras"));
        	produtoFront.setImg(req.getParameter("txtFotoProduto"));
        	produtoFront.setAtivo(req.getParameter("txtStatusProduto"));
        	produtoFront.setIdProduto(req.getParameter("txtIdProduto"));
        	produtoFront.setPrecoCusto(Double.parseDouble(req.getParameter("txtPreco")));
        	produtoFront.setQuantidade(Integer.parseInt(req.getParameter("txtQuantidade")));
        	
        	ProdutoDAO produtoDAO = new ProdutoDAO();
        	produtoDAO.alterar(produtoFront);
        	produtoDAO.alterarEstoque(produtoFront);
    		
    		req.getRequestDispatcher("produtosLeitura").forward(req, resp);
    	}else if(action.equals("Ativar")) {
    		
    		Produto produtoFront = new Produto();
        	produtoFront.setIdProduto(req.getParameter("txtIdProduto"));
        	produtoFront.setMotivoAtivacao(req.getParameter("txtMotivo"));
        	
        	ProdutoDAO produtoDAO = new ProdutoDAO();
        	produtoDAO.produtoAtivar(produtoFront);
    	
    		req.getRequestDispatcher("produtosLeitura").forward(req, resp);
    			
    	}
    	else if(action.equals("Inativar")) {
    		
    		Produto produtoFront = new Produto();
        	produtoFront.setIdProduto(req.getParameter("txtIdProduto"));
        	produtoFront.setMotivoInativacao(req.getParameter("txtMotivo"));
        	
        	ProdutoDAO produtoDAO = new ProdutoDAO();
        	produtoDAO.produtoInativar(produtoFront);
        	
    		req.getRequestDispatcher("produtosLeitura").forward(req, resp);
    			
    	}
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
