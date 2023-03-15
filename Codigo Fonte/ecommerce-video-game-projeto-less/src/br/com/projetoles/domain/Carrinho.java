package br.com.projetoles.domain;

import java.util.List;

public class Carrinho extends EntidadeDominio {
	
	private String img;
	private String nome_produto;
	private String descricao_produto;
	private double precoUnico;
	private int quantidade_diponivel;
	private int quantidade_selecionada;
	private int idEndereco;
	private int idPagamento;
	private int idItemPedido;
	private int frete;
	private List<EntidadeDominio> prestacao;
	
	
	
	
	
	
	public Carrinho() {
		super();
	}
	
	
	public Carrinho(String img, String nome_produto, String descricao_produto, double precoUnico,
			int quantidade_diponivel, int quantidade_selecionada, int idEndereco, int idPagamento, int idItemPedido) {
		super();
		this.img = img;
		this.nome_produto = nome_produto;
		this.descricao_produto = descricao_produto;
		this.precoUnico = precoUnico;
		this.quantidade_diponivel = quantidade_diponivel;
		this.quantidade_selecionada = quantidade_selecionada;
		this.idEndereco = idEndereco;
		this.idPagamento = idPagamento;
		this.idItemPedido = idItemPedido;
	}
	
	public List<EntidadeDominio> getPrestacao() {
		return prestacao;
	}


	public void setPrestacao(List<EntidadeDominio> prestacao) {
		this.prestacao = prestacao;
	}


	public int getFrete() {
		return frete;
	}


	public void setFrete(int frete) {
		this.frete = frete;
	}


	public int getIdItemPedido() {
		return idItemPedido;
	}


	public void setIdItemPedido(int idItemPedido) {
		this.idItemPedido = idItemPedido;
	}


	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getNome_produto() {
		return nome_produto;
	}
	public void setNome_produto(String nome_produto) {
		this.nome_produto = nome_produto;
	}
	public String getDescricao_produto() {
		return descricao_produto;
	}
	public void setDescricao_produto(String descricao_produto) {
		this.descricao_produto = descricao_produto;
	}
	public double getPrecoUnico() {
		return precoUnico;
	}
	public void setPrecoUnico(double precoUnico) {
		this.precoUnico = precoUnico;
	}
	public int getQuantidade_diponivel() {
		return quantidade_diponivel;
	}
	public void setQuantidade_diponivel(int quantidade_diponivel) {
		this.quantidade_diponivel = quantidade_diponivel;
	}
	public int getQuantidade_selecionada() {
		return quantidade_selecionada;
	}
	public void setQuantidade_selecionada(int quantidade_selecionada) {
		this.quantidade_selecionada = quantidade_selecionada;
	}
	public int getIdEndereco() {
		return idEndereco;
	}
	public void setIdEndereco(int idEndereco) {
		this.idEndereco = idEndereco;
	}
	public int getIdPagamento() {
		return idPagamento;
	}
	public void setIdPagamento(int idPagamento) {
		this.idPagamento = idPagamento;
	}
	
	
}
