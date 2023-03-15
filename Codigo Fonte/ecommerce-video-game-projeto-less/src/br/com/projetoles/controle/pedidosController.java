package br.com.projetoles.controle;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.projetoles.dao.CupomDAO;
import br.com.projetoles.dao.ItemPedidoDAO;
import br.com.projetoles.dao.PedidoDAO;
import br.com.projetoles.dao.ProdutoDAO;
import br.com.projetoles.domain.Carrinho;
import br.com.projetoles.domain.Cartao;
import br.com.projetoles.domain.Cupom;
import br.com.projetoles.domain.EntidadeDominio;
import br.com.projetoles.domain.ItemPedido;
import br.com.projetoles.domain.Pagamento;
import br.com.projetoles.domain.Pedido;
import br.com.projetoles.domain.Prestacao;
import br.com.projetoles.domain.Produto;


@WebServlet(urlPatterns = { "/pedidos","/troca","/AdicionaItemCarrinho","/atualizaEnderecoEntregaPedido","/atualizaPagamentoPedido",
		"/atualizaUsoCupom","/finalizarPedido","/atualizarStatusPedido","/solicitarTroca",
		"/AtualizarItemPedidoParaTroca","/finalizarSolicitacaoTroca","/cancelarPedido","/AnalisePedidos"})
