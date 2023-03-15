<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
	
<%@page import="br.com.projetoles.domain.Pessoa"%>
<%@page import="br.com.projetoles.util.DateUtil"%>
<%@page import="br.com.projetoles.domain.EntidadeDominio"%>
<%@page import="br.com.projetoles.domain.Endereco"%>
<%@page import="br.com.projetoles.domain.Cartao"%>
<%@page import="br.com.projetoles.domain.Result"%>
<%@page import="br.com.projetoles.domain.Carrinho"%>
<%@page import="br.com.projetoles.domain.Cupom"%>
<%@page import="br.com.projetoles.domain.Prestacao"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>

<%@page import="java.text.DateFormat"%>
<%@page import="java.text.ParseException"%>	
	
<%@page import="java.text.NumberFormat"%>
	
	
	
	
<%	
int idPedido = 0;
int idEnderecoPedido = 0;
String cidadeFrete = null;
double valorTotalProdutos = 0;
double valorTotalCompra = 0;
double valorCartoes = 0;
int valorFrete = 0;
int valorDesconto = 0;
int verificadorSetemCartaoSelecionado = 0;
valorDesconto = (int) request.getAttribute("valorDesconto");
String nomeBandeira = null;
List<EntidadeDominio> prestacoesPedido = null;
List<EntidadeDominio> carrinhoResultado = (List<EntidadeDominio>) request.getAttribute("resultCarrinho");
Carrinho carrinho = new Carrinho();

for (EntidadeDominio carrinhoResult : carrinhoResultado) {
	carrinho = (Carrinho) carrinhoResult;
	idPedido = carrinho.getId();
	idEnderecoPedido = carrinho.getIdEndereco();
	prestacoesPedido = carrinho.getPrestacao();
	valorTotalProdutos += carrinho.getQuantidade_selecionada() * carrinho.getPrecoUnico();
	
}
								

List<EntidadeDominio> pessoasResultado = (List<EntidadeDominio>) request.getAttribute("resultPessoa");
Pessoa usuarioResultado = new Pessoa();

