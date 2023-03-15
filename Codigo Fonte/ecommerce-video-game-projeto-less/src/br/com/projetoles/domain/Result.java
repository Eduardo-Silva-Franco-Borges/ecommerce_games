package br.com.projetoles.domain;

import java.util.ArrayList;
import java.util.List;

import br.com.projetoles.domain.EntidadeDominio;

public class Result {
	private String message;
	private List<EntidadeDominio> entities;

	
	
	public String getMessage() {
		return message;
	}


	public void setMessage(String message) {
		this.message = message;
	}


	public List<EntidadeDominio> getEntities() {
		return entities;
	}


	public void setEntities(List<EntidadeDominio> entities) {
		this.entities = entities;
	}

	public List<EntidadeDominio> add(EntidadeDominio entity) {
		if (entities == null) {
			entities = new ArrayList<EntidadeDominio>();
			entities.add(entity);
		} else
			entities.add(entity);

		return entities;
	}
}
