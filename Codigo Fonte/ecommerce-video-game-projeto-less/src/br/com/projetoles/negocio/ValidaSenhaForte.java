package br.com.projetoles.negocio;

import br.com.projetoles.domain.Cliente;
import br.com.projetoles.domain.EntidadeDominio;
import br.com.projetoles.domain.Pessoa;


public class ValidaSenhaForte implements IStrategy {

	@Override
	public String process(EntidadeDominio entity) {
		String pwdStrong = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*](?=\\S+$).{8,15}$";
		String msg = null;
		String className = entity.getClass().getSimpleName();
		
		Pessoa user = null;
		if (className.equals(Cliente.class.getSimpleName())) {
			user= ((Cliente) entity).getCliente();
		} else {
			user= (Cliente) entity;
		}		
		
		
		if (user.getCliente().getDocumento().getCodigo() == null || user.getCliente().getDocumento().getCodigo().equals(""))
			return null;
		if (!user.getCliente().getDocumento().getCodigo().matches(pwdStrong)) {
			msg = "Senha fraca! (8 caract�res, 1 letra mai�scula, 1 min�scula, 1 s�mbolo, 1 n�mero)";
		}
		return msg;
	}

	

}
