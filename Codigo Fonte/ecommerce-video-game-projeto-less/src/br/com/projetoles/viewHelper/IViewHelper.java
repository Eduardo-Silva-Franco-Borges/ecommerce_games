package br.com.projetoles.viewHelper;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.projetoles.domain.EntidadeDominio;
import br.com.projetoles.domain.Result;

public interface IViewHelper {
	
	public EntidadeDominio getEntidade(HttpServletRequest request, String action);
	
	public void setView(Result result, HttpServletRequest request, HttpServletResponse response, String action)
			throws IOException, ServletException;

}