for (EntidadeDominio pessoaResultado : pessoasResultado) {
	usuarioResultado = (Pessoa) pessoaResultado;
	List<EntidadeDominio> enderecoCompras;
	List<EntidadeDominio> cartaoCompras;
	
	
	enderecoCompras = usuarioResultado.getCliente().getEnderecoCompras();
	cartaoCompras = usuarioResultado.getCliente().getCartoes();
	
	StringBuilder tableEnderecoCobranca = new StringBuilder();
	StringBuilder tableEnderecoEntrega = new StringBuilder();
	StringBuilder tableCartao = new StringBuilder();
	
	StringBuilder tableCartaoMin = new StringBuilder();
	
// 	tableEnderecoCobranca.append("'");
// 	tableEnderecoEntrega.append("'");
// 	tableCartao.append("'");
	
	for (EntidadeDominio enderecos:enderecoCompras) {
		Endereco endereco =  (Endereco) enderecos;
		
		String tipoEnderecoCompra = null;
		
		if(endereco.getTipo_endereco_compra() != null){
			tipoEnderecoCompra = endereco.getTipo_endereco_compra();
			
			if(tipoEnderecoCompra.equals("Cobranca")){
				tableEnderecoCobranca.append("<tr><td><input name='enderecoCobrancaID'  type='radio'  ></td><td>"+endereco.getTipoEndereco().getNome()+"</td><td>"+endereco.getTipoEndereco().getDescricao()+"</td><td>"+endereco.getRua()+"</td><td>"+endereco.getNumero()+"</td><td>"+endereco.getCidade().getDescricao()+"</td></tr>");
			}
			
			if(tipoEnderecoCompra.equals("Entrega")){
				if((endereco.getId()) == idEnderecoPedido){
					tableEnderecoEntrega.append("<tr><td><input checked name='enderecoEntregaID' value='"+endereco.getId()+"' type='radio' onclick='atualizaEnderecoEntregaPedidoAjax("+endereco.getId()+","+idPedido+")'></td><td>"+endereco.getTipoEndereco().getNome()+"</td><td>"+endereco.getTipoEndereco().getDescricao()+"</td><td>"+endereco.getRua()+"</td><td>"+endereco.getNumero()+"</td><td>"+endereco.getCidade().getDescricao()+"</td></tr>");
					cidadeFrete = endereco.getCidade().getDescricao();
				}else{
					tableEnderecoEntrega.append("<tr><td><input name='enderecoEntregaID' value='"+endereco.getId()+"' type='radio' onclick='atualizaEnderecoEntregaPedidoAjax("+endereco.getId()+","+idPedido+")'></td><td>"+endereco.getTipoEndereco().getNome()+"</td><td>"+endereco.getTipoEndereco().getDescricao()+"</td><td>"+endereco.getRua()+"</td><td>"+endereco.getNumero()+"</td><td>"+endereco.getCidade().getDescricao()+"</td></tr>");
					
				}
				
			}
		}
		
	}
	for (EntidadeDominio cartoes:cartaoCompras) {
		Cartao cartao =  (Cartao) cartoes;
		
		if(cartao.getCodigo_seguranca() != null){
			int verificador = 0;
			
			if(cartao.getBandeira_cartao().equals("1"))nomeBandeira = "Visa";
			if(cartao.getBandeira_cartao().equals("2"))nomeBandeira = "MasterCard";
			if(cartao.getBandeira_cartao().equals("3"))nomeBandeira = "Elo";
			if(cartao.getBandeira_cartao().equals("4"))nomeBandeira = "American Express";
			
			
			for (EntidadeDominio prestacao:prestacoesPedido) {
				
				Prestacao prest =  (Prestacao) prestacao;
				 if(prest.getIdCartao() == cartao.getId_cartao()) verificador ++;
			}
			
			if(verificador != 0){
				tableCartao.append("<tr><td ><input checked type='radio' ></td><td>"+nomeBandeira+"</td><td>"+cartao.getNome_impresso()+"</td><td>"+cartao.getNumero()+"</td></tr>");	
				verificadorSetemCartaoSelecionado ++;
			}else{
				tableCartao.append("<tr><td ><input type='radio' onclick='atualizaPagamentoPedidoModal("+cartao.getId_cartao()+","+idPedido+")'></td><td>"+nomeBandeira+"</td><td>"+cartao.getNome_impresso()+"</td><td>"+cartao.getNumero()+"</td></tr>");	
				
			}
			
			
		}
		
	}
	
	
	
	
	
	for (EntidadeDominio cartoes:cartaoCompras) {
		Cartao cartao =  (Cartao) cartoes;
		
		if(cartao.getCodigo_seguranca() != null){
			int verificador = 0;
			double valorCartao = 0;
			int quantidadeParcela = 0;
			
			
			if(cartao.getBandeira_cartao().equals("1"))nomeBandeira = "Visa";
			if(cartao.getBandeira_cartao().equals("2"))nomeBandeira = "MasterCard";
			if(cartao.getBandeira_cartao().equals("3"))nomeBandeira = "Elo";
			if(cartao.getBandeira_cartao().equals("4"))nomeBandeira = "American Express";
			
			
			for (EntidadeDominio prestacao:prestacoesPedido) {
				
				Prestacao prest =  (Prestacao) prestacao;
				 if(prest.getIdCartao() == cartao.getId_cartao()){
					 verificador ++;
					 valorCartao = prest.getValor();
					 quantidadeParcela = prest.getQtd();
					 valorCartoes += prest.getValor();
					 
				 }
			}
			
			if(verificador != 0){
				tableCartaoMin.append("<tr><td>"+nomeBandeira+"</td><td>"+NumberFormat.getCurrencyInstance().format(valorCartao)+"</td><td>"+quantidadeParcela+"</td></tr>");	
				
			}
			
			
		}
		
	}
	
// 	tableEnderecoCobranca.append("'");
// 	tableEnderecoEntrega.append("'");
// 	tableCartao.append("'");
	
	usuarioResultado.getCliente().setTableEnderecosCobranca(tableEnderecoCobranca);
	usuarioResultado.getCliente().setTableEnderecosEntrega(tableEnderecoEntrega);
	usuarioResultado.getCliente().setTableCartao(tableCartao);
	usuarioResultado.getCliente().setTableCartaoMin(tableCartaoMin);
		
}

