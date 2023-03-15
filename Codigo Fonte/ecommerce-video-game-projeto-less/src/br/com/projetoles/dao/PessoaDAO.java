package br.com.projetoles.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import br.com.projetoles.domain.Cliente;
import br.com.projetoles.domain.Documento;
import br.com.projetoles.domain.Endereco;
import br.com.projetoles.domain.EntidadeDominio;
import br.com.projetoles.domain.Pessoa;
import br.com.projetoles.domain.TipoCliente;
import br.com.projetoles.domain.TipoDocumento;
import br.com.projetoles.util.DateUtil;
import br.com.projetoles.util.PasswordEncryptSHA512;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;


public class PessoaDAO extends AbstractJdbcDAO{
	
	public PessoaDAO() {
		super("tb_cliente", "id_cli");		
	}	
	
	public void salvar(EntidadeDominio entidade) {
		
		
		openConnection();
		PreparedStatement pst=null;
		Pessoa pessoa = (Pessoa)entidade;
		Endereco end = pessoa.getCliente().getEndereco();
		
		
		try {
			connection.setAutoCommit(false);	
//			EnderecoDAO endDAO = new EnderecoDAO(connection);
//			endDAO.ctrlTransaction = false;
//			endDAO.salvar(end);	
					
			StringBuilder sql = new StringBuilder();
			sql.append("INSERT INTO tb_cliente(nome,"
											+ "sobrenome,"
											+ "dt_nascimento,"
											+ "genero,"
											+ "doc_tipo_id,"
											+ "doc_codigo,"
											+ "doc_validade,"
											+ "cli_tipo_id,"
											+ "tipo_telefone,"
											+ "telefone,"
											+ "email,"
											+ "login,"
											+ "senha,"
											+ "confirmacaoSenha"
											
											+ ")");
			
			sql.append("VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?)");		
					
			pst = connection.prepareStatement(sql.toString(), 
					pst.RETURN_GENERATED_KEYS);
			
			
			pst.setString(1, pessoa.getNome());
			pst.setString(2, pessoa.getSobrenome());
			pst.setString(3, new DateUtil().getFormatedDate( pessoa.getDt_nascimento()));
			pst.setString(4, pessoa.getGenero());
			pst.setString(5, pessoa.getCliente().getDocumento().getTipoDocumento().getDescricao());
			pst.setString(6, pessoa.getCliente().getDocumento().getCodigo());
			pst.setString(7, new DateUtil().getFormatedDate( pessoa.getCliente().getDocumento().getValidade()) );
			pst.setString(8, pessoa.getCliente().getTipoCliente().getDescricao());
			pst.setString(9, pessoa.getCliente().getTipoTelefone());
			pst.setString(10, pessoa.getCliente().getTelefone());
			pst.setString(11, pessoa.getCliente().getEmail());
			pst.setString(12, pessoa.getCliente().getLogin());
			pst.setString(13, new PasswordEncryptSHA512().encryptThisString(pessoa.getCliente().getSenha()));
			pst.setString(14, new PasswordEncryptSHA512().encryptThisString(pessoa.getCliente().getConfimacaoSenha()));
			
			
			pst.executeUpdate();
			
			ResultSet rs = pst.getGeneratedKeys();
			int idCli=0;
			if(rs.next())
				idCli = rs.getInt(1);
			pessoa.getCliente().setId_cli(idCli);
			end.setCli_id(Integer.toString(idCli));
			
			connection.commit();
			
			EnderecoDAO endDAO = new EnderecoDAO(connection);
			
			endDAO.ctrlTransaction = false;
			endDAO.salvar(end);	
			
			endDAO.alterar(pessoa);
			alterar(pessoa);
			
			
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
	public void alterar(EntidadeDominio entidade) {
		openConnection();
		PreparedStatement pst=null;
		Pessoa pessoa = (Pessoa)entidade;
		Endereco end = pessoa.getCliente().getEndereco();
		
		
		try {
			connection.setAutoCommit(false);	
			EnderecoDAO endDAO = new EnderecoDAO();
			endDAO.ctrlTransaction = false;
			endDAO.alterar(pessoa);	
					
			StringBuilder sql = new StringBuilder();
			sql.append("UPDATE dbecommerce_video_game.tb_cliente SET ");
			sql.append("end_id = ?,");
			sql.append("nome = ?,");
			sql.append("sobrenome = ?,");
			sql.append("dt_nascimento = ?,");
		    sql.append("genero = ? ,");
			sql.append("doc_tipo_id = ? ,");
			sql.append("doc_codigo = ? ,");
			sql.append("doc_validade = ? ,");
			sql.append("cli_tipo_id = ? ,");
			sql.append("tipo_telefone = ? ,");
			sql.append("telefone = ? ");
						
					
			if(pessoa.getCliente().getEmail()!= null) sql.append(", email = ? ");
			if(pessoa.getCliente().getLogin()!= null) sql.append(", login = ? ");
			if(pessoa.getCliente().getSenha()!= null) sql.append(", senha = ? ");
		    if(pessoa.getCliente().getConfimacaoSenha()!= null) sql.append(", confirmacaoSenha = ? ");
									
		    sql.append("WHERE id_cli = ?");	
			
			

			pst = connection.prepareStatement(sql.toString());
			pst.setInt(1, pessoa.getCliente().getEnd_id());
			pst.setString(2, pessoa.getNome());
			pst.setString(3, pessoa.getSobrenome());
			pst.setString(4, new DateUtil().getFormatedDate( pessoa.getDt_nascimento()));
			pst.setString(5, pessoa.getGenero());
			pst.setString(6, pessoa.getCliente().getDocumento().getTipoDocumento().getDescricao());
			pst.setString(7, pessoa.getCliente().getDocumento().getCodigo());
			pst.setString(8, new DateUtil().getFormatedDate( pessoa.getCliente().getDocumento().getValidade()) );
			pst.setString(9, pessoa.getCliente().getTipoCliente().getDescricao());
			pst.setString(10, pessoa.getCliente().getTipoTelefone());
			pst.setString(11, pessoa.getCliente().getTelefone());
			
			if(pessoa.getCliente().getEmail()!= null)  pst.setString(12, pessoa.getCliente().getEmail());
			if(pessoa.getCliente().getLogin()!= null)  pst.setString(13, pessoa.getCliente().getLogin());
			if(pessoa.getCliente().getSenha()!= null)  pst.setString(14, pessoa.getCliente().getSenha());
		    if(pessoa.getCliente().getConfimacaoSenha()!= null)  pst.setString(15, pessoa.getCliente().getConfimacaoSenha());
			
		    
		    if(pessoa.getCliente().getConfimacaoSenha()!= null) {
		    	pst.setInt(16, pessoa.getCliente().getId_cli());
		    }else {
		    	pst.setInt(12, pessoa.getCliente().getId_cli());
		    }
			
			
			
			//System.out.println(pessoa.getCliente().getId_cli());
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
	
	@Override
	public void excluir(EntidadeDominio entidade) {
//		openConnection();
//		PreparedStatement pst=null;
//		Cliente cliente = (Cliente)entidade;
//		
//		try {
//			connection.setAutoCommit(false);	
//			EnderecoDAO endDAO = new EnderecoDAO();
//			endDAO.ctrlTransaction = false;
//			endDAO.excluir(cliente);	
//					
//			StringBuilder sql = new StringBuilder();
//			sql.append("DELETE FROM tb_gerentepj where id_gen = ?");		
//					
//			pst = connection.prepareStatement(sql.toString());
//			pst.setInt(1, cliente.getId());
//			
//			pst.executeUpdate();			
//			connection.commit();		
//		} catch (SQLException e) {
//			try {
//				connection.rollback();
//			} catch (SQLException e1) {
//				e1.printStackTrace();
//			}
//			e.printStackTrace();			
//		}finally{
//			try {
//				pst.close();
//				connection.close();
//			} catch (SQLException e) {
//				e.printStackTrace();
//			}
//		}
		
		
	}
	
	@Override
	public List<EntidadeDominio> consultar(EntidadeDominio entidade) {
		
		openConnection();
		PreparedStatement pst=null;
		
		List<EntidadeDominio> resultado = new ArrayList<>();
		
		EnderecoDAO enderecoDAO = new EnderecoDAO();
		CartaoDAO cartaoDAO = new CartaoDAO();
		CupomDAO cupomDAO = new CupomDAO();
		
		
		try {
			connection.setAutoCommit(false);	
					
			StringBuilder sql = new StringBuilder();
			sql.append("SELECT * FROM dbecommerce_video_game.tb_cliente");		
					
			pst = connection.prepareStatement(sql.toString());
			ResultSet resultSet = pst.executeQuery();
			
			
			
			while(resultSet.next()) {
				//System.out.println(resultSet.getString("nome"));
				Endereco enderecoParapesquisa = new Endereco();
				enderecoParapesquisa.setId(resultSet.getInt("end_id"));
				Endereco endereco = (Endereco) enderecoDAO.consultarEspecifico(enderecoParapesquisa);
				
				
				TipoDocumento tipoDocumento = new TipoDocumento(resultSet.getString("doc_tipo_id"));
				Documento documento = new Documento(resultSet.getString("doc_codigo"),resultSet.getDate("doc_validade"),tipoDocumento);
				
				TipoCliente tipoCliente = new TipoCliente(resultSet.getString("cli_tipo_id"));
				
				
				
				Cliente cliente = new Cliente(resultSet.getInt("id_cli"),
											  documento,
											  resultSet.getString("tipo_telefone"),
											  resultSet.getString("telefone"),
											  tipoCliente,
											  endereco,
											  resultSet.getInt("end_id"),
											  resultSet.getDate("dt_cadastro"),resultSet.getString("email"),resultSet.getString("login"),resultSet.getString("senha"),resultSet.getString("confirmacaoSenha"));
				
				
				Pessoa pessoa = new Pessoa(resultSet.getString("nome"),
													resultSet.getString("sobrenome"),
													resultSet.getDate("dt_nascimento"),
													resultSet.getString("genero"),cliente);
				
				//System.out.println(pessoa.getCliente().getEnd_id());
				
				List<EntidadeDominio> enderecosCompras = (List<EntidadeDominio>) enderecoDAO.consultar(pessoa);
				cliente.setEnderecoCompras(enderecosCompras);
				
				List<EntidadeDominio> cartoes = (List<EntidadeDominio>) cartaoDAO.consultar(pessoa);
				cliente.setCartoes(cartoes);
				
				List<EntidadeDominio> cupons = (List<EntidadeDominio>) cupomDAO.consultar(pessoa);
				
				cliente.setCupons(cupons);
				
				
				
				resultado.add(pessoa);
				
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
