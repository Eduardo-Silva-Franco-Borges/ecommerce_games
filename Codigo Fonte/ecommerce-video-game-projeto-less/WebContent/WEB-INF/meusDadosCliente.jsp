<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="br.com.projetoles.domain.Pessoa"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>

<%@page import="java.text.DateFormat"%>
<%@page import="java.text.ParseException"%>







<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0,maximum-scale=1">

<title>Meus Dados</title>

<!-- Loading third party fonts -->
<link
	href="http://fonts.googleapis.com/css?family=Roboto:100,300,400,700|"
	rel="stylesheet" type="text/css">
<link href="fonts/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="fonts/lineo-icon/style.css" rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- Loading main css file -->
<link rel="stylesheet" href="style.css">



<script type="text/javascript">
	function modalAlterar(id_cliente,id_cliente_ender,nome,
						  sobrenome,
						  dt_nascimento,
						  genero,
						  tipo_doc,
						  num_doc,
						  validade_doc,
						  tipo_telefone,
						  telefone,
						  tipo_cliente, 
						  nome_endereco, 
						  tipo_residencia, 
						  tipo_logradouro, 
						  logradouro, 
						  numero, 
						  cep, 
						  bairro, 
						  pais, 
						  estado, 
						  cidade, 
						  obs) {
		
		//alert(dt_nascimento);
		
		$('#modalAlterar #txtNameUpdate').val(nome);
		$('#modalAlterar #txtLastNameUpdate').val(sobrenome);
		
		$('#modalAlterar #txtBirthDateUpdate').val(dt_nascimento);
		$('#modalAlterar #txtGenderUpdate').val(genero);
		$('#modalAlterar #txtTypeDocumentUpdate').val(tipo_doc);
		$('#modalAlterar #txtDocumentUpdate').val(num_doc);
		$('#modalAlterar #txtValidadeDocumentUpdate').val(validade_doc);
		$('#modalAlterar #txtPhoneTypeUpdate').val(tipo_telefone);
		$('#modalAlterar #txtPhoneUpdate').val(telefone);
		$('#modalAlterar #txtTypeClientUpdate').val(tipo_cliente);
		
		$('#modalAlterar #txtNameEnderUpdate').val(nome_endereco);
		$('#modalAlterar #txtResidenceTypeHomeUpdate').val(tipo_residencia);
		$('#modalAlterar #txtStreetTypeUpdate').val(tipo_logradouro);
		$('#modalAlterar #txtStreetNameUpdate').val(logradouro);
		$('#modalAlterar #txtNumberUpdate').val(numero);
		$('#modalAlterar #txtCepUpdate').val(cep);
		$('#modalAlterar #txtNeighnorhoodUpdate').val(bairro);
		$('#modalAlterar #txtCountryHomeUpdate').val(pais);
		$('#modalAlterar #txtCityUpdate').val(cidade);
		$('#modalAlterar #txtStateHomeUpdate').val(estado);
		$('#modalAlterar #txtObservationUpdate').val(obs);
		
		$('#modalAlterar #id_cliente').val(id_cliente);
		$('#modalAlterar #id_cliente_ender').val(id_cliente_ender);
		
		$('#modalAlterar').modal('show');
	}
</script>


</head>


