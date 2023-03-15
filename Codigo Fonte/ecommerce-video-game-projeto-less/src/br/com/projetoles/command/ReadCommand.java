package br.com.projetoles.command;

import br.com.projetoles.domain.EntidadeDominio;
import br.com.projetoles.domain.Result;

public class ReadCommand extends AbstractCommand{

	@Override
	public Result executar(EntidadeDominio entity) {
		return fachada.consultar(entity);
	}
	
}
