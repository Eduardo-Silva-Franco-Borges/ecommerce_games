package br.com.projetoles.domain;

import java.util.Date;

public class Cupom extends EntidadeDominio {
	private int idCliente;
	private String nomeCupom;
	private double valor;
	private Date dataExpriracao;
	private int ativo;
	private int idPedido;
	
	
	
	
	
	public Cupom() {
		super();
	}
	
	public Cupom(int idCliente, String nomeCupom, double valor, Date dataExpriracao, int ativo) {
		super();
		this.idCliente = idCliente;
		this.nomeCupom = nomeCupom;
		this.valor = valor;
		this.dataExpriracao = dataExpriracao;
		this.ativo = ativo;
	}
	
	
	
	public int getIdPedido() {
		return idPedido;
	}

	public void setIdPedido(int idPedido) {
		this.idPedido = idPedido;
	}

	public int getIdCliente() {
		return idCliente;
	}
	public void setIdCliente(int idCliente) {
		this.idCliente = idCliente;
	}
	public String getNomeCupom() {
		return nomeCupom;
	}
	public void setNomeCupom(String nomeCupom) {
		this.nomeCupom = nomeCupom;
	}
	public double getValor() {
		return valor;
	}
	public void setValor(double valor) {
		this.valor = valor;
	}
	public Date getDataExpriracao() {
		return dataExpriracao;
	}
	public void setDataExpriracao(Date dataExpriracao) {
		this.dataExpriracao = dataExpriracao;
	}
	public int getAtivo() {
		return ativo;
	}
	public void setAtivo(int ativo) {
		this.ativo = ativo;
	}
	
}
