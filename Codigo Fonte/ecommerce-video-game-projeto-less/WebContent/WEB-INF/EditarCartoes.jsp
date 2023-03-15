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

<title>Cartões</title>

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
		function modalEditarCartao(bandeira,
				nome,
				numero,
				id,codSeguranca,idCard){
			
			
			$('#txtBandeiraCartao').val(bandeira);
			$('#txtNomeCartao').val(nome);
			$('#txtNumeroCartao').val(numero);
			$('#idClienteCartao').val(id);
			$('#txtcodigoSegurancaCartao').val(codSeguranca);
			$('#idCard').val(idCard);
			
			
			
			$('#modalEditarCartao').modal('show');
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
						<h1>Editar Cartões</h1>
					</div>
				</div>
				<br>
				
				
				
				<table class="table table-striped">
							<thead>
								<tr>
									
									<th>Banderia</th>
									<th>Nome</th>
									<th>Número</th>
									<th>&nbsp;</th>
									<th>&nbsp;</th>
								</tr>
							</thead>
							<tbody>
								
								<%	
								
									List<EntidadeDominio> result = (List<EntidadeDominio>) request.getAttribute("result");
								
									
									Cartao cartao = new Cartao();
									
									for (EntidadeDominio car : result) {
																			
										cartao = (Cartao) car;
										out.print("<tr>");
											out.print("<td>"+cartao.getBandeira_cartao()+"</td>");
											out.print("<td>"+cartao.getNome_impresso()+"</td>");
											out.print("<td>"+cartao.getNumero()+"</td>");
											
											
											out.print("<td><button onclick='modalEditarCartao(");
											out.print(cartao.getBandeira_cartao());
											out.print(',');
											out.print('"'+cartao.getNome_impresso()+'"');
											out.print(',');
											out.print('"'+cartao.getNumero()+'"');
											out.print(',');
											out.print(cartao.getCli_id());
											out.print(',');
											out.print('"'+cartao.getCodigo_seguranca()+'"');
											out.print(',');
											out.print(cartao.getId_cartao());
											
											out.print(")' class='btn btn-info'><i class='fa fa-pencil' title='Ver Cartão'></i></button></td>");
											out.print("<td><buttom class='btn btn-danger'><i class='fa fa-times' title='Excluir Cartão'></i></button></td>");
											
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
	
	
	
	
	<div class="modal fade" id="modalEditarCartao" role="dialog">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
<!-- 					<button type="button" class="close" data-dismiss="modal">&times;</button> -->
				</div>
				<div class="modal-body">
					
					
						<h1>Editar Cartões</h1>

						<form method="POST"  action="cartaoAtualizacao">
							
							<div id="fieldsCreditCard">
								<div class="row">
									<div class="col-md-6">
										<label class="reduced-input-label" for="txtBandeiraCartao">Bandeira
											do cartão*</label> <select data-cy="txtBandeiraCartao" name="txtBandeiraCartao" id="txtBandeiraCartao"
											class="form-control reduced-input" required>
											<option value=""></option>


											<option value="1">Visa</option>

											<option value="2">MasterCard</option>

											<option value="3">Elo</option>

											<option value="4">American Express</option>


										</select>
									</div>
									<div class="col-md-6">
										<label class="reduced-input-label" for="txtNumeroCartao">Número*</label>
										<input data-cy="txtNumeroCartao"  type="text" class="form-control reduced-input"
											name="txtNumeroCartao" id="txtNumeroCartao" required >
									</div>
								</div>
								<br>
								<div class="row">
									<div class="col-md-6">
										<label class="reduced-input-label" for="txtNomeCartao">Nome
											impresso no cartão*</label> <input data-cy="txtNomeCartao"  type="text"
											class="form-control uppercase reduced-input" name="txtNomeCartao" id="txtNomeCartao"
											value="" required>
									</div>
									<div class="col-md-6">
										<label class="reduced-input-label" for="txtcodigoSegurancaCartao">Código
											de segurança*</label> <input data-cy="txtcodigoSegurancaCartao" type="text"
											class="form-control reduced-input" name="txtcodigoSegurancaCartao" id="txtcodigoSegurancaCartao"
											maxlength="3" value="" required>
									</div>
								</div>
							</div>
							<input type="hidden" name="idClienteCartao" id="idClienteCartao">
							<input type="hidden" name="idCard" id="idCard">
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