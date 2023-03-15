package br.com.projetoles.command;

import br.com.projetoles.domain.EntidadeDominio;
import br.com.projetoles.domain.Result;

public class UpdateCommand extends AbstractCommand{

	@Override
	public Result executar(EntidadeDominio entity) {
		return fachada.alterar(entity);
	}

}
