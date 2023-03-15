
package br.com.projetoles.domain;

import br.com.projetoles.domain.EntidadeDominio;

public class TipoCliente extends EntidadeDominio {
	
	private String nome;

	private String descricao;

	public TipoCliente(String nome, String descricao) {
		this.nome = nome;
		this.descricao = descricao;
	}
	public TipoCliente( String descricao) {
		
		this.descricao = descricao;
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

	

}
