<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	

<%@page import="br.com.projetoles.domain.Pessoa"%>
<%@page import="br.com.projetoles.util.DateUtil"%>
<%@page import="br.com.projetoles.domain.EntidadeDominio"%>
<%@page import="br.com.projetoles.domain.Endereco"%>
<%@page import="br.com.projetoles.domain.Cartao"%>
<%@page import="br.com.projetoles.domain.Result"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
    
<%@page import="javax.servlet.http.Cookie"%>
<%@page import="java.util.List"%>
<%@page import="br.com.projetoles.util.DateUtil"%>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0,maximum-scale=1">

<title>Endereços</title>

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


<!-- Loading main css file -->
<link rel="stylesheet" href="style.css">

<!--[if lt IE 9]>
		<script src="js/ie-support/html5.js"></script>
		<script src="js/ie-support/respond.js"></script>
		<![endif]-->
		
		
	<script type="text/javascript">
		function modalEditarEndereco(cli_id,
				cidade,
				estado,
				bairro,
				numero,
				rua,
				cep,
				nome_endereco,
				tipo_residencia,
				tipo_rua,
				pais,
				obs,
				id_end){
			
			
			$('#cli_id').val(cli_id);
			$('#txtCityDA').val(cidade);
			$('#txtStateDA').val(estado);
			$('#txtNeighnorhoodDA').val(bairro);
			$('#txtNumberDA').val(numero);
			$('#txtStreetNameDA').val(rua);
			$('#txtNameDA').val(nome_endereco);
			$('#txtResidenceTypeDA').val(tipo_residencia);
			$('#txtStreetTypeDA').val(tipo_rua);
			$('#txtCountryDA').val(pais);
			$('#txtObservationDA').val(obs);
			$('#id_end').val(id_end);
			$('#txtCepDA').val(cep);
			
			
			
			$('#modalEditarEndereco').modal('show');
		}
	
	</script>
							  
		

</head>


<body>

	<div id="site-content">
		<div id="header"></div>
		<main class="main-content">
			<div class="container">
				<br>
				<div class="row">
					<div class="col-md-12">
						<h1>Editar Endereços</h1>
					</div>
				</div>
				<br>
				
				
				
				<table class="table table-striped">
							<thead>
								<tr>
									
									<th>Nome Endereço</th>
									<th>Local</th>
									<th>Logradouro</th>
									<th>Número</th>
									<th>Cidade</th>
									<th>Tipo</th>
									<th>&nbsp;</th>
									<th>&nbsp;</th>
								</tr>
							</thead>
							<tbody>
								
								<%	
								
									List<EntidadeDominio> result = (List<EntidadeDominio>) request.getAttribute("result");
									
									Endereco endereco = new Endereco();
									
									for (EntidadeDominio end : result) {
																			
										endereco = (Endereco) end;
										out.print("<tr>");
											out.print("<td>"+endereco.getTipoEndereco().getNome()+"</td>");
											out.print("<td>"+endereco.getTipoEndereco().getDescricao()+"</td>");
											out.print("<td>"+endereco.getRua()+"</td>");
											out.print("<td>"+endereco.getNumero()+"</td>");
											out.print("<td>"+endereco.getCidade().getDescricao()+"</td>");
											out.print("<td>"+endereco.getTipo_endereco_compra()+"</td>");
											
											out.print("<td><button onclick='modalEditarEndereco(");
											out.print(endereco.getCli_id());
											out.print(',');
											out.print('"'+endereco.getCidade().getDescricao()+'"');
											out.print(',');
											out.print('"'+endereco.getCidade().getEstado().getDescricao()+'"');
											out.print(',');
											out.print('"'+endereco.getBairro()+'"');
											out.print(',');
											out.print('"'+endereco.getNumero()+'"');
											out.print(',');
											out.print('"'+endereco.getRua()+'"');
											out.print(',');
											out.print('"'+endereco.getCep()+'"');
											out.print(',');
											out.print('"'+endereco.getTipoEndereco().getNome()+'"');
											out.print(',');
											out.print('"'+endereco.getTipoEndereco().getDescricao()+'"');
											out.print(',');
											out.print('"'+endereco.getTipoRua()+'"');
											out.print(',');
											out.print('"'+endereco.getPais()+'"');
											out.print(',');
											out.print('"'+endereco.getObs()+'"');
											out.print(',');
											out.print(endereco.getId());
											out.print(")' class='btn btn-info'><i class='fa fa-pencil' title='Ver Endereço'></i></button></td>");
											out.print("<td><buttom class='btn btn-danger'><i class='fa fa-times' title='Excluir Endereço'></i></button></td>");
											
										out.print("</tr>");
									}
								%>

							</tbody>
						</table>
				
				<br>
				<br>
				<br>
				<br>
			</div>
			<!-- .container -->
		</main>
		<!-- .main-content -->
		<div id="footer"></div>


	</div>

	<div class="overlay"></div>

	<div class="auth-popup popup">
		<a href="#" class="close"><i class="fa fa-close"></i></a>
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
	
	
	
	
	<div class="modal fade" id="modalEditarEndereco" role="dialog">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
