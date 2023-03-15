package br.com.projetoles.domain;

import java.util.Date;

public class Cartao extends EntidadeDominio {
	
	
	private int id_cartao;

	private int cli_id;
	
	private String bandeira_cartao;

	private String numero;
	
	private String nome_impresso;
	
	private String codigo_seguranca;
	
	
	private int idPedido;

	
	
	public Cartao() {
		super();
	}

	public int getIdPedido() {
		return idPedido;
	}

	public void setIdPedido(int idPedido) {
		this.idPedido = idPedido;
	}

	public int getId_cartao() {
		return id_cartao;
	}

	public void setId_cartao(int id_cartao) {
		this.id_cartao = id_cartao;
	}

	public int getCli_id() {
		return cli_id;
	}

	public void setCli_id(int cli_id) {
		this.cli_id = cli_id;
	}

	public String getBandeira_cartao() {
		return bandeira_cartao;
	}

	public void setBandeira_cartao(String bandeira_cartao) {
		this.bandeira_cartao = bandeira_cartao;
	}

	public String getNumero() {
		return numero;
	}

	public void setNumero(String numero) {
		this.numero = numero;
	}

	public String getNome_impresso() {
		return nome_impresso;
	}

	public void setNome_impresso(String nome_impresso) {
		this.nome_impresso = nome_impresso;
	}

	public String getCodigo_seguranca() {
		return codigo_seguranca;
	}

	public void setCodigo_seguranca(String codigo_seguranca) {
		this.codigo_seguranca = codigo_seguranca;
	}

	public Cartao(int id_cartao, int cli_id, String bandeira_cartao, String numero, String nome_impresso,
			String codigo_seguranca) {
		super();
		this.id_cartao = id_cartao;
		this.cli_id = cli_id;
		this.bandeira_cartao = bandeira_cartao;
		this.numero = numero;
		this.nome_impresso = nome_impresso;
		this.codigo_seguranca = codigo_seguranca;
	}

	public Cartao(String bandeira_cartao, String numero, String nome_impresso, String codigo_seguranca) {
		super();
		this.bandeira_cartao = bandeira_cartao;
		this.numero = numero;
		this.nome_impresso = nome_impresso;
		this.codigo_seguranca = codigo_seguranca;
	}

	public Cartao(int cli_id, String bandeira_cartao, String numero, String nome_impresso, String codigo_seguranca) {
		super();
		this.cli_id = cli_id;
		this.bandeira_cartao = bandeira_cartao;
		this.numero = numero;
		this.nome_impresso = nome_impresso;
		this.codigo_seguranca = codigo_seguranca;
	}
	
	

	
}
