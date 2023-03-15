package br.com.projetoles.viewHelper;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.projetoles.domain.Cidade;
import br.com.projetoles.domain.Endereco;
import br.com.projetoles.domain.EntidadeDominio;
import br.com.projetoles.domain.Estado;
import br.com.projetoles.domain.Result;
import br.com.projetoles.domain.TipoEndereco;

public class VHEnderecoCompras implements IViewHelper {
	private String enderecoTipo = null;

	@Override
	public EntidadeDominio getEntidade(HttpServletRequest req, String action) {
		
		verificarTipo(action);
		
		String txtNameEnder = req.getParameter("txtName"+ enderecoTipo);
		String txtResidenceType = req.getParameter("txtResidenceType"+ enderecoTipo);
		String txtStreetType = req.getParameter("txtStreetType"+ enderecoTipo);
		String txtStreetName = req.getParameter("txtStreetName"+ enderecoTipo);
		String txtNumber = req.getParameter("txtNumber"+ enderecoTipo);
		String txtCep = req.getParameter("txtCep"+ enderecoTipo);
		String txtNeighnorhood = req.getParameter("txtNeighnorhood"+ enderecoTipo);
		String txtCountryHome = req.getParameter("txtCountryHome"+ enderecoTipo);
		String txtStateHome = req.getParameter("txtStateHome"+ enderecoTipo);
		String txtCity = req.getParameter("txtCity"+ enderecoTipo);
		String txtObservation = req.getParameter("txtObservation"+ enderecoTipo);
		
		String tipoEnderecoCompra = req.getParameter("txtTipoEnderecoCompra"+ enderecoTipo);
		
		String cliId = req.getParameter("txtCliId"+ enderecoTipo);
		
		//System.out.println(cliId);
		
		Estado estado = new Estado(txtStateHome);
		Cidade cidade = new Cidade(txtCity,estado);
		TipoEndereco tipoEndereco = new TipoEndereco(txtResidenceType,txtNameEnder);
		Endereco endereco = new Endereco(cliId,txtCep,txtNumber,txtStreetName,txtNeighnorhood,cidade,tipoEndereco,txtStreetType,txtCountryHome,txtObservation,tipoEnderecoCompra);
		
		if(req.getParameter("idClienteEndereco") != null)endereco.setCli_id(req.getParameter("idClienteEndereco"));
		if(req.getParameter("id_end") != null)endereco.setId(Integer.parseInt(req.getParameter("id_end")));
		
		return endereco;
	}

	private void verificarTipo(String action) {
		
		action = action.replace("Criacao", "");
		
		if (action.contains("Cobranca"))
			enderecoTipo = "BA";
		else if (action.contains("Entrega"))
			enderecoTipo = "DA";
		
	}

	@Override
	public void setView(Result result, HttpServletRequest request, HttpServletResponse response, String action)
			throws IOException, ServletException {
		
		if(action.equals("Criacao")) {
//			request.getRequestDispatcher("usuarioLeituraLogin").forward(request, response);
			response.sendRedirect("/ecommerce-video-game-projeto-less/usuarioLeituraLogin");
		}
		if(action.equals("FecharPedidoCriacaoEntrega")) {
			request.getRequestDispatcher("/fecharPedido").forward(request, response);
		}
		
		if(action.equals("Atualizacao")) {
			request.getRequestDispatcher("/usuarioLeituraLogin").forward(request, response);
		}
		
	}

}
