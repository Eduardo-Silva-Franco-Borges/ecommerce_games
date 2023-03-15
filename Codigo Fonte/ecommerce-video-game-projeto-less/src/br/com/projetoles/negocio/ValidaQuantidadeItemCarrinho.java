package br.com.projetoles.negocio;

import br.com.projetoles.domain.EntidadeDominio;
import br.com.projetoles.domain.Carrinho;
import br.com.projetoles.domain.Produto;


public class ValidaQuantidadeItemCarrinho implements IStrategy {

	@Override
	public String process(EntidadeDominio entity) {
		Carrinho cart = (Carrinho) entity;
		
		Produto product = new Produto();
		product.setId(cart.getId());
		
		
		String msg = null;
		if (cart.getQuantidade_diponivel() < 1) {
			msg = "Quantidade inv�lida."; 
		} else if (cart.getQuantidade_diponivel()<0) {
			msg = "Quantidade indispon�vel no estoque.";
		}
		return msg;
	}

}
