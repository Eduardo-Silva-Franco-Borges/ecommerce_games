package br.com.projetoles.negocio;

import br.com.projetoles.domain.EntidadeDominio;
import br.com.projetoles.domain.Produto;


public class ValidaCamposProduto implements IStrategy{

	@Override
	public String process(EntidadeDominio entity) {
		String msg = "";
		
		Produto product = (Produto) entity;
		
		if(!validateNullFields(product)){
			msg = "Selecione um produto";
		}			
		
		return msg;
	}
	
	private boolean validateNullFields(Produto prod) {
		if((prod == null || prod.getFornecedor().equals("")) || prod.getCodBarras().equals(""))
				
			return false;
		
		return true;
	}

}
