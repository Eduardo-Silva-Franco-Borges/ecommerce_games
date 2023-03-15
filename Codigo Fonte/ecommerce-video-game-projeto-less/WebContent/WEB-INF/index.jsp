<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="br.com.projetoles.domain.EntidadeDominio"%>
<%@page import="br.com.projetoles.domain.Result"%>
<%@page import="br.com.projetoles.domain.Produto"%>
<%@page import="java.text.NumberFormat"%>
    
<%@page import="javax.servlet.http.Cookie"%>
<%@page import="java.util.List"%>


  
   
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1">
		
		<title>Ecommerce Video Game</title>

		<!-- Loading third party fonts -->
		<link href="http://fonts.googleapis.com/css?family=Roboto:100,300,400,700|" rel="stylesheet" type="text/css">
		<link href="fonts/font-awesome.min.css" rel="stylesheet" type="text/css">
		<link href="fonts/lineo-icon/style.css" rel="stylesheet" type="text/css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
		  
		

		<!-- Loading main css file -->
		<link rel="stylesheet" href="style.css">
		
		

	</head>


	<body class="slider-collapse">
		
		
		<div id="site-content">
			<div id="header"></div>
			


			<main class="main-content">
				<div class="container">
					<div class="page">
					<div class="row">
						<div class="col-md-10">
							<input type="text"  class="form-control reduced-input" placeholder="Pesquise um produto">
						</div>
						<div class="col-md-2" >
							<button type="button" class="btn btn-primary py-3 px-3"
										id="operacao" name="operacao" value="Salvar" >Buscar</button>
						</div>
					</div>
						
						
						
						<section>
							<header>
								<h2 class="section-title">Produtos</h2>
								
							</header>

							
								

								
							<div class="product-list">
							
							

							<%	
								
									List<EntidadeDominio> result = (List<EntidadeDominio>) request.getAttribute("result");
									Produto produto = new Produto();
									
									for (EntidadeDominio prod : result) {
										
										produto = (Produto) prod;
										
// 										
										out.print("<div class='product'>");
										out.print("<div class='inner-product'>");
										out.print("<div class='figure-image'>");
										out.print("<a href=''><img src='"+produto.getImg()+"'  style='width: 290px;height: 300px;'  alt='Game 1'></a>");
										out.print("</div>");
										out.print("<h3 class='product-title'><a href='#'>"+produto.getNome()+"</a></h3>");
										out.print("<small class='price'>"+NumberFormat.getCurrencyInstance().format(produto.getPrecoCusto())+"</small>");
										out.print("<p>"+produto.getDescricao()+"</p>");
										if(produto.getAtivo().equals("1")){
										out.print("<form action='AdicionaItemCarrinho' method='post'>");
									    out.print("<span>Quantidade: </span>");
										out.print("<input type='hidden' name='idProduto' value='"+produto.getIdProduto()+"' >");
										out.print("<input type='hidden' name='valorProduto' value='"+produto.getPrecoCusto()+"' >");
										out.print("<input  required type='number' name='quantidade' style='padding-bottom:5px;padding-top:5px' min='0' max='"+produto.getQuantidade()+"'min='0' max='"+produto.getQuantidade()+"'  >");
										out.print("<br>");
										out.print("<br>");
										out.print("<button class='button' type='submit' onclick='addCarrinho()'>Adicionar ao carrinho</button>");
										out.print("</form>");
										}else{
											out.print("<span>Quantidade: </span>");
											out.print("<input type='hidden' name='idProduto' value='"+produto.getIdProduto()+"' >");
											out.print("<input type='hidden' name='valorProduto' value='"+produto.getPrecoCusto()+"' >");
											out.print("<input  required readonly type='number' name='quantidade' style='padding-bottom:5px;padding-top:5px' min='0' max='"+produto.getQuantidade()+"'min='0' max='"+produto.getQuantidade()+"'  >");
											out.print("<br>");
											out.print("<br>");
											out.print("<button class='button' type='submit' >Indisponível</button>");
										}
										out.print("</div>");
										out.print("</div>");
// 										
										
									}
									
							%>
										

								
								
							</div>
								

							

						</section>

						
					</div>
				</div> <!-- .container -->
			</main> <!-- .main-content -->

			<div id="footer"></div>

			
		</div>

		<div class="overlay"></div>

		<div class="auth-popup popup">
			<a href="#" class="close"><i class="fa fa-times"></i></a>
			<form action="home" method="post"> <div class="row"><button name="operacao" id="operacao" value="logout" type='submit' class = 'btn btn-primary' ><i class="fa fa-power-off" title="Sair"></i> Sair</button></div></form><br><br>
			<div class="row">
				<div class="col-md-6">
					<h2 class="section-title">Login</h2>
					<form action="home" method="post">
						<input type="text" name="username" id="username" placeholder="Username...">
						<input type="password" name="password" id="password" placeholder="Password...">
						<input type="submit" name="operacao" id="operacao" value="Login">
					</form>
				</div> <!-- .column -->
				<div class="col-md-6">
					<h2 class="section-title">Crie sua conta</h2>
					<form action="usuarioCriacaoLogin" method="post">
						<input type="text" data-cy="username" name="username" id="username" placeholder="Username...">
						<input type="text" data-cy="emailAddress" name="emailAddress" id="emailAddress" placeholder="Email address...">
						<input type="submit" name="operacao" id="operacao" value="Criar">
					</form>
				</div> <!-- .column -->
			</div> <!-- .row -->
		</div> <!-- .auth-popup -->

		<script src="js/jquery-1.11.1.min.js"></script>
		<script src="js/plugins.js"></script>
		

		<script>
			$("#header").load("header.jsp");
			$("#footer").load("footer.html");
		</script>
		
		<script type="text/javascript">
			window.addCarrinho = function(){
				let i = $('#valorCarrinho').text();
				i = i.replace("[", "");
				i = i.replace("]", "");
				var valor = parseInt(i)
				valor++;
				$('#valorCarrinho').text(" ["+valor+"]");
				
	        }
		</script>
		
		
	</body>

</html>