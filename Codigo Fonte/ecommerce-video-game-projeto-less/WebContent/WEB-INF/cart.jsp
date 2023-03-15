<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
    
<%@page import="br.com.projetoles.domain.EntidadeDominio"%>
<%@page import="br.com.projetoles.domain.Result"%>
<%@page import="br.com.projetoles.domain.Carrinho"%>
<%@page import="java.text.NumberFormat"%>
    
<%@page import="javax.servlet.http.Cookie"%>
<%@page import="java.util.List"%>

<%	
	double valorTotalProdutos = 0;							
	List<EntidadeDominio> resultt = (List<EntidadeDominio>) request.getAttribute("result");
	Carrinho carrinhoo = new Carrinho();
	
	for (EntidadeDominio carri : resultt) {
		
		carrinhoo = (Carrinho) carri;
		
		valorTotalProdutos += carrinhoo.getQuantidade_selecionada() * carrinhoo.getPrecoUnico();
	}
%>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0,maximum-scale=1">

<title>Ecommerce Video Game | Cart</title>

<!-- Loading third party fonts -->
<link href="http://fonts.googleapis.com/css?family=Roboto:400,700|"
	rel="stylesheet" type="text/css">
<link href="fonts/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="fonts/lineo-icon/style.css" rel="stylesheet" type="text/css">

<!-- Loading main css file -->
<link rel="stylesheet" href="style.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

</head>


<body>

	<div id="site-content">
		<div id="header"></div>
		<!-- .site-header -->
		<main class="main-content">
			<div class="container">
				<div class="page">
					<a href="home" class="button">+ Adicionar produto</a>
					<table class="cart">
						<thead>
							<tr>
								<th class="product-name">Nome Produto</th>
								<th class="product-price">Preço</th>
								<th class="product-qty">Quantidade</th>
								<th class="product-total">Total</th>
								<th class="action"></th>
							</tr>
						</thead>
						<tbody>
												
							
							
							<%	
								
									List<EntidadeDominio> result = (List<EntidadeDominio>) request.getAttribute("result");
									Carrinho carrinho = new Carrinho();
									int count = 0;
									for (EntidadeDominio carri : result) {
										
										count++;
										
										carrinho = (Carrinho) carri;
										out.print("<tr>");
										out.print("<td class='product-name'>");
										out.print("<div class='product-thumbnail'>");
										out.print("<img src='"+carrinho.getImg()+"' width='90' heigh='90' alt=''>");
										out.print("</div>");
										out.print("<div class='product-detail'>");
										out.print("<h3 class='product-title'>"+carrinho.getNome_produto()+"</h3>");
										out.print("<p>"+carrinho.getDescricao_produto()+"</p>");
										out.print("</div>");
										out.print("</td>");
										out.print("<td class='product-price'>"+NumberFormat.getCurrencyInstance().format(carrinho.getPrecoUnico())+"</td>");
										out.print("<td class='product-qty'>");
										out.print("<input type='hidden' name='idItemPedido' value='"+carrinho.getIdItemPedido()+"' >");
										out.print("<input type='number' data-cy='qtd"+count+"' id='quantidadeEscolhida"+carrinho.getIdItemPedido()+"'   onkeypress='alterarQuantidadeItemPedidoAjax("+carrinho.getIdItemPedido()+")' min='0' max='"+carrinho.getQuantidade_diponivel()+"' value='"+carrinho.getQuantidade_selecionada()+"' >");
										out.print("</td>");
										out.print("<td class='product-total'>"+NumberFormat.getCurrencyInstance().format(carrinho.getPrecoUnico()*carrinho.getQuantidade_selecionada())+"</td>");
										out.print("<td class='action'><a href='#' onclick='excluirQuantidadeItemPedidoAjax("+carrinho.getIdItemPedido()+")'><i class='fa fa-times' style='font-size:25px'></i></a></td>");
										out.print("</tr>");
									}
							%>
							
							
							
						</tbody>
					</table>
					<!-- .cart -->
					
					<div class="cart-total" style="margin-left:10px" >
						<p>
							<h2>Total do Carrinho</h2>
						</p>
						<p>
							<strong>Subtotal: </strong> <% out.print(NumberFormat.getCurrencyInstance().format(valorTotalProdutos)); %>
						</p>
						
						<p class="total">
							<strong>Total</strong><span class="num" id="valorTotal"><% out.print(NumberFormat.getCurrencyInstance().format(valorTotalProdutos)); %></span>
						</p>
						<p>
						 <a href="fecharPedido" class="button">Finalizar pedido</a>
						</p>
					</div>
					
