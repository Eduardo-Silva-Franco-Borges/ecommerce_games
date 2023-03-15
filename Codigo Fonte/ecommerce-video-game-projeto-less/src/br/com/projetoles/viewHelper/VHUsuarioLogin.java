package br.com.projetoles.viewHelper;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.projetoles.domain.Cidade;
import br.com.projetoles.domain.Cliente;
import br.com.projetoles.domain.Documento;
import br.com.projetoles.domain.Endereco;
import br.com.projetoles.domain.EntidadeDominio;
import br.com.projetoles.domain.Estado;
import br.com.projetoles.domain.Pessoa;
import br.com.projetoles.domain.Result;
import br.com.projetoles.domain.TipoCliente;
import br.com.projetoles.domain.TipoDocumento;
import br.com.projetoles.domain.TipoEndereco;
import br.com.projetoles.util.DateUtil;

public class VHUsuarioLogin implements IViewHelper{

	@Override
	public EntidadeDominio getEntidade(HttpServletRequest req, String action) {
		EntidadeDominio pessoa = null;
		Date txtBirthDate= null;
		Date txtValidadeDocument= null;
		
		String txtName = req.getParameter("txtName");
		String txtLastName = req.getParameter("txtLastName");
		txtBirthDate = new DateUtil().setDate(req.getParameter("txtBirthDate"));
		String txtGender = req.getParameter("txtGender");
		String txtTypeDocument = req.getParameter("txtTypeDocument");
		String txtDocument = req.getParameter("txtDocument");
		txtValidadeDocument = new DateUtil().setDate(req.getParameter("txtValidadeDocument"));
		String txtPhoneType = req.getParameter("txtPhoneType");
		String txtPhone = req.getParameter("txtPhone");
		String txtTypeClient = req.getParameter("txtTypeClient");
		
		
		String txtNameEnder = req.getParameter("txtNameEnder");
		String txtResidenceType = req.getParameter("txtResidenceType");
		String txtStreetType = req.getParameter("txtStreetType");
		String txtStreetName = req.getParameter("txtStreetName");
		String txtNumber = req.getParameter("txtNumber");
		String txtCep = req.getParameter("txtCep");
		String txtNeighnorhood = req.getParameter("txtNeighnorhood");
		String txtCountryHome = req.getParameter("txtCountryHome");
		String txtStateHome = req.getParameter("txtStateHome");
		String txtCity = req.getParameter("txtCity");
		String txtObservation = req.getParameter("txtObservation");
		
		String txtEmail = req.getParameter("txtEmail");
		String txtLogin = req.getParameter("txtLogin");
		String txtPassword = req.getParameter("txtPassword");
		String txtPasswordConfirmation = req.getParameter("txtPasswordConfirmation");
		
		
		
		Estado estado = new Estado(txtStateHome);
		Cidade cidade = new Cidade(txtCity,estado);
		TipoEndereco tipoEndereco = new TipoEndereco(txtResidenceType,txtNameEnder);
		Endereco endereco = new Endereco(txtCep,txtNumber,txtStreetName,txtNeighnorhood,cidade,tipoEndereco,txtStreetType,txtCountryHome,txtObservation);
		
		if(req.getParameter("txtIdCliente") != null) endereco.setCli_id(req.getParameter("txtIdCliente"));
		if(req.getParameter("txtEnd_id") != null) endereco.setId(Integer.parseInt(req.getParameter("txtEnd_id")));
		
		TipoDocumento tipoDocumento = new TipoDocumento(txtTypeDocument,txtTypeDocument);
		Documento documento = new Documento(txtDocument,txtValidadeDocument,tipoDocumento);
		
		TipoCliente tipoCliente = new TipoCliente(txtTypeClient,txtTypeClient);
		
		Cliente cliente = new Cliente(documento,txtPhoneType,txtPhone,tipoCliente,endereco,  txtEmail,  txtLogin,  txtPassword,  txtPasswordConfirmation);
		
		if(req.getParameter("txtIdCliente") != null) cliente.setId_cli(Integer.parseInt(req.getParameter("txtIdCliente")));
		if(req.getParameter("txtEnd_id") != null) cliente.setEnd_id(Integer.parseInt(req.getParameter("txtEnd_id")));
		
		pessoa = new Pessoa(txtName,txtLastName,txtBirthDate,txtGender,cliente);
		
		return pessoa;
	}

	@Override
	public void setView(Result result, HttpServletRequest request, HttpServletResponse response, String action)
			throws IOException, ServletException {
		
		if(action.equals("Criacao")) {
			request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);
		}
		
		if(action.equals("Leitura")) {
			request.setAttribute("result", result);
			request.getRequestDispatcher("/WEB-INF/Clientes.jsp").forward(request, response);
		}
		
		if(action.equals("Atualizacao")) {
			request.setAttribute("result", result);
			request.getRequestDispatcher("/usuarioLeituraLogin").forward(request, response);
		}
		
		if(action.equals("FecharPedido")) {
			request.setAttribute("result", result);
			request.getRequestDispatcher("/fecharPedido").forward(request, response);
		}
			
	}

}
