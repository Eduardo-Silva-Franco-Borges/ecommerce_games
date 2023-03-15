package br.com.projetoles.domain;

import br.com.projetoles.domain.EntidadeDominio;

public class TipoDocumento extends EntidadeDominio {
	
	private String descricao;

	private String nome;

	public TipoDocumento(String descricao, String nome) {
		this.descricao = descricao;
		this.nome = nome;
	}
	
	public TipoDocumento(String descricao) {
		this.descricao = descricao;
		
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	

}
