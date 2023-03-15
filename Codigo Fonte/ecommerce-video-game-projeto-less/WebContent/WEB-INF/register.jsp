<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1"%>
<%@page import="br.com.projetoles.domain.Pessoa"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>

<%@page import="java.text.DateFormat"%>
<%@page import="java.text.ParseException"%>







<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0,maximum-scale=1">

<title>Registrar Conta</title>

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






</head>


<body class="slider-collapse">

	<div id="site-content">

		<div id="header"></div>

		<main class="main-content">
			<div class="container">
				<div class="page">


					<form id="formPersonalData" name="formPersonalData" action="usuarioCriacaoLogin" method="post">
					<ul class="nav nav-tabs" id="myTab" role="tablist">
						<li class="nav-item active" id="Etapa1" ><a class="nav-link active"
							id="dados-pessoais" data-toggle="tab" href="#DadosPessoais"
							role="tab" aria-selected="true">Dados Pessoais</a></li>

						<li class="nav-item" id="Etapa2"><a class="nav-link" id="dados-usuario"
							data-toggle="tab" href="#DadosUsuario" role="tab"
							aria-selected="false">Dados de Usuário</a></li>

					</ul>
					<div class="tab-content" id="myTabContent">
						<div class="tab-pane fade active in" id="DadosPessoais" role="tabpanel">
							<h1>Dados Pessoais</h1>
							
								<div class="row">


									<div class="col-md-6">
										<label class="reduced-input-label" for="txtName">Nome*</label>
										<input type="text" data-cy="txtName" class="form-control reduced-input"
											id="txtName" name="txtName">
									</div>
									<div class="col-md-6">
										<label class="reduced-input-label" for="txtLastName">Sobrenome*</label>
										<input type="text" data-cy="txtLastName" class="form-control reduced-input"
											id="txtLastName" name="txtLastName">
									</div>
								</div>
								<br>
								<div class="row">
									<div class="col-md-2">
										<label class="reduced-input-label" for="txtBirthDate">Data
											de nascimento*</label> <input data-cy="txtBirthDate" type="date"
											class="form-control reduced-input" id="txtBirthDate"
											autocomplete='off' name="txtBirthDate">
									</div>
									<div class="col-md-2">
										<label class="reduced-input-label" for="txtGender">Gênero*</label>
										<select id="txtGender" data-cy="txtGender" name="txtGender"
											class="form-control reduced-input">
											<option value=""></option>
											<option value="M">Masculino</option>
											<option value="F">Feminino</option>
											<option value="O">Outro</option>
										</select>
									</div>
									<div class="col-md-2">
										<label class="reduced-input-label" for="txtTypeDocument">Tipo
											Documento*</label> <select id="txtTypeDocument" data-cy="txtTypeDocument"
											name="txtTypeDocument" class="form-control reduced-input">
											<option value=""></option>
											<option value="1">RG</option>
											<option value="2">CPF</option>
											<option value="3">CNH</option>
										</select>
									</div>
									<div class="col-md-3">
										<label class="reduced-input-label" for="txtDocument">Número
											Documento*</label> <input type="text" data-cy="txtDocument"
											class="form-control reduced-input" id="txtDocument"
											name="txtDocument">
									</div>
									<div class="col-md-3">
										<label class="reduced-input-label" for="txtValidadeDocument">Validade
											Documento*</label> <input type="date" data-cy="txtValidadeDocument"
											class="form-control reduced-input" id="txtValidadeDocument"
											name="txtValidadeDocument">
									</div>
								</div>
								<br> 

								<div class="row">
									<div class="col-md-4">
										<label class="reduced-input-label" for="txtPhoneType">Tipo
											Telefone* </label> <select id="txtPhoneType" name="txtPhoneType" data-cy="txtPhoneType"
											class="form-control">
											<option value=""></option>
											<option value="Celular">Celular</option>
											<option value="Telefone">Telefone</option>
										</select>

									</div>
									<div class="col-md-4">
										<label class="reduced-input-label" for="txtPhone">Telefone*</label>
										<input type="text" class="form-control reduced-input" data-cy="txtPhone"
											id="txtPhone" name="txtPhone">
									</div>
									<div class="col-md-4">
										<label class="reduced-input-label" for="txtTypeClient">Tipo
											Cliente*</label> <select id="txtTypeClient" name="txtTypeClient" data-cy="txtTypeClient"
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
											Endereço</label> <input type="text" data-cy="txtNameEnder"
											class="form-control reduced-input" name="txtNameEnder"
											id="txtNameEnder" required>
									</div>

								</div>
								<br>

								<div class="row">
									<div class="col-md-4">
										<label class="reduced-input-label" for="txtResidenceTypeHome">Tipo
											de residência*</label> <select id="txtResidenceType" data-cy="txtResidenceType"
											name="txtResidenceType" class="form-control reduced-input" required>
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
										<label class="reduced-input-label" for="txtStreetType">Tipo
											do logradouro*</label> <select id="txtStreetType" data-cy="txtStreetType"
											name="txtStreetType" class="form-control reduced-input" required>
											<option value=""></option>
											<option value="Rua">Rua</option>
											<option value="Avenida">Avenida</option>
											<option value="Travessa">Travessa</option>
											<option value="Passagem">Passagem</option>
											<option value="Outros">Outros</option>
										</select>

									</div>
									<div class="col-md-4">
										<label class="reduced-input-label" for="txtStreetName">Logradouro*</label>
										<input type="text" class="form-control reduced-input" data-cy="txtStreetName"
											name="txtStreetName" id="txtStreetName" required
											>
									</div>
								</div>
								<br>
								<div class="row">
									<div class="col-md-4">
										<label class="reduced-input-label" for="txtNumber">Número*</label>
										<input type="text" class="form-control reduced-input" data-cy="txtNumber"
											name="txtNumber" id="txtNumber" required>
									</div>

									<div class="col-md-4">
										<label class="reduced-input-label" for="txtCep">CEP*</label> <input
											type="text" class="form-control reduced-input" name="txtCep" data-cy="txtCep"
											id="txtCep" required >
									</div>
									<div class="col-md-4">
										<label class="reduced-input-label" for="txtNeighnorhood">Bairro*</label>
										<input type="text" class="form-control reduced-input" data-cy="txtNeighnorhood"
											name="txtNeighnorhood" id="txtNeighnorhood" required
											>
									</div>
								</div>
								<br>
								<div class="row">
									<div class="col-md-4">
										<label class="reduced-input-label" for="txtCountryHome">País*</label>
										<select id="txtCountryHome" name="txtCountryHome" data-cy="txtCountryHome"
											class="form-control reduced-input" required>
											

											<option value="1">Brasil</option>

											<option value="2">Estados Unidos</option>

											<option value="3">Espanha</option>

										</select>
									</div>

									<input type="hidden" id="formAddressType"
										name="formAddressType" value="Home">
									<div class="col-md-4">
										<label class="reduced-input-label" for="txtStateHome">Estado*</label>
										<select data-cy="txtStateHome" id="txtStateHome" name="txtStateHome" 
											class="form-control reduced-input" required>
											

											<option value="1">Acre</option>

											<option value="2">Alagoas</option>

											<option value="3">Amapá</option>

											<option value="4">Amazonas</option>

											<option value="5" >Bahia</option>

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
										<input type="text" class="form-control reduced-input" data-cy="txtCity"
											name="txtCity" id="txtCity"required >
									</div>

								</div>
								<br>
								<div class="row">
									<div class="col-md-12">
										<label class="reduced-input-label" for="txtObservation">Observações</label>
										<input type="text" class="form-control reduced-input" data-cy="txtObservation"
											name="txtObservation" id="txtObservation"
											>
									</div>
								</div>
								<br>
								<div class="col-sm form-group text-lg-right">
									
