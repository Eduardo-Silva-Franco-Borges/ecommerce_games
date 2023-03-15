package br.com.projetoles.domain;

public class Cidade {

	private String descricao;
	private Estado estado;

	public Cidade(String descricao, Estado estado) {
		this.setDescricao(descricao);
		this.setEstado(estado);
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public Estado getEstado() {
		return estado;
	}

	public void setEstado(Estado estado) {
		this.estado = estado;
	}
}
