package br.com.projetoles.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.com.projetoles.domain.Cartao;
import br.com.projetoles.domain.Cidade;
import br.com.projetoles.domain.Endereco;
import br.com.projetoles.domain.EntidadeDominio;
import br.com.projetoles.domain.Estado;
import br.com.projetoles.domain.Pessoa;
import br.com.projetoles.domain.Prestacao;
import br.com.projetoles.domain.TipoEndereco;
import br.com.projetoles.util.DateUtil;
import br.com.projetoles.util.PasswordEncryptSHA512;

public class CartaoDAO extends AbstractJdbcDAO{
	
	public CartaoDAO() {
		super("tb_cartao", "id_card");		
	}	
	
	
	@Override
	public void salvar(EntidadeDominio entity) {
		
		openConnection();
		PreparedStatement pst=null;
		Cartao cartao = (Cartao)entity;
		try {
			connection.setAutoCommit(false);	
//			EnderecoDAO endDAO = new EnderecoDAO(connection);
//			endDAO.ctrlTransaction = false;
//			endDAO.salvar(end);	
					
			StringBuilder sql = new StringBuilder();
			sql.append("INSERT INTO tb_cartao(cli_id,"
											+ "bandeira_cartao,"
											+ "numero,"
											+ "nome_impresso,"
											+ "codigo_seguranca"
											+ ")");
			
			sql.append("VALUES (?,?,?,?,?)");		
					
			pst = connection.prepareStatement(sql.toString(), 
					pst.RETURN_GENERATED_KEYS);
			
			
			pst.setInt(1, cartao.getCli_id());
			pst.setString(2, cartao.getBandeira_cartao());
			pst.setString(3, cartao.getNumero());
			pst.setString(4, cartao.getNome_impresso());
			pst.setString(5, cartao.getCodigo_seguranca());
			
			
			pst.executeUpdate();
			
//			ResultSet rs = pst.getGeneratedKeys();
//			int idCli=0;
//			if(rs.next())
//				idCli = rs.getInt(1);
//			pessoa.getCliente().setId_cli(idCli);
//			end.setCli_id(Integer.toString(idCli));
			
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

	@Override
	public void alterar(EntidadeDominio entity) {
		
		
		openConnection();
		
		PreparedStatement pst = null;
		Cartao cartao = (Cartao)entity;
		
		StringBuilder sql = new StringBuilder();
		
		System.out.println(cartao.getCli_id());
		System.out.println(cartao.getBandeira_cartao());
		System.out.println(cartao.getNumero());
		System.out.println(cartao.getNome_impresso());
		System.out.println(cartao.getCodigo_seguranca());
		System.out.println(cartao.getId_cartao());
		
		sql.append("UPDATE `dbecommerce_video_game`.`tb_cartao` SET `cli_id` = ?, `bandeira_cartao` = ?, `numero` = ?, `nome_impresso` = ?, `codigo_seguranca` = ? WHERE `id_card` = ?");

		
		try {
			connection.setAutoCommit(false);
			
			pst = connection.prepareStatement(sql.toString());
			
			pst.setInt(1, cartao.getCli_id());
			pst.setString(2, cartao.getBandeira_cartao());
			pst.setString(3, cartao.getNumero());
			pst.setString(4, cartao.getNome_impresso());
			pst.setString(5, cartao.getCodigo_seguranca());
			pst.setInt(6, cartao.getId_cartao());
			

			
		
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

	@Override
	public void excluir(EntidadeDominio entity) {
		
		
	}
	
	
	public List<EntidadeDominio> consultarCartoesPedido(EntidadeDominio entidade) {
		
		openConnection();
		PreparedStatement pst=null;
		
		Cartao cartao = (Cartao)entidade;
		
		List<EntidadeDominio> resultado = new ArrayList<>();
		
		
		try {
			connection.setAutoCommit(false);	
					
			StringBuilder sql = new StringBuilder();
			sql.append("select tb_cartao.numero,tb_cartao.nome_impresso,tb_prestacao.valor,tb_prestacao.qtd,(tb_prestacao.valor/tb_prestacao.qtd) as valor_parcela from tb_prestacao left join tb_cartao on tb_cartao.id_card = tb_prestacao.idCartao left join tb_pagamento on tb_pagamento.id = tb_prestacao.idPagamento where tb_pagamento.idPedido = ?");		
					
			pst = connection.prepareStatement(sql.toString());
			pst.setInt(1, cartao.getIdPedido());
			
			ResultSet resultSet = pst.executeQuery();
			
			while(resultSet.next()) {
								
				
				Prestacao prestacao = new Prestacao();
				
				prestacao.setNumero_cartao(resultSet.getString("numero"));
				prestacao.setNome_impress(resultSet.getString("nome_impresso"));
				prestacao.setValor(resultSet.getDouble("valor"));
				prestacao.setQtd(resultSet.getInt("qtd"));
				prestacao.setValor_parcela(resultSet.getDouble("valor_parcela"));
				
				
				
				resultado.add(prestacao);
				
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
	
	
	
	

	@Override
	public List<EntidadeDominio> consultar(EntidadeDominio entidade) {
		
		openConnection();
		PreparedStatement pst=null;
		
		Pessoa pessoa = (Pessoa)entidade;
		
		List<EntidadeDominio> resultado = new ArrayList<>();
		
		
		try {
			connection.setAutoCommit(false);	
					
			StringBuilder sql = new StringBuilder();
			sql.append("SELECT * FROM dbecommerce_video_game.tb_cartao where cli_id = ?");		
					
			pst = connection.prepareStatement(sql.toString());
			pst.setInt(1, pessoa.getCliente().getId_cli());
			ResultSet resultSet = pst.executeQuery();
			
			while(resultSet.next()) {
								
				
				Cartao cartaoResult = new Cartao(resultSet.getInt("id_card"),
												 resultSet.getInt("cli_id"),
												 resultSet.getString("bandeira_cartao"),
												 resultSet.getString("numero"),
												 resultSet.getString("nome_impresso"),
												 resultSet.getString("codigo_seguranca"));
				
				
				resultado.add(cartaoResult);
				
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