public class pedidosController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public pedidosController() {
        super();
       
    }
    
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	String uri = req.getRequestURI();
    	String action = uri.substring(uri.lastIndexOf('/') + 1).replace("usuario", "").replace("Login", "");
		
    	
    	
    	if(action.equals("pedidos")) {
			
    		Pedido pedido = new Pedido();
    		PedidoDAO pedidoDAO = new PedidoDAO();
    		
    		List<EntidadeDominio> pedidos = pedidoDAO.consultarPedidoPorClinente(pedido); 
    		req.setAttribute("pedidos", pedidos);
    		req.getRequestDispatcher("/WEB-INF/pedidos.jsp").forward(req, resp);
		
    	}else if(action.equals("solicitarTroca")) {
    		
    		
    		
    		ItemPedido itemPedido = new ItemPedido();
    		ItemPedidoDAO itemPedidoDao = new ItemPedidoDAO();
    		itemPedido.setIdPedido(Integer.parseInt(req.getParameter("idPedidoTroca")));
    		List<EntidadeDominio> itensPedidos = itemPedidoDao.consultar(itemPedido);
    		
    		req.setAttribute("itensPedidos", itensPedidos);
    		
			req.getRequestDispatcher("/WEB-INF/troca.jsp").forward(req, resp);
			
			
		}else if(action.equals("finalizarSolicitacaoTroca")) {
    		
			PedidoDAO pedidoDAO = new PedidoDAO();
			Pedido pedido = new Pedido();
			
			pedido.setIdStatusPedidoNovo(6);
			pedido.setIdPedido(Integer.parseInt(req.getParameter("idPedido")));
			
			pedidoDAO.updateStatusPedido(pedido);
			pedidoDAO.updateStatusPedidoTroca(pedido,1);
    		
			req.getRequestDispatcher("/home").forward(req, resp);
			
		}else if(action.equals("AtualizarItemPedidoParaTroca")) {
    		
    		int qtdTroca = 0;
    		
    		ItemPedido itemPedido = new ItemPedido();
    		ItemPedidoDAO itemPedidoDao = new ItemPedidoDAO();
    		itemPedido.setId(Integer.parseInt(req.getParameter("idItemPedido")));
    		
    		qtdTroca = Integer.parseInt(req.getParameter("qtdTroca"));
    		
    		
    		itemPedidoDao.atualizarItemPedidoParaTroca(itemPedido,qtdTroca);
    		
    		
    		
		}else if(action.equals("AdicionaItemCarrinho")) {
			
			Pedido pedidos = new Pedido();
			pedidos.setIdCliente(1);
			
			
			
			Produto produto = new Produto(req.getParameter("idProduto")
										 ,Double.parseDouble(req.getParameter("valorProduto")),
										 Integer.parseInt(req.getParameter("quantidade")));
			
			PedidoDAO pedidoDAO = new PedidoDAO();
			ItemPedidoDAO itemPedidoDAO = new ItemPedidoDAO();
	    	
	    	List<EntidadeDominio> result =  pedidoDAO.consultarCarrinho(pedidos);
	    	if(result.isEmpty()) {
	    		pedidoDAO.salvar(pedidos);
	    		itemPedidoDAO.salvar(pedidos.getIdPedido(),produto);
	    	} 
	    	else {
	    		Pedido pedido = new  Pedido();
	    		for (EntidadeDominio ped : result) {
	    			pedido = (Pedido) ped;
				}
	    		itemPedidoDAO.salvar(pedido.getIdPedido(),produto);
	    		System.out.println("tem pedido em carrinho");
	    	} 
	    	
			req.getRequestDispatcher("/home").forward(req, resp);
			
		}else if(action.equals("atualizaEnderecoEntregaPedido")) {
			
			Pedido pedido = new Pedido();
    		PedidoDAO pedidoDAO = new PedidoDAO();
    		pedido.setIdPedido(Integer.parseInt(req.getParameter("idPedido")));
    		pedido.setIdEndereco(Integer.parseInt(req.getParameter("idEndereco")));
    		pedidoDAO.alterar(pedido);
		}else if(action.equals("atualizaPagamentoPedido")) {
			
			Pagamento pagamento = new Pagamento();
			pagamento.setIdPedido(Integer.parseInt(req.getParameter("idPedido")));
			PedidoDAO pedidoDAO = new PedidoDAO();
			List<EntidadeDominio> result =  pedidoDAO.verificaPagamentoPedido(pagamento);
			
			
			if(result.isEmpty()) {
				
				pedidoDAO.salvarPagamento(pagamento);
				
				Prestacao prestacao = new Prestacao();
	    		prestacao.setIdCartao(Integer.parseInt(req.getParameter("idCartao")));
	    		prestacao.setQtd(Integer.parseInt(req.getParameter("quantidadePrestacao")));
	    		prestacao.setValor(Double.parseDouble(req.getParameter("valorEscolhidoPrestacao")));
	    		prestacao.setIdPagamento(pagamento.getId());
	    		pedidoDAO.salvarPagamentoPrestacao(prestacao);
	    		
			}else {
				
				Pagamento pagt  = new  Pagamento();
	    		for (EntidadeDominio pgto : result) {
	    			pagt = (Pagamento) pgto;
				}
	    		
	    		Prestacao prestacao = new Prestacao();
	    		prestacao.setIdCartao(Integer.parseInt(req.getParameter("idCartao")));
	    		prestacao.setQtd(Integer.parseInt(req.getParameter("quantidadePrestacao")));
	    		prestacao.setValor(Double.parseDouble(req.getParameter("valorEscolhidoPrestacao")));
	    		prestacao.setIdPagamento(pagt.getId());
	    		pedidoDAO.salvarPagamentoPrestacao(prestacao);
	    		
				
			}
			
			
		}else if(action.equals("atualizaUsoCupom")) {
			
			Cupom cupom = new Cupom();
			Pedido pedido = new Pedido();
    		PedidoDAO pedidoDAO = new PedidoDAO();
    		CupomDAO cupomDAO = new CupomDAO();
    		
    		cupom.setId(Integer.parseInt(req.getParameter("idCupom")));
    		cupom.setAtivo(Integer.parseInt(req.getParameter("novoStatusCupom")));
    		cupom.setIdPedido(Integer.parseInt(req.getParameter("idPedido")));
    		
    		cupomDAO.alterar(cupom);
    		Cupom cupomPesquisado = cupomDAO.consultarEspecifico(cupom);
    		
    		cupomPesquisado.setIdPedido(Integer.parseInt(req.getParameter("idPedido")));
    		
    		int valorDesconto = 0;
    		valorDesconto = pedidoDAO.consultarValorDesconto(cupomPesquisado);
    		if(cupom.getAtivo() == 0) {
    			cupomPesquisado.setValor(cupomPesquisado.getValor()+valorDesconto);
    		}else {
    			if(cupomPesquisado.getValor()>valorDesconto) {
    				cupomPesquisado.setValor(cupomPesquisado.getValor()-valorDesconto);
    			}else {
    				cupomPesquisado.setValor(valorDesconto- cupomPesquisado.getValor());
    			}
    			
    		}
    		pedidoDAO.alterarDesconto(cupomPesquisado);
		}else if(action.equals("finalizarPedido")) {
			
			
			Pedido pedido = new Pedido();
			PedidoDAO pedidoDAO = new PedidoDAO();
			pedido.setPrecoTotal(Double.parseDouble(req.getParameter("valorProdutos")));
			pedido.setFrete(Double.parseDouble(req.getParameter("valorFrete")));
			pedido.setIdPedido(Integer.parseInt(req.getParameter("idPedido")));
			
			
			pedidoDAO.updateFecharPedido(pedido);
		}
		else if(action.equals("cancelarPedido")) {
			
			Pedido pedido = new Pedido();
			PedidoDAO pedidoDAO = new PedidoDAO();
			ItemPedidoDAO itemPedidoDAO = new ItemPedidoDAO();
			pedido.setIdPedido(Integer.parseInt(req.getParameter("id_pedido")));
			pedido.setIdStatusPedidoAntigo(5);
			pedido.setIdStatusPedidoNovo(9);
			
			
			pedidoDAO.updateStatusPedido(pedido);
			
			pedidoDAO.updateStatusPedidoTroca(pedido,2);
			
			itemPedidoDAO.updateStatusItemPedidoTroca(pedido,2);
			
			
		}
    	
		else if(action.equals("AnalisePedidos")) {
			
			
			String dtPesquisaInicio = req.getParameter("txtDtInicio");
			String dtPesquisaFim = req.getParameter("txtDtFim");
			String idStatusPesquisa = req.getParameter("txtStatus");
			
			if (idStatusPesquisa == null)idStatusPesquisa = "0";
			if (idStatusPesquisa == "")idStatusPesquisa = "0";
			
			
			
			PedidoDAO pedidoDAO = new PedidoDAO();
			Pedido pedido = new Pedido();
			pedido.setDtPesquisaInicio(dtPesquisaInicio);
			pedido.setDtPesquisaFim(dtPesquisaFim);
			pedido.setIdStatus(Integer.parseInt(idStatusPesquisa));
			List<EntidadeDominio> pedidos;
			pedidos = pedidoDAO.AnalisePedido(pedido);
			
			req.setAttribute("pedidos", pedidos);
			req.setAttribute("dataInicio", dtPesquisaInicio);
			req.setAttribute("dataFim", dtPesquisaFim);
			req.getRequestDispatcher("/WEB-INF/AnalisePedidos.jsp").forward(req, resp);
			
		}
    	
		else if(action.equals("atualizarStatusPedido")) {
			
			
			Pedido pedido = new Pedido();
			PedidoDAO pedidoDAO = new PedidoDAO();
			ItemPedidoDAO itemPedidoDAO = new ItemPedidoDAO();
			ItemPedido itemPedido = new ItemPedido();
			itemPedido.setIdPedido(Integer.parseInt(req.getParameter("id_pedido")));
			pedido.setIdPedido(Integer.parseInt(req.getParameter("id_pedido")));
			pedido.setIdStatusPedidoAntigo(Integer.parseInt(req.getParameter("antigo_status_pedido_id")));
			pedido.setIdStatusPedidoNovo(Integer.parseInt(req.getParameter("novo_status_pedido_id")));
			
			pedido.setTroca(Integer.parseInt(req.getParameter("identificacaoTroca")));
			
			
			try {
				
				if(pedido.getIdStatusPedidoAntigo() == 1 && pedido.getIdStatusPedidoNovo() == 2) {
					// atualiza o status e da baixa no estoque - proximo status só pode ser pagamento realizado
					pedidoDAO.updateStatusPedido(pedido);
					pedidoDAO.realizarBaixaEmEstoque(pedido);
					
					
				}else if(pedido.getIdStatusPedidoAntigo() == 2 && pedido.getIdStatusPedidoNovo() == 3) {
					// atualiza o status para enviado para transportadora
					pedidoDAO.updateStatusPedido(pedido);
					
					
				}else if(pedido.getIdStatusPedidoAntigo() == 3 && pedido.getIdStatusPedidoNovo() == 4) {
					// atualiza o status para em transporte
					pedidoDAO.updateStatusPedido(pedido);
					
					
				}else if(pedido.getIdStatusPedidoAntigo() == 4 && pedido.getIdStatusPedidoNovo() == 5) {
					// atualiza o status para entregue
					pedidoDAO.updateStatusPedido(pedido);
					
					
				}else if(pedido.getIdStatusPedidoAntigo() == 6 && pedido.getIdStatusPedidoNovo() == 7) {
					// atualiza o status para troca recusada e retira trocas do pedido e item pedido
					pedidoDAO.updateStatusPedido(pedido);
					pedidoDAO.retiraPedidoTroca(pedido);
					itemPedidoDAO.retiraPedidoTroca(pedido);
					
				}else if(pedido.getIdStatusPedidoAntigo() == 6 && pedido.getIdStatusPedidoNovo() == 8) {
					// atualiza o status para troca aceita
					pedidoDAO.updateStatusPedido(pedido);
					
					
				}else if(pedido.getIdStatusPedidoAntigo() == 8 && pedido.getIdStatusPedidoNovo() == 9) {
					// atualiza o status para produto enviado para troca cancelamento
					pedidoDAO.updateStatusPedido(pedido);
					
					
				}else if(pedido.getIdStatusPedidoAntigo() == 9 && pedido.getIdStatusPedidoNovo() == 10) {
					// atualiza o status para produto recebido para troca cancelamento
					List<EntidadeDominio> itensPedido = new ArrayList<>();
					CupomDAO cupomDAO = new CupomDAO();
					Cupom cupom = new Cupom();
					double valorCupomTrocaCancelamento = 0;
					
					pedidoDAO.realizarEntradaEmEstoque(pedido);
					itensPedido = itemPedidoDAO.consultarTrocaCancelamento(itemPedido,pedido);
					ItemPedido p = new  ItemPedido();
		    		for (EntidadeDominio it : itensPedido) {
		    			p = (ItemPedido) it;
		    			if(p.getTroca() == 1) valorCupomTrocaCancelamento += p.getPrecoUnico() *  p.getQtdtroca();
		    			if(p.getTroca() == 2) valorCupomTrocaCancelamento += p.getPrecoUnico() *  p.getQtd();
		    			
					}
		    		
		    		if(valorCupomTrocaCancelamento > 0) {
		    			
		    			String nomeCupom = "";
		    			
		    			nomeCupom = "troca"+valorCupomTrocaCancelamento;
		    			
		    			cupom.setAtivo(1);
		    			cupom.setIdCliente(1);
		    			cupom.setNomeCupom(nomeCupom);
		    			cupom.setValor(valorCupomTrocaCancelamento);
		    			
		    			cupomDAO.salvar(cupom);
		    			
		    		}
		    		
		    		
					
					
					pedidoDAO.updateStatusPedido(pedido);
					
					
				}else if(pedido.getIdStatusPedidoAntigo() == 10 && pedido.getIdStatusPedidoNovo() == 11) {
					// atualiza o status para troca cancelamento realizado
					pedidoDAO.updateStatusPedido(pedido);
					
					
				}else {
					Exception e = null;
					throw e;
				}
				
			} catch (Exception e) {
				
				PrintWriter pw =   resp.getWriter();
				pw.println(1);
			}
			
			
			
			
			
			

		}
    	
    	
		
	
    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
