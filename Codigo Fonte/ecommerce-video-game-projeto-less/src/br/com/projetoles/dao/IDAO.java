package br.com.projetoles.dao;

import java.util.List;

import br.com.projetoles.domain.EntidadeDominio;


public interface IDAO {
	
	public void salvar(EntidadeDominio entity);
	public void alterar(EntidadeDominio entity);
	public void excluir(EntidadeDominio entity);
	public List<EntidadeDominio> consultar(EntidadeDominio entidade);

}
