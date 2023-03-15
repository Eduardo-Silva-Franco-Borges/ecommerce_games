package br.com.projetoles.viewHelper;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.projetoles.domain.Cartao;
import br.com.projetoles.domain.Endereco;
import br.com.projetoles.domain.EntidadeDominio;
import br.com.projetoles.domain.Result;

public class VHCartao implements IViewHelper {

	@Override
	public EntidadeDominio getEntidade(HttpServletRequest req, String action) {
		int  cliId = 0;
		
		String bandeira = req.getParameter("txtBandeiraCartao");
		String numero = req.getParameter("txtNumeroCartao");
		String nome = req.getParameter("txtNomeCartao");
		String codigo_seguranca = req.getParameter("txtcodigoSegurancaCartao");
		if(req.getParameter("txtCliIdCartao") != null) {
		  cliId = Integer.parseInt(req.getParameter("txtCliIdCartao"));
		}
		
		Cartao cartao = new Cartao(cliId,bandeira,numero,nome,codigo_seguranca);
		
		if(req.getParameter("idClienteCartao") != null)cartao.setCli_id(Integer.parseInt(req.getParameter("idClienteCartao")));
		if(req.getParameter("idCard") != null)cartao.setId_cartao(Integer.parseInt(req.getParameter("idCard")));
		
		return cartao;
	}

	@Override
	public void setView(Result result, HttpServletRequest request, HttpServletResponse response, String action)
			throws IOException, ServletException {
		
		if(action.equals("Criacao")) {
//			request.getRequestDispatcher("usuarioLeituraLogin").forward(request, response);
			response.sendRedirect("/ecommerce-video-game-projeto-less/usuarioLeituraLogin");
		}
		
		if(action.equals("CriacaoFecharPedido")) {

			request.getRequestDispatcher("/fecharPedido").forward(request, response);
		}
		if(action.equals("Atualizacao")) {

			request.getRequestDispatcher("/usuarioLeituraLogin").forward(request, response);
		}
		
		

	}

}
