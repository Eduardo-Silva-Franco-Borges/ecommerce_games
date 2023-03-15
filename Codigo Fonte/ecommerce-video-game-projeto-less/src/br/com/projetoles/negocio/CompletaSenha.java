package br.com.projetoles.negocio;

import br.com.projetoles.domain.EntidadeDominio;
import br.com.projetoles.domain.Pessoa;
import br.com.projetoles.util.PasswordEncryptSHA512;

public class CompletaSenha implements IStrategy {

	@Override
	public String process(EntidadeDominio entity) {
		String className = entity.getClass().getSimpleName();

		Pessoa user = null;
		if (className.equals(Pessoa.class.getSimpleName())) {
			user = ((Pessoa) entity).getCliente();
		} else {
			user = (Pessoa) entity;
		}

		if (user != null && user.getCliente().getSenha() != null && !user.getCliente().getSenha().equals(""))
			user.getCliente().setSenha(PasswordEncryptSHA512.encryptThisString(user.getCliente().getSenha()));
		return null;
	}

	

}
