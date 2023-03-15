package br.com.projetoles.dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.com.projetoles.dao.AbstractJdbcDAO;
import br.com.projetoles.domain.Cidade;
import br.com.projetoles.domain.Cliente;
import br.com.projetoles.domain.Documento;
import br.com.projetoles.domain.Endereco;
import br.com.projetoles.domain.EntidadeDominio;
import br.com.projetoles.domain.Estado;
import br.com.projetoles.domain.Pessoa;
import br.com.projetoles.domain.TipoCliente;
import br.com.projetoles.domain.TipoDocumento;
import br.com.projetoles.domain.TipoEndereco;

public class EnderecoDAO extends AbstractJdbcDAO {
	
	protected EnderecoDAO(String table, String idTable) {
		super("tb_endereco", "id_end");	
	}
	
	public EnderecoDAO(Connection cx){
		super(cx, "tb_endereco", "id_end");
	}
	
	public EnderecoDAO(){
		super("tb_endereco", "id_end");			
	}
	
	public void salvar(EntidadeDominio entidade) {
//		if(connection == null){
			openConnection();
//		}
		PreparedStatement pst = null;
		Endereco end = (Endereco) entidade;
		StringBuilder sql = new StringBuilder();
		
		sql.append("INSERT INTO tb_endereco(cli_id,cidade, estado,bairro,numero,rua,cep,nome_endereco,tipo_residencia,tipo_rua,pais,obs,tipo_endereco_compra)");
		sql.append(" VALUES (?,?, ?, ?, ?, ?,?,?,?,?,?,?,?)");

		
		try {
			connection.setAutoCommit(false);
			
			pst = connection.prepareStatement(sql.toString(), 
					pst.RETURN_GENERATED_KEYS);
			
			
			pst.setInt(1, Integer.parseInt(end.getCli_id()) );
			pst.setString(2, end.getCidade().getDescricao());
			pst.setString(3, end.getCidade().getEstado().getSigla());
			pst.setString(4, end.getBairro());
			pst.setString(5, end.getNumero());
			pst.setString(6, end.getRua());
			pst.setString(7, end.getCep());
			pst.setString(8, end.getTipoEndereco().getNome());
			pst.setString(9, end.getTipoEndereco().getDescricao());
			pst.setString(10, end.getTipoRua());
			pst.setString(11, end.getPais());
			pst.setString(12, end.getObs());
			pst.setString(13, end.getTipo_endereco_compra());
			
		
			pst.executeUpdate();		
					
			ResultSet rs = pst.getGeneratedKeys();
			int idEnd=0;
			if(rs.next())
				idEnd = rs.getInt(1);
			end.setId(idEnd);
			
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
	public void alterar(EntidadeDominio entidade) {
		if(connection == null){
			openConnection();
		}
		PreparedStatement pst = null;
		Pessoa pessoa = (Pessoa)entidade;
		Endereco end = pessoa.getCliente().getEndereco();
		StringBuilder sql = new StringBuilder();
		
		sql.append("UPDATE dbecommerce_video_game.tb_endereco SET "
				+ "cli_id = ?,"
				+ "cidade = ?,"
				+ "estado = ?,"
				+ "bairro = ?,"
				+ "numero = ?,"
				+ "rua = ?,"
				+ "cep = ?,"
				+ "nome_endereco = ?,"
				+ "tipo_residencia = ?,"
				+ "tipo_rua = ?,"
				+ "pais = ?,"
				+ "obs = ?"
				
				+ "WHERE id_end = ?");

		
		try {
			connection.setAutoCommit(false);
			
			pst = connection.prepareStatement(sql.toString());
			
			pst.setInt(1, pessoa.getCliente().getId_cli());
			pst.setString(2, end.getCidade().getDescricao());
			pst.setString(3, end.getCidade().getEstado().getSigla());
			pst.setString(4, end.getBairro());
			pst.setString(5, end.getNumero());
			pst.setString(6, end.getRua());
			pst.setString(7, end.getCep());
			
			pst.setString(8, end.getTipoEndereco().getNome());
			pst.setString(9, end.getTipoEndereco().getDescricao());
			pst.setString(10, end.getTipoRua());
			pst.setString(11, end.getPais());
			pst.setString(12, end.getObs());
			
			
			
			pst.setInt(13, pessoa.getCliente().getEndereco().getId());
			
		
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
	public void excluir(EntidadeDominio entidade) {
		openConnection();
		PreparedStatement pst=null;
		Cliente cliente = (Cliente)entidade;
		
		try {
			connection.setAutoCommit(false);	
			StringBuilder sql = new StringBuilder();
			sql.append("DELETE FROM tb_endereco where id_end = ?");		
					
			pst = connection.prepareStatement(sql.toString());
			pst.setInt(1, cliente.getEnd_id());
			
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

	

	@Override
	public List<EntidadeDominio> consultar(EntidadeDominio entidade) {
		
		openConnection();
		PreparedStatement pst=null;
		
		Pessoa pessoa = (Pessoa)entidade;
		
		List<EntidadeDominio> resultado = new ArrayList<>();
		
		
		try {
			connection.setAutoCommit(false);	
					
			StringBuilder sql = new StringBuilder();
			sql.append("SELECT * FROM dbecommerce_video_game.tb_endereco where cli_id = ?");		
					
			pst = connection.prepareStatement(sql.toString());
			pst.setInt(1, pessoa.getCliente().getId_cli());
			ResultSet resultSet = pst.executeQuery();
			
//			System.out.println(pessoa.getCliente().getId_cli());
			
			while(resultSet.next()) {
								
				Estado estado = new Estado(resultSet.getString("estado"));
				Cidade cidade = new Cidade(resultSet.getString("cidade"),estado);
				
				TipoEndereco tipoEndereco = new TipoEndereco(resultSet.getString("tipo_residencia"),resultSet.getString("nome_endereco"));
				Endereco enderecoResult = new Endereco(resultSet.getString("cli_id"),resultSet.getString("cep"),
													   resultSet.getString("numero"),
													   resultSet.getString("rua"),
													   resultSet.getString("bairro"),
													   cidade,
													   tipoEndereco,
													   resultSet.getString("tipo_rua"),
													   resultSet.getString("pais"),
													   resultSet.getString("obs"),resultSet.getString("tipo_endereco_compra"));
				
				enderecoResult.setId(resultSet.getInt("id_end"));
				
//				System.out.println(resultSet.getString("nome_endereco"));
				resultado.add(enderecoResult);
				
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
	public EntidadeDominio consultarEspecifico(EntidadeDominio entidade) {
		openConnection();
		PreparedStatement pst=null;
		Endereco end = (Endereco)entidade;
		Endereco endereco = new Endereco();
		
		//System.out.println(end.getId());
		
		try {
			connection.setAutoCommit(false);	
					
			StringBuilder sql = new StringBuilder();
			sql.append("SELECT * FROM dbecommerce_video_game.tb_endereco where id_end = ?");
			
					
			pst = connection.prepareStatement(sql.toString());
			pst.setInt(1, end.getId());
			ResultSet resultSet = pst.executeQuery();
			
			while(resultSet.next()) {
				
				Estado estado = new Estado(resultSet.getString("estado"));
				Cidade cidade = new Cidade(resultSet.getString("cidade"),estado);
				
				TipoEndereco tipoEndereco = new TipoEndereco(resultSet.getString("tipo_residencia"),resultSet.getString("nome_endereco"));
				Endereco enderecoResult = new Endereco(resultSet.getString("cli_id"),resultSet.getString("cep"),
													   resultSet.getString("numero"),
													   resultSet.getString("rua"),
													   resultSet.getString("bairro"),
													   cidade,
													   tipoEndereco,
													   resultSet.getString("tipo_rua"),
													   resultSet.getString("pais"),
													   resultSet.getString("obs"));
				endereco = enderecoResult;
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
		return endereco;
		
	}

	

	

}
