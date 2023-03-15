<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	

<%@page import="br.com.projetoles.domain.EntidadeDominio"%>
<%@page import="br.com.projetoles.domain.Result"%>
<%@page import="br.com.projetoles.domain.Carrinho"%>
<%@page import="br.com.projetoles.domain.Pedido"%>
<%@page import="br.com.projetoles.domain.ItemPedido"%>
<%@page import="br.com.projetoles.domain.Prestacao"%>
<%@page import="br.com.projetoles.domain.Cupom"%>
<%@page import="java.text.NumberFormat"%>
    
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

<title>Cupons</title>

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
		
		
		
		

</head>


<body>

	<div id="site-content">
		<div id="header"></div>
		<main class="main-content">
			<div class="container">
				<br>
				<div class="row">
					<div class="col-md-12">
						<h1>Visualizar Cupom</h1>
					</div>
				</div>
				<br>
<!-- 				<div class="row"> -->
<!-- 					<div class="col-md-12"> -->
<!-- 						<h5>*Todos os campos opcionais</h5> -->
						
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				<div class="row"> -->

					
<!-- 					<div class="col-md-12"> -->
<!-- 						<label class="reduced-input-label" for="txtCodCupom">Código</label> -->
<!-- 						<input type="text" class="form-control reduced-input" -->
<!-- 							id="txtCodCupom" name="txtCodCupom" placeholder="Digite o código do cupom"> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				<br> -->
<!-- 				<div class="row"> -->

<!-- 					<div class="col-md-6"> -->
<!-- 						<label class="reduced-input-label" for="txtValorCupom">Valor -->
<!-- 							</label> <input type="number" class="form-control reduced-input" -->
<!-- 							id="txtValorCupom" name="txtValorCupom"> -->
<!-- 					</div> -->
<!-- 					<div class="col-md-6"> -->
<!-- 						<label class="reduced-input-label" for="txtTipoCupom">Tipo</label> -->
<!-- 						<select id="txtTipoCupom" name="txtTipoCupom" -->
<!-- 							class="form-control reduced-input"> -->
<!-- 							<option value=""></option> -->
<!-- 							<option value="Em_troca">TROCA</option> -->
<!-- 							<option value="Troca_Autorizada">PROMOCIONAL</option> -->
<!-- 						</select> -->
						
<!-- 					</div> -->
					
<!-- 				</div> -->
<!-- 				<br> -->
<!-- 				<div class="row"> -->
<!-- 				<div class="col-md-4"> -->
<!-- 				<input type="submit" class="btn btn-primary py-3 px-3" -->
<!-- 				id="operacao" name="operacao" value="Pesquisar"> -->
<!-- 				<input type="submit" class="btn btn-primary py-3 px-3" -->
<!-- 				id="operacao" name="operacao" value="Limpar"> -->
<!-- 				</div> -->
<!-- 				</div> -->
<!-- 				<br> -->
<!-- 				<br> -->
<!-- 				<br> -->
				<br>
				
				
				<table class="table table-striped">
							<thead>
								<tr>
									<th># Código Cupom</th>
									<th>Valor</th>
									<th>Tipo</th>
								</tr>
							</thead>
							<tbody>
								
								<%	
								
									List<EntidadeDominio> result = (List<EntidadeDominio>) request.getAttribute("cupons");
									Cupom cupom = new Cupom();
									
									for (EntidadeDominio cup : result) {
										
										
										
										
										

										
										cupom = (Cupom) cup;
										out.print("<tr>");
										out.print("<td># "+cupom.getNomeCupom()+"</td>");
										out.print("<td>"+NumberFormat.getCurrencyInstance().format(cupom.getValor())+"</td>");
										if(cupom.getNomeCupom().replaceAll("[0-9]", "").replace(".", "").toUpperCase().equals("PROMOCAO")){
											out.print("<td><button class='btn btn-primary btn-sm'>PROMOÇÃO</button></td>");
										}
										if(cupom.getNomeCupom().replaceAll("[0-9]", "").replace(".", "").toUpperCase().equals("TROCA")){
											out.print("<td><button class='btn btn-info btn-sm'>TROCA</button></td>");
										}
										
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
	
	
	
	
	
	
	
	
	<div class="modal fade" id="modalVerPedido" role="dialog">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
<!-- 					<button type="button" class="close" data-dismiss="modal">&times;</button> -->
					<h1 class="modal-title">Visualizar Pedido</h1>
				</div>
				<div class="modal-body">
					
					<div class="row">
						<div class="col-md-6">
							<h5><b>Status do pedido: </b>Troca Autorizada</h5>
						</div>
						<div class="col-md-6">
							<h5><b>Cliente: </b>Eduardo</h5>
						</div>
					</div>
					<div class="row">
						<div class="col-md-3">
							<h5><b>Data: </b>14/01/2021</h5>
						</div>
						<div class="col-md-3">
							<h5><b>Valor Desconto: </b>0.0</h5>
						</div>
						<div class="col-md-3">
							<h5><b>Valor Frete: </b>0.0</h5>
						</div>
						<div class="col-md-3">
							<h5><b>Valor Total: </b>150.50</h5>
						</div>
					</div>
					<hr>
					<div class="row">
						<div class="col-md-3">
							<h5><b>Nome Endereço: </b>Casa mãe</h5>
						</div>
						<div class="col-md-3">
							<h5><b>Tipo Endereço: </b>Teste</h5>
						</div>
						<div class="col-md-3">
							<h5><b>Tipo Logradouro: </b>Rua</h5>
						</div>
						<div class="col-md-3">
							<h5><b>Logradouro: </b>Ozeias</h5>
						</div>
					</div>
					<div class="row">
						<div class="col-md-3">
							<h5><b>Número: </b>84</h5>
						</div>
						<div class="col-md-3">
							<h5><b>CEP: </b>08738-040</h5>
						</div>
						<div class="col-md-3">
							<h5><b>Cidade: </b>Mogi das Cruzes</h5>
						</div>
						<div class="col-md-3">
							<h5><b>País: </b>Brasil</h5>
						</div>
					</div>
					<hr>
					<h3>Produtos</h3>
					<table class="table table-striped">
							<thead>
								<tr>
									<th>Produto</th>
									<th>Quantidade</th>
									<th>Valor Unitário</th>
									<th>Valor Total</th>
									
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>Jogo Playstation FIFA 2021</td>
									<td>2</td>
									<td>100.00</td>
									<td>200.00</td>
								</tr>
								<tr>
									<td>Jogo Playstation PES 2021</td>
									<td>1</td>
									<td>100.00</td>
									<td>100.00</td>
								</tr>

							</tbody>
					</table>
					<br>
					<hr>
					<br>
					<h3>Cartões</h3>
					<table class="table table-striped">
							<thead>
								<tr>
									<th>Número</th>
									<th>Nome</th>
									<th>Bandeira</th>
									<th>Valor Total</th>
									<th>Quantidade de Parcelas</th>
									<th>Valor Parcela</th>
									
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>8754 5454 8585 8584</td>
									<td>Cartão black</td>
									<td>Visa</td>
									<td>300,00</td>
									<td>1</td>
									<td>300,00</td>
								</tr>
								

							</tbody>
					</table>
					
					
				</div>
				
			</div>
		</div>
	</div>
	
	
	
	
	
	
	
	

</body>

</html>