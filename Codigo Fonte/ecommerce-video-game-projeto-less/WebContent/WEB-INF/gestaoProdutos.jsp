<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0,maximum-scale=1">

<title>Gestão de Produtos</title>

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
	function modalVerProduto() {
		
		
		$('#modalVerProduto').modal('show');
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
						<h1>Gestão de Produtos</h1>
					</div>
				</div>
				<br>
				
				<div class="row">

					<div class="col-md-4">
						<label class="reduced-input-label" for="txtNomeProduto">Nome do Produto
						</label> <input type="text" class="form-control reduced-input"
							id="txtNomeProduto" name="txtNomeProduto">
					</div>
					<div class="col-md-4">
						<label class="reduced-input-label" for="txtDescricaoProduto">Descrição do Produto
						</label> <input type="text" class="form-control reduced-input"
							id="txtDescricaoProduto" name="txtDescricaoProduto">
					</div>
					<div class="col-md-4">
						<label class="reduced-input-label" for="txtCategoriaProduto">Categoria Produto
						</label> <select id="txtCategoriaProduto" name="txtCategoriaProduto"
							class="form-control reduced-input">
							<option value=""></option>
							<option value="Jogos_Playstation">Jogos Playstation</option>
							<option value="Jogos_XBOX">Jogos XBOX</option>
							<option value="Jogos_Nintendo">Jogos Nintendo</option>
						</select>
					</div>
				</div>
				<br>
				<div class="row">

					<div class="col-md-4">
						<label class="reduced-input-label" for="txtQtdProduto">Quantidade em Estoque
						</label> <input type="number" class="form-control reduced-input"
							id="txtQtdProduto" name="txtQtdProduto">
					</div>
					<div class="col-md-4">
						<label class="reduced-input-label" for="txtValorProduto">Valor unitário
						</label> <input type="number" class="form-control reduced-input"
							id="txtValorProduto" name="txtValorProduto">
					</div>
					<div class="col-md-4">
						<label class="reduced-input-label" for="txtCodigoProduto">Código produto
						</label> <input type="text" class="form-control reduced-input"
							id="txtCodigoProduto" name="txtCodigoProduto">
					</div>
				</div>
				
				<br>
				<div class="row">
					<div class="col-md-4">
					<input type="submit" class="btn btn-primary py-3 px-3"
					id="operacao" name="operacao" value="Salvar">
					<input type="submit" class="btn btn-primary py-3 px-3"
					id="operacao" name="operacao" value="Limpar">
					</div>
				</div>
				<br>
				<br>
				<br>
				<br>
				
				
				<table class="table table-hover">
							<thead>
								<tr>
									<th>Código</th>
									<th>Nome Produto</th>
									<th>Categoria</th>
									<th>Valor</th>
									<th>Ações</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>8546698</td>
									<td>Far Cry 5</td>
									<td>Jogo Playstation</td>
									<td>R$ 100,00</td>
									<td><button type='button' class = 'btn btn-primary' onclick='modalVerProduto()' ><i class="fa fa-pencil" title="Ver Produto"></i></button>&nbsp;<button type='button' class = 'btn btn-danger'  ><i class="fa fa-times" title="Excluir Produto"></i></button></td>
								</tr>
								<tr>
									<td>8695744</td>
									<td>FIFA 2021</td>
									<td>Jogo Xbox</td>
									<td>R$ 200,00</td>
									<td><button type='button' class = 'btn btn-primary' onclick='modalVerProduto()' ><i class="fa fa-pencil" title="Ver Produto"></i></button>&nbsp;<button type='button' class = 'btn btn-danger'  ><i class="fa fa-times" title="Excluir Produto"></i></button></td>
								</tr>
								<tr>
									<td>9655458</td>
									<td>Super Mario Bros</td>
									<td>Jogo Nintendo</td>
									<td>R$ 50,00</td>
									<td><button type='button' class = 'btn btn-primary' onclick='modalVerProduto()' ><i class="fa fa-pencil" title="Ver Produto"></i></button>&nbsp;<button type='button' class = 'btn btn-danger'  ><i class="fa fa-times" title="Excluir Produto"></i></button></td>
								</tr>

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
	
	
	
	
	
	
	
	
	<div class="modal fade" id="modalVerProduto" role="dialog">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
<!-- 					<button type="button" class="close" data-dismiss="modal">&times;</button> -->
					<h1 class="modal-title">Visualizar Produto</h1>
				</div>
				<div class="modal-body">
					
					<div class="row">

					<div class="col-md-4">
						<label class="reduced-input-label" for="txtNomeProduto">Nome do Produto
						</label> <input type="text" class="form-control reduced-input"
							id="txtNomeProduto" name="txtNomeProduto" value="Far Cry 5">
					</div>
					<div class="col-md-4">
						<label class="reduced-input-label" for="txtDescricaoProduto">Descrição do Produto
						</label> <input type="text" class="form-control reduced-input"
							id="txtDescricaoProduto" name="txtDescricaoProduto" value="Jogo de tiro">
					</div>
					<div class="col-md-4">
						<label class="reduced-input-label" for="txtCategoriaProduto">Categoria Produto
						</label> <select id="txtCategoriaProduto" name="txtCategoriaProduto"
							class="form-control reduced-input">
							<option value=""></option>
							<option selected value="Jogos_Playstation">Jogos Playstation</option>
							<option value="Jogos_XBOX">Jogos XBOX</option>
							<option value="Jogos_Nintendo">Jogos Nintendo</option>
						</select>
					</div>
				</div>
				<br>
				<div class="row">

					<div class="col-md-4">
						<label class="reduced-input-label" for="txtQtdProduto">Quantidade em Estoque
						</label> <input type="number" class="form-control reduced-input"
							id="txtQtdProduto" name="txtQtdProduto" value="5">
					</div>
					<div class="col-md-4">
						<label class="reduced-input-label" for="txtValorProduto">Valor unitário
						</label> <input type="number" class="form-control reduced-input"
							id="txtValorProduto" name="txtValorProduto" value="100.00">
					</div>
					<div class="col-md-4">
						<label class="reduced-input-label" for="txtCodigoProduto">Código produto
						</label> <input type="text" class="form-control reduced-input"
							id="txtCodigoProduto" name="txtCodigoProduto" value="45685585">
					</div>
				</div>
				
				<br>
				<div class="row">
					<div class="col-md-4">
					<input type="submit" class="btn btn-primary py-3 px-3"
					id="operacao" name="operacao" value="Salvar">
					<input type="submit" class="btn btn-primary py-3 px-3"
					id="operacao" name="operacao" value="Limpar">
					</div>
				</div>
					
					
				</div>
				
			</div>
		</div>
	</div>
	
	
	
	
	
	
	
	

</body>

</html>