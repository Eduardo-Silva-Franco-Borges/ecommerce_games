<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
	
<%@page import="br.com.projetoles.domain.EntidadeDominio"%>
<%@page import="br.com.projetoles.domain.Result"%>
<%@page import="br.com.projetoles.domain.Carrinho"%>
<%@page import="br.com.projetoles.domain.Pedido"%>
<%@page import="br.com.projetoles.domain.ItemPedido"%>
<%@page import="br.com.projetoles.domain.Prestacao"%>
<%@page import="java.util.List"%>
<%@page import="java.text.NumberFormat"%>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0,maximum-scale=1">

<title>Troca de pedido</title>

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
	function modalItemParaTroca(id_pedido,maxQuantidade) {
		
		$('#idItemPedidoParaTroca').val(id_pedido);
		document.getElementById("inputTypeQuantidadeParatroca").innerHTML = "<input type='number'  class='form-control' placeholder='Insira a quantidade' name='qtdParaTrocaProduto' id='qtdParaTrocaProduto' min='0' max='"+maxQuantidade+"'> ";
		
		
		$('#modalQuantidadeTroca').modal('show');
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
						<h1>Troca de pedido</h1>
					</div>
				</div>
				
				
				<br>
				
				
				<h3>Selecione os produtos que deseja trocar</h3>
					<table class="table table-striped">
							<thead>
								<tr>
									<th>Selecione</th>
									<th>Produto</th>
									
									
									<th>Valor</th>
									<th>Quantidade</th>
									
								</tr>
							</thead>
							<tbody>
								
								<%	
	
								
								List<EntidadeDominio> resultItensPedidos = (List<EntidadeDominio>) request.getAttribute("itensPedidos");
								ItemPedido itemPedido = new ItemPedido();
								
								
									for (EntidadeDominio intPed : resultItensPedidos) {
										itemPedido = (ItemPedido)intPed;
										
										out.print("<tr>");
											out.print("<td>");
											out.print("<input class='form-check-input' type='checkbox' onclick='modalItemParaTroca("+itemPedido.getId()+","+itemPedido.getQtd()+")' id='flexCheckDefault'>");
											out.print("</td>");
											out.print("<td>");
											out.print(itemPedido.getNomeProduto());
											out.print("</td>");
											out.print("<td>");
											out.print(NumberFormat.getCurrencyInstance().format(itemPedido.getPrecoUnico()));
											out.print("</td>");
											out.print("<td>");
											out.print(itemPedido.getQtd());
											out.print("</td>");
										out.print("</tr>");
									}
								
								
								
								%>
								

							</tbody>
					</table>
					
					<form id="formTroca" action="finalizarSolicitacaoTroca"> <input type="hidden" name="idPedido"id="idPedido" value="<% out.print(itemPedido.getIdPedido()); %>"> <button type='button' id="btnTroca" name="btnTroca"class = 'btn btn-primary' onclick="troca_alerta_pedido()">Solicitar troca</button></form>
				
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
		<form action="home" method="post"> <div class="row"><button name="operacao" id="operacao" value="logout" type='submit' class = 'btn btn-primary' ><i class="fa fa-power-off" title="Sair"></i> Sair</button></div></form><br><br>
		<div class="row">
			<div class="col-md-6">
				<h2 class="section-title">Login</h2>
				<form action="home" method="post">
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
	
	<script>
	
		function mudarItemParaTroca() {
			
			$('#modalQuantidadeTroca').modal('hide');
			

			var qtdTroca = $('#qtdParaTrocaProduto').val();
			var idItemPedido = $('#idItemPedidoParaTroca').val();
			
			
			if(qtdTroca=='')qtdTroca=0;
			
			$.ajax({
 				url : "/ecommerce-video-game-projeto-less/AtualizarItemPedidoParaTroca",
 				type : "POST",
 				
				data: {
					'ajax':'true',
					'idItemPedido':idItemPedido,
					'qtdTroca':qtdTroca,
					
				},
 				success : function(e) {	
 					execucao_alerta();
 					
 					
 				},
 				error: function(e) {
 					alert('erro');
 	            }  
 			});
		}
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
	
	
	
	<div class="modal fade" id="modalQuantidadeTroca" role="dialog">
		<div class="modal-dialog modal-md">
			<div class="modal-content">
				<div class="modal-header">
<!-- 					<button type="button" class="close" data-dismiss="modal">&times;</button> -->
					<h1 class="modal-title">Inserir quantidade desejada de troca</h1>
				</div>
				<div class="modal-body">
		
					<div class="row">
						<div class="col-md-9">
							<input type='hidden' class='form-control' name="idItemPedidoParaTroca" id="idItemPedidoParaTroca">
							<div id="inputTypeQuantidadeParatroca"></div>
							
						</div>
						<div class="col-md-3">
							<button class="btn btn-primary" onclick="mudarItemParaTroca()" >Salvar</button>
						</div>
					</div>
				
					
				</div>
				
			</div>
		</div>
	</div>
	
	
	
	
	
	
	
	

</body>

</html>