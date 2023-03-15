package br.com.projetoles.domain;

public class Produto extends EntidadeDominio{
	
	private String idProduto;
	private String nome;
	private String descricao;
	private String ativo;
	private String idCategoriaProduto;
	private String grupoPrecificacao;
	private String img;
	private double precoCusto;
	private int quantidade;
	
	
	private String fabricante;
	private String fornecedor;
	private String codBarras;
	private String motivoAtivacao;
	private String motivoInativacao;
	
	
	
	
	public Produto() {
		super();
	}
	
	

	

	public String getMotivoAtivacao() {
		return motivoAtivacao;
	}





	public void setMotivoAtivacao(String motivoAtivacao) {
		this.motivoAtivacao = motivoAtivacao;
	}





	public String getMotivoInativacao() {
		return motivoInativacao;
	}





	public void setMotivoInativacao(String motivoInativacao) {
		this.motivoInativacao = motivoInativacao;
	}





	public String getFabricante() {
		return fabricante;
	}





	public void setFabricante(String fabricante) {
		this.fabricante = fabricante;
	}





	public String getFornecedor() {
		return fornecedor;
	}





	public void setFornecedor(String fornecedor) {
		this.fornecedor = fornecedor;
	}





	public String getCodBarras() {
		return codBarras;
	}





	public void setCodBarras(String codBarras) {
		this.codBarras = codBarras;
	}





	public Produto(String idProduto, double precoCusto, int quantidade) {
		super();
		this.idProduto = idProduto;
		this.precoCusto = precoCusto;
		this.quantidade = quantidade;
	}



	public Produto( String idProduto, String nome, String descricao, String ativo, String idCategoriaProduto,
			String grupoPrecificacao, String img) {
		super();
		this.idProduto = idProduto;
		this.nome = nome;
		this.descricao = descricao;
		this.ativo = ativo;
		this.idCategoriaProduto = idCategoriaProduto;
		this.grupoPrecificacao = grupoPrecificacao;
		this.img = img;
	}
	
	
	
	
	
	
	public Produto(String idProduto, String nome, String descricao, String ativo, String idCategoriaProduto,
			String grupoPrecificacao, String img, double precoCusto, int quantidade) {
		super();
		this.idProduto = idProduto;
		this.nome = nome;
		this.descricao = descricao;
		this.ativo = ativo;
		this.idCategoriaProduto = idCategoriaProduto;
		this.grupoPrecificacao = grupoPrecificacao;
		this.img = img;
		this.precoCusto = precoCusto;
		this.quantidade = quantidade;
	}



	public double getPrecoCusto() {
		return precoCusto;
	}



	public void setPrecoCusto(double precoCusto) {
		this.precoCusto = precoCusto;
	}



	public int getQuantidade() {
		return quantidade;
	}



	public void setQuantidade(int quantidade) {
		this.quantidade = quantidade;
	}



	public String getIdProduto() {
		return idProduto;
	}


	public void setIdProduto(String idProduto) {
		this.idProduto = idProduto;
	}



	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getDescricao() {
		return descricao;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	public String getAtivo() {
		return ativo;
	}
	public void setAtivo(String ativo) {
		this.ativo = ativo;
	}
	public String getIdCategoriaProduto() {
		return idCategoriaProduto;
	}
	public void setIdCategoriaProduto(String idCategoriaProduto) {
		this.idCategoriaProduto = idCategoriaProduto;
	}
	public String getGrupoPrecificacao() {
		return grupoPrecificacao;
	}
	public void setGrupoPrecificacao(String grupoPrecificacao) {
		this.grupoPrecificacao = grupoPrecificacao;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	
	

}
