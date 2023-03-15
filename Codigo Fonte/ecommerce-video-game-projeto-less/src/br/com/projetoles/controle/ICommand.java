package br.com.projetoles.controle;

import br.com.projetoles.domain.EntidadeDominio;

public interface ICommand {
	
	public Object executar(EntidadeDominio entidade);
}