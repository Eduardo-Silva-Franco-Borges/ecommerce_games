package br.com.projetoles.command;

import br.com.projetoles.domain.EntidadeDominio;
import br.com.projetoles.domain.Result;

public interface ICommand {
	public Result executar(EntidadeDominio entidade);
}
