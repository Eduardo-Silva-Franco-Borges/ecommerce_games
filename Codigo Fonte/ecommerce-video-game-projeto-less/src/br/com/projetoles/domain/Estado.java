package br.com.projetoles.domain;

public class Estado {
	private String sigla;

	private String descricao;

	public Estado(String sigla, String descricao) {
		this.setSigla(sigla);
		this.setDescricao(descricao);
	}
	
	public Estado(String sigla) {
		this.setSigla(sigla);
		
	}

	public String getSigla() {
		return sigla;
	}

	public void setSigla(String sigla) {
		this.sigla = sigla;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
}
