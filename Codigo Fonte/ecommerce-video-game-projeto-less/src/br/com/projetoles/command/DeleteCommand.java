package br.com.projetoles.command;

import br.com.projetoles.domain.EntidadeDominio;
import br.com.projetoles.domain.Result;

public class DeleteCommand extends AbstractCommand{

	@Override
	public Result executar(EntidadeDominio entity) {
		return fachada.excluir(entity);
	}
	
}
