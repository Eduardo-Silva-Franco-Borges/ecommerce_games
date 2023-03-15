package br.com.projetoles.negocio;


import br.com.projetoles.domain.EntidadeDominio;
import br.com.projetoles.domain.Pessoa;


public class ValidaDuplicidadeDocumento implements IStrategy{

	@Override
	public String process(EntidadeDominio entity) {
		String msg = null;
		
		Pessoa person = ((Pessoa) entity);
		
		if(person != null && person.getCliente().getDocumento().getCodigo()!=null) {
			person.getCliente().getDocumento().setCodigo(person.getCliente().getDocumento().getCodigo().replaceAll("[/. _-]", ""));
			
			 
			msg = "O CPF "+ person.getCliente().getDocumento().getCodigo() +" já foi cadastrado";
				 
		}
		
		return msg;
	}

}
