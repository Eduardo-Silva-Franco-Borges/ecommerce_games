package br.com.projetoles.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.com.projetoles.domain.Carrinho;
import br.com.projetoles.domain.Cupom;
import br.com.projetoles.domain.EntidadeDominio;
import br.com.projetoles.domain.Pedido;
import br.com.projetoles.domain.Pessoa;

public class CupomDAO extends AbstractJdbcDAO {

	public CupomDAO() {
		super("tb_cupom", "id");		
	}

	
	public void salvar(EntidadeDominio entity) {
		
		openConnection();
		
		PreparedStatement pst = null;
		Cupom cupom = (Cupom) entity;
		StringBuilder sql = new StringBuilder();
		
		sql.append("INSERT INTO tb_cupom(idCliente,nomeCupom,valor,ativo)");
		sql.append(" VALUES (?,?,?,?)");

		
		try {
			connection.setAutoCommit(false);
			
			pst = connection.prepareStatement(sql.toString(), 
					pst.RETURN_GENERATED_KEYS);
			
			
			pst.setInt(1, cupom.getIdCliente());
			pst.setString(2, cupom.getNomeCupom());
			pst.setDouble(3, cupom.getValor());
			pst.setInt(4, cupom.getAtivo());
		
			
			
		
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
		PreparedStatement pst=null;
		
		Cupom cupom = (Cupom) entity;
		
		
		try {
			connection.setAutoCommit(false);	
				
					
			StringBuilder sql = new StringBuilder();
			sql.append("UPDATE tb_cupom SET ativo = ? WHERE id = ?");	
					
			pst = connection.prepareStatement(sql.toString());
			pst.setInt(1, cupom.getAtivo());
			pst.setInt(2, cupom.getId());
			
			
			
			
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

	
	public List<EntidadeDominio> consultar(EntidadeDominio entidade) {
		
		openConnection();
		PreparedStatement pst=null;
		
		List<EntidadeDominio> resultado = new ArrayList<>();
		Pessoa pessoa = (Pessoa)entidade;
		
//		System.out.println(pessoa.getCliente().getId_cli());
		try {
			connection.setAutoCommit(false);	
					
			StringBuilder sql = new StringBuilder();
			
			sql.append("select * from tb_cupom where idCliente = ? and ativo = 1;");		
					
			pst = connection.prepareStatement(sql.toString());
			
			pst.setInt(1, pessoa.getCliente().getId_cli());
			
			ResultSet resultSet = pst.executeQuery();
			
			
			
			while(resultSet.next()) {
								
				Cupom cupom = new Cupom();
				cupom.setId(resultSet.getInt("id"));
				cupom.setIdCliente(resultSet.getInt("idCliente"));
				cupom.setNomeCupom(resultSet.getString("nomeCupom"));
				cupom.setValor(resultSet.getDouble("valor"));
				cupom.setAtivo(resultSet.getInt("ativo"));
				
				
				resultado.add(cupom);
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
	
	
	
	
	public Cupom consultarEspecifico(EntidadeDominio entidade) {
		
		openConnection();
		PreparedStatement pst=null;
		
		Cupom cupom = new Cupom();
		Cupom cup = (Cupom) entidade;
		
		
		try {
			connection.setAutoCommit(false);	
					
			StringBuilder sql = new StringBuilder();
			
			sql.append("select * from tb_cupom where id = ?;");		
					
			pst = connection.prepareStatement(sql.toString());
			
			pst.setInt(1, cup.getId());
			
			ResultSet resultSet = pst.executeQuery();
			
			
			
			while(resultSet.next()) {
								
				cupom.setId(resultSet.getInt("id"));
				cupom.setIdCliente(resultSet.getInt("idCliente"));
				cupom.setNomeCupom(resultSet.getString("nomeCupom"));
				cupom.setValor(resultSet.getDouble("valor"));
				cupom.setAtivo(resultSet.getInt("ativo"));
				
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
		
		
		
		return cupom;
	}
}
