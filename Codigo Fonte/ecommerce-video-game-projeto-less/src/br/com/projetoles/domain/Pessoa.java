package br.com.projetoles.domain;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import br.com.projetoles.domain.EntidadeDominio;





public class Pessoa extends EntidadeDominio {
	
	
	private String nome;
	private String sobrenome;
	private Date dt_nascimento;
	private String genero;
	private Cliente cliente;
	
	
	public Pessoa() {
		
	}
	
	
	public Pessoa(String nome, String sobrenome, Date dt_nascimento, String genero,Cliente cliente) {
		super();
		this.nome = nome;
		this.sobrenome = sobrenome;
		this.dt_nascimento = dt_nascimento;
		this.genero = genero;
		this.cliente = cliente;
	}
	
	
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getSobrenome() {
		return sobrenome;
	}
	public void setSobrenome(String sobrenome) {
		this.sobrenome = sobrenome;
	}
	public Date getDt_nascimento() {
		return dt_nascimento;
	}
	public void setDt_nascimento(Date dt_nascimento) {
		this.dt_nascimento = dt_nascimento;
	}
	public String getGenero() {
		return genero;
	}
	public void setGenero(String genero) {
		this.genero = genero;
	}
	public Cliente getCliente() {
		return cliente;
	}
	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}
	
	
	

}