if(cidadeFrete != null){
	

	if(cidadeFrete.equals("Mogi das Cruzes")){
		valorFrete = 50;
	}else{
		valorFrete = 100;
	}
	
	valorTotalCompra = (valorTotalProdutos + valorFrete)-valorCartoes - valorDesconto;
}else{
	valorTotalCompra = valorTotalProdutos - valorCartoes - valorDesconto;
}





%>	
	
	
	
	
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0,maximum-scale=1">

<title>Finalizar Pedido</title>

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
	function modalAdicionaEndereco() {
		
		
		$('#modalAdicionaEndereco').modal('show');
	}
</script>

<script type="text/javascript">
	function modalAdicionaFormaPagamento() {
		
		
		$('#modalAdicionaFormaPagamento').modal('show');
	}
</script>	


<script type="text/javascript">
	function atualizaPagamentoPedidoModal(idCartao, idPedido) {
		
		$('#idCartaoPrestacao').val(idCartao);
		$('#idPedidoPrestacao').val(idPedido);
		
		$('#modalPagamentoPrestacao').modal('show');
	}
</script>	

<script>
     //Funcao adiciona uma nova linha na tabela
     function adicionaLinha(idTabela) {
	
    	 $('#modalAdicionaEndereco').modal('hide');
    	 
         var tabela = document.getElementById(idTabela);
         var numeroLinhas = tabela.rows.length;
         var linha = tabela.insertRow(numeroLinhas);

         var celula1 = linha.insertCell(0);
         var celula2 = linha.insertCell(1);   
         var celula3 = linha.insertCell(2); 
         var celula4 = linha.insertCell(3);
		 var celula5 = linha.insertCell(4);
		 var celula6 = linha.insertCell(5);

         celula1.innerHTML = '<input type="radio" name="defaultAddressDA"> '; 
         celula2.innerHTML = document.getElementById("txtNameEnder").value; 
         celula3.innerHTML =  document.getElementById("txtStreetType").value; 
		 celula4.innerHTML =  document.getElementById("txtStreetName").value; 
		 celula5.innerHTML =  document.getElementById("txtNumber").value; 
		 celula6.innerHTML =  document.getElementById("txtCity").value; 
		 
		 
		 
     }
     
     // funcao remove uma linha da tabela
     function removeLinha(linha) {
       var i=linha.parentNode.parentNode.rowIndex;
       document.getElementById('tbl').deleteRow(i);
     }            
 </script>
 
 
 
 
 <script>
     //Funcao adiciona uma nova linha na tabela
     function adicionaLinhaCartao(idTabela) {
		
    	 $('#modalAdicionaFormaPagamento').modal('hide');
    	 
         var tabela = document.getElementById(idTabela);
         var numeroLinhas = tabela.rows.length;
         var linha = tabela.insertRow(numeroLinhas);

         var celula1 = linha.insertCell(0);
         var celula2 = linha.insertCell(1);   
         var celula3 = linha.insertCell(2); 
         var celula4 = linha.insertCell(3);
		 

         celula1.innerHTML = '<input type="radio" name="defaultAddressDA"> '; 
         celula2.innerHTML = document.getElementById("txtCardBanner").value; 
         celula3.innerHTML =  document.getElementById("txtNumbercartao").value; 
		 celula4.innerHTML =  document.getElementById("txtNameCartao").value; 
		 
     }
     
     // funcao remove uma linha da tabela
     function removeLinha(linha) {
       var i=linha.parentNode.parentNode.rowIndex;
       document.getElementById('tbl').deleteRow(i);
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
					<div class="col-md-10">
						<h1>Finalizar Pedido</h1>
					</div>
					<div class="col-md-2">
						<a href="home" class="button">+ Adicionar produto</a>
					</div>
					
				</div>
				<br>
				<h3>Detalhes do Envio</h3> <button  class="button" onclick="modalAdicionaEndereco()">Adicionar Endereço</button>
				<br>
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
								</tr>
							</thead>
							<tbody>
							
								<%	
								

									List<EntidadeDominio> pessoasEndereco = (List<EntidadeDominio>) request.getAttribute("resultPessoa");
									Pessoa usuarioEndereco = new Pessoa();
									
									for (EntidadeDominio pessoa : pessoasEndereco) {
										usuarioEndereco = (Pessoa) pessoa;
										out.print(usuarioEndereco.getCliente().getTableEnderecosEntrega());
									}
								%>

<!-- 								<tr> -->
<!-- 									<td class="product-name" style="width: 0%"><input -->
<!-- 										type="radio" name="defaultAddressDA" checked></td> -->

<!-- 									<td class="product-name">Endereço 1 <input type="hidden" -->
<!-- 										name="idAddressDA" id="idAddressDA" -->
<!-- 										form="formDeliveryAddresses"> -->
<!-- 									</td> -->
<!-- 									<td class="product-name" style="width: 0%">Casa</td> -->
<!-- 									<td class="product-name" style="width: 50%">Neverland -->
<!-- 										Downtown</td> -->
<!-- 									<td class="product-name" style="width: 0%">4524a</td> -->
<!-- 									<td class="product-name" style="width: 10%">Porto Seguro</td> -->
									
<!-- 								</tr> -->

								

								

							</tbody>
						</table>
				<br>
				<hr>
				<br>
				<h3>Formas de Pagamento</h3>
				
				<button  class="button" onclick="modalAdicionaFormaPagamento()">Adicionar Forma de pagamento</button>
				<br>
				<br>
				<table id="tableCreditCards" class="table">
							<thead class="thead-light">
								<tr>
									<th>Padrão</th>
									<th>Bandeira</th>
									<th>Nome</th>
									<th>Número</th>
									
								</tr>
							</thead>
							<tbody>

								

								<%	
								

									List<EntidadeDominio> pessoasCartao = (List<EntidadeDominio>) request.getAttribute("resultPessoa");
									Pessoa usuarioCartao = new Pessoa();
									
									for (EntidadeDominio pessoa : pessoasCartao) {
										usuarioCartao = (Pessoa) pessoa;
										out.print(usuarioCartao.getCliente().getTableCartao());
									}
								%>

								

							</tbody>
						</table>
				<br>
				<div class="row">
					<div class="col-md-12">
						
					</div>
				</div>
				<br>
<!-- 				<div class="cart-total"  > -->
<!-- 						<p> -->
<!-- 							<h2>Total do Pedido</h2> -->
<!-- 						</p> -->
<!-- 						<p> -->
<!-- 							<strong>Subtotal: </strong> R$450.00 -->
<!-- 						</p> -->
<!-- 						<p> -->
<!-- 							<strong>Entrega: </strong> R$30.00 -->
<!-- 						</p> -->
<!-- 						<p> -->
<!-- 							<strong>Desconto: </strong> R$50.00 -->
<!-- 						</p> -->
<!-- 						<p class="total"> -->
<!-- 							<strong>Total a pagar</strong><span class="num">R$430.00</span> -->
<!-- 						</p> -->
<!-- 						<p> -->
<!-- 						 <button type="button" class="button" onclick="finalizarPedido()">Finalizar pedido</button> -->
<!-- 						</p>		 -->
<!-- 				</div> -->
				
				<div class="cart-total" style="margin-left:10px" >
						<p>
							<h2>Total do Carrinho</h2>
						</p>
						<p>
							<strong>Subtotal: </strong> <% out.print(NumberFormat.getCurrencyInstance().format(valorTotalProdutos)); %>
						</p>
						<% if(cidadeFrete != null){ 
							 out.print("<p><strong>Entrega: </strong> <spam id='valorFrete'>"+NumberFormat.getCurrencyInstance().format(valorFrete)+"</spam></p>");
						   }
						%>
						
						<p >
							<strong>Desconto: </strong> <spam id="valorDescontoCupom"><% out.print(NumberFormat.getCurrencyInstance().format(valorDesconto)); %></spam>
						</p>
						<p class="total">
							<strong>Total</strong><span class="num" id="valorTotal"><% out.print(NumberFormat.getCurrencyInstance().format(valorTotalCompra)); %></span>
						</p>
						<p>
						 <button type='button' data-cy='btnFinalizarPedido' onclick='verificacaoFechamentoCompra(<% out.print(valorTotalProdutos); %>,<% out.print(valorFrete); %>,<% out.print(valorTotalCompra); %>,<% out.print(verificadorSetemCartaoSelecionado); %>,<% out.print(idPedido); %>)' class="button">Finalizar pedido</button>
						</p>
				</div>
				
				<div class="cart-total" style="margin-left:10px">
						<p>
							<h2>Pagamento</h2>
						</p>
						<table id="tableCreditCards" class="table">
							<thead class="thead-light">
								<tr>
									<th>Bandeira</th>
									<th>Valor</th>
									<th>Parcelas</th>
									
									
								</tr>
							</thead>
							<tbody>

								

								<%	
								

									List<EntidadeDominio> pessoasCartaoMin = (List<EntidadeDominio>) request.getAttribute("resultPessoa");
									Pessoa usuarioCartaoMin = new Pessoa();
									
									for (EntidadeDominio pessoa : pessoasCartaoMin) {
										usuarioCartaoMin = (Pessoa) pessoa;
										out.print(usuarioCartaoMin.getCliente().getTableCartaoMin());
									}
								%>

								

							</tbody>
						</table>
						
					</div>
					

					<!-- ele vai aqui -->
					<div class="cart-total" id="cupomDePagamento" style="margin-left:10px">
						<p>
							<h2>Cupons Disponíveis</h2>
						</p>
						
						<table id="" class="table">
							<thead class="thead-light">
								<tr>
									<th>Nome Cupom</th>
									<th>Valor</th>
									<th>Ação</th>
									
									
								</tr>
							</thead>
							<tbody>
							
								<%	
								

									List<EntidadeDominio> cupons = (List<EntidadeDominio>) request.getAttribute("resultCupons");
									Cupom cupom = new Cupom();
									
									for (EntidadeDominio cup : cupons) {
										cupom = (Cupom) cup;
										if(cupom.getAtivo()==1){
											out.print("<tr><td>"+cupom.getNomeCupom()+"</td><td>"+NumberFormat.getCurrencyInstance().format(cupom.getValor())+"</td><td><button class='btn btn-success btn-sm' onclick='atualizaUsoCupomAjax("+cupom.getId()+","+idPedido+",0,"+cupom.getValor()+")' >Aplicar</button></td></tr>");
											
										}else{
											out.print("<tr><td>"+cupom.getNomeCupom()+"</td><td>"+NumberFormat.getCurrencyInstance().format(cupom.getValor())+"</td><td><button class='btn btn-danger btn-sm' onclick='atualizaUsoCupomAjax("+cupom.getId()+","+idPedido+",1,"+cupom.getValor()+")' >Remover</button></td></tr>");
											
										}
										
									}
									
								%>

		

								

							</tbody>
						</table>
						
						

					</div>
				
				
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
		<a href="#" class="close"><i class="fa fa-close"></i>&times;</a>
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
		
		
		
		function verificacaoFechamentoCompra(valorProdutos,valorFrete,valorTotalCompra,verificaPreenchimentoCartao,idPedido) {
			
 			if((valorTotalCompra!=0) || (valorFrete == 0) || (verificaPreenchimentoCartao==0)){
 				if(valorTotalCompra!=0){
 					// valor da compra
 					alertFecharPedidoNaoZerado();
 				}
 				
 				if(valorFrete == 0){
 					// falta de seleção de endereco
 					alertFecharPedidoSemFrete();
 				}
 				
 				if(verificaPreenchimentoCartao==0){
 					// falta de seleção de cartao
 					alertFecharPedidoSemCartão();
 				}
 			}else{
	 			$.ajax({
	 				url : "/ecommerce-video-game-projeto-less/finalizarPedido",
	 				type : "POST",
	 				
					data: {
						'ajax':'true',
						'valorProdutos':valorProdutos,
						'valorFrete':valorFrete,
						'idPedido':idPedido,
						
					},
	 				success : function(e) {	
	 					execucao_alerta_fechamentoPedido();
	 					
	 					
	 				},
	 				error: function(e) {
	 					alert('erro');
	 	            }  
	 			});
 			}
 				
 			

 		}
		
		function atualizaEnderecoEntregaPedidoAjax(idEndereco,idPedido) {
			
 			
 			
 			$.ajax({
 				url : "/ecommerce-video-game-projeto-less/atualizaEnderecoEntregaPedido",
 				type : "POST",
 				
				data: {
					'ajax':'true',
					'idEndereco':idEndereco,
					'idPedido':idPedido,
					
				},
 				success : function(e) {	
 					execucao_alerta_fecharPedido();
 					
 					
 				},
 				error: function(e) {
 					alert('erro');
 	            }  
 			});
 		}
		
		
		
		
		function atualizaUsoCupomAjax(idCupom,idPedido,novoStatusCupom,valorCupom) {
			
			
			var valorTotalCompra = <% out.print(valorTotalCompra); %>
			
			if((valorTotalCompra-valorCupom) < 0){
				execucao_alerta_erro_valor_carrinho_ultrapassado();
			}else{
				$.ajax({
	 				url : "/ecommerce-video-game-projeto-less/atualizaUsoCupom",
	 				type : "POST",
	 				
					data: {
						'ajax':'true',
						'idCupom':idCupom,
						'idPedido':idPedido,
						'novoStatusCupom':novoStatusCupom,
						
					},
	 				success : function(e) {	
	 					execucao_alerta_fecharPedidoCupom();
	 					
	 					
	 				},
	 				error: function(e) {
	 					alert('erro');
	 	            }  
	 			});
			}
 			
 			
 			
 		}
		
		
		function atualizaPagamentoPedidoAjax() {
			
			
			
			var idCartaoPrestacao = $('#idCartaoPrestacao').val();
			var idPedidoPrestacao = $('#idPedidoPrestacao').val();

			var valorEscolhidoPrestacao = $('#valorEscolhidoPrestacao').val();
			var quantidadePrestacao = $('#quantidadePrestacao').val();
			
			var valorTotalCompra = <% out.print(valorTotalCompra); %>
			
			if((valorTotalCompra-valorEscolhidoPrestacao) < 0){
				execucao_alerta_erro_valor_carrinho_ultrapassado();
			}else{
				$.ajax({
	 				url : "/ecommerce-video-game-projeto-less/atualizaPagamentoPedido",
	 				type : "POST",
	 				
					data: {
						'ajax':'true',
						'idCartao':idCartaoPrestacao,
						'idPedido':idPedidoPrestacao,
						'valorEscolhidoPrestacao':valorEscolhidoPrestacao,
						'quantidadePrestacao':quantidadePrestacao,
						
					},
	 				success : function(e) {	
	 					execucao_alerta_fecharPedido();
	 					
	 					
	 				},
	 				error: function(e) {
	 					alert('erro');
	 	            }  
	 			});
			}
 			
 			
 		}
		
		
	</script>
	
	
	<div class="modal fade" id="modalAdicionaEndereco" role="dialog">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
<!-- 					<button type="button" class="close" data-dismiss="modal">&times;</button> -->
					<h1 class="modal-title">Adicionar endereço</h1>
				</div>
				<div class="modal-body">
					
					<form method="POST" id="" action="enderecoFecharPedidoCriacaoEntregaLogin">
							

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
											value="" name="txtDescriptionDA" id="txtDescriptionDA" data-cy="txtDescriptionDA"required>
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

								<input type="hidden" id="formAddressType" name="formAddressType"
									value="DA"> <br>
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
										<select id="txtStateHomeDA" name="txtStateHomeDA"
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
<!-- 							<input type="hidden" name="txtIdRowEndereco" id="txtIdRowEndereco" > -->
							<input type="hidden" name="txtTipoEnderecoCompraDA" id="txtTipoEnderecoCompraDA" value="Entrega">
							<%	
								

								List<EntidadeDominio> pessoaId = (List<EntidadeDominio>) request.getAttribute("resultPessoa");
								Pessoa usuarioID = new Pessoa();
								
								for (EntidadeDominio pessoa : pessoaId) {
									usuarioID = (Pessoa) pessoa;
									out.print("<input type='hidden' name='txtCliIdDA' id='txtCliIdDA' value='"+usuarioID.getCliente().getId_cli()+"'>");
								}
							 %>
							
							<p>
								<br>
							<div class="row">
								<div class="col-md-4">

									<button type="submit" class="btn btn-primary py-3 px-3" id="MudarTabelaEnderecoEntrega"  value="Adicionar">Adicionar</button>

								</div>
								
								
							</div>
							<p>
						</form>
				</div>
				
			</div>
		</div>
	</div>
	
	
	<div class="modal fade" id="modalAdicionaFormaPagamento" role="dialog">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
<!-- 					<button type="button" class="close" data-dismiss="modal">&times;</button> -->
					<h1 class="modal-title">Adicionar forma de pagamento</h1>
				</div>
				<div class="modal-body">
					
					<form method="POST" id="formCreditCard" action="cartaoCriacaoFecharPedido">
							<input type="hidden" value="/customerRedirectUpdate"
								name="pageReturn" id="pageReturn"> <input type="hidden"
								id="fieldUpdateCard" name="fieldUpdateCard">
							<div id="consistFildsCreditCard"></div>

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

							<%	
								

								List<EntidadeDominio> pessoaIdCartao = (List<EntidadeDominio>) request.getAttribute("resultPessoa");
								Pessoa usuarioIDcartao = new Pessoa();
								
								for (EntidadeDominio pessoa : pessoaIdCartao) {
									usuarioIDcartao = (Pessoa) pessoa;
									out.print("<input type='hidden' name='txtCliIdCartao' id='txtCliIdCartao' value='"+usuarioIDcartao.getCliente().getId_cli()+"'>");
								}
							 %>
							<p>
								<br>
								<input type="hidden" name="txtIdRowCartao" id="txtIdRowCartao">
							<div class="row">
								<div class="col-md-4">

<!-- 									<button type="button" class="btn btn-primary py-3 px-3" -->
<!-- 										id="operacao" name="operacao" value="Adicionar" onclick="execucao_alerta()">Adicionar</button> -->
										
									<button type="submit" class="btn btn-primary py-3 px-3" id="MudarTabelaCartao"  value="Adicionar">Adicionar</button> 

								</div>
								
							</div>
							<p>
						</form>
					
					
				</div>
				
			</div>
		</div>
	</div>
	
	
	
	
	
	
	<div class="modal fade" id="modalPagamentoPrestacao" role="dialog">
		<div class="modal-dialog modal-md">
			<div class="modal-content">
				<div class="modal-header">
<!-- 					<button type="button" class="close" data-dismiss="modal">&times;</button> -->
					<h1 class="modal-title">Cartão pagamento</h1>
				</div>
				<div class="modal-body">
					
					<input type='hidden' name='idCartaoPrestacao' id='idCartaoPrestacao'>
					<input type='hidden' name='idPedidoPrestacao' id='idPedidoPrestacao'>
					<div class='row'>
						<div class='col-md-6'>
						<label>Valor a pagar</label>
							<input class="form-control reduced-input" type='number' name='valorEscolhidoPrestacao' id='valorEscolhidoPrestacao'>
						</div>
						<div class='col-md-6'>
						<label>Quantidade parcelas</label>
							<select class="form-control reduced-input" name='quantidadePrestacao' id='quantidadePrestacao'>
								<option value="1">1x sem juros</option>
							    <option value="2">2x sem juros</option>
							    <option value="3">3x sem juros</option>
							    <option value="4">4x sem juros</option>
							    <option value="5">5x sem juros</option>
							</select>
						</div>
						 
						
						
					</div>
					<br><br>
					<div class='row'>
					<div class='col-md-6'>
					<button type="button" class="btn btn-primary py-3 px-3" onclick='atualizaPagamentoPedidoAjax()' >Aplicar Cartão</button>
					</div>
					
					</div>
					
							
					
					
					
				</div>
				
			</div>
		</div>
	</div>
	
	
	
	
	
	
	
	
	
	
	
	
	
	

</body>

</html>