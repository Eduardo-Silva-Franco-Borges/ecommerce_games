<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<%@page import="br.com.projetoles.domain.EntidadeDominio"%>
<%@page import="br.com.projetoles.domain.Result"%>
<%@page import="br.com.projetoles.domain.Carrinho"%>
<%@page import="br.com.projetoles.domain.Pedido"%>
<%@page import="br.com.projetoles.domain.ItemPedido"%>
<%@page import="br.com.projetoles.domain.Prestacao"%>
<%@page import="java.text.NumberFormat"%>
    
<%@page import="javax.servlet.http.Cookie"%>
<%@page import="java.util.List"%>
<%@page import="br.com.projetoles.util.DateUtil"%>
	
	
<%			
			String user = "";
			Cookie[] cookies = request.getCookies();
			for(Cookie atual: cookies){
				if(atual.getName().equals("nomeUsuario")){
					 user = atual.getValue();
				}
			}
%>






<%	
	
								
	List<EntidadeDominio> resultPedidos = (List<EntidadeDominio>) request.getAttribute("pedidos");
	Pedido pedidoo = new Pedido();
	
	
	for (EntidadeDominio ped : resultPedidos) {
		
		
		StringBuilder tabelaProdutosPedido = new StringBuilder();
		StringBuilder tabelaCartoesPedido = new StringBuilder();
		
		tabelaProdutosPedido.append("'");
		tabelaCartoesPedido.append("'");
		
		pedidoo = (Pedido) ped;
		
		List<EntidadeDominio> itemPedido;
		List<EntidadeDominio> prest;
		
		itemPedido = pedidoo.getItemPedido();
		prest = pedidoo.getCartoes();
		
		ItemPedido produto = new ItemPedido();
		Prestacao prestacao = new Prestacao();
		
		
		
		
		for (EntidadeDominio intped:itemPedido) {
			produto = (ItemPedido) intped;
			if(produto.getTroca()==1){
				tabelaProdutosPedido.append("<tr><td>"+produto.getNomeProduto()+"</td><td>"+produto.getQtd()+"</td><td>"+NumberFormat.getCurrencyInstance().format(produto.getPrecoUnico())+"</td><td>"+NumberFormat.getCurrencyInstance().format(produto.getPrecoUnico()*produto.getQtd())+"</td><td><edu>Troca("+produto.getQtdtroca()+")</edu></td></tr>");
				
			}else if(produto.getTroca()==2){
				tabelaProdutosPedido.append("<tr><td>"+produto.getNomeProduto()+"</td><td>"+produto.getQtd()+"</td><td>"+NumberFormat.getCurrencyInstance().format(produto.getPrecoUnico())+"</td><td>"+NumberFormat.getCurrencyInstance().format(produto.getPrecoUnico()*produto.getQtd())+"</td><td><edu>Cancelamento</edu></td></tr>");
				
			}else{
				tabelaProdutosPedido.append("<tr><td>"+produto.getNomeProduto()+"</td><td>"+produto.getQtd()+"</td><td>"+NumberFormat.getCurrencyInstance().format(produto.getPrecoUnico())+"</td><td>"+NumberFormat.getCurrencyInstance().format(produto.getPrecoUnico()*produto.getQtd())+"</td><td></td></tr>");
				
			}
			
		}
		
		for (EntidadeDominio prt:prest) {
			prestacao = (Prestacao) prt;
			tabelaCartoesPedido.append("<tr><td>"+prestacao.getNumero_cartao()+"</td><td>"+prestacao.getNome_impress()+"</td><td>"+NumberFormat.getCurrencyInstance().format(prestacao.getValor())+"</td><td>"+prestacao.getQtd()+"</td><td>"+NumberFormat.getCurrencyInstance().format(prestacao.getValor_parcela())+"</td></tr>");
		}
		
		
		
		tabelaProdutosPedido.append("'");
		tabelaCartoesPedido.append("'");
		
		
		pedidoo.setTabelaProdutosPedido(tabelaProdutosPedido);
		pedidoo.setTabelaCartoesPedido(tabelaCartoesPedido);
		
		
		
	}
	
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0,maximum-scale=1">

<title>Pedidos</title>

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

