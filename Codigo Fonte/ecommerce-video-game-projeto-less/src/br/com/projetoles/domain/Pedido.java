package br.com.projetoles.domain;

import java.util.Date;
import java.util.List;

public class Pedido extends EntidadeDominio {
	
	
	private int idPedido;
	private int idStatus;
	private String nome_Status;
	private int idCliente;
	private int idEndereco;
	private Date dt_cadastro;
	private double precoTotal;
	private double desconto;
	private double frete;
	
	private String nome_endereco;
	private String tipo_endereco;
	private String tipo_logradour;
	private String logradour;
	private String numero_endereco;
	private String cep;
	private String cidade;
	
	private List<EntidadeDominio> itemPedido;
	private List<EntidadeDominio> cartoes;
	
	private StringBuilder tabelaProdutosPedido;
	private StringBuilder tabelaCartoesPedido;
	
	private int idStatusPedidoNovo;
	private int idStatusPedidoAntigo;
	
	private int troca;
	
	private int totalPedidos;
	private int pedidosPlaystation;
	private int pedidosXbox;
	private int pedidosNintento;
	
	private String dtPesquisaInicio;
	private String dtPesquisaFim;
	
	
	
	public Pedido() {
		super();
	}
	
	public Pedido(int idPedido, int idStatus, int idCliente, int idEndereco, Date dt_cadastro, double precoTotal,
			double desconto, double frete) {
		super();
		this.idPedido = idPedido;
		this.idStatus = idStatus;
		this.idCliente = idCliente;
		this.idEndereco = idEndereco;
		this.dt_cadastro = dt_cadastro;
		this.precoTotal = precoTotal;
		this.desconto = desconto;
		this.frete = frete;
	}
	
	
	
	
	
	
	
	public String getDtPesquisaInicio() {
		return dtPesquisaInicio;
	}

	public void setDtPesquisaInicio(String dtPesquisaInicio) {
		this.dtPesquisaInicio = dtPesquisaInicio;
	}

	public String getDtPesquisaFim() {
		return dtPesquisaFim;
	}

	public void setDtPesquisaFim(String dtPesquisaFim) {
		this.dtPesquisaFim = dtPesquisaFim;
	}

	public int getTotalPedidos() {
		return totalPedidos;
	}

	public void setTotalPedidos(int totalPedidos) {
		this.totalPedidos = totalPedidos;
	}

	public int getPedidosPlaystation() {
		return pedidosPlaystation;
	}

	public void setPedidosPlaystation(int pedidosPlaystation) {
		this.pedidosPlaystation = pedidosPlaystation;
	}

	public int getPedidosXbox() {
		return pedidosXbox;
	}

	public void setPedidosXbox(int pedidosXbox) {
		this.pedidosXbox = pedidosXbox;
	}

	public int getPedidosNintento() {
		return pedidosNintento;
	}

	public void setPedidosNintento(int pedidosNintento) {
		this.pedidosNintento = pedidosNintento;
	}

	public int getTroca() {
		return troca;
	}

	public void setTroca(int troca) {
		this.troca = troca;
	}

	public int getIdStatusPedidoNovo() {
		return idStatusPedidoNovo;
	}

	public void setIdStatusPedidoNovo(int idStatusPedidoNovo) {
		this.idStatusPedidoNovo = idStatusPedidoNovo;
	}

	public int getIdStatusPedidoAntigo() {
		return idStatusPedidoAntigo;
	}

	public void setIdStatusPedidoAntigo(int idStatusPedidoAntigo) {
		this.idStatusPedidoAntigo = idStatusPedidoAntigo;
	}

	public StringBuilder getTabelaCartoesPedido() {
		return tabelaCartoesPedido;
	}

	public void setTabelaCartoesPedido(StringBuilder tabelaCartoesPedido) {
		this.tabelaCartoesPedido = tabelaCartoesPedido;
	}

	public StringBuilder getTabelaProdutosPedido() {
		return tabelaProdutosPedido;
	}

	public void setTabelaProdutosPedido(StringBuilder tabelaProdutosPedido) {
		this.tabelaProdutosPedido = tabelaProdutosPedido;
	}

	public List<EntidadeDominio> getCartoes() {
		return cartoes;
	}

	public void setCartoes(List<EntidadeDominio> cartoes) {
		this.cartoes = cartoes;
	}

	public List<EntidadeDominio> getItemPedido() {
		return itemPedido;
	}

	public void setItemPedido(List<EntidadeDominio> itemPedido) {
		this.itemPedido = itemPedido;
	}

	public String getNome_Status() {
		return nome_Status;
	}

	public void setNome_Status(String nome_Status) {
		this.nome_Status = nome_Status;
	}

	public String getNome_endereco() {
		return nome_endereco;
	}

	public void setNome_endereco(String nome_endereco) {
		this.nome_endereco = nome_endereco;
	}

	public String getTipo_endereco() {
		return tipo_endereco;
	}

	public void setTipo_endereco(String tipo_endereco) {
		this.tipo_endereco = tipo_endereco;
	}

	public String getTipo_logradour() {
		return tipo_logradour;
	}

	public void setTipo_logradour(String tipo_logradour) {
		this.tipo_logradour = tipo_logradour;
	}

	public String getLogradour() {
		return logradour;
	}

	public void setLogradour(String logradour) {
		this.logradour = logradour;
	}

	public String getNumero_endereco() {
		return numero_endereco;
	}

	public void setNumero_endereco(String numero_endereco) {
		this.numero_endereco = numero_endereco;
	}

	public String getCep() {
		return cep;
	}

	public void setCep(String cep) {
		this.cep = cep;
	}

	public String getCidade() {
		return cidade;
	}

	public void setCidade(String cidade) {
		this.cidade = cidade;
	}

	public int getIdPedido() {
		return idPedido;
	}
	public void setIdPedido(int idPedido) {
		this.idPedido = idPedido;
	}
	public int getIdStatus() {
		return idStatus;
	}
	public void setIdStatus(int idStatus) {
		this.idStatus = idStatus;
	}
	public int getIdCliente() {
		return idCliente;
	}
	public void setIdCliente(int idCliente) {
		this.idCliente = idCliente;
	}
	public int getIdEndereco() {
		return idEndereco;
	}
	public void setIdEndereco(int idEndereco) {
		this.idEndereco = idEndereco;
	}
	public Date getDt_cadastro() {
		return dt_cadastro;
	}
	public void setDt_cadastro(Date dt_cadastro) {
		this.dt_cadastro = dt_cadastro;
	}
	public double getPrecoTotal() {
		return precoTotal;
	}
	public void setPrecoTotal(double precoTotal) {
		this.precoTotal = precoTotal;
	}
	public double getDesconto() {
		return desconto;
	}
	public void setDesconto(double desconto) {
		this.desconto = desconto;
	}
	public double getFrete() {
		return frete;
	}
	public void setFrete(double frete) {
		this.frete = frete;
	}
	
	
}