<!-- 					<div class="cart-total" style="margin-left:10px"> -->
<!-- 						<p> -->
<!-- 							<h2>Prazo de entrega + impostos</h2> -->
<!-- 						</p> -->
<!-- 						<p> -->
<!-- 							<strong>Insira seu endereço para ter um prazo estimado de entrega</strong> -->
<!-- 						</p> -->
<!-- 						<p> -->
<!-- 							<strong>Estado</strong> -->
<!-- 						</p> -->
<!-- 						<select data-cy="txtStateHome" id="txtStateHome" name="txtStateHome"  -->
<!-- 											class="form-control reduced-input" required> -->
											

<!-- 											<option value="1">Acre</option> -->

<!-- 											<option value="2">Alagoas</option> -->

<!-- 											<option value="3">Amapá</option> -->

<!-- 											<option value="4">Amazonas</option> -->

<!-- 											<option value="5" >Bahia</option> -->

<!-- 											<option value="6">Ceará</option> -->

<!-- 											<option value="7">Espírito Santo</option> -->

<!-- 											<option value="8">Goiás</option> -->

<!-- 											<option value="9">Maranhão</option> -->

<!-- 											<option value="10">Mato Grosso</option> -->

<!-- 											<option value="11">Mato Grosso do Sul</option> -->

<!-- 											<option value="12">Minas Gerais</option> -->

<!-- 											<option value="13">Pará</option> -->

<!-- 											<option value="14">Paraíba</option> -->

<!-- 											<option value="15">Paraná</option> -->

<!-- 											<option value="16">Pernambuco</option> -->

<!-- 											<option value="17">Piauí</option> -->

<!-- 											<option value="18">Rio de Janeiro</option> -->

<!-- 											<option value="19">Rio Grande do Norte</option> -->

<!-- 											<option value="20">Rio Grande do Sul</option> -->

<!-- 											<option value="21">Rondônia</option> -->

<!-- 											<option value="22">Roraima</option> -->

<!-- 											<option value="23">Santa Catarina</option> -->

<!-- 											<option value="24">São Paulo</option> -->

<!-- 											<option value="25">Sergipe</option> -->

<!-- 											<option value="26">Tocantins</option> -->

<!-- 											<option value="27">Distrito Federal</option> -->

<!-- 										</select> -->
<!-- 						<p> -->
<!-- 						<br> -->
<!-- 							<strong>CEP</strong> -->
<!-- 						</p> -->
<!-- 						<p><input type="text" class="form-control reduced-input" ></p> -->
						
<!-- 						<p> -->
<!-- 						 <a href="#cupomDePagamento" class="button" onclick="calcularFrete()">Simular Prazo</a> -->
<!-- 						</p> -->
<!-- 					</div> -->
					

<!-- 					<div class="cart-total" id="cupomDePagamento" style="margin-left:10px"> -->
<!-- 						<p> -->
<!-- 							<h2>Cupom de desconto</h2> -->
<!-- 						</p> -->
<!-- 						<p> -->
<!-- 							<strong>Insira o código do Cupom</strong> -->
<!-- 						</p> -->
<!-- 						<p><input type="text" id="myInput" placeholder="Adicionar Cupom" class="form-control reduced-input" > -->
<!-- 						<a href="#cupomDePagamento" onclick="newElement()" class="addBtn button" >Aplicar Cupom</a> -->
<!-- 						</p> -->
						
						
						 
						
<!-- 						<ul id="myUL"> -->
  
<!-- 						</ul> -->
<!-- 					</div> -->
					<!-- .cart-total -->

				</div>
			</div>
			<!-- .container -->
		</main>
		<!-- .main-content -->

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

	<script src="js/jquery-1.11.1.min.js"></script>
	<script src="js/plugins.js"></script>
	<script>
		$("#header").load("header.jsp");
		$("#footer").load("footer.html");
	</script>
	<script>
// 		// Create a "close" button and append it to each list item
// 		var myNodelist = document.getElementsByTagName("LI");
// 		var i;
// 		for (i = 0; i < myNodelist.length; i++) {
// 		  var span = document.createElement("SPAN");
// 		  var txt = document.createTextNode("\u00D7");
// 		  span.className = "close";
// 		  span.appendChild(txt);
// 		  myNodelist[i].appendChild(span);
// 		}
		
