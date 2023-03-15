package br.com.projetoles.domain;

public class ItemPedido extends EntidadeDominio {
	
	private int id;
	private int idPedido;
	private int idProduto;
	private int qtd;
	private double precoUnico;
	
	private String nomeProduto;
	private int troca;
	private int qtdtroca;
	
	
	
	
	
	
	
	public int getQtdtroca() {
		return qtdtroca;
	}


	public void setQtdtroca(int qtdtroca) {
		this.qtdtroca = qtdtroca;
	}


	public ItemPedido() {
		super();
	}
	
	
	public ItemPedido(int id, int idPedido, int idProduto, int qtd, double precoUnico) {
		super();
		this.id = id;
		this.idPedido = idPedido;
		this.idProduto = idProduto;
		this.qtd = qtd;
		this.precoUnico = precoUnico;
	}
	
	
	
	public int getTroca() {
		return troca;
	}


	public void setTroca(int troca) {
		this.troca = troca;
	}


	public String getNomeProduto() {
		return nomeProduto;
	}


	public void setNomeProduto(String nomeProduto) {
		this.nomeProduto = nomeProduto;
	}


	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getIdPedido() {
		return idPedido;
	}
	public void setIdPedido(int idPedido) {
		this.idPedido = idPedido;
	}
	public int getIdProduto() {
		return idProduto;
	}
	public void setIdProduto(int idProduto) {
		this.idProduto = idProduto;
	}
	public int getQtd() {
		return qtd;
	}
	public void setQtd(int qtd) {
		this.qtd = qtd;
	}
	public double getPrecoUnico() {
		return precoUnico;
	}
	public void setPrecoUnico(double precoUnico) {
		this.precoUnico = precoUnico;
	}
	
	
	
}
