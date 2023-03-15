package br.com.projetoles.domain;

public class Pagamento extends EntidadeDominio {
	private int idPedido;

	public Pagamento() {
		super();
	}

	public Pagamento(int idPedido) {
		super();
		this.idPedido = idPedido;
	}

	public int getIdPedido() {
		return idPedido;
	}

	public void setIdPedido(int idPedido) {
		this.idPedido = idPedido;
	}
	
}
