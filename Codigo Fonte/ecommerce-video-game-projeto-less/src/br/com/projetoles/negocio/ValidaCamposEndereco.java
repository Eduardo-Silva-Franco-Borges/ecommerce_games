package br.com.projetoles.negocio;

import br.com.projetoles.domain.Endereco;
import br.com.projetoles.domain.Cidade;
import br.com.projetoles.domain.Estado;
import br.com.projetoles.domain.EntidadeDominio;


public class ValidaCamposEndereco implements IStrategy{

	@Override
	public String process(EntidadeDominio entity) {
		String msg = null;
		
		Endereco address = (Endereco) entity;
		
		if(address == null || !validateAddressFields(address)){
			msg = "Insira todos os campos obrigatórios do endereço";
		}			
		
		return msg;
	}
	
	private boolean validateAddressFields(Endereco address) {
		try {
			Cidade city = address.getCidade();
			Estado state = address.getCidade().getEstado();
			String country = address.getPais();
			
			if((address.getTipo_endereco_compra() == null || address.getTipoRua() == null || 
					address.getNumero() == null || 
					address.getBairro() == null || address.getCep() == null || 
					city == null || city.getDescricao() == null || state == null || 
					country == null)
				||
				(address.getTipo_endereco_compra().trim().length() < 1 || address.getTipoRua().trim().length()  < 1 || 
					address.getNumero().trim().length()  < 1 || address.getNumero().trim().length()  < 1 || 
					address.getBairro().trim().length()  < 1 || address.getCep().trim().length()  < 1 || 
					city.getDescricao().trim().length()  < 1)) 
			return false;
		}catch (Exception e) {
			return false;
		}
		return true;
	}
	
}
