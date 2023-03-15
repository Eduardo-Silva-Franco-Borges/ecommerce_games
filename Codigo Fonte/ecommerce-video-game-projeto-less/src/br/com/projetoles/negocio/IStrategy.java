package br.com.projetoles.negocio;

import br.com.projetoles.domain.EntidadeDominio;

public interface IStrategy {
	public String process(EntidadeDominio entity);
}
