package br.com.projetoles.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.com.projetoles.domain.Carrinho;
import br.com.projetoles.domain.Cartao;
import br.com.projetoles.domain.Cliente;
import br.com.projetoles.domain.Cupom;
import br.com.projetoles.domain.Documento;
import br.com.projetoles.domain.Endereco;
import br.com.projetoles.domain.EntidadeDominio;
import br.com.projetoles.domain.ItemPedido;
import br.com.projetoles.domain.Pagamento;
import br.com.projetoles.domain.Pedido;
import br.com.projetoles.domain.Pessoa;
import br.com.projetoles.domain.Prestacao;
import br.com.projetoles.domain.TipoCliente;
import br.com.projetoles.domain.TipoDocumento;

public class PedidoDAO extends AbstractJdbcDAO {
	
	public PedidoDAO() {
		super("tb_pedido", "id");		
	}

	
	public void salvar(EntidadeDominio entidade) {
		openConnection();
		
		PreparedStatement pst = null;
		Pedido pedido = (Pedido) entidade;
		StringBuilder sql = new StringBuilder();
		
		sql.append("INSERT INTO tb_pedido(idStatus,idCliente,idEndereco,precoTotal,desconto,frete)");
		sql.append(" VALUES (?,?, ?, ?, ?, ?)");

		
		try {
			connection.setAutoCommit(false);
			
			pst = connection.prepareStatement(sql.toString(), 
					pst.RETURN_GENERATED_KEYS);
			
			
			pst.setInt(1, pedido.getIdStatus());
			pst.setInt(2, pedido.getIdCliente());
			pst.setInt(3, pedido.getIdEndereco());
			pst.setDouble(4, pedido.getPrecoTotal());
			pst.setDouble(5, pedido.getDesconto());
			pst.setDouble(6, pedido.getFrete());
			
			
		
			pst.executeUpdate();		
					
			ResultSet rs = pst.getGeneratedKeys();
			int idPedido=0;
			if(rs.next())
				idPedido = rs.getInt(1);
			pedido.setIdPedido(idPedido);
			
			connection.commit();					
		} catch (SQLException e) {
			try {
				connection.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();	
		}finally{
			if(ctrlTransaction){
				try {
					pst.close();
					if(ctrlTransaction)
						connection.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			
		}
	}
	
	
	
	public List<EntidadeDominio> consultarPedidoPorClinente(EntidadeDominio entidade) {
		openConnection();
		PreparedStatement pst=null;
		List<EntidadeDominio> resultado = new ArrayList<>();
		
		
		
		try {
			connection.setAutoCommit(false);	
					
			StringBuilder sql = new StringBuilder();
			sql.append("select tb_pedido.dt_cadastro as data_pedido,tb_pedido.idStatus as status_pedido,tb_pedido_status.descricao as status_pedido_descicao,tb_pedido.desconto as valor_desconto,tb_pedido.frete as valor_frete,tb_pedido.precoTotal as valorTotalProdutos,tb_endereco.nome_endereco as nome_endereco,tb_endereco.tipo_endereco_compra as tipo_endereco,tb_endereco.tipo_rua as tipo_logradouro,tb_endereco.rua as nome_rua, tb_endereco.numero as numero, tb_endereco.cep, tb_endereco.cidade,tb_pedido.id as idPedido ,tb_pedido.troca as troca from tb_pedido left join tb_pedido_status on tb_pedido_status.id = tb_pedido.idStatus  left join tb_endereco on tb_endereco.id_end = tb_pedido.idEndereco where tb_pedido.idCliente = 1;");		
					
			pst = connection.prepareStatement(sql.toString());
			
			ItemPedidoDAO itemPedidoDAO = new ItemPedidoDAO();
			ItemPedido itemPedido = new ItemPedido();
			
			Cartao cartao = new Cartao(); 
			CartaoDAO cartaoDAO = new CartaoDAO(); 
			
			ResultSet resultSet = pst.executeQuery();
			
			
			
			while(resultSet.next()) {
								
				Pedido ped  = new Pedido();
				
				ped.setDt_cadastro(resultSet.getDate("data_pedido"));
				
				ped.setIdStatus(resultSet.getInt("status_pedido"));
				
				ped.setNome_Status(resultSet.getString("status_pedido_descicao"));
				
				ped.setDesconto(resultSet.getDouble("valor_desconto"));
				
				ped.setFrete(resultSet.getDouble("valor_frete"));
				
				ped.setPrecoTotal(resultSet.getDouble("valorTotalProdutos"));
				
				ped.setNome_endereco(resultSet.getString("nome_endereco"));
				
				ped.setTipo_endereco(resultSet.getString("tipo_endereco"));
				
				ped.setTipo_logradour(resultSet.getString("tipo_logradouro"));
				
				ped.setLogradour(resultSet.getString("nome_rua"));
				
				ped.setNumero_endereco(resultSet.getString("numero"));
				
				ped.setCep(resultSet.getString("cep"));
				
				ped.setCidade(resultSet.getString("cidade"));
				ped.setIdPedido(resultSet.getInt("idPedido"));
				
				itemPedido.setIdPedido(resultSet.getInt("idPedido"));
				ped.setItemPedido(itemPedidoDAO.consultar(itemPedido));
				
				cartao.setIdPedido(resultSet.getInt("idPedido"));
				ped.setCartoes(cartaoDAO.consultarCartoesPedido(cartao));
				
				ped.setTroca(resultSet.getInt("troca"));
				
				resultado.add(ped);
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
	
	
	
	public void salvarPagamento(EntidadeDominio entidade) {
		openConnection();
		
		PreparedStatement pst = null;
		Pagamento pagamento = (Pagamento) entidade;
		StringBuilder sql = new StringBuilder();
		
		sql.append("INSERT INTO tb_pagamento(idPedido)");
		sql.append(" VALUES (?)");

		
		try {
			connection.setAutoCommit(false);
			
			pst = connection.prepareStatement(sql.toString(), 
					pst.RETURN_GENERATED_KEYS);
			
			
			pst.setInt(1, pagamento.getIdPedido());
					
			
		
			pst.executeUpdate();		
					
			ResultSet rs = pst.getGeneratedKeys();
			int idPagamento=0;
			if(rs.next())
				idPagamento = rs.getInt(1);
			pagamento.setId(idPagamento);
			
			connection.commit();					
		} catch (SQLException e) {
			try {
				connection.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();	
		}finally{
			if(ctrlTransaction){
				try {
					pst.close();
					if(ctrlTransaction)
						connection.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			
		}
	}
	
	
	
	
	
	
	
	
	public void salvarPagamentoPrestacao(EntidadeDominio entidade) {
		openConnection();
		
		PreparedStatement pst = null;
		Prestacao prestacao = (Prestacao) entidade;
		StringBuilder sql = new StringBuilder();
		
		sql.append("INSERT INTO tb_prestacao(idCartao,idPagamento,valor,qtd)");
		sql.append(" VALUES (?,?,?,?)");

		
		try {
			connection.setAutoCommit(false);
			
			pst = connection.prepareStatement(sql.toString(), 
					pst.RETURN_GENERATED_KEYS);
			
			
			pst.setInt(1, prestacao.getIdCartao());
			pst.setInt(2, prestacao.getIdPagamento());
			pst.setDouble(3, prestacao.getValor());
			pst.setInt(4, prestacao.getQtd());
					
			
		
			pst.executeUpdate();		
					
			ResultSet rs = pst.getGeneratedKeys();
			int idPrestacao=0;
			if(rs.next())
				idPrestacao = rs.getInt(1);
			prestacao.setId(idPrestacao);
			
			connection.commit();					
		} catch (SQLException e) {
			try {
				connection.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();	
		}finally{
			if(ctrlTransaction){
				try {
					pst.close();
					if(ctrlTransaction)
						connection.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			
		}
	}

	public void updateStatusPedido(EntidadeDominio entity) {
		openConnection();
		PreparedStatement pst=null;
		
		Pedido pedido = (Pedido) entity;
		
		
		try {
			connection.setAutoCommit(false);	
				
					
			StringBuilder sql = new StringBuilder();
			sql.append("UPDATE tb_pedido SET idStatus = ? WHERE id = ?");	
					
			pst = connection.prepareStatement(sql.toString());
			pst.setDouble(1, pedido.getIdStatusPedidoNovo());
			pst.setInt(2, pedido.getIdPedido());
			
			
			//System.out.println(gerentePJ.getId());
			
			pst.executeUpdate();
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
	}
	
	
	public void retiraPedidoTroca(EntidadeDominio entity) {
		openConnection();
		PreparedStatement pst=null;
		
		Pedido pedido = (Pedido) entity;
		
		
		try {
			connection.setAutoCommit(false);	
				
					
			StringBuilder sql = new StringBuilder();
			sql.append("UPDATE tb_pedido SET troca = ? WHERE id = ?");	
					
			pst = connection.prepareStatement(sql.toString());
			pst.setDouble(1, 0);
			pst.setInt(2, pedido.getIdPedido());
			
			
			//System.out.println(gerentePJ.getId());
			
			pst.executeUpdate();
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
	}
	
	
	
	
	public void updateStatusPedidoTroca(EntidadeDominio entity,int numeral) {
		openConnection();
		PreparedStatement pst=null;
		
		Pedido pedido = (Pedido) entity;
		
		
		try {
			connection.setAutoCommit(false);	
				
					
			StringBuilder sql = new StringBuilder();
			sql.append("UPDATE tb_pedido SET troca = ? WHERE id = ?");	
					
			pst = connection.prepareStatement(sql.toString());
			pst.setDouble(1, numeral);
			pst.setInt(2, pedido.getIdPedido());
			
			
			//System.out.println(gerentePJ.getId());
			
			pst.executeUpdate();
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
	}
	
	public void alterarDesconto(EntidadeDominio entity) {
		openConnection();
		PreparedStatement pst=null;
		
		Cupom cupom = (Cupom) entity;
		
		
		try {
			connection.setAutoCommit(false);	
				
					
			StringBuilder sql = new StringBuilder();
			sql.append("UPDATE tb_pedido SET desconto = ? WHERE id = ?");	
					
			pst = connection.prepareStatement(sql.toString());
			pst.setDouble(1, cupom.getValor());
			pst.setInt(2, cupom.getIdPedido());
			
			
			//System.out.println(gerentePJ.getId());
			
			pst.executeUpdate();
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
	}
	public void alterar(EntidadeDominio entity) {
		openConnection();
		PreparedStatement pst=null;
		
		Pedido pedido = (Pedido) entity;
		
		
		try {
			connection.setAutoCommit(false);	
				
					
			StringBuilder sql = new StringBuilder();
			sql.append("UPDATE tb_pedido SET idEndereco = ? WHERE id = ?");	
					
			pst = connection.prepareStatement(sql.toString());
			pst.setInt(1, pedido.getIdEndereco());
			pst.setInt(2, pedido.getIdPedido());
			
			
			//System.out.println(gerentePJ.getId());
			
			pst.executeUpdate();
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
	}
	
	
	
	
	
	public void updateFecharPedido(EntidadeDominio entity) {
		openConnection();
		PreparedStatement pst=null;
		
		Pedido pedido = (Pedido) entity;
		
		
		try {
			connection.setAutoCommit(false);	
				
					
			StringBuilder sql = new StringBuilder();
			sql.append("UPDATE tb_pedido SET idStatus = ?, precoTotal = ?, frete = ? WHERE id = ?");	
					
			pst = connection.prepareStatement(sql.toString());
			pst.setInt(1, 1);
			pst.setDouble(2, pedido.getPrecoTotal());
			pst.setDouble(3, pedido.getFrete());
			pst.setInt(4, pedido.getIdPedido());
			
			
			
			
			pst.executeUpdate();
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
	}
	
	
	
	
	public void excluir(EntidadeDominio entity) {
		
	}
	
	
	public List<EntidadeDominio> realizarBaixaEmEstoque(EntidadeDominio entidade) {
		
		openConnection();
		PreparedStatement pst=null;
		List<EntidadeDominio> resultado = new ArrayList<>();
		List<EntidadeDominio> itensPedido = new ArrayList<>();
		int quantidade_disponivel = 0;
		
		Pedido pedido = (Pedido) entidade;
		ItemPedidoDAO itemPedidoDao = new ItemPedidoDAO();
		ItemPedido itemPedido = new ItemPedido();
		itemPedido.setIdPedido(pedido.getIdPedido());
		
		itensPedido = itemPedidoDao.consultar(itemPedido);
		
		try {
			connection.setAutoCommit(false);	
					
//			StringBuilder sql = new StringBuilder();
//			sql.append("select * from tb_pagamento where idPedido = ?;");		
//					
//			pst = connection.prepareStatement(sql.toString());
//			pst.setInt(1, pagamento.getIdPedido());
//			ResultSet resultSet = pst.executeQuery();
//			
//			
//			
//			while(resultSet.next()) {
//								
//				Pagamento pgto  = new Pagamento();
//				pgto.setId(resultSet.getInt("id"));
//				pgto.setIdPedido(resultSet.getInt("idPedido"));
//				
//				resultado.add(pgto);
//			}
			
			for (EntidadeDominio itp :itensPedido) {
				
				ItemPedido itPedido =  (ItemPedido) itp;
				
				StringBuilder sql = new StringBuilder();
				sql.append("select quantidade as quantidade_disponivel from tb_estoque where idProduto = ?");		
						
				pst = connection.prepareStatement(sql.toString());
				pst.setInt(1, itPedido.getIdProduto());
				ResultSet resultSet = pst.executeQuery();
				
				
				while(resultSet.next()) {
					
					quantidade_disponivel = resultSet.getInt("quantidade_disponivel");	
				}
				
				
				
				if(quantidade_disponivel > 0) {
					
					StringBuilder sqlEstoque = new StringBuilder();
					sqlEstoque.append("UPDATE tb_estoque SET quantidade = ? WHERE idProduto = ?");	
					
					pst = connection.prepareStatement(sqlEstoque.toString());
					pst.setInt(1, (quantidade_disponivel - itPedido.getQtd()));
					pst.setInt(2, itPedido.getIdProduto());
					
					pst.executeUpdate();
				}
				
					
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
	
	
	
public List<EntidadeDominio> AnalisePedido(EntidadeDominio entidade) {
		
		openConnection();
		PreparedStatement pst=null;
		List<EntidadeDominio> resultado = new ArrayList<>();
		
		
		Pedido pedido = (Pedido) entidade;
		
		try {
			connection.setAutoCommit(false);	
					
				
				StringBuilder sql = new StringBuilder();
				sql.append("select  count( distinct tb_pedido.id) as totalVendido,  count( distinct jogosPlaystation.qtd) as jogosPlaystation, count( distinct jogosXbox.qtd )as jogosXbox, count( distinct jogosNintendo.qtd )as jogosNintendo, date(tb_pedido.dt_cadastro ) as dataPedido from  tb_pedido left join tb_item_pedido on tb_item_pedido.idPedido = tb_pedido.id left join tb_produto on tb_produto.id = tb_item_pedido.idProduto left join ( select  tb_pedido.id as qtd, tb_pedido.dt_cadastro cadastro from tb_pedido  left join tb_item_pedido on tb_item_pedido.idPedido = tb_pedido.id  left join tb_produto on tb_produto.id = tb_item_pedido.idProduto  where  tb_produto.idCategoriaProduto = 1 ) as jogosPlaystation on date(jogosPlaystation.cadastro) = date(tb_pedido.dt_cadastro) left join ( select  tb_pedido.id as qtd, tb_pedido.dt_cadastro cadastro from tb_pedido  left join tb_item_pedido on tb_item_pedido.idPedido = tb_pedido.id  left join tb_produto on tb_produto.id = tb_item_pedido.idProduto where  tb_produto.idCategoriaProduto = 2 ) as jogosXbox on date(jogosXbox.cadastro) = date(tb_pedido.dt_cadastro) left join ( select  tb_pedido.id as qtd, tb_pedido.dt_cadastro cadastro from tb_pedido  left join tb_item_pedido on tb_item_pedido.idPedido = tb_pedido.id  left join tb_produto on tb_produto.id = tb_item_pedido.idProduto where tb_produto.idCategoriaProduto = 3 ) as jogosNintendo on date(jogosNintendo.cadastro) = date(tb_pedido.dt_cadastro) where date(tb_pedido.dt_cadastro) between ? and ?");
						if(pedido.getIdStatus() != 0) sql.append( " and tb_pedido.idStatus = ? ");
								sql.append( " group by date(tb_pedido.dt_cadastro) ");		
						
				pst = connection.prepareStatement(sql.toString());
				
				pst.setString(1, pedido.getDtPesquisaInicio());
				pst.setString(2, pedido.getDtPesquisaFim());
				if(pedido.getIdStatus() != 0)pst.setInt(3, pedido.getIdStatus());
				
				
				ResultSet resultSet = pst.executeQuery();
				
				
				while(resultSet.next()) {
					
					Pedido ped  = new Pedido();
					ped.setTotalPedidos(resultSet.getInt("totalVendido"));
					ped.setPedidosPlaystation(resultSet.getInt("jogosPlaystation"));
					ped.setPedidosXbox(resultSet.getInt("jogosXbox"));
					ped.setPedidosNintento(resultSet.getInt("jogosNintendo"));
					ped.setDt_cadastro(resultSet.getDate("dataPedido"));
					
					
					resultado.add(ped);	
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
	
	
	
	
	public List<EntidadeDominio> realizarEntradaEmEstoque(EntidadeDominio entidade) {
		
		openConnection();
		PreparedStatement pst=null;
		List<EntidadeDominio> resultado = new ArrayList<>();
		List<EntidadeDominio> itensPedido = new ArrayList<>();
		int quantidade_disponivel = 0;
		
		Pedido pedido = (Pedido) entidade;
		ItemPedidoDAO itemPedidoDao = new ItemPedidoDAO();
		ItemPedido itemPedido = new ItemPedido();
		itemPedido.setIdPedido(pedido.getIdPedido());
		
		itensPedido = itemPedidoDao.consultarTrocaCancelamento(itemPedido,pedido);
		
		try {
			connection.setAutoCommit(false);	
					
//			StringBuilder sql = new StringBuilder();
//			sql.append("select * from tb_pagamento where idPedido = ?;");		
//					
//			pst = connection.prepareStatement(sql.toString());
//			pst.setInt(1, pagamento.getIdPedido());
//			ResultSet resultSet = pst.executeQuery();
//			
//			
//			
//			while(resultSet.next()) {
//								
//				Pagamento pgto  = new Pagamento();
//				pgto.setId(resultSet.getInt("id"));
//				pgto.setIdPedido(resultSet.getInt("idPedido"));
//				
//				resultado.add(pgto);
//			}
			
			for (EntidadeDominio itp :itensPedido) {
				
				ItemPedido itPedido =  (ItemPedido) itp;
				
				StringBuilder sql = new StringBuilder();
				sql.append("select quantidade as quantidade_disponivel from tb_estoque where idProduto = ?");		
						
				pst = connection.prepareStatement(sql.toString());
				pst.setInt(1, itPedido.getIdProduto());
				ResultSet resultSet = pst.executeQuery();
				
				
				while(resultSet.next()) {
					
					quantidade_disponivel = resultSet.getInt("quantidade_disponivel");	
				}
				
				
				
				if(quantidade_disponivel > 0) {
					
					StringBuilder sqlEstoque = new StringBuilder();
					sqlEstoque.append("UPDATE tb_estoque SET quantidade = ? WHERE idProduto = ?");	
					
					pst = connection.prepareStatement(sqlEstoque.toString());
					pst.setInt(1, (quantidade_disponivel + itPedido.getQtd()));
					pst.setInt(2, itPedido.getIdProduto());
					
					pst.executeUpdate();
				}
				
					
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
	
	public List<EntidadeDominio> verificaPagamentoPedido(EntidadeDominio entidade) {
		openConnection();
		PreparedStatement pst=null;
		List<EntidadeDominio> resultado = new ArrayList<>();
		
		Pagamento pagamento = (Pagamento) entidade;
		
		try {
			connection.setAutoCommit(false);	
					
			StringBuilder sql = new StringBuilder();
			sql.append("select * from tb_pagamento where idPedido = ?;");		
					
			pst = connection.prepareStatement(sql.toString());
			pst.setInt(1, pagamento.getIdPedido());
			ResultSet resultSet = pst.executeQuery();
			
			
			
			while(resultSet.next()) {
								
				Pagamento pgto  = new Pagamento();
				pgto.setId(resultSet.getInt("id"));
				pgto.setIdPedido(resultSet.getInt("idPedido"));
				
				resultado.add(pgto);
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
	
	
	public List<EntidadeDominio> consultarPrestacaoPedido(EntidadeDominio entidade) {
		openConnection();
		PreparedStatement pst=null;
		List<EntidadeDominio> resultado = new ArrayList<>();
		
		Prestacao prestacao = (Prestacao) entidade;
		
		try {
			connection.setAutoCommit(false);	
					
			StringBuilder sql = new StringBuilder();
			sql.append("select * from tb_prestacao where idPagamento = ?;");		
					
			pst = connection.prepareStatement(sql.toString());
			pst.setInt(1, prestacao.getIdPagamento());
			
			ResultSet resultSet = pst.executeQuery();
			
			
			
			while(resultSet.next()) {
								
				Prestacao prest  = new Prestacao();
				prest.setId(resultSet.getInt("id"));
				prest.setIdCartao(resultSet.getInt("idCartao"));
				prest.setIdPagamento(resultSet.getInt("idPagamento"));
				prest.setValor(resultSet.getInt("valor"));
				prest.setQtd(resultSet.getInt("qtd"));
				
				resultado.add(prest);
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

	
	public List<EntidadeDominio> consultar(EntidadeDominio entidade) {
		return null;
	}
	
	public int consultarValorDesconto(EntidadeDominio entidade) {
		openConnection();
		PreparedStatement pst=null;
		
		Cupom cupom = (Cupom)entidade;
		int desconto = 0;
		
		
		
		
		
		try {
			connection.setAutoCommit(false);	
					
			StringBuilder sql = new StringBuilder();
			sql.append("select * from tb_pedido where id = ?;");		
					
			pst = connection.prepareStatement(sql.toString());
			pst.setInt(1, cupom.getIdPedido());
			ResultSet resultSet = pst.executeQuery();
			
			
			
			while(resultSet.next()) {
								
				
				desconto = resultSet.getInt("desconto");
				
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
		
		
		
		return desconto;
	}
	
	
	
	
	public List<EntidadeDominio> consultarCarrinho(EntidadeDominio entidade) {
		
		openConnection();
		PreparedStatement pst=null;
		
		List<EntidadeDominio> resultado = new ArrayList<>();
		
		
		
		try {
			connection.setAutoCommit(false);	
					
			StringBuilder sql = new StringBuilder();
			sql.append("select * from tb_pedido where idstatus = 0;");		
					
			pst = connection.prepareStatement(sql.toString());
			ResultSet resultSet = pst.executeQuery();
			
			
			
			while(resultSet.next()) {
								
				Pedido pedido = new Pedido( 
											resultSet.getInt("id"),
											resultSet.getInt("idStatus"),
											resultSet.getInt("idCliente"),
											resultSet.getInt("idEndereco"),
											resultSet.getDate("dt_cadastro"),
											resultSet.getDouble("precoTotal"),
											resultSet.getDouble("desconto"),
											resultSet.getDouble("frete"));
				resultado.add(pedido);
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
