package br.com.projetoles.domain;

public class Prestacao extends EntidadeDominio {
	private int idCartao;
	private int idPagamento;
	private double valor;
	private int qtd;
	
	
	private String numero_cartao;
	private String nome_impress;
	
	
	private double valor_parcela;
	
	
	
	
	
	public Prestacao() {
		super();
	}
	public Prestacao(int idCartao, int idPagamento, double valor, int qtd) {
		super();
		this.idCartao = idCartao;
		this.idPagamento = idPagamento;
		this.valor = valor;
		this.qtd = qtd;
	}
	
	
	
	
	public String getNumero_cartao() {
		return numero_cartao;
	}
	public void setNumero_cartao(String numero_cartao) {
		this.numero_cartao = numero_cartao;
	}
	public String getNome_impress() {
		return nome_impress;
	}
	public void setNome_impress(String nome_impress) {
		this.nome_impress = nome_impress;
	}
	public double getValor_parcela() {
		return valor_parcela;
	}
	public void setValor_parcela(double valor_parcela) {
		this.valor_parcela = valor_parcela;
	}
	public int getIdCartao() {
		return idCartao;
	}
	public void setIdCartao(int idCartao) {
		this.idCartao = idCartao;
	}
	public int getIdPagamento() {
		return idPagamento;
	}
	public void setIdPagamento(int idPagamento) {
		this.idPagamento = idPagamento;
	}
	public double getValor() {
		return valor;
	}
	public void setValor(double valor) {
		this.valor = valor;
	}
	public int getQtd() {
		return qtd;
	}
	public void setQtd(int qtd) {
		this.qtd = qtd;
	}
	
}