<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.css"> -->
<link rel="stylesheet" href="https://cdn.datatables.net/1.11.3/css/dataTables.bootstrap4.min.css">


<!-- Loading main css file -->
<link rel="stylesheet" href="style.css">

<!--[if lt IE 9]>
		<script src="js/ie-support/html5.js"></script>
		<script src="js/ie-support/respond.js"></script>
		<![endif]-->
		

<style>
	edu { color: red; }
</style>


<script type="text/javascript">
	function modalVerPedido(
				id_pedido,
				status_pedido,
				id_status_pedido,
				nomeCliente,
				data_pedido,
				valorDesconto,
				valorFrete,
				valorTotal,
				nomeEndereco,
				tipoEndereco,
				tipoLogradouro,
				numeroEndereco,
				logradouro,
				cep,
				cidade,tabelaProdutosPedido,tabelaCartoesPedido,troca) {
		
		$('#idpedido').val(id_pedido);
		$('#statusPedido').text(status_pedido);
		$('#idstatusPedido').val(id_status_pedido);
		$('#nomeCliente').text(nomeCliente);

		$('#dataPedido').text(data_pedido);
		$('#valorDesconto').text(valorDesconto);
		$('#valorFrete').text(valorFrete);
		$('#valorTotal').text(valorTotal);
		$('#nome_endereco').text(nomeEndereco);
		$('#tipoEndereco').text(tipoEndereco);
		$('#tipoLogradouro').text(tipoLogradouro);
		$('#numero_endereco').text(numeroEndereco);
		$('#logradouro').text(logradouro);
		$('#cep').text(cep);
		$('#cidade').text(cidade);
		$('#identificacaoTroca').val(troca);
		
		document.getElementById("tabelaProdutosPedido").innerHTML = tabelaProdutosPedido;
		document.getElementById("tabelaCartoesPedido").innerHTML = tabelaCartoesPedido;
		
		$('#modalVerPedido').modal('show');
	}
</script>
	
<script>
	$(document).ready(function() {
	    $('#example').DataTable();
	} );	
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
						<h1>Pedidos</h1>
					</div>
				</div>
<!-- 				<br> -->
<!-- 				<div class="row"> -->
<!-- 					<div class="col-md-12"> -->
<!-- 						<h5>*Todos os campos opcionais</h5> -->
						
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				<div class="row"> -->

<!-- 					<div class="col-md-6"> -->
<!-- 						<label class="reduced-input-label" for="txtDtInicio">Data -->
<!-- 							Início</label> <input type="date" class="form-control reduced-input" -->
<!-- 							id="txtDtInicio" name="txtDtInicio"> -->
<!-- 					</div> -->
<!-- 					<div class="col-md-6"> -->
<!-- 						<label class="reduced-input-label" for="txtDtFim">Data Fim</label> -->
<!-- 						<input type="date" class="form-control reduced-input" -->
<!-- 							id="txtDtFim" name="txtDtFim"> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				<br> -->
<!-- 				<div class="row"> -->

					
<!-- 					<div class="col-md-12"> -->
<!-- 						<label class="reduced-input-label" for="txtStatus">Status</label> -->
<!-- 						<select id="txtStatus" name="txtStatus" -->
<!-- 							class="form-control reduced-input"> -->
<!-- 								<option value=""></option> -->
<!-- 								<option value="1">EM PROCESSAMENTO</option> -->
<!-- 								<option value="2">PAGAMENTO REALIZADO</option> -->
<!-- 								<option value="3">ENVIADO PARA TRANSPORTADORA</option> -->
<!-- 								<option value="4">EM TRANSPORTE</option> -->
<!-- 								<option value="5">ENTREGUE</option> -->
<!-- 								<option value="6">TROCA SOLICITADA</option> -->
<!-- 								<option value="7">TROCA RECUSADA</option> -->
<!-- 								<option value="8">TROCA ACEITA</option> -->
<!-- 								<option value="9">PRODUTO ENVIADO PARA TROCA/CANCELAMENTO</option> -->
<!-- 								<option value="10">PRODUTO RECEBIDO PARA TROCA/CANCELAMENTO</option> -->
<!-- 								<option value="11">TROCA / CANCELAMENTO REALIZADO</option>		 -->
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
				
				
				<table class="table table-striped" id='example'>
							<thead>
								<tr>
									<th>Pedido</th>
									<th>Data</th>
									<th>Status</th>
									<th>Cliente</th>
									<th>Ações</th>
								</tr>
							</thead>
							<tbody>
