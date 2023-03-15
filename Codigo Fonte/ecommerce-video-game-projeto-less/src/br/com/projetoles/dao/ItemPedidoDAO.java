package br.com.projetoles.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.com.projetoles.domain.Carrinho;
import br.com.projetoles.domain.EntidadeDominio;
import br.com.projetoles.domain.ItemPedido;
import br.com.projetoles.domain.Pagamento;
import br.com.projetoles.domain.Pedido;
import br.com.projetoles.domain.Produto;



public class ItemPedidoDAO extends AbstractJdbcDAO {

	public ItemPedidoDAO() {
		super("tb_item_pedido", "id");		
	}

	
	public void salvar(EntidadeDominio entity) {
		
		
	}
	
	public void salvar(int idPedido,EntidadeDominio entity) {
		
		openConnection();
		
		PreparedStatement pst = null;
		Produto produto = (Produto) entity;
		StringBuilder sql = new StringBuilder();
		
		sql.append("INSERT INTO tb_item_pedido(idPedido,idProduto,qtd,precoUnico)");
		sql.append(" VALUES (?,?, ?, ?)");

		
		try {
			connection.setAutoCommit(false);
			
			pst = connection.prepareStatement(sql.toString(), 
					pst.RETURN_GENERATED_KEYS);
			
			
			pst.setInt(1, idPedido);
			pst.setString(2, produto.getIdProduto());
			pst.setInt(3, produto.getQuantidade());
			pst.setDouble(4, produto.getPrecoCusto());
			
			
			
			
		
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
	
	
	public void atualizarItemPedidoParaTroca(EntidadeDominio entity,int qtdTroca) {
		openConnection();
		PreparedStatement pst=null;
		int posicaoTroca = 0;
		ItemPedido itemPedido = (ItemPedido) entity;
		
		
		try {
			connection.setAutoCommit(false);	
			
			StringBuilder sqlPesquisa = new StringBuilder();
			sqlPesquisa.append("select troca from tb_item_pedido where id = ?");		
					
			pst = connection.prepareStatement(sqlPesquisa.toString());
			pst.setInt(1, itemPedido.getId());
			ResultSet resultSet = pst.executeQuery();
			
			
			
			while(resultSet.next()) {
								
				posicaoTroca = resultSet.getInt("troca");
			}
			
			if(posicaoTroca == 0) {
				StringBuilder sql = new StringBuilder();
				sql.append("UPDATE tb_item_pedido SET troca = ?,qtdParaTroca=? WHERE id = ?");	
						
				pst = connection.prepareStatement(sql.toString());
				pst.setInt(1, 1);
				pst.setInt(2, qtdTroca);
				pst.setInt(3, itemPedido.getId());
				
				pst.executeUpdate();
			}
			
			if(posicaoTroca == 1) {
				StringBuilder sql = new StringBuilder();
				sql.append("UPDATE tb_item_pedido SET troca = ?,qtdParaTroca=? WHERE id = ?");	
						
				pst = connection.prepareStatement(sql.toString());
				pst.setInt(1, 0);
				pst.setInt(2, 0);
				pst.setInt(3, itemPedido.getId());
				
				pst.executeUpdate();
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
		
	}
	
	
	public void retiraPedidoTroca(EntidadeDominio entity) {
		openConnection();
		PreparedStatement pst=null;
		
		Pedido pedido = (Pedido) entity;
		
		
		try {
			connection.setAutoCommit(false);	
				
					
			StringBuilder sql = new StringBuilder();
			sql.append("UPDATE tb_item_pedido SET troca = ? WHERE idPedido = ?");	
					
			pst = connection.prepareStatement(sql.toString());
			pst.setInt(1, 0);
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
	
	
	public void updateStatusItemPedidoTroca(EntidadeDominio entity,int numeral) {
		openConnection();
		PreparedStatement pst=null;
		
		Pedido pedido = (Pedido) entity;
		
		
		try {
			connection.setAutoCommit(false);	
				
					
			StringBuilder sql = new StringBuilder();
			sql.append("UPDATE tb_item_pedido SET troca = ? WHERE idPedido = ?");	
					
			pst = connection.prepareStatement(sql.toString());
			pst.setInt(1, numeral);
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

	
	public void alterar(EntidadeDominio entity) {
		openConnection();
		PreparedStatement pst=null;
		
		Carrinho carrinho = (Carrinho) entity;
		
		
		try {
			connection.setAutoCommit(false);	
				
					
			StringBuilder sql = new StringBuilder();
			sql.append("UPDATE tb_item_pedido SET qtd = ? WHERE id = ?");	
					
			pst = connection.prepareStatement(sql.toString());
			pst.setInt(1, carrinho.getQuantidade_selecionada());
			pst.setInt(2, carrinho.getIdItemPedido());
			
			
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

	
	public void excluir(EntidadeDominio entity) {
		
		openConnection();
		PreparedStatement pst=null;
		Carrinho carrinho = (Carrinho)entity;
		
		try {
			connection.setAutoCommit(false);	
			
					
			StringBuilder sql = new StringBuilder();
			sql.append("DELETE FROM tb_item_pedido where id = ?");		
					
			pst = connection.prepareStatement(sql.toString());
			pst.setInt(1, carrinho.getIdItemPedido());
			
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

	public List<EntidadeDominio> consultar(EntidadeDominio entidade) {
		
		openConnection();
		PreparedStatement pst=null;
		List<EntidadeDominio> resultado = new ArrayList<>();
		
		ItemPedido itemPedido = (ItemPedido) entidade;
		
		try {
			connection.setAutoCommit(false);	
					
			StringBuilder sql = new StringBuilder();
			sql.append("select tb_item_pedido.id,tb_item_pedido.idPedido,tb_item_pedido.idProduto,tb_item_pedido.qtd,tb_item_pedido.precoUnico,tb_produto.nome,tb_item_pedido.troca,tb_item_pedido.qtdParaTroca from tb_item_pedido left join tb_produto on tb_produto.id = tb_item_pedido.idProduto where idPedido = ?");		
					
			pst = connection.prepareStatement(sql.toString());
			pst.setInt(1, itemPedido.getIdPedido());
			ResultSet resultSet = pst.executeQuery();
			
			
			
			while(resultSet.next()) {
								
				ItemPedido intPedido  = new ItemPedido();
				intPedido.setId(resultSet.getInt("id"));
				intPedido.setIdPedido(resultSet.getInt("idPedido"));
				intPedido.setIdProduto(resultSet.getInt("idProduto"));
				intPedido.setQtd(resultSet.getInt("qtd"));
				intPedido.setPrecoUnico(resultSet.getDouble("precoUnico"));
				intPedido.setNomeProduto(resultSet.getString("nome"));
				intPedido.setTroca(resultSet.getInt("troca"));
				intPedido.setQtdtroca(resultSet.getInt("qtdParaTroca"));
				
				
				resultado.add(intPedido);
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
	
	
	public List<EntidadeDominio> consultarTrocaCancelamento(EntidadeDominio entidade,EntidadeDominio pedido) {
		
		openConnection();
		PreparedStatement pst=null;
		List<EntidadeDominio> resultado = new ArrayList<>();
		
		ItemPedido itemPedido = (ItemPedido) entidade;
		Pedido ped = (Pedido) pedido;
		
		try {
			connection.setAutoCommit(false);	
					
			StringBuilder sql = new StringBuilder();
			sql.append("select tb_item_pedido.id,tb_item_pedido.idPedido,tb_item_pedido.idProduto,tb_item_pedido.qtd,tb_item_pedido.precoUnico,tb_produto.nome,tb_item_pedido.troca,tb_item_pedido.qtdParaTroca from tb_item_pedido left join tb_produto on tb_produto.id = tb_item_pedido.idProduto where idPedido = ? and troca = ?");		
					
			pst = connection.prepareStatement(sql.toString());
			pst.setInt(1, itemPedido.getIdPedido());
			pst.setInt(2, ped.getTroca());
			ResultSet resultSet = pst.executeQuery();
			
			
			
			while(resultSet.next()) {
								
				ItemPedido intPedido  = new ItemPedido();
				intPedido.setId(resultSet.getInt("id"));
				intPedido.setIdPedido(resultSet.getInt("idPedido"));
				intPedido.setIdProduto(resultSet.getInt("idProduto"));
				intPedido.setQtd(resultSet.getInt("qtd"));
				intPedido.setPrecoUnico(resultSet.getDouble("precoUnico"));
				intPedido.setNomeProduto(resultSet.getString("nome"));
				intPedido.setTroca(resultSet.getInt("troca"));
				intPedido.setQtdtroca(resultSet.getInt("qtdParaTroca"));
				
				
				resultado.add(intPedido);
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
