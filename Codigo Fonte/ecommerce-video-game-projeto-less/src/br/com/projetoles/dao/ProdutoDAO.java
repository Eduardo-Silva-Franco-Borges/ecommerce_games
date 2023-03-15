package br.com.projetoles.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.com.projetoles.domain.Cartao;
import br.com.projetoles.domain.Cliente;
import br.com.projetoles.domain.Documento;
import br.com.projetoles.domain.Endereco;
import br.com.projetoles.domain.EntidadeDominio;
import br.com.projetoles.domain.Pessoa;
import br.com.projetoles.domain.Produto;
import br.com.projetoles.domain.TipoCliente;
import br.com.projetoles.domain.TipoDocumento;

public class ProdutoDAO extends AbstractJdbcDAO {
	
	public ProdutoDAO() {
		super("tb_produto", "id");		
	}	


	public void salvar(EntidadeDominio entity) {
		openConnection();
		PreparedStatement pst=null;
		
		Produto produto = (Produto)entity;
		try {
			connection.setAutoCommit(false);	

					
			StringBuilder sql = new StringBuilder();
			sql.append("INSERT INTO tb_produto(nome,"
											+ "descricao,"
											+ "ativo,"
											+ "idCategoriaProduto,"
											+ "grupoPrecificacao,"
											+ "img,"
											+ "fabricante,"
											+ "fornecedor,"
											+ "codigo_barras"
											+ ")");
			
			sql.append("VALUES (?,?,?,?,?,?,?,?,?)");		
					
			pst = connection.prepareStatement(sql.toString(), 
					pst.RETURN_GENERATED_KEYS);
			
			
			
			pst.setString(1, produto.getNome());
			pst.setString(2, produto.getDescricao());
			pst.setInt(3, 1);
			pst.setString(4, produto.getIdCategoriaProduto());
			pst.setString(5, produto.getGrupoPrecificacao());
			pst.setString(6, produto.getImg());
			pst.setString(7, produto.getFabricante());
			pst.setString(8, produto.getFornecedor());
			pst.setString(9, produto.getCodBarras());
			
			
			pst.executeUpdate();
			
			ResultSet rs = pst.getGeneratedKeys();
			int idProduto=0;
			if(rs.next())
				idProduto = rs.getInt(1);
			produto.setIdProduto(Integer.toString(idProduto));
			
			
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
	
	public void salvarEstoque(EntidadeDominio entity) {
		openConnection();
		PreparedStatement pst=null;
		
		Produto produto = (Produto)entity;
		try {
			connection.setAutoCommit(false);	

					
			StringBuilder sql = new StringBuilder();
			sql.append("INSERT INTO tb_estoque(idProduto,"
											+ "quantidade,"
											+ "precoCusto"
											
											+ ")");
			
			sql.append("VALUES (?,?,?)");		
					
			pst = connection.prepareStatement(sql.toString(), 
					pst.RETURN_GENERATED_KEYS);
			
			
			
			pst.setInt(1, Integer.parseInt(produto.getIdProduto()));
			pst.setInt(2, produto.getQuantidade());
			pst.setDouble(3, produto.getPrecoCusto());
			
			
			
			pst.executeUpdate();
			
			ResultSet rs = pst.getGeneratedKeys();
			int idProduto=0;
			if(rs.next())
				idProduto = rs.getInt(1);
			produto.setIdProduto(Integer.toString(idProduto));
			
			
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
	
	public void produtoAtivar(EntidadeDominio entity) {
		

		openConnection();
		
		PreparedStatement pst = null;
		Produto produto = (Produto)entity;
		
		StringBuilder sql = new StringBuilder();
		
		
		sql.append("UPDATE `dbecommerce_video_game`.`tb_produto` SET `ativo` = ?, "
																 + "`motivoAtivacao` = ?, "
																 + "`motivoInativacao` = ? "
																 
																 
																 + "WHERE `id` = ?");

		try {
			connection.setAutoCommit(false);
			
			pst = connection.prepareStatement(sql.toString());
			
			pst.setInt(1, 1);
			pst.setString(2, produto.getMotivoAtivacao());
			pst.setString(3, "");
			pst.setString(4, produto.getIdProduto());
			

		
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
	
	public void produtoInativar(EntidadeDominio entity) {
		

		openConnection();
		
		PreparedStatement pst = null;
		Produto produto = (Produto)entity;
		
		StringBuilder sql = new StringBuilder();
		
		
		sql.append("UPDATE `dbecommerce_video_game`.`tb_produto` SET `ativo` = ?, "
																 + "`motivoAtivacao` = ?, "
																 + "`motivoInativacao` = ? "
																 
																 
																 + "WHERE `id` = ?");

		try {
			connection.setAutoCommit(false);
			
			pst = connection.prepareStatement(sql.toString());
			
			pst.setInt(1, 0);
			pst.setString(2, "");
			pst.setString(3, produto.getMotivoInativacao());
			pst.setString(4, produto.getIdProduto());
			

		
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

	
	public void alterar(EntidadeDominio entity) {
		

		openConnection();
		
		PreparedStatement pst = null;
		Produto produto = (Produto)entity;
		
		StringBuilder sql = new StringBuilder();
		
		
		sql.append("UPDATE `dbecommerce_video_game`.`tb_produto` SET `nome` = ?, "
																 + "`descricao` = ?, "
																 + "`idCategoriaProduto` = ?, "
																 + "`grupoPrecificacao` = ?, "
																 + "`img` = ?,"
																 + "`fabricante` = ?, "
																 + "`fornecedor` = ?, "
																 + "`codigo_barras` = ? "
																 
																 + "WHERE `id` = ?");

		
		try {
			connection.setAutoCommit(false);
			
			pst = connection.prepareStatement(sql.toString());
			
			pst.setString(1, produto.getNome());
			pst.setString(2, produto.getDescricao());
			pst.setString(3, produto.getIdCategoriaProduto());
			pst.setString(4, produto.getGrupoPrecificacao());
			pst.setString(5, produto.getImg());
			pst.setString(6, produto.getFabricante());
			pst.setString(7, produto.getFornecedor());
			pst.setString(8, produto.getCodBarras());
			pst.setString(9, produto.getIdProduto());
			
			

		
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
	
	public void alterarEstoque(EntidadeDominio entity) {
		

		openConnection();
		
		PreparedStatement pst = null;
		Produto produto = (Produto)entity;
		
		StringBuilder sql = new StringBuilder();
		
		
		sql.append("UPDATE `dbecommerce_video_game`.`tb_estoque` SET `quantidade` = ?, "
																 + "`precoCusto` = ? "
																 
																 
																 + "WHERE `idProduto` = ?");

		
		try {
			connection.setAutoCommit(false);
			
			pst = connection.prepareStatement(sql.toString());
			
			pst.setInt(1, produto.getQuantidade());
			pst.setDouble(2, produto.getPrecoCusto());
			
			pst.setString(3, produto.getIdProduto());
			
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

	
	public void excluir(EntidadeDominio entity) {
		
		
	}

	
	public List<EntidadeDominio> consultar(EntidadeDominio entidade) {
		openConnection();
		PreparedStatement pst=null;
		
		List<EntidadeDominio> resultado = new ArrayList<>();
		try {
			connection.setAutoCommit(false);	
					
			StringBuilder sql = new StringBuilder();
			sql.append("SELECT tb_produto.id,tb_produto.nome,tb_produto.descricao,tb_produto.ativo,tb_produto.idCategoriaProduto,tb_produto.grupoPrecificacao,tb_produto.img,tb_estoque.precoCusto,tb_estoque.quantidade,tb_produto.fabricante,tb_produto.fornecedor,tb_produto.codigo_barras,tb_produto.motivoAtivacao,tb_produto.motivoInativacao FROM dbecommerce_video_game.tb_produto inner join tb_estoque on tb_estoque.idProduto = tb_produto.id;");		
					
			pst = connection.prepareStatement(sql.toString());
			ResultSet resultSet = pst.executeQuery();
			
			
			while(resultSet.next()) {			
					
				Produto produto = new Produto(resultSet.getString("id"),
											  resultSet.getString("nome"),
											  resultSet.getString("descricao"),
											  resultSet.getString("ativo"),
											  resultSet.getString("idCategoriaProduto"),
											  resultSet.getString("grupoPrecificacao"),
											  resultSet.getString("img"),
											  resultSet.getDouble("precoCusto"),
											  resultSet.getInt("quantidade"));
				
				produto.setFabricante(resultSet.getString("fabricante"));
				produto.setFornecedor(resultSet.getString("fornecedor"));
				produto.setCodBarras(resultSet.getString("codigo_barras"));
				produto.setMotivoAtivacao(resultSet.getString("motivoAtivacao"));
				produto.setMotivoInativacao(resultSet.getString("motivoInativacao"));
				
				
				resultado.add(produto);
				
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
