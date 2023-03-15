package br.com.projetoles.negocio;


import br.com.projetoles.dao.CupomDAO;
import br.com.projetoles.domain.EntidadeDominio;



public class ValidaCupomAplicado implements IStrategy {

	@Override
	public String process(EntidadeDominio entity) {
		String msg = "";
		try {
			CupomDAO availableCupons = new CupomDAO();
			if (availableCupons == null) 
				msg += "Cupom não encontrado!\n";
			
		} catch (Exception ex) {
			msg = "Erro ao localizar cupom!\n";
		}
		return msg;
	}

}