// 		// Click on a close button to hide the current list item
// 		var close = document.getElementsByClassName("close");
// 		var i;
// 		for (i = 0; i < close.length; i++) {
// 		  close[i].onclick = function() {
// 		    var div = this.parentElement;
// 		    div.style.display = "none";
// 		  }
// 		}
		
// 		// Add a "checked" symbol when clicking on a list item
// 		var list = document.querySelector('ul');
// 		list.addEventListener('click', function(ev) {
// 		  if (ev.target.tagName === 'LI') {
// 		    ev.target.classList.toggle('checked');
// 		  }
// 		}, false);


		function calcularFrete() {
			/*valorFrete*/
			 
			 var valorTAGfrete = 30;
			 $("#valorFrete").text("R$"+valorTAGfrete+".00");
			 /*valorFrete*/
			
			/*valor total*/
			 let valorTagtotal = $("#valorTotal").text();
			 valorTagtotal = valorTagtotal.replace("R$", "");
			 valorTagtotal = valorTagtotal.replace(".00", "");
			 var valorTotal = valorTagtotal-30;
			 $("#valorTotal").text("R$"+valorTotal+".00");
			 /*valor total*/
		}
		
		// Create a new list item when clicking on the "Add" button
		function newElement() {
		  var li = document.createElement("li");
		  var inputValue = document.getElementById("myInput").value;
		  var t = document.createTextNode(inputValue);
		  li.appendChild(t);
		  if (inputValue === '') {
		    alert("Atenção insira um nome de cupom!");
		  } else {
		    document.getElementById("myUL").appendChild(li);
		    /*desconto cupom*/ 
	 		 let campoCupom = inputValue
	 		 campoCupom = campoCupom.replace("cupom", "");
			 var valorCupom = parseInt(campoCupom)	
	 		 let conteudoTagValorDesconto = $("#valorDescontoCupom").text();
			 conteudoTagValorDesconto = conteudoTagValorDesconto.replace("R$", "");
			 conteudoTagValorDesconto = conteudoTagValorDesconto.replace(".00", "");
			 var tagCupom = parseInt(conteudoTagValorDesconto);
			 var valorDesconto = tagCupom+valorCupom;
			 $("#valorDescontoCupom").text("R$"+valorDesconto+".00");
			 /*desconto cupom*/
			 
			 
			 /*valor total*/
			 let valorTagtotal = $("#valorTotal").text();
			 valorTagtotal = valorTagtotal.replace("R$", "");
			 valorTagtotal = valorTagtotal.replace(".00", "");
			 var valorTotal = valorTagtotal-valorDesconto;
			 $("#valorTotal").text("R$"+valorTotal+".00");
			 /*valor total*/
		  }
 		  document.getElementById("myInput").value = "";
 		  
 		  
 		 
		 
		 
		 
		 
		 
		 
// 		  var span = document.createElement("SPAN");
// 		  var txt = document.createTextNode("\u00D7");
// 		  span.className = "close";
// 		  span.appendChild(txt);
// 		  li.appendChild(span);
		
// 		  for (i = 0; i < close.length; i++) {
// 		    close[i].onclick = function() {
// 		      var div = this.parentElement;
// 		      div.style.display = "none";
// 		    }
// 		  }
		}
		
		
		
		
		
		
		
		
		
		
		
		function alterarQuantidadeItemPedidoAjax(idItemPedido) {
			
 			var quantidadeEscolhidaItem = document.getElementById('quantidadeEscolhida'+idItemPedido).value;
 			
 			$.ajax({
 				url : "/ecommerce-video-game-projeto-less/alterarQuantidadeCarrinho",
 				type : "POST",
 				
				data: {
					'ajax':'true',
					'idItemPedido':idItemPedido,
					'quantidadeEscolhidaItem':quantidadeEscolhidaItem,
				},
 				success : function(e) {	
 					execucao_alerta_carrinho();
 					
 					
 				},
 				error: function(e) {
 					alert('erro');
 	            }  
 			});
 		}
		
		
		
		
		
		
		
		
		
		
		
		function excluirQuantidadeItemPedidoAjax(idItemPedido) {
			
 			
 			
 			$.ajax({
 				url : "/ecommerce-video-game-projeto-less/exluirQuantidadeCarrinho",
 				type : "POST",
 				
				data: {
					'ajax':'true',
					'idItemPedido':idItemPedido,
					
				},
 				success : function(e) {	
 					execucao_alerta_carrinho();
 					
 					
 				},
 				error: function(e) {
 					alert('erro');
 	            }  
 			});
 		}
		</script>


</body>

</html>