
package br.com.projetoles.domain;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import br.com.projetoles.domain.EntidadeDominio;



public class Documento extends EntidadeDominio {

	private String codigo;

	private Date validade;
	
	private TipoDocumento tipoDocumento;
	
	
	public Documento(String codigo, Date validade, TipoDocumento tipoDocumento) {
		
		this.codigo = codigo;
		this.validade = validade;
		this.tipoDocumento = tipoDocumento;
	}
	
	public TipoDocumento getTipoDocumento() {
		return tipoDocumento;
	}

	public void setTipoDocumento(TipoDocumento tipoDocumento) {
		this.tipoDocumento = tipoDocumento;
	}

	public String getCodigo() {
		return codigo;
	}

	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}
	
	
	public Date getValidade() {
		return validade;
	}

	public void setValidade(Date validade) {
		this.validade = validade;
	}

}