<!-- 								<tr> -->
<!-- 									<td>1</td> -->
<!-- 									<td>14/02/2021</td> -->
<!-- 									<td><button type="button" class="btn btn-warning btn-sm">Troca Autorizada </button></td> -->
<!-- 									<td>Eduardo</td> -->
<!-- 									<td> <div class="row"> -->
<!-- 											<div class="col-md-2"> -->
<!-- 												<button type='button' class = 'btn btn-info btn-sm' onclick='modalVerPedido()' ><i class="fa fa-eye" title="Ver Pedido"></i></button> -->
<!-- 											</div> -->
<!-- 											<div class="col-md-2"> -->
<!-- 												<form action="troca" method="post"><button type='submit' class = 'btn btn-primary btn-sm' ><i class="fa fa-refresh" title="Trocar Pedido"></i></button></form> -->
<!-- 											</div> -->
<!-- 											<div class="col-md-2"> -->
<!-- 												<button type='button' class = 'btn btn-danger btn-sm' onclick="cancelamento_alerta_pedido()"><i class="fa fa-times" title="Cancelar Pedido"></i></button> -->
<!-- 											</div> -->
											
<!-- 										</div>   -->
										
<!-- 									</td> -->
<!-- 								</tr> -->
<!-- 								<tr> -->
<!-- 									<td>2</td> -->
<!-- 									<td>15/07/2021</td> -->
<!-- 									<td><button type="button" class="btn btn-success btn-sm">Em processamento </button></td> -->
<!-- 									<td>Julia</td> -->
<!-- 									<td> -->
<!-- 										<div class="row"> -->
<!-- 											<div class="col-md-2"> -->
<!-- 												<button type='button' class = 'btn btn-info btn-sm' onclick='modalVerPedido()' ><i class="fa fa-eye" title="Ver Pedido"></i></button> -->
<!-- 											</div> -->
<!-- 											<div class="col-md-2"> -->
<!-- 												<form action="troca" method="post"><button type='submit' class = 'btn btn-primary btn-sm' ><i class="fa fa-refresh" title="Trocar Pedido"></i></button></form> -->
<!-- 											</div> -->
<!-- 											<div class="col-md-2"> -->
<!-- 												<button type='button' class = 'btn btn-danger btn-sm' onclick="cancelamento_alerta_pedido()"><i class="fa fa-times" title="Cancelar Pedido"></i></button> -->
<!-- 										</div> -->
<!-- 									</td> -->
<!-- 								</tr> -->
<!-- 								<tr> -->
<!-- 									<td>3</td> -->
<!-- 									<td>14/05/2021</td> -->
<!-- 									<td><button type="button" class="btn btn-danger btn-sm">Reprovada </button></td> -->
<!-- 									<td>Maria</td> -->
<!-- 									<td> -->
<!-- 										<div class="row"> -->
<!-- 											<div class="col-md-2"> -->
<!-- 												<button type='button' class = 'btn btn-info btn-sm' onclick='modalVerPedido()' ><i class="fa fa-eye" title="Ver Pedido"></i></button> -->
<!-- 											</div> -->
<!-- 											<div class="col-md-2"> -->
<!-- 												<form action="troca" method="post"><button type='submit' class = 'btn btn-primary btn-sm' ><i class="fa fa-refresh" title="Trocar Pedido"></i></button></form> -->
<!-- 											</div> -->
<!-- 											<div class="col-md-2"> -->
<!-- 												<button type='button' class = 'btn btn-danger btn-sm' onclick="cancelamento_alerta_pedido()"><i class="fa fa-times" title="Cancelar Pedido"></i></button> -->
<!-- 										</div> -->
<!-- 									</td> -->
<!-- 								</tr> -->
<!-- 								<tr> -->
<!-- 									<td>4</td> -->
<!-- 									<td>14/07/2021</td> -->
<!-- 									<td><button type="button" class="btn btn-info btn-sm">Entrega realizada </button></td> -->
<!-- 									<td>Joseph</td> -->
<!-- 									<td> -->
<!-- 										<div class="row"> -->
<!-- 											<div class="col-md-2"> -->
<!-- 												<button type='button' class = 'btn btn-info btn-sm' onclick='modalVerPedido()' ><i class="fa fa-eye" title="Ver Pedido"></i></button> -->
<!-- 											</div> -->
<!-- 											<div class="col-md-2"> -->
<!-- 												<form action="troca" method="post"><button type='submit' class = 'btn btn-primary btn-sm' ><i class="fa fa-refresh" title="Trocar Pedido"></i></button></form> -->
<!-- 											</div> -->
<!-- 											<div class="col-md-2"> -->
<!-- 												<button type='button' class = 'btn btn-danger btn-sm' onclick="cancelamento_alerta_pedido()"><i class="fa fa-times" title="Cancelar Pedido"></i></button> -->
<!-- 										</div> -->
<!-- 									</td> -->
<!-- 								</tr> -->



									<%	
								
									List<EntidadeDominio> result = (List<EntidadeDominio>) request.getAttribute("pedidos");
									Pedido pedido = new Pedido();
									
									for (EntidadeDominio ped : result) {
										
										pedido = (Pedido) ped;
										out.print("<tr>");
										out.print("<td>#"+pedido.getIdPedido()+"</td>");
										out.print("<td>"+ new DateUtil().getFormatedDateBrasil(pedido.getDt_cadastro())+"</td>");
										
										if(pedido.getNome_Status().equals("EM PROCESSAMENTO"))out.print("<td><button type='button' class='btn btn-success btn-sm'>"+pedido.getNome_Status()+"</button></td>");
										if(pedido.getNome_Status().equals("PAGAMENTO REALIZADO"))out.print("<td><button type='button' class='btn btn-success btn-sm'>"+pedido.getNome_Status()+"</button></td>");
										if(pedido.getNome_Status().equals("ENVIADO PARA TRANSPORTADORA"))out.print("<td><button type='button' class='btn btn-info btn-sm'>"+pedido.getNome_Status()+"</button></td>");
										if(pedido.getNome_Status().equals("EM TRANSPORTE"))out.print("<td><button type='button' class='btn btn-warning btn-sm'>"+pedido.getNome_Status()+"</button></td>");
										if(pedido.getNome_Status().equals("ENTREGUE"))out.print("<td><button type='button' class='btn btn-success btn-sm'>"+pedido.getNome_Status()+"</button></td>");
										if(pedido.getNome_Status().equals("TROCA SOLICITADA"))out.print("<td><button type='button' class='btn btn-info btn-sm'>"+pedido.getNome_Status()+"</button></td>");
										if(pedido.getNome_Status().equals("TROCA RECUSADA"))out.print("<td><button type='button' class='btn btn-danger btn-sm'>"+pedido.getNome_Status()+"</button></td>");
										if(pedido.getNome_Status().equals("TROCA ACEITA"))out.print("<td><button type='button' class='btn btn-success btn-sm'>"+pedido.getNome_Status()+"</button></td>");
										if(pedido.getNome_Status().equals("PRODUTO ENVIADO PARA TROCA/CANCELAMENTO"))out.print("<td><button type='button' class='btn btn-primary btn-sm'>"+pedido.getNome_Status()+"</button></td>");
										if(pedido.getNome_Status().equals("PRODUTO RECEBIDO PARA TROCA/CANCELAMENTO"))out.print("<td><button type='button' class='btn btn-info btn-sm'>"+pedido.getNome_Status()+"</button></td>");
										if(pedido.getNome_Status().equals("TROCA / CANCELAMENTO REALIZADO"))out.print("<td><button type='button' class='btn btn-warning btn-sm'>"+pedido.getNome_Status()+"</button></td>");
										
										
										out.print("<td>Eduardo</td>");
										out.print("<td><div class='row'><div class='col-md-2'><button type='button' class = 'btn btn-info btn-sm' onclick=");
										
										out.print('"');
										out.print("modalVerPedido(");
										out.print("'"+pedido.getIdPedido()+"'");
										out.print(",");
										out.print("'"+pedido.getNome_Status()+"'");
										out.print(",");
										out.print("'"+pedido.getIdStatus()+"'");
										out.print(",");
										out.print("'Eduardo'");
										out.print(",");
										out.print("'"+new DateUtil().getFormatedDateBrasil(pedido.getDt_cadastro())+"'");
										out.print(",");
										out.print("'"+NumberFormat.getCurrencyInstance().format(pedido.getDesconto())+"'");
										out.print(",");
										out.print("'"+NumberFormat.getCurrencyInstance().format(pedido.getFrete())+"'");
										out.print(",");
										out.print("'"+NumberFormat.getCurrencyInstance().format(pedido.getPrecoTotal())+"'");
										out.print(",");
										out.print("'"+pedido.getNome_endereco()+"'");
										out.print(",");
										out.print("'"+pedido.getTipo_endereco()+"'");
										out.print(",");
										out.print("'"+pedido.getTipo_logradour()+"'");
										out.print(",");
										out.print("'"+pedido.getNumero_endereco()+"'");
										out.print(",");
										out.print("'"+pedido.getLogradour()+"'");
										out.print(",");
										out.print("'"+pedido.getCep()+"'");
										out.print(",");
										out.print("'"+pedido.getCidade()+"'");
										out.print(",");
										out.print(pedido.getTabelaProdutosPedido());
										out.print(",");
										out.print(pedido.getTabelaCartoesPedido());
										out.print(",");
										out.print(pedido.getTroca());
										out.print(")");
										out.print('"');
										out.print(" ><i class='fa fa-eye' title='Ver Pedido'></i></button></div>");
										
										if (user.equals("Cliente")) {
										
										if(pedido.getIdStatus()==5){
											out.print("<div class='col-md-2'><form action='solicitarTroca' method='post'><input type='hidden' name='idPedidoTroca' id='idPedidoTroca' value='"+pedido.getIdPedido()+"' ><button type='submit' class = 'btn btn-primary btn-sm' ><i class='fa fa-refresh' title='Trocar Pedido'></i></button></form></div>");
											out.print("<div class='col-md-2'><button type='button' class = 'btn btn-danger btn-sm' onclick='cancelamento_alerta_pedido("+pedido.getIdPedido()+")'><i class='fa fa-times' title='Cancelar Pedido'></i></button></div></td>");
											
										}else{
											
											out.print("<div class='col-md-2'><form action='solicitarTroca' method='post'><input type='hidden' name='idPedidoTroca' id='idPedidoTroca' value='"+pedido.getIdPedido()+"' ><button type='button' class = 'btn btn-primary btn-sm' ><i class='fa fa-refresh' title='Trocar Pedido'></i></button></form></div>");
											out.print("<div class='col-md-2'><button type='button' class = 'btn btn-danger btn-sm' ><i class='fa fa-times' title='Cancelar Pedido'></i></button></div></td>");
											
										}
										
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
	
	
	
	
	
	
	
	
	<div class="modal fade" id="modalVerPedido" role="dialog">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
<!-- 					<button type="button" class="close" data-dismiss="modal">&times;</button> -->
					<div class="row">
						<div class="col-md-8"><h1 class="modal-title">Visualizar Pedido</h1></div>
						<div class="col-md-4" style="text-align:right">
						<% if (user.equals("Adm")) { %>
							<label>Alterar status do pedido</label>
							<select class="form-control reduced-input" id="valorStatusPedido"name="valorStatusPedido" onchange="mudarStatusPedido()" >
								<option value=""></option>
								<option value="1">EM PROCESSAMENTO</option>
								<option value="2">PAGAMENTO REALIZADO</option>
								<option value="3">ENVIADO PARA TRANSPORTADORA</option>
								<option value="4">EM TRANSPORTE</option>
								<option value="5">ENTREGUE</option>
								<option value="6">TROCA SOLICITADA</option>
								<option value="7">TROCA RECUSADA</option>
								<option value="8">TROCA ACEITA</option>
								<option value="9">PRODUTO ENVIADO PARA TROCA/CANCELAMENTO</option>
								<option value="10">PRODUTO RECEBIDO PARA TROCA/CANCELAMENTO</option>
								<option value="11">TROCA / CANCELAMENTO REALIZADO</option>		
							</select>
						<% } %>
						</div>
						
						</div>
					
				</div>
				<div class="modal-body">
					
					<div class="row">
						<div class="col-md-6">
							<h5><b>Status do pedido: </b><span id="statusPedido">Troca Autorizada</span></h5>
						</div>
							<input type='hidden' id="idpedido" name="idpedido" >
							<input type='hidden' id="idstatusPedido" name="idstatusPedido" >
							<input type='hidden' id="identificacaoTroca" name="identificacaoTroca" >
						
						<div class="col-md-6">
							<h5 ><b>Cliente: </b><span id="nomeCliente"></span></h5>
						</div>
					</div>
					<div class="row">
						<div class="col-md-3">
							<h5 id=""><b>Data: </b><span id="dataPedido"></span></h5>
						</div>
						<div class="col-md-3">
							<h5 id=""><b>Valor Desconto: </b><span id="valorDesconto"></span></h5>
						</div>
						<div class="col-md-3">
							<h5 id=""><b>Valor Frete: </b><span id="valorFrete"></span></h5>
						</div>
						<div class="col-md-3">
							<h5 id=""><b>Valor Total: </b><span id="valorTotal"></span></h5>
						</div>
					</div>
					<hr>
					<div class="row">
						<div class="col-md-3">
							<h5 id=""><b>Nome Endereço: </b><span id="nome_endereco"></span></h5>
						</div>
						<div class="col-md-3">
							<h5 id=""><b>Tipo Endereço: </b><span id="tipoEndereco"></span></h5>
						</div>
						<div class="col-md-3">
							<h5 id=><b>Tipo Logradouro: </b><span id="tipoLogradouro"></span></h5>
						</div>
						<div class="col-md-3">
							<h5 id=""><b>Logradouro: </b><span id="logradouro"></span></h5>
						</div>
					</div>
					<div class="row">
						<div class="col-md-3">
							<h5 id=""><b>Número: </b><span id="numero_endereco"></span></h5>
						</div>
						<div class="col-md-3">
							<h5 id=""><b>CEP: </b><span id="cep"></span></h5>
						</div>
						<div class="col-md-3">
							<h5 id=''><b>Cidade: </b><span id="cidade"></span></h5>
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
									<th>&nbsp;</th>
									
								</tr>
							</thead>
							<tbody id='tabelaProdutosPedido'>
								

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
									
									<th>Valor Total</th>
									<th>Quantidade de Parcelas</th>
									<th>Valor Parcela</th>
									
								</tr>
							</thead>
							<tbody id='tabelaCartoesPedido'>
								
								

							</tbody>
					</table>
					
					
				</div>
				
			</div>
		</div>
	</div>
	
	
	
	<script >
        
        function mudarStatusPedido() {
        	
      
		
			var antigo_status_pedido_id = $('#idstatusPedido').val();
			var id_pedido = $('#idpedido').val();
			var novo_status_pedido_id = $('#valorStatusPedido :selected').val();
			
			var identificacaoTroca = $('#identificacaoTroca').val();
			
// 			alert(antigo_status_pedido_id);
// 			alert(id_pedido);
// 			alert(novo_status_pedido_id);
			
			
			
			
			$.ajax({
	 				url : "/ecommerce-video-game-projeto-less/atualizarStatusPedido",
	 				type : "POST",
	 				
					data: {
						'ajax':'true',
						'antigo_status_pedido_id':antigo_status_pedido_id,
						'novo_status_pedido_id':novo_status_pedido_id,
						'id_pedido':id_pedido,
						'identificacaoTroca':identificacaoTroca,
						
						
					},
	 				success : function(e) {	

						var d = parseInt(e);
	 					
	 					if(d==1){
	 						execucao_alerta_atualizarPedido_erro();
	 					}else{
	 						
	 						execucao_alerta_atualizarPedido();
	 					}
	 					
	 					
	 					
	 				},
	 				error: function(e) {
	 					alert("operacao com erro");
	 					execucao_alerta_atualizarPedido_erro();
	 	            }  
	 			});
			
        	
                
        }
	</script>
	
	<script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
	<script src="https://cdn.datatables.net/1.11.3/js/dataTables.bootstrap4.min.js"></script>

	
	

</body>

</html>