package br.com.projetoles.domain;

import br.com.projetoles.domain.EntidadeDominio;

public class Endereco extends EntidadeDominio{
	
	private String cep;
	private String numero;
	private String rua;
	private String bairro;
	private String tipoRua;
	private String pais;
	private String obs;
	private String cli_id;
	private String tipo_endereco_compra;
	
	
	
	public String getTipo_endereco_compra() {
		return tipo_endereco_compra;
	}
	public void setTipo_endereco_compra(String tipo_endereco_compra) {
		this.tipo_endereco_compra = tipo_endereco_compra;
	}
	public String getCli_id() {
		return cli_id;
	}
	public void setCli_id(String cli_id) {
		this.cli_id = cli_id;
	}
	private TipoEndereco tipoEndereco;
	private Cidade cidade;
	public String getCep() {
		return cep;
	}
	public void setCep(String cep) {
		this.cep = cep;
	}
	public String getNumero() {
		return numero;
	}
	public void setNumero(String numero) {
		this.numero = numero;
	}
	public String getRua() {
		return rua;
	}
	public void setRua(String rua) {
		this.rua = rua;
	}
	public String getBairro() {
		return bairro;
	}
	public void setBairro(String bairro) {
		this.bairro = bairro;
	}
	
	public Endereco(String cli_id,String cep,String numero,String rua,String bairro, Cidade cidade, TipoEndereco tipoEndereco,String tipoRua,String pais,String obs) {
		this.setCli_id(cli_id);
		this.setCep(cep);
		this.setNumero(numero);
		this.setRua(rua);
		this.setBairro(bairro);
		this.setCidade(cidade);
		this.setTipoEndereco(tipoEndereco);
		this.setTipoRua(tipoRua);
		this.setPais(pais);
		this.setObs(obs);
		
	}
	public Endereco(String cli_id,String cep,String numero,String rua,String bairro, Cidade cidade, TipoEndereco tipoEndereco,String tipoRua,String pais,String obs,String tipo_endereco_compra) {
		this.setCli_id(cli_id);
		this.setCep(cep);
		this.setNumero(numero);
		this.setRua(rua);
		this.setBairro(bairro);
		this.setCidade(cidade);
		this.setTipoEndereco(tipoEndereco);
		this.setTipoRua(tipoRua);
		this.setPais(pais);
		this.setObs(obs);
		this.setTipo_endereco_compra(tipo_endereco_compra);
		
	}
	public Endereco(String cep,String numero,String rua,String bairro, Cidade cidade, TipoEndereco tipoEndereco,String tipoRua,String pais,String obs) {
		
		this.setCep(cep);
		this.setNumero(numero);
		this.setRua(rua);
		this.setBairro(bairro);
		this.setCidade(cidade);
		this.setTipoEndereco(tipoEndereco);
		this.setTipoRua(tipoRua);
		this.setPais(pais);
		this.setObs(obs);
		
	}
	
	public Endereco(String cep,String numero,String rua,String bairro, Cidade cidade, TipoEndereco tipoEndereco,String tipoRua,String pais,String obs,String tipo_endereco_compra) {
		
		this.setCep(cep);
		this.setNumero(numero);
		this.setRua(rua);
		this.setBairro(bairro);
		this.setCidade(cidade);
		this.setTipoEndereco(tipoEndereco);
		this.setTipoRua(tipoRua);
		this.setPais(pais);
		this.setObs(obs);
		this.setTipo_endereco_compra(tipo_endereco_compra);
		
	}
	
	
	public Endereco() {
		
	}
	public Cidade getCidade() {
		return cidade;
	}
	public void setCidade(Cidade cidade) {
		this.cidade = cidade;
	}
	
	public String getTipoRua() {
		return tipoRua;
	}
	public void setTipoRua(String tipoRua) {
		this.tipoRua = tipoRua;
	}
	public String getPais() {
		return pais;
	}
	public void setPais(String pais) {
		this.pais = pais;
	}
	public String getObs() {
		return obs;
	}
	public void setObs(String obs) {
		this.obs = obs;
	}
	public TipoEndereco getTipoEndereco() {
		return tipoEndereco;
	}
	public void setTipoEndereco(TipoEndereco tipoEndereco) {
		this.tipoEndereco = tipoEndereco;
	}
}
