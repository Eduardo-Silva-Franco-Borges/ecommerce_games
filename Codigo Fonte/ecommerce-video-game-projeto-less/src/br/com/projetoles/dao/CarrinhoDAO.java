package br.com.projetoles.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.com.projetoles.domain.Carrinho;
import br.com.projetoles.domain.Endereco;
import br.com.projetoles.domain.EntidadeDominio;
import br.com.projetoles.domain.Pedido;
import br.com.projetoles.domain.Prestacao;

public class CarrinhoDAO extends AbstractJdbcDAO {
	
	public CarrinhoDAO() {
		super("tb_item_pedido", "id");		
	}

	
	public void salvar(EntidadeDominio entity) {
		
		
	}

	
	public void alterar(EntidadeDominio entity) {
		
		
	}

	
	public void excluir(EntidadeDominio entity) {
		
		
	}

	
	public List<EntidadeDominio> consultar(EntidadeDominio entidade) {
		
		
		
		openConnection();
		PreparedStatement pst=null;
		
		List<EntidadeDominio> resultado = new ArrayList<>();
		PedidoDAO pedidoDAO = new PedidoDAO();
		
		
		try {
			connection.setAutoCommit(false);	
					
			StringBuilder sql = new StringBuilder();
			sql.append("select distinct tb_produto.img as imagem, tb_produto.nome as nome_produto, tb_produto.descricao as descricao_produto, tb_estoque.precoCusto as precoUnico, tb_estoque.quantidade as quantidade_disponivel, tb_item_pedido.qtd as quantidade_selecionada, tb_item_pedido.id as idItemPedido,tb_pedido.id as idPedido,tb_pedido.frete as fretePedido, tb_pedido.idEndereco as idEndereco, tb_pagamento.id as idPagamento from tb_pedido left join tb_item_pedido on tb_item_pedido.idPedido = tb_pedido.id left join tb_produto on tb_produto.id = tb_item_pedido.idProduto left join tb_estoque on tb_estoque.idProduto = tb_produto.id left join tb_pagamento on tb_pagamento.idPedido = tb_pedido.id left join tb_prestacao on tb_prestacao.idPagamento = tb_pagamento.id where tb_pedido.idStatus = 0");		
					
			pst = connection.prepareStatement(sql.toString());
			ResultSet resultSet = pst.executeQuery();
			
			
			
			while(resultSet.next()) {
								
				Carrinho carrinho = new Carrinho( 
											resultSet.getString("imagem"),
											resultSet.getString("nome_produto"),
											resultSet.getString("descricao_produto"),
											resultSet.getDouble("precoUnico"),
											resultSet.getInt("quantidade_disponivel"),
											resultSet.getInt("quantidade_selecionada"),
											resultSet.getInt("idEndereco"),
											resultSet.getInt("idPagamento"),
											resultSet.getInt("idItemPedido")
											);
				carrinho.setFrete(resultSet.getInt("fretePedido"));
				carrinho.setId(resultSet.getInt("idPedido"));
				
				Prestacao prestacaoPedido = new Prestacao();
				prestacaoPedido.setIdPagamento(resultSet.getInt("idPagamento"));
				List<EntidadeDominio> prestacao = (List<EntidadeDominio>) pedidoDAO.consultarPrestacaoPedido(prestacaoPedido);
				carrinho.setPrestacao(prestacao);
				
				
				
				
				
				resultado.add(carrinho);
			}
			
			
			
			connection.commit();		
		} catch (SQLException e) {
			try {
				connection.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();			
		}finally{
			try {
				pst.close();
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		
		
		return resultado;
	}
}
