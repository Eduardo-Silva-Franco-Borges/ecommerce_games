package br.com.projetoles.command;

import br.com.projetoles.controle.Fachada;
import br.com.projetoles.controle.IFachada;

public abstract class AbstractCommand implements ICommand{
	protected IFachada fachada = new Fachada();
}