<!-- 									<button type="button" class="btn btn-primary py-3 px-3" -->
<!-- 										id="operacao" name="operacao" value="salvar" onclick="execucao_alerta_register()">Próximo</button> -->
									<a class="btn btn-primary py-3 px-3"  id="dados-usuario-botao" data-toggle="tab" href="#DadosUsuario" role="tab" aria-selected="false">Próximo</a>
							
						</div>

						

					</div>
					<div class="tab-pane fade" id="DadosUsuario" role="tabpanel">
						<h1>Dados de Usuário</h1>
						
							

							<div class="row">
								<div class="col-md-6">
									<label for="txtEmail" class="reduced-input-label">Email</label>
									<input type="email" class="form-control reduced-input"
										id="txtEmail" name="txtEmail" data-cy="txtEmail" placeholder="E-Mail" value="" required />
								</div>
								<div class=" col-md-6">
									<label for="txtLogin" class="reduced-input-label"> Nome
										de usuário </label> <input type="text" 
										class="form-control reduced-input" id="txtLogin"
										name="txtLogin" data-cy="txtLogin" placeholder="Nome de usuário" required />
								</div>
							</div>
							<br>
							<div class="row">
								<div class="col-md-6">
									<label for="txtPassword" class="reduced-input-label">Senha</label>
									<input type="password" class="form-control reduced-input pass"
										id="txtPassword" data-cy="txtPassword" name="txtPassword"
										placeholder="Digite a senha"  data-placement="bottom" required  />
								</div>
								<div class="col-md-6">
									<label for="txtConfirmPassword" class="reduced-input-label">Confirme
										a senha</label> <input type="password"
										class="form-control reduced-input pass"
										data-cy="txtPasswordConfirmation" id="txtPasswordConfirmation" name="txtPasswordConfirmation"
										placeholder="Confirme a senha" required />
								</div>
							</div>
						
						<br>
						<div class="col-sm form-group text-lg-right">
							
								<button type="submit" class="btn btn-primary py-3 px-3"
										id="operacao" name="operacao" value="Salvar" onclick="execucao_alerta_register()">Salvar</button>
							
						</div>
					</form>
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
		
		<script type="text/javascript">
		
	
		$('#dados-usuario-botao').on('click', function(event){
		    event.preventDefault();
		    $('#Etapa1').toggleClass('nav-item active nav-item');
		    $('#Etapa2').toggleClass('nav-item  nav-item active');
	
		});
	</script>
	<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
    <script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="http://andti.com.br/bootstrap-strong-password/js/bootstrap-strong-password.js"></script>
    <script type="text/javascript">
        $('.pass').bsStrongPass();
    </script>



</body>

</html>