package br.com.projetoles.domain;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import br.com.projetoles.domain.EntidadeDominio;

public class Cliente extends Pessoa {
	
	private int id_cli;
	private Documento documento;
	private String tipoTelefone;
	private String telefone;
	private TipoCliente tipoCliente;
	private Endereco endereco;
	private int end_id;
	private Date dt_cadastro;
	
	private String email;
	private String login;
	private String senha;
	private String confimacaoSenha;
	
	
	private StringBuilder tableCupons;
	private StringBuilder tableEnderecosCobranca;
	private StringBuilder tableEnderecosEntrega;
	private StringBuilder tableCartao;
	private StringBuilder tableCartaoMin;
	
	
	
	public StringBuilder getTableCupons() {
		return tableCupons;
	}

	public void setTableCupons(StringBuilder tableCupons) {
		this.tableCupons = tableCupons;
	}

	public Cliente() {
		super();
	}

	public StringBuilder getTableCartaoMin() {
		return tableCartaoMin;
	}

	public void setTableCartaoMin(StringBuilder tableCartaoMin) {
		this.tableCartaoMin = tableCartaoMin;
	}

	public StringBuilder getTableCartao() {
		return tableCartao;
	}

	public void setTableCartao(StringBuilder tableCartao) {
		this.tableCartao = tableCartao;
	}

	public StringBuilder getTableEnderecosCobranca() {
		return tableEnderecosCobranca;
	}

	public void setTableEnderecosCobranca(StringBuilder tableEnderecosCobranca) {
		this.tableEnderecosCobranca = tableEnderecosCobranca;
	}

	public StringBuilder getTableEnderecosEntrega() {
		return tableEnderecosEntrega;
	}

	public void setTableEnderecosEntrega(StringBuilder tableEnderecosEntrega) {
		this.tableEnderecosEntrega = tableEnderecosEntrega;
	}

	
	
	private List<EntidadeDominio> enderecoCompras;
	
	private List<EntidadeDominio> cartoes;
	
	private List<EntidadeDominio> cupons;
	
	
	
	public List<EntidadeDominio> getCupons() {
		return cupons;
	}

	public void setCupons(List<EntidadeDominio> cupons) {
		this.cupons = cupons;
	}

	public List<EntidadeDominio> getCartoes() {
		return cartoes;
	}

	public void setCartoes(List<EntidadeDominio> cartoes) {
		this.cartoes = cartoes;
	}

	public List<EntidadeDominio> getEnderecoCompras() {
		return enderecoCompras;
	}

	public void setEnderecoCompras(List<EntidadeDominio> enderecoCompras) {
		this.enderecoCompras = enderecoCompras;
	}

	public int getId_cli() {
		return id_cli;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

	public String getConfimacaoSenha() {
		return confimacaoSenha;
	}

	public void setConfimacaoSenha(String confimacaoSenha) {
		this.confimacaoSenha = confimacaoSenha;
	}

	public void setId_cli(int id_cli) {
		this.id_cli = id_cli;
	}

	public Date getDt_cadastro() {
		return dt_cadastro;
	}

	public void setDt_cadastro(Date dt_cadastro) {
		this.dt_cadastro = dt_cadastro;
	}

	public Cliente(int id_cli, Documento documento, String tipoTelefone, String telefone, TipoCliente tipoCliente,
			Endereco endereco, int end_id, Date dt_cadastro, String email, String login, String senha, String confimacaoSenha) {
		super();
		this.id_cli = id_cli;
		this.documento = documento;
		this.tipoTelefone = tipoTelefone;
		this.telefone = telefone;
		this.tipoCliente = tipoCliente;
		this.endereco = endereco;
		this.end_id = end_id;
		this.dt_cadastro = dt_cadastro;
		this.email = email;
		this.login = login;
		this.senha = senha;
		this.confimacaoSenha = confimacaoSenha;
	}

	public Cliente(int id_cli,int end_id,Documento documento,String tipoTelefone, String telefone, TipoCliente tipoCliente, Endereco endereco, String email, String login, String senha, String confimacaoSenha) {
		
		this.id_cli = id_cli;
		this.end_id = end_id;
		this.documento = documento;
		this.tipoTelefone = tipoTelefone;
		this.telefone = telefone;
		this.tipoCliente = tipoCliente;
		this.endereco = endereco;
		
		this.email = email;
		this.login = login;
		this.senha = senha;
		this.confimacaoSenha = confimacaoSenha;
	}
	
	public Cliente(Documento documento,String tipoTelefone, String telefone, TipoCliente tipoCliente, Endereco endereco, String email, String login, String senha, String confimacaoSenha) {
		
		this.documento = documento;
		this.tipoTelefone = tipoTelefone;
		this.telefone = telefone;
		this.tipoCliente = tipoCliente;
		this.endereco = endereco;
		
		this.email = email;
		this.login = login;
		this.senha = senha;
		this.confimacaoSenha = confimacaoSenha;
	}
	
	public TipoCliente getTipoCliente() {
		return tipoCliente;
	}

	public void setTipoCliente(TipoCliente tipoCliente) {
		this.tipoCliente = tipoCliente;
	}

	public Endereco getEndereco() {
		return endereco;
	}

	public void setEndereco(Endereco endereco) {
		this.endereco = endereco;
	}

	

	public Documento getDocumento() {
		return documento;
	}

	public void setDocumento(Documento documento) {
		this.documento = documento;
	}

	public String getTipoTelefone() {
		return tipoTelefone;
	}

	public void setTipoTelefone(String tipoTelefone) {
		this.tipoTelefone = tipoTelefone;
	}

	public String getTelefone() {
		return telefone;
	}

	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}

	public int getEnd_id() {
		return end_id;
	}

	public void setEnd_id(int end_id) {
		this.end_id = end_id;
	}

	public Cliente(Documento documento, String tipoTelefone, String telefone, TipoCliente tipoCliente,
			Endereco endereco, int end_id, String email, String login, String senha, String confimacaoSenha) {
		
		this.documento = documento;
		this.tipoTelefone = tipoTelefone;
		this.telefone = telefone;
		this.tipoCliente = tipoCliente;
		this.endereco = endereco;
		this.end_id = end_id;
		
		this.email = email;
		this.login = login;
		this.senha = senha;
		this.confimacaoSenha = confimacaoSenha;
	}

	

	
	

}