<!-- 					<button type="button" class="close" data-dismiss="modal">&times;</button> -->
				</div>
				<div class="modal-body">
					
					
						<h1>Editar endereço</h1>

						<form method="POST" id="" action="enderecoAtualizacaoLogin">
							
							<input type="hidden" id="cli_id" name ="txtCliIdDA">
							<input type="hidden" id="id_end" name ="id_end">

							<div id="filedsDeliveryAddresses">
								<div class="row">
									<div class="col-md-4">
										<label class="reduced-input-label" for="txtNameDA">Nome
											de identificação*</label> <input required type="text"
											class="form-control reduced-input " name="txtNameDA"
											id="txtNameDA" value="" data-cy="txtNameDA"required>
									</div>
									<div class="col-md-8">
										<label class="reduced-input-label" for="txtDescriptionDA">Descrição*</label>
										<input required type="text" class="form-control reduced-input"
											value="Casa 11" name="txtDescriptionDA" id="txtDescriptionDA" data-cy="txtDescriptionDA"required>
									</div>
								</div>
								<br>
								<div class="row">
									<div class="col-md-4">
										<label class="reduced-input-label" for="txtResidenceTypeDA">Tipo
											de residência*</label> <select name="txtResidenceTypeDA"
											id="txtResidenceTypeDA" class="form-control reduced-input" data-cy="txtResidenceTypeDA"required>
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
											id="txtStreetTypeDA" class="form-control reduced-input" data-cy="txtStreetTypeDA" required>
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
											name="txtStreetNameDA" id="txtStreetNameDA" data-cy="txtStreetNameDA" required>
									</div>
								</div>
								<br>
								<div class="row">
									<div class="col-md-4">
										<label class="reduced-input-label" for="txtNumberDA">Número*</label>
										<input required type="text" class="form-control reduced-input"
											name="txtNumberDA" id="txtNumberDA" data-cy="txtNumberDA" required>
									</div>

									<div class="col-md-4">
										<label class="reduced-input-label" for="txtCepDA">CEP*</label>
										<input required type="text" class="form-control reduced-input"
											name="txtCepDA" id="txtCepDA" data-cy="txtCepDA" required>
									</div>
									<div class="col-md-4">
										<label class="reduced-input-label" for="txtNeighnorhoodDA">Bairro*</label>
										<input required type="text" class="form-control reduced-input"
											name="txtNeighnorhoodDA" id="txtNeighnorhoodDA" data-cy="txtNeighnorhoodDA" required>
									</div>
								</div>

								
								<div class="row">
									<div class="col-md-4">
										<label class="reduced-input-label" for="txtCountryDA">País*</label>
										<select name="txtCountryDA" id="txtCountryDA"
											class="form-control reduced-input" data-cy="txtCountryDA" required>
											<option value=""></option>

											<option value="1">Brasil</option>

											<option value="2">Estados Unidos</option>

											<option value="3">Espanha</option>

										</select>
									</div>
									<div class="col-md-4">
										<label class="reduced-input-label" for="txtStateDA">Estado*</label>
										<select id="txtStateDA" name="txtStateDA"
											class="form-control reduced-input" data-cy="txtStateDA" required>
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
											name="txtCityDA" id="txtCityDA" data-cy="txtCityDA" required>
									</div>
								</div>
								<br>
								<div class="row">
									<div class="col-md-12">
										<label class="reduced-input-label" for="txtObservationDA">Observações</label>
										<input type="text" class="form-control reduced-input"
											name="txtObservationDA" id="txtObservationDA" data-cy="txtObservationDA">
									</div>
								</div>
							</div>

							<input type="hidden" name="txtTipoEnderecoCompraDA" id="txtTipoEnderecoCompraDA" value="Entrega">
							
							<p>
								<br>
							<div class="row">
								<div class="col-md-4">

									<button type="submit" class="btn btn-primary py-3 px-3" id="MudarTabelaEnderecoEntrega"  value="Salvar">Salvar</button>

								</div>
								
								
							</div>
							<p>
						</form>
						
						

					
					
					
				</div>
				
			</div>
		</div>
	
	
	
	
	
	
	
	
	
	
	

</body>

</html>