<body class="slider-collapse">

	<div id="site-content">

		<div id="header"></div>

		<main class="main-content">
			<div class="container">
				<div class="page">



					<ul class="nav nav-tabs" id="myTab" role="tablist">
						<li class="nav-item active">
							<a class="nav-link active" id="dados-pessoais" data-toggle="tab" href="#DadosPessoais" role="tab" aria-selected="true" aria-expanded="true">Dados Pessoais</a>
						</li>

						<li class="nav-item"><a class="nav-link" id="dados-usuario"
							data-toggle="tab" href="#DadosUsuario" role="tab"
							aria-selected="false">Dados de Usuário</a></li>

						<li class="nav-item"><a class="nav-link"
							id="endereco-cobranca" data-toggle="tab" href="#EnderecoCobranca"
							role="tab" aria-selected="false">Endereço de Cobrança</a></li>

						<li class="nav-item"><a class="nav-link"
							id="endereco-entrega" data-toggle="tab" href="#EnderecoEntrega"
							role="tab" aria-selected="false">Endereço de Entrega</a></li>

						<li class="nav-item"><a class="nav-link" id="cartao-credito"
							data-toggle="tab" href="#CartaoCredito" role="tab"
							aria-selected="false">Cartão de Crédito</a></li>
					</ul>
					<div class="tab-content" id="myTabContent">
						<div class="tab-pane fade active in" id="DadosPessoais" role="tabpanel">
							<h1>Dados Pessoais</h1>
							<form id="formPersonalData" name="formPersonalData"
								action="CtrlCliente" method="post">
								<div class="row">


									<div class="col-md-6">
										<label class="reduced-input-label" for="txtName">Nome*</label>
										<input type="text" class="form-control reduced-input"
											id="txtName" name="txtName">
									</div>
									<div class="col-md-6">
										<label class="reduced-input-label" for="txtLastName">Sobrenome*</label>
										<input type="text" class="form-control reduced-input"
											id="txtLastName" name="txtLastName">
									</div>
								</div>
								<br>
								<div class="row">
									<div class="col-md-2">
										<label class="reduced-input-label" for="txtBirthDate">Data
											de nascimento*</label> <input type="date"
											class="form-control reduced-input" id="txtBirthDate"
											autocomplete='off' name="txtBirthDate">
									</div>
									<div class="col-md-2">
										<label class="reduced-input-label" for="txtGender">Gênero*</label>
										<select id="txtGender" name="txtGender"
											class="form-control reduced-input">
											<option value=""></option>
											<option value="M">Masculino</option>
											<option selected value="F">Feminino</option>
											<option value="O">Outro</option>
										</select>
									</div>
									<div class="col-md-2">
										<label class="reduced-input-label" for="txtTypeDocument">Tipo
											Documento*</label> <select id="txtTypeDocument"
											name="txtTypeDocument" class="form-control reduced-input">
											<option value=""></option>
											<option value="1">RG</option>
											<option selected value="2">CPF</option>
											<option value="3">CNH</option>
										</select>
									</div>
									<div class="col-md-3">
										<label class="reduced-input-label" for="txtDocument">Número
											Documento*</label> <input type="text"
											class="form-control reduced-input" id="txtDocument"
											name="txtDocument">
									</div>
									<div class="col-md-3">
										<label class="reduced-input-label" for="txtValidadeDocument">Validade
											Documento*</label> <input type="date"
											class="form-control reduced-input" id="txtValidadeDocument"
											name="txtValidadeDocument">
									</div>
								</div>
								<br> <input type="hidden" id="pageReturn" name="pageReturn">

								<div class="row">
									<div class="col-md-4">
										<label class="reduced-input-label" for="txtPhoneType">Tipo
											Telefone* </label> <select id="txtPhoneType" name="txtPhoneType"
											class="form-control">
											<option value=""></option>
											<option value="Celular">Celular</option>
											<option value="Telefone">Telefone</option>
										</select>

									</div>
									<div class="col-md-4">
										<label class="reduced-input-label" for="txtPhone">Telefone*</label>
										<input type="text" class="form-control reduced-input"
											id="txtPhone" name="txtPhone">
									</div>
									<div class="col-md-4">
										<label class="reduced-input-label" for="txtTypeClient">Tipo
											Cliente*</label> <select id="txtTypeClient" name="txtTypeClient"
											class="form-control">
											<option value=""></option>
											<option value="1">Gold</option>
											<option value="2">Silver</option>
											<option value="3">Black</option>
										</select>
									</div>


								</div>
								<br>
								<hr>
								<br>
								<h1>Endereço Residencial</h1>

								<div class="row">

									<div class="col-md-12">
										<label class="reduced-input-label" for="txtNameEnder">Nome
											Endereço</label> <input type="text"
											class="form-control reduced-input" name="txtNameEnder"
											id="txtNameEnder" value="Minha Casa">
									</div>

								</div>
								<br>

								<div class="row">
									<div class="col-md-4">
										<label class="reduced-input-label" for="txtResidenceTypeHome">Tipo
											de residência*</label> <select id="txtResidenceType"
											name="txtResidenceType" class="form-control reduced-input">
											<option value=""></option>
											<option value="Casa">Casa</option>
											<option selected value="Apartamento">Apartamento</option>
											<option value="Sobrado">Sobrado</option>
											<option value="Loja">Loja</option>
											<option value="Galpão">Galpão</option>
											<option value="Outros">Outros</option>
										</select>
									</div>
									<div class="col-md-4">
										<label class="reduced-input-label" for="txtStreetType">Tipo
											do logradouro*</label> <select id="txtStreetType"
											name="txtStreetType" class="form-control reduced-input">
											<option value=""></option>
											<option value="Rua">Rua</option>
											<option selected value="Avenida">Avenida</option>
											<option value="Travessa">Travessa</option>
											<option value="Passagem">Passagem</option>
											<option value="Outros">Outros</option>
										</select>

									</div>
									<div class="col-md-4">
										<label class="reduced-input-label" for="txtStreetName">Logradouro*</label>
										<input type="text" class="form-control reduced-input"
											name="txtStreetName" id="txtStreetName"
											value="Avenida não antes vista">
									</div>
								</div>
								<br>
								<div class="row">
									<div class="col-md-4">
										<label class="reduced-input-label" for="txtNumber">Número*</label>
										<input type="text" class="form-control reduced-input"
											name="txtNumber" id="txtNumber" value="4524">
									</div>

									<div class="col-md-4">
										<label class="reduced-input-label" for="txtCep">CEP*</label> <input
											type="text" class="form-control reduced-input" name="txtCep"
											id="txtCep" value="45544488">
									</div>
									<div class="col-md-4">
										<label class="reduced-input-label" for="txtNeighnorhood">Bairro*</label>
										<input type="text" class="form-control reduced-input"
											name="txtNeighnorhood" id="txtNeighnorhood"
											value="Vila do chaves">
									</div>
								</div>
								<br>
								<div class="row">
									<div class="col-md-4">
										<label class="reduced-input-label" for="txtCountryHome">País*</label>
										<select id="txtCountryHome" name="txtCountryHome"
											class="form-control reduced-input">
											<option value="0"></option>

											<option value="1" selected>Brasil</option>

											<option value="2">Estados Unidos</option>

											<option value="3">Espanha</option>

										</select>
									</div>

									<input type="hidden" id="formAddressType"
										name="formAddressType" value="Home">
									<div class="col-md-4">
										<label class="reduced-input-label" for="txtStateHome">Estado*</label>
										<select id="txtStateHome" name="txtStateHome"
											class="form-control reduced-input">
											<option value="0"></option>

											<option value="1">Acre</option>

											<option value="2">Alagoas</option>

											<option value="3">Amapá</option>

											<option value="4">Amazonas</option>

											<option value="5" selected>Bahia</option>

											<option value="6">Ceará</option>

											<option value="7">Espírito Santo</option>

											<option value="8">Goiás</option>

											<option value="9">Maranhão</option>

											<option value="10">Mato Grosso</option>

											<option value="11">Mato Grosso do Sul</option>

											<option value="12">Minas Gerais</option>

											<option value="13">Pará</option>

											<option value="14">Paraíba</option>

											<option value="15">Paraná</option>

											<option value="16">Pernambuco</option>

											<option value="17">Piauí</option>

											<option value="18">Rio de Janeiro</option>

											<option value="19">Rio Grande do Norte</option>

											<option value="20">Rio Grande do Sul</option>

											<option value="21">Rondônia</option>

											<option value="22">Roraima</option>

											<option value="23">Santa Catarina</option>

											<option value="24">São Paulo</option>

											<option value="25">Sergipe</option>

											<option value="26">Tocantins</option>

											<option value="27">Distrito Federal</option>

										</select>

									</div>

									<div class="col-md-4">
										<label class="reduced-input-label" for="txtCity">Cidade*</label>
										<input type="text" class="form-control reduced-input"
											name="txtCity" id="txtCity" value="Porto Seguro">
									</div>

								</div>
								<br>
								<div class="row">
									<div class="col-md-12">
										<label class="reduced-input-label" for="txtObservation">Observações</label>
										<input type="text" class="form-control reduced-input"
											name="txtObservation" id="txtObservation"
											value="Apartamento ali no 15">
									</div>
								</div>
								<br>
								<div class="col-sm form-group text-lg-right">
									
									<input type="submit" class="btn btn-primary py-3 px-3"
										id="operacao" name="operacao" value="Salvar"></div>
							</form>
						

						<table class="table table-striped">
							<thead>
								<tr>
									<th>Nome</th>
									<th>Sobrenome</th>
									<th>Documento</th>
									<th>Telefone</th>
									<th>Ações</th>
								</tr>
							</thead>
							<tbody>
								<%
									if (request.getAttribute("Pessoas") != null) {
									List<Pessoa> pessoas = (List<Pessoa>) request.getAttribute("Pessoas");
									for (Pessoa pessoa : pessoas) {
										out.print("<tr>");
										out.print("<td>");
										out.print(pessoa.getNome());
										out.print("</td>");
										out.print("<td>");
										out.print(pessoa.getSobrenome());
										out.print("</td>");
										out.print("<td>");
										out.print(pessoa.getCliente().getDocumento().getCodigo());
										out.print("</td>");
										out.print("<td>");
										out.print(pessoa.getCliente().getTelefone());
										out.print("</td>");

										out.print("<td><button type='button' class = 'btn btn-primary' onclick='modalAlterar(");
										out.print(pessoa.getCliente().getId_cli());
										out.print(",");
										out.print(pessoa.getCliente().getEnd_id());
										out.print(",");
										out.print('"'+pessoa.getNome()+'"');
										out.print(",");
										out.print('"'+pessoa.getSobrenome()+'"');
										out.print(",");					
										out.print( '"'+pessoa.getDt_nascimento().toString()+'"' );
										out.print(",");
										out.print('"'+pessoa.getGenero()+'"');
										out.print(",");
										out.print('"'+pessoa.getCliente().getDocumento().getTipoDocumento().getDescricao()+'"');
										out.print(",");
										out.print('"'+pessoa.getCliente().getDocumento().getCodigo()+'"');
										out.print(",");
										out.print('"'+pessoa.getCliente().getDocumento().getValidade().toString()+'"');
										out.print(",");
										out.print('"'+pessoa.getCliente().getTipoTelefone()+'"');
										out.print(",");
										out.print('"'+pessoa.getCliente().getTelefone()+'"');
										out.print(",");
										out.print('"'+pessoa.getCliente().getTipoCliente().getDescricao()+'"');
										
										out.print(",");
										out.print('"'+pessoa.getCliente().getEndereco().getTipoEndereco().getNome()+'"');
										out.print(",");
										out.print('"'+pessoa.getCliente().getEndereco().getTipoEndereco().getDescricao()+'"');
										out.print(",");
										out.print('"'+pessoa.getCliente().getEndereco().getTipoRua()+'"');
										out.print(",");
										out.print('"'+pessoa.getCliente().getEndereco().getRua()+'"');
										out.print(",");
										out.print('"'+pessoa.getCliente().getEndereco().getNumero()+'"');
										out.print(",");
										out.print('"'+pessoa.getCliente().getEndereco().getCep()+'"');
										out.print(",");
										out.print('"'+pessoa.getCliente().getEndereco().getBairro()+'"');
										out.print(",");
										out.print('"'+pessoa.getCliente().getEndereco().getPais()+'"');
										out.print(",");
										out.print('"'+pessoa.getCliente().getEndereco().getCidade().getEstado().getSigla()+'"');
										out.print(",");
										out.print('"'+pessoa.getCliente().getEndereco().getCidade().getDescricao()+'"');
										out.print(",");
										out.print('"'+pessoa.getCliente().getEndereco().getObs()+'"');
										out.print(")' id='operacaoAlterar' name='operacaoAlterar' value='EDITAR'><i class='fa fa-pencil' aria-hidden='true'></i> </button>&nbsp;<button type='button' class = 'btn btn-danger' id='operacaoExcluir' name='operacaoExcluir' value='EXCLUIR'><i class='fa fa-times' aria-hidden='true'></i> </button></td>");
										out.print("<tr/>");
									}
								}
								%>

							</tbody>
						</table>
					</div>
					
					<div class="tab-pane fade" id="DadosUsuario" role="tabpanel">
						<h1>Dados de Usuário</h1>
						<form id="formUserGeneric">
							<input type="hidden" id="fieldUpdateUser" name="fieldUpdateUser">

							<div class="row">
								<div class="col-md-6">
									<label for="txtEmail" class="reduced-input-label">Email</label>
									<input type="email" class="form-control reduced-input"
										id="txtEmail" name="txtEmail" placeholder="E-Mail" value="" />
								</div>
								<div class=" col-md-6">
									<label for="txtLogin" class="reduced-input-label"> Nome
										de usuário </label> <input type="text" value="Cliente"
										class="form-control reduced-input" id="txtLogin"
										name="txtLogin" placeholder="Nome de usuário" />
								</div>
							</div>
							<br>
							<div class="row">
								<div class="col-md-6">
									<label for="txtPassword" class="reduced-input-label">Senha</label>
									<input type="password" class="form-control reduced-input"
										id="txtPassword" name="txtPassword"
										placeholder="Digite a senha" value="null" />
								</div>
								<div class="col-md-6">
									<label for="txtConfirmPassword" class="reduced-input-label">Confirme
										a senha</label> <input type="password"
										class="form-control reduced-input"
										id="txtPasswordConfirmation" name="txtPasswordConfirmation"
										placeholder="Confirme a senha" value="null" />
								</div>
							</div>
						</form>
						<br>
						<div class="col-sm form-group text-lg-right">
							<form method="post" action="">
								<input type="submit" class="btn btn-primary py-3 px-3"
									value="Salvar">
							</form>
						</div>
					</div>
					<div class="tab-pane fade" id="EnderecoCobranca" role="tabpanel">
						<h1>Endereço de Cobrança</h1>
						<form method="POST" action="" id="formBillingAddresses">

							<input type="hidden" id="fieldUpdateBA" name="fieldUpdateBA">

							<input type="hidden" value="/customerRedirectUpdate"
								name="pageReturn"> <input type="hidden" value="null"
								id="attributeNameAddress" name="attributeNameAddress">

							<div class="row">
								<div class="col-md-4">
									<label class="reduced-input-label" for="txtNameBA">Nome
										de identificação*</label> <input required type="text"
										class="form-control reduced-input " value="" name="txtNameBA"
										id="txtNameBA">
								</div>
								<div class="col-md-8">
									<label class="reduced-input-label" for="txtDescriptionBA">Descrição*</label>
									<input required type="text" class="form-control reduced-input"
										name="txtDescriptionBA" id="txtDescriptionBA" value="">
								</div>
							</div>
							<br>
							<div class="row">
								<div class="col-md-4">
									<label class="reduced-input-label" for="txtResidenceTypeHomeBA">Tipo
										de residência*</label> <select id="txtResidenceTypeBA"
										name="txtResidenceTypeBA" class="form-control reduced-input">
										<option value=""></option>
										<option value="Casa">Casa</option>
										<option value="Apartamento">Apartamento</option>
										<option value="Sobrado">Sobrado</option>
										<option value="Loja">Loja</option>
										<option value="Galpão">Galpão</option>
										<option value="Outros">Outros</option>
									</select>
								</div>
								<div class="col-md-4">
									<label class="reduced-input-label" for="txtStreetTypeBA">Tipo
										do logradouro*</label> <select id="txtStreetTypeBA"
										name="txtStreetTypeBA" class="form-control reduced-input">
										<option value=""></option>
										<option value="Rua">Rua</option>
										<option value="Avenida">Avenida</option>
										<option value="Travessa">Travessa</option>
										<option value="Passagem">Passagem</option>
										<option value="Outros">Outros</option>
									</select>

								</div>
								<div class="col-md-4">
									<label class="reduced-input-label" for="txtStreetNameBA">Logradouro*</label>
									<input type="text" class="form-control reduced-input"
										name="txtStreetNameBA" id="txtStreetNameBA" value="">
								</div>
							</div>
							<br>
							<div class="row">
								<div class="col-md-4">
									<label class="reduced-input-label" for="txtNumberBA">Número*</label>
									<input type="text" class="form-control reduced-input"
										name="txtNumberBA" id="txtNumberBA" value="">
								</div>

								<div class="col-md-4">
									<label class="reduced-input-label" for="txtCepBA">CEP*</label>
									<input type="text" class="form-control reduced-input"
										name="txtCepBA" id="txtCepBA" value="">
								</div>
								<div class="col-md-4">
									<label class="reduced-input-label" for="txtNeighnorhoodBA">Bairro*</label>
									<input type="text" class="form-control reduced-input"
										name="txtNeighnorhoodBA" id="txtNeighnorhoodBA" value="">
								</div>
							</div>
							<br>
							<div class="row">
								<div class="col-md-4">
									<label class="reduced-input-label" for="txtCountryBA">País*</label>
									<select id="txtCountryBA" name="txtCountryBA"
										class="form-control reduced-input">
										<option value="0"></option>

										<option value="1">Brasil</option>

										<option value="2">Estados Unidos</option>

										<option value="3">Espanha</option>

									</select>
								</div>

								<input type="hidden" id="formAddressType" name="formAddressType"
									value="BA">
								<div class="col-md-4">
									<label class="reduced-input-label" for="txtStateBA">Estado*</label>
									<select id="txtStateBA" name="txtStateBA"
										class="form-control reduced-input">
										<option value="0"></option>

										<option value="1">Acre</option>

										<option value="2">Alagoas</option>

										<option value="3">Amapá</option>

										<option value="4">Amazonas</option>

										<option value="5" selected>Bahia</option>

										<option value="6">Ceará</option>

										<option value="7">Espírito Santo</option>

										<option value="8">Goiás</option>

										<option value="9">Maranhão</option>

										<option value="10">Mato Grosso</option>

										<option value="11">Mato Grosso do Sul</option>

										<option value="12">Minas Gerais</option>

										<option value="13">Pará</option>

										<option value="14">Paraíba</option>

										<option value="15">Paraná</option>

										<option value="16">Pernambuco</option>

										<option value="17">Piauí</option>

										<option value="18">Rio de Janeiro</option>

										<option value="19">Rio Grande do Norte</option>

										<option value="20">Rio Grande do Sul</option>

										<option value="21">Rondônia</option>

										<option value="22">Roraima</option>

										<option value="23">Santa Catarina</option>

										<option value="24">São Paulo</option>

										<option value="25">Sergipe</option>

										<option value="26">Tocantins</option>

										<option value="27">Distrito Federal</option>

									</select>
								</div>
								<div class="col-md-4">
									<label class="reduced-input-label" for="txtCityBA">Cidade*</label>
									<input type="text" class="form-control reduced-input"
										name="txtCityBA" id="txtCityBA" value="">
								</div>

							</div>
							<br>
							<div class="row">
								<div class="col-md-12">
									<label class="reduced-input-label" for="txtObservationBA">Observações</label>
									<input type="text" class="form-control reduced-input"
										name="txtObservationBA" id="txtObservationBA" value="">
								</div>
							</div>
							<p>
							<div>

								<input type="submit" class="btn btn-primary py-2"
									value="Adicionar" id="btnSendAddBA" name="btnSendAddBA">

							</div>
							<p>
						</form>
						<br>
						<table id="tableBillingAddresses" class="table">
							<thead class="thead-light">
								<tr>
									<th>Padrão</th>
									<th>Nome</th>
									<th>Tipo</th>
									<th>Logradouro</th>
									<th>Número</th>
									<th>Cidade</th>
									<th>&nbsp;</th>
									<th>&nbsp;</th>
								</tr>
							</thead>
							<tbody>

								<tr>
									<td class="product-name" style="width: 0%"><input
										type="radio" name="defaultAddress" checked></td>

									<td class="product-name">aaaa <input type="hidden"
										name="idAddressBA" id="idAddressBA"
										form="formBillingAddresses">
									</td>
									<td class="product-name" style="width: 0%">Apartamento</td>
									<td class="product-name" style="width: 50%">aaaaaaaa</td>
									<td class="product-name" style="width: 0%">aaaaaaa</td>
									<td class="product-name" style="width: 10%">dsafgsd</td>
									<td class="product-name" style="width: 5%"><a href="#"><i
											class="fa fa-pencil"></i></a></td>
									<td class="product-name" style="width: 5%"><a href="#"><i
											class="fa fa-times"></i></a></td>
								</tr>
								<tr>
									<td class="product-name" style="width: 0%"><input
										type="radio" name="defaultAddress"></td>

									<td class="product-name">Sogra <input type="hidden"
										name="idAddressBA" id="idAddressBA"
										form="formBillingAddresses">
									</td>
									<td class="product-name" style="width: 0%">Casa Sogra</td>
									<td class="product-name" style="width: 50%">accccc</td>
									<td class="product-name" style="width: 0%">ccccc</td>
									<td class="product-name" style="width: 10%">ccccc</td>
									<td class="product-name" style="width: 5%"><a href="#"><i
											class="fa fa-pencil"></i></a></td>
									<td class="product-name" style="width: 5%"><a href="#"><i
											class="fa fa-times"></i></a></td>
								</tr>
								<tr>
									<td class="product-name" style="width: 0%"><input
										type="radio" name="defaultAddress"></td>

									<td class="product-name">Home <input type="hidden"
										name="idAddressBA" id="idAddressBA"
										form="formBillingAddresses">
									</td>
									<td class="product-name" style="width: 0%">Casa</td>
									<td class="product-name" style="width: 50%">bbbbb</td>
									<td class="product-name" style="width: 0%">bbbbb</td>
									<td class="product-name" style="width: 10%">bbbbbb</td>
									<td class="product-name" style="width: 5%"><a href="#"><i
											class="fa fa-pencil"></i></a></td>
									<td class="product-name" style="width: 5%"><a href="#"><i
											class="fa fa-times"></i></a></td>
								</tr>

							</tbody>
						</table>
					</div>
					<div class="tab-pane fade" id="EnderecoEntrega" role="tabpanel">
						<h1>Endereço de Entrega</h1>

						<form method="POST" id="" action="deliveryAddressesCreate">
							<input type="hidden" id="fieldUpdateDA" name="fieldUpdateDA">

							<input type="hidden" value="/customerRedirectUpdate"
								name="pageReturn">
							<div id="consistFildsDA"></div>

							<div id="filedsDeliveryAddresses">
								<div class="row">
									<div class="col-md-4">
										<label class="reduced-input-label" for="txtNameDA">Nome
											de identificação*</label> <input required type="text"
											class="form-control reduced-input " name="txtNameDA"
											id="txtNameDA" value="">
									</div>
									<div class="col-md-8">
										<label class="reduced-input-label" for="txtDescriptionDA">Descrição*</label>
										<input required type="text" class="form-control reduced-input"
											value="" name="txtDescriptionDA" id="txtDescriptionDA">
									</div>
								</div>
								<br>
								<div class="row">
									<div class="col-md-4">
										<label class="reduced-input-label" for="txtResidenceTypeDA">Tipo
											de residência*</label> <select name="txtResidenceTypeDA"
											id="txtResidenceTypeDA" class="form-control reduced-input">
											<option value=""></option>

											<option value="Casa">Casa</option>
											<option value="Apartamento">Apartamento</option>
											<option value="Sobrado">Sobrado</option>
											<option value="Loja">Loja</option>
											<option value="Galpão">Galpão</option>
											<option value="Outros">Outros</option>
										</select>
									</div>
									<div class="col-md-4">
										<label class="reduced-input-label" for="txtStreetTypeDA">Tipo
											do logradouro*</label> <select name="txtStreetTypeDA"
											id="txtStreetTypeDA" class="form-control reduced-input">
											<option value=""></option>
											<option value="Rua">Rua</option>
											<option value="Avenida">Avenida</option>
											<option value="Travessa">Travessa</option>
											<option value="Passagem">Passagem</option>
											<option value="Outros">Outros</option>
										</select>
									</div>
									<div class="col-md-4">
										<label class="reduced-input-label" for="txtStreetNameDA">Logradouro*</label>
										<input required type="text" class="form-control reduced-input"
											name="txtStreetNameDA" id="txtStreetNameDA">
									</div>
								</div>
								<br>
								<div class="row">
									<div class="col-md-4">
										<label class="reduced-input-label" for="txtNumberDA">Número*</label>
										<input required type="text" class="form-control reduced-input"
											name="txtNumberDA" id="txtNumberDA">
									</div>

									<div class="col-md-4">
										<label class="reduced-input-label" for="txtCepDA">CEP*</label>
										<input required type="text" class="form-control reduced-input"
											name="txtCepDA" id="txtCepDA">
									</div>
									<div class="col-md-4">
										<label class="reduced-input-label" for="txtNeighnorhoodDA">Bairro*</label>
										<input required type="text" class="form-control reduced-input"
											name="txtNeighnorhoodDA" id="txtNeighnorhoodDA">
									</div>
								</div>

								<input type="hidden" id="formAddressType" name="formAddressType"
									value="DA"> <br>
								<div class="row">
									<div class="col-md-4">
										<label class="reduced-input-label" for="txtCountryDA">País*</label>
										<select name="txtCountryDA" id="txtCountryDA"
											class="form-control reduced-input">
											<option value=""></option>

											<option value="1">Brasil</option>

											<option value="2">Estados Unidos</option>

											<option value="3">Espanha</option>

										</select>
									</div>
									<div class="col-md-4">
										<label class="reduced-input-label" for="txtStateDA">Estado*</label>
										<select id="txtStateDA" name="txtStateDA"
											class="form-control reduced-input">
											<option value="0"></option>

											<option value="1">Acre</option>

											<option value="2">Alagoas</option>

											<option value="3">Amapá</option>

											<option value="4">Amazonas</option>

											<option value="5">Bahia</option>

											<option value="6">Ceará</option>

											<option value="7" selected>Espírito Santo</option>

											<option value="8">Goiás</option>

											<option value="9">Maranhão</option>

											<option value="10">Mato Grosso</option>

											<option value="11">Mato Grosso do Sul</option>

											<option value="12">Minas Gerais</option>

											<option value="13">Pará</option>

											<option value="14">Paraíba</option>

											<option value="15">Paraná</option>

											<option value="16">Pernambuco</option>

											<option value="17">Piauí</option>

											<option value="18">Rio de Janeiro</option>

											<option value="19">Rio Grande do Norte</option>

											<option value="20">Rio Grande do Sul</option>

											<option value="21">Rondônia</option>

											<option value="22">Roraima</option>

											<option value="23">Santa Catarina</option>

											<option value="24">São Paulo</option>

											<option value="25">Sergipe</option>

											<option value="26">Tocantins</option>

											<option value="27">Distrito Federal</option>

										</select>
									</div>
									<div class="col-md-4">
										<label class="reduced-input-label" for="txtCityDA">Cidade*</label>
										<input required type="text" class="form-control reduced-input"
											name="txtCityDA" id="txtCityDA">
									</div>
								</div>
								<br>
								<div class="row">
									<div class="col-md-12">
										<label class="reduced-input-label" for="txtObservationDA">Observações</label>
										<input type="text" class="form-control reduced-input"
											name="txtObservationDA" id="txtObservationDA">
									</div>
								</div>
							</div>
							<p>
								<br>
							<div class="row">
								<div class="col-md-4">

									<input type="submit" class="btn btn-primary py-2"
										value="Adicionar" id="btnSendAddDA" name="btnSendAddDA">

								</div>
								<div class="col-md-4">
									<input type="reset" id="resetFormDA" name="resetFormDA"
										value="Limpar" style="display: none;">
								</div>
							</div>
							<p>
						</form>
						<br>
						<table id="tableDeliveryAddresses" class="table">
							<thead class="thead-light">
								<tr>
									<th>Padrão</th>
									<th>Nome</th>
									<th>Tipo</th>
									<th>Logradouro</th>
									<th>Número</th>
									<th>Cidade</th>
									<th>&nbsp;</th>
									<th>&nbsp;</th>
								</tr>
							</thead>
							<tbody>

								<tr>
									<td class="product-name" style="width: 0%"><input
										type="radio" name="defaultAddressDA" checked></td>

									<td class="product-name">Name <input type="hidden"
										name="idAddressDA" id="idAddressDA"
										form="formDeliveryAddresses">
									</td>
									<td class="product-name" style="width: 0%">Casa</td>
									<td class="product-name" style="width: 50%">Neverland
										Downtown</td>
									<td class="product-name" style="width: 0%">4524a</td>
									<td class="product-name" style="width: 10%">Porto Seguro</td>
									<td class="product-name" style="width: 5%"><a href="#"><i
											class="fa fa-pencil"></i></a></td>
									<td class="product-name" style="width: 5%"><a href="#"><i
											class="fa fa-times"></i></a></td>
								</tr>

								<tr>
									<td class="product-name" style="width: 0%"><input
										type="radio" name="defaultAddressDA"></td>

									<td class="product-name">Laura <input type="hidden"
										name="idAddressDA" id="idAddressDA"
										form="formDeliveryAddresses">
									</td>
									<td class="product-name" style="width: 0%">Apartamento</td>
									<td class="product-name" style="width: 50%">saSas</td>
									<td class="product-name" style="width: 0%">saSAs</td>
									<td class="product-name" style="width: 10%">SAsaSA</td>
									<td class="product-name" style="width: 5%"><a href="#"><i
											class="fa fa-pencil"></i></a></td>
									<td class="product-name" style="width: 5%"><a href="#"><i
											class="fa fa-times"></i></a></td>
								</tr>

								<tr>
									<td class="product-name" style="width: 0%"><input
										type="radio" name="defaultAddressDA"></td>

									<td class="product-name">Eduardo Borges <input
										type="hidden" name="idAddressDA" id="idAddressDA"
										form="formDeliveryAddresses">
									</td>
									<td class="product-name" style="width: 0%">Sobrado</td>
									<td class="product-name" style="width: 50%">dadadada</td>
									<td class="product-name" style="width: 0%">dadada</td>
									<td class="product-name" style="width: 10%">dsadsadada</td>
									<td class="product-name" style="width: 5%"><a href="#"><i
											class="fa fa-pencil"></i></a></td>
									<td class="product-name" style="width: 5%"><a href="#"><i
											class="fa fa-times"></i></a></td>
								</tr>

								<tr>
									<td class="product-name" style="width: 0%"><input
										type="radio" name="defaultAddressDA"></td>

									<td class="product-name">End show <input type="hidden"
										name="idAddressDA" id="idAddressDA"
										form="formDeliveryAddresses">
									</td>
									<td class="product-name" style="width: 0%">Casa</td>
									<td class="product-name" style="width: 50%">Abacate</td>
									<td class="product-name" style="width: 0%">919</td>
									<td class="product-name" style="width: 10%">Cidade</td>
									<td class="product-name" style="width: 5%"><a href="#"><i
											class="fa fa-pencil"></i></a></td>
									<td class="product-name" style="width: 5%"><a href="#"><i
											class="fa fa-times"></i></a></td>
								</tr>

								<tr>
									<td class="product-name" style="width: 0%"><input
										type="radio" name="defaultAddressDA"></td>

									<td class="product-name">End show <input type="hidden"
										name="idAddressDA" id="idAddressDA"
										form="formDeliveryAddresses">
									</td>
									<td class="product-name" style="width: 0%">Casa</td>
									<td class="product-name" style="width: 50%">Abacate</td>
									<td class="product-name" style="width: 0%">919</td>
									<td class="product-name" style="width: 10%">Cidade</td>
									<td class="product-name" style="width: 5%"><a href="#"><i
											class="fa fa-pencil"></i></a></td>
									<td class="product-name" style="width: 5%"><a href="#"><i
											class="fa fa-times"></i></a></td>
								</tr>

								<tr>
									<td class="product-name" style="width: 0%"><input
										type="radio" name="defaultAddressDA"></td>

									<td class="product-name">End show <input type="hidden"
										name="idAddressDA" id="idAddressDA"
										form="formDeliveryAddresses">
									</td>
									<td class="product-name" style="width: 0%">Casa</td>
									<td class="product-name" style="width: 50%">Abacate</td>
									<td class="product-name" style="width: 0%">919</td>
									<td class="product-name" style="width: 10%">Cidade</td>
									<td class="product-name" style="width: 5%"><a href="#"><i
											class="fa fa-pencil"></i></a></td>
									<td class="product-name" style="width: 5%"><a href="#"><i
											class="fa fa-times"></i></a></td>
								</tr>

								<tr>
									<td class="product-name" style="width: 0%"><input
										type="radio" name="defaultAddressDA"></td>

									<td class="product-name">End <input type="hidden"
										name="idAddressDA" id="idAddressDA"
										form="formDeliveryAddresses">
									</td>
									<td class="product-name" style="width: 0%">Sobrado</td>
									<td class="product-name" style="width: 50%">log</td>
									<td class="product-name" style="width: 0%">456</td>
									<td class="product-name" style="width: 10%">cid</td>
									<td class="product-name" style="width: 5%"><a href="#"><i
											class="fa fa-pencil"></i></a></td>
									<td class="product-name" style="width: 5%"><a href="#"><i
											class="fa fa-times"></i></a></td>
								</tr>

							</tbody>
						</table>
					</div>
					<div class="tab-pane fade" id="CartaoCredito" role="tabpanel">
						<h1>Cartão de Crédito</h1>

						<form method="POST" id="formCreditCard" action="">
							<input type="hidden" value="/customerRedirectUpdate"
								name="pageReturn" id="pageReturn"> <input type="hidden"
								id="fieldUpdateCard" name="fieldUpdateCard">
							<div id="consistFildsCreditCard"></div>

							<div id="fieldsCreditCard">
								<div class="row">
									<div class="col-md-6">
										<label class="reduced-input-label" for="txtCardBanner">Bandeira
											do cartão*</label> <select name="txtCardBanner"
											class="form-control reduced-input">
											<option value=""></option>


											<option value="1">Visa</option>

											<option value="2">MasterCard</option>

											<option value="3">Elo</option>

											<option value="4">American Express</option>


										</select>
									</div>
									<div class="col-md-6">
										<label class="reduced-input-label" for="txtNumber">Número*</label>
										<input required type="text" class="form-control reduced-input"
											name="txtNumber" value="">
									</div>
								</div>
								<br>
								<div class="row">
									<div class="col-md-6">
										<label class="reduced-input-label" for="txtName">Nome
											impresso no cartão*</label> <input required type="text"
											class="form-control uppercase reduced-input" name="txtName"
											value="">
									</div>
									<div class="col-md-6">
										<label class="reduced-input-label" for="txtSecurityCode">Código
											de segurança*</label> <input required type="text"
											class="form-control reduced-input" name="txtSecurityCode"
											id="txtSecurityCode" maxlength="3" value="">
									</div>
								</div>
							</div>
							<p>
								<br>
							<div class="row">
								<div class="col-md-4">

									<input type="submit" class="btn btn-primary py-2"
										value="Adicionar" id="btnSendAddCreditCard"
										name="btnSendAddCreditCard">

								</div>
								<div class="col-md-4">
									<input type="button" value="Cancelar"
										id="btnSendCancCreditCard" style="display: none;">
								</div>
								<div class="col-md-4">
									<input type="reset" id="resetFormCreditCard"
										name="resetFormCreditCard" style="display: none;">
								</div>
							</div>
							<p>
						</form>
						<br>
						<table id="tableCreditCards" class="table">
							<thead class="thead-light">
								<tr>
									<th>Padrão</th>
									<th>Bandeira</th>
									<th>Nome</th>
									<th>Número</th>
									<th>&nbsp;</th>
									<th>&nbsp;</th>
								</tr>
							</thead>
							<tbody>

								<tr>
									<td class="product-name" style="width: 0%"><input
										type="radio" checked></td>

									<td class="product-name">Visa <input type="hidden"
										name="idCreditCard" id="idCreditCard" form="formCreditCard">
									</td>
									<td class="product-name">Compras</td>
									<td class="product-name">1234 5678 9009 8765</td>
									<td class="product-name" style="width: 5%"><a href="#"><i
											class="fa fa-pencil"></i></a></td>
									<td class="product-name" style="width: 5%"><a href="#"><i
											class="fa fa-times"></i></a></td>
								</tr>

								<tr>
									<td class="product-name" style="width: 0%"><input
										type="radio"></td>

									<td class="product-name">Visa <input type="hidden"
										name="idCreditCard" id="idCreditCard" form="formCreditCard">
									</td>
									<td class="product-name">rere</td>
									<td class="product-name">23233</td>
									<td class="product-name" style="width: 5%"><a href="#"><i
											class="fa fa-pencil"></i></a></td>
									<td class="product-name" style="width: 5%"><a href="#"><i
											class="fa fa-times"></i></a></td>
								</tr>

								<tr>
									<td class="product-name" style="width: 0%"><input
										type="radio"></td>

									<td class="product-name">Elo <input type="hidden"
										name="idCreditCard" id="idCreditCard" form="formCreditCard">
									</td>
									<td class="product-name">21312</td>
									<td class="product-name">123123</td>
									<td class="product-name" style="width: 5%"><a href="#"><i
											class="fa fa-pencil"></i></a></td>
									<td class="product-name" style="width: 5%"><a href="#"><i
											class="fa fa-times"></i></a></td>
								</tr>

							</tbody>
						</table>
					</div>

				</div>


			</div>
	</div>
	<!-- .container -->
	</main>
	<!-- .main-content -->
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<div id="footer"></div>


	</div>

	<div class="overlay"></div>

	<div class="auth-popup popup">
		<a href="#" class="close"><i class="fa fa-times"></i></a>
		<form action="CtrlCliente" method="post"> <div class="row"><button name="operacao" id="operacao" value="logout" type='submit' class = 'btn btn-primary' ><i class="fa fa-power-off" title="Sair"></i> Sair</button></div></form><br><br>
		<div class="row">
			<div class="col-md-6">
				<h2 class="section-title">Login</h2>
				<form action="CtrlCliente" method="post">
						<input type="text" name="username" id="username" placeholder="Username...">
						<input type="password" name="password" id="password" placeholder="Password...">
						<input type="submit" name="operacao" id="operacao" value="Login">
					</form>
			</div>
			<!-- .column -->
			<div class="col-md-6">
				<h2 class="section-title">Crie sua conta</h2>
					<form action="CtrlCliente" method="post">
						<input type="text" name="username" id="username" placeholder="Username...">
						<input type="text" name="emailAddress" id="emailAddress" placeholder="Email address...">
						<input type="submit" name="operacao" id="operacao" value="Criar">
					</form>
			</div>
			<!-- .column -->
		</div>
		<!-- .row -->
	</div>
	<!-- .auth-popup -->

	<!-- 	<script src="js/jquery-1.11.1.min.js"></script> -->
	<script src="js/plugins.js"></script>
	<script>
		$("#header").load("header.jsp");
		$("#footer").load("footer.html");
	</script>









	<div class="modal fade" id="modalAlterar" role="dialog">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
<!-- 					<button type="button" class="close" data-dismiss="modal">&times;</button> -->
					<h4 class="modal-title">Alterar Cliente</h4>
				</div>
				<div class="modal-body">
					<form id="formPersonalData" name="formPersonalData"
						action="CtrlCliente" method="post">
						<div class="row">


							<div class="col-md-6">
								<label class="reduced-input-label" for="txtNameUpdate">Nome*</label> <input
									type="text" class="form-control reduced-input" id="txtNameUpdate"
									name="txtNameUpdate">
							</div>
							<div class="col-md-6">
								<label class="reduced-input-label" for="txtLastNameUpdate">Sobrenome*</label>
								<input type="text" class="form-control reduced-input"
									id="txtLastNameUpdate" name="txtLastNameUpdate">
							</div>
						</div>
						<br>
						<div class="row">
							<div class="col-md-2">
								<label class="reduced-input-label" for="txtBirthDateUpdate">Nascimento*</label> <input type="date"
									class="form-control reduced-input" id="txtBirthDateUpdate"
									autocomplete='off' name="txtBirthDateUpdate">
							</div>
							<div class="col-md-2">
								<label class="reduced-input-label" for="txtGenderUpdate">Gênero*</label>
								<select id="txtGenderUpdate" name="txtGenderUpdate"
									class="form-control reduced-input">
									<option value=""></option>
									<option value="M">Masculino</option>
									<option selected value="F">Feminino</option>
									<option value="O">Outro</option>
								</select>
							</div>
							<div class="col-md-2">
								<label class="reduced-input-label" for="txtTypeDocumentUpdate">Tipo
									Documento*</label> <select id="txtTypeDocumentUpdate" name="txtTypeDocumentUpdate"
									class="form-control reduced-input">
									<option value=""></option>
									<option value="1">RG</option>
									<option selected value="2">CPF</option>
									<option value="3">CNH</option>
								</select>
							</div>
							<div class="col-md-3">
								<label class="reduced-input-label" for="txtValidadeDocumentUpdate">Número
									Documento*</label> <input type="text"
									class="form-control reduced-input" id="txtDocumentUpdate"
									name="txtDocumentUpdate">
							</div>
							<div class="col-md-3">
								<label class="reduced-input-label" for="txtValidadeDocumentUpdate">Validade
									Documento*</label> <input type="date"
									class="form-control reduced-input" id="txtValidadeDocumentUpdate"
									name="txtValidadeDocumentUpdate">
							</div>
						</div>
						<br> <input type="hidden" id="pageReturn" name="pageReturn">

						<div class="row">
							<div class="col-md-4">
								<label class="reduced-input-label" for="txtPhoneTypeUpdate">Tipo
									Telefone* </label> <select id="txtPhoneTypeUpdate" name="txtPhoneTypeUpdate"
									class="form-control">
									<option value=""></option>
									<option value="Celular">Celular</option>
									<option value="Telefone">Telefone</option>
								</select>

							</div>
							<div class="col-md-4">
								<label class="reduced-input-label" for="txtPhoneUpdate">Telefone*</label>
								<input type="text" class="form-control reduced-input"
									id="txtPhoneUpdate" name="txtPhoneUpdate">
							</div>
							<div class="col-md-4">
								<label class="reduced-input-label" for="txtTypeClientUpdate">Tipo
									Cliente*</label> <select id="txtTypeClientUpdate" name="txtTypeClientUpdate"
									class="form-control">
									<option value=""></option>
									<option value="1">Gold</option>
									<option value="2">Silver</option>
									<option value="3">Black</option>
								</select>
							</div>


						</div>
						<br>
						<hr>
						<br>
						<h1>Endereço Residencial</h1>

						<div class="row">

							<div class="col-md-12">
								<label class="reduced-input-label" for="txtNameEnderUpdate">Nome
									Endereço</label> <input type="text" class="form-control reduced-input"
									name="txtNameEnderUpdate" id="txtNameEnderUpdate" value="">
							</div>

						</div>
						<br>

						<div class="row">
							<div class="col-md-4">
								<label class="reduced-input-label" for="txtResidenceTypeHomeUpdate">Tipo
									de residência*</label> <select id="txtResidenceTypeHomeUpdate"
									name="txtResidenceTypeHomeUpdate" class="form-control reduced-input">
									<option value=""></option>
									<option value="Casa">Casa</option>
									<option value="Apartamento">Apartamento</option>
									<option value="Sobrado">Sobrado</option>
									<option value="Loja">Loja</option>
									<option value="Galpão">Galpão</option>
									<option value="Outros">Outros</option>
								</select>
							</div>
							<div class="col-md-4">
								<label class="reduced-input-label" for="txtStreetTypeUpdate">Tipo
									do logradouro*</label> <select id="txtStreetTypeUpdate" name="txtStreetTypeUpdate"
									class="form-control reduced-input">
									<option value=""></option>
									<option value="Rua">Rua</option>
									<option value="Avenida">Avenida</option>
									<option value="Travessa">Travessa</option>
									<option value="Passagem">Passagem</option>
									<option value="Outros">Outros</option>
								</select>

							</div>
							<div class="col-md-4">
								<label class="reduced-input-label" for="txtStreetNameUpdate">Logradouro*</label>
								<input type="text" class="form-control reduced-input"
									name="txtStreetNameUpdate" id="txtStreetNameUpdate"
									value="">
							</div>
						</div>
						<br>
						<div class="row">
							<div class="col-md-4">
								<label class="reduced-input-label" for="txtNumberUpdate">Número*</label>
								<input type="text" class="form-control reduced-input"
									name="txtNumberUpdate" id="txtNumberUpdate" value="">
							</div>

							<div class="col-md-4">
								<label class="reduced-input-label" for="txtCepUpdate">CEP*</label> <input
									type="text" class="form-control reduced-input" name="txtCepUpdate"
									id="txtCepUpdate" value="">
							</div>
							<div class="col-md-4">
								<label class="reduced-input-label" for="txtNeighnorhoodUpdate">Bairro*</label>
								<input type="text" class="form-control reduced-input"
									name="txtNeighnorhoodUpdate" id="txtNeighnorhoodUpdate"
									value="">
							</div>
						</div>
						<br>
						<div class="row">
							<div class="col-md-4">
								<label class="reduced-input-label" for="txtCountryHomeUpdate">País*</label>
								<select id="txtCountryHomeUpdate" name="txtCountryHomeUpdate"
									class="form-control reduced-input">
									<option value="0"></option>

									<option value="1" >Brasil</option>

									<option value="2">Estados Unidos</option>

									<option value="3">Espanha</option>

								</select>
							</div>

							<input type="hidden" id="formAddressTypeUpdate" name="formAddressTypeUpdate"
								value="Home">
							<div class="col-md-4">
								<label class="reduced-input-label" for="txtStateHomeUpdate">Estado*</label>
								<select id="txtStateHomeUpdate" name="txtStateHomeUpdate"
									class="form-control reduced-input">
									<option value="0"></option>

									<option value="1">Acre</option>

									<option value="2">Alagoas</option>

									<option value="3">Amapá</option>

									<option value="4">Amazonas</option>

									<option value="5">Bahia</option>

									<option value="6">Ceará</option>

									<option value="7">Espírito Santo</option>

									<option value="8">Goiás</option>

									<option value="9">Maranhão</option>

									<option value="10">Mato Grosso</option>

									<option value="11">Mato Grosso do Sul</option>

									<option value="12">Minas Gerais</option>

									<option value="13">Pará</option>

									<option value="14">Paraíba</option>

									<option value="15">Paraná</option>

									<option value="16">Pernambuco</option>

									<option value="17">Piauí</option>

									<option value="18">Rio de Janeiro</option>

									<option value="19">Rio Grande do Norte</option>

									<option value="20">Rio Grande do Sul</option>

									<option value="21">Rondônia</option>

									<option value="22">Roraima</option>

									<option value="23">Santa Catarina</option>

									<option value="24">São Paulo</option>

									<option value="25">Sergipe</option>

									<option value="26">Tocantins</option>

									<option value="27">Distrito Federal</option>

								</select>

							</div>

							<div class="col-md-4">
								<label class="reduced-input-label" for="txtCityUpdate">Cidade*</label>
								<input type="text" class="form-control reduced-input"
									name="txtCityUpdate" id="txtCityUpdate" value="">
							</div>

						</div>
						<br>
						<div class="row">
							<div class="col-md-12">
								<label class="reduced-input-label" for="txtObservationUpdate">Observações</label>
								<input type="text" class="form-control reduced-input"
									name="txtObservationUpdate" id="txtObservationUpdate"
									value="">
							</div>
						</div>
						<br>
						<div class="col-sm form-group text-lg-right">
							<input type="hidden"  name="id_cliente" id="id_cliente">
							<input type="hidden"  name="id_cliente_ender" id="id_cliente_ender">
							<input type="submit" class="btn btn-primary py-3 px-3"
								id="operacao" name="operacao" value="Editar">
					</form>

				</div>
				
			</div>
		</div>
	</div>


</body>

</html>