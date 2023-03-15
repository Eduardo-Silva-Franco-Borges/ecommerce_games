package br.com.projetoles.negocio;

import br.com.projetoles.domain.Cartao;
import br.com.projetoles.domain.EntidadeDominio;


public class ValidaCamposCartao implements IStrategy{

	@Override
	public String process(EntidadeDominio entity) {
		String msg = "";
		
		Cartao creditCard = (Cartao) entity;
		
		if(!validateCreditCardFields(creditCard)){
			msg = "Insira todos os campos obrigatórios do cartão de crédito";
		}			
		
		return msg;
	}
	
	private boolean validateCreditCardFields(Cartao card) {
 		if((card.getNome_impresso() == null || card.getNumero() == null ||
				card.getCodigo_seguranca() == null || card.getBandeira_cartao() == null ||
				card.getBandeira_cartao()== null)
				||
			(card.getNome_impresso().trim().length() < 1 || card.getNumero().trim().length() < 1 ||
				card.getCodigo_seguranca().trim().length() < 1))
			return false;
		
		return true;
	}

}
