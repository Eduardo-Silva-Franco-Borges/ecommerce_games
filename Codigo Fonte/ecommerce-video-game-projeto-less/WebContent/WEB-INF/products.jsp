<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%@page import="br.com.projetoles.domain.EntidadeDominio"%>
<%@page import="br.com.projetoles.domain.Result"%>
<%@page import="br.com.projetoles.domain.Carrinho"%>
<%@page import="br.com.projetoles.domain.Pedido"%>
<%@page import="br.com.projetoles.domain.ItemPedido"%>
<%@page import="br.com.projetoles.domain.Prestacao"%>
<%@page import="br.com.projetoles.domain.Produto"%>
<%@page import="java.text.NumberFormat"%>
    
<%@page import="javax.servlet.http.Cookie"%>
<%@page import="java.util.List"%>
<%@page import="br.com.projetoles.util.DateUtil"%>


<% 



%>
	
	
	
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0,maximum-scale=1">

<title>Gestão de produtos</title>

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
				
<script type="text/javascript">
	function modalEditarProduto(nome,descricao,categoria,fabricante,forncedor,grupoPrecificacao,codBarras,foto,status,id,preco,quantidade) {
		
		$('#modalEditarProduto #txtNomeProduto').val(nome);
		$('#modalEditarProduto #txtDescricao').val(descricao);
		$('#modalEditarProduto #txtCategoria').val(categoria);
		$('#modalEditarProduto #txtFabricante').val(fabricante);
		$('#modalEditarProduto #txtfornecedor').val(forncedor);
		$('#modalEditarProduto #txtGrupoPrecificacao').val(grupoPrecificacao);
		$('#modalEditarProduto #txtCodigoBarras').val(codBarras);
		$('#modalEditarProduto #txtFotoProduto').val(foto);
		$('#modalEditarProduto #txtStatusProduto').val(status);
		$('#modalEditarProduto #txtIdProduto').val(id);
		$('#modalEditarProduto #txtPreco').val(preco);
		$('#modalEditarProduto #txtQuantidade').val(quantidade);
		
		$('#modalEditarProduto').modal('show');
	}
</script>

<script type="text/javascript">
	function modalAtivarProduto(idProduto) {
		
		$('#modalAtivarProduto #txtIdProduto').val(idProduto);
		
		
		$('#modalAtivarProduto').modal('show');
	}
</script>

<script type="text/javascript">
	function modalInativarProduto(idProduto) {
		
		$('#modalInativarProduto #txtIdProduto').val(idProduto);
		
		$('#modalInativarProduto').modal('show');
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
				<form method="post" action="produtosSalvar">
				
				<div class="row">
					<div class="col-md-4">
						<label class="reduced-input-label" for="txtNomeProduto">Nome Produto</label> <input type="text" class="form-control reduced-input"
							id="txtNomeProduto" name="txtNomeProduto" required>
					</div>
					<div class="col-md-4">
						<label class="reduced-input-label" for="txtDescricao">Descrição
							</label> <input type="text" class="form-control reduced-input"
							id="txtDescricao" name="txtDescricao" required>
					</div>
					<div class="col-md-4">
						<label class="reduced-input-label" for="txtCategoria">Categoria
							</label> <select id="txtCategoria" name="txtCategoria"
							class="form-control reduced-input">
								<option value=""></option>
								<option value="1">Playstation</option>
								<option value="2">Xbox</option>
								<option value="3">Nintendo</option>
								
						</select>
					</div>
				</div>
				<br>
				<div class="row">
					<div class="col-md-4">
						<label class="reduced-input-label" for="txtDtInicio">Fabricante
							</label> <input type="text" class="form-control reduced-input"
							id="txtFabricante" name="txtFabricante" required>
					</div>
					<div class="col-md-4">
						<label class="reduced-input-label" for="txtfornecedor">Fornecedor
							</label> <input type="text" class="form-control reduced-input"
							id="txtfornecedor" name="txtfornecedor" required>
					</div>
					<div class="col-md-4">
						<label class="reduced-input-label" for="txtGrupoPrecificacao">Grupo Precificação
							</label> <select id="txtGrupoPrecificacao" name="txtGrupoPrecificacao"
							class="form-control reduced-input">
								<option value=""></option>
								<option value="Grupo A">Grupo A</option>
								<option value="Grupo B">Grupo B</option>
								<option value="Grupo C">Grupo C</option>
								
						</select>
					</div>
				</div>
				<br>
				<div class="row">
					
					<div class="col-md-6">
						<label class="reduced-input-label" for="txtCodigoBarras">Código de Barras
							</label> 
							<input type="text" class="form-control reduced-input"
							id="txtCodigoBarras" name="txtCodigoBarras" required>
					</div>
					<div class="col-md-6">
						<label class="reduced-input-label" for="txtFotoProduto">Foto Produto
							</label> 
							<input type="text" class="form-control reduced-input"
							id="txtFotoProduto" name="txtFotoProduto" required>
					</div>
				</div>
				<br>
				
				<div class="row">
					
					<div class="col-md-6">
						<label class="reduced-input-label" for="txtQuantidade">Quantidade
							</label> 
							<input type="number" class="form-control reduced-input"
							id="txtQuantidade" name="txtQuantidade" required>
					</div>
					<div class="col-md-6">
						<label class="reduced-input-label" for="txtPreco">Preço
							</label> 
							<input type="number" class="form-control reduced-input"
							id="txtPreco" name="txtPreco" required>
					</div>
				</div>
				<br>
				<br>
				<div class="row">
					
					<div class="col-md-6">
						<button type="submit" class="btn btn-primary" >Adicionar</button>
					</div>
					
				</div>
				
				</form>
				
				<br>
				<br>
				<div class="row">
					<div class="col-md-12">
						<h1>Produtos</h1>
					</div>
				</div>
				
				<table class="table table-striped">
							<thead>
								<tr>
									
									<th>&nbsp;</th>
									<th>Nome</th>
									<th>Descrição</th>
									<th>Categoria</th>
									<th>Status</th>
									<th>&nbsp;</th>
									<th>&nbsp;</th>
								</tr>
							</thead>
							<tbody>
								
								<%	
									
									List<EntidadeDominio> prods = (List<EntidadeDominio>) request.getAttribute("produtos");
									
									
									Produto produto = new Produto();
									
									for (EntidadeDominio p : prods) {
																			
										produto = (Produto) p;
										out.print("<tr>");
											out.print("<td style='width: 10px;'><img src='"+produto.getImg()+"'  style='width: 80px;height: 90px;'  alt='Game 1'></td>");
											
											out.print("<td>"+produto.getNome()+"</td>");
											out.print("<td>"+produto.getDescricao()+"</td>");
											if(produto.getIdCategoriaProduto().equals("1"))out.print("<td>Playstation</td>");
											if(produto.getIdCategoriaProduto().equals("2"))out.print("<td>Xbox</td>");
											if(produto.getIdCategoriaProduto().equals("3"))out.print("<td>Nintendo</td>");
											
											if(produto.getAtivo().equals("1"))out.print("<td>Ativo</td>");
											if(produto.getAtivo().equals("0"))out.print("<td>Inativo</td>");
											out.print("<td style='width: 1px;'><buttom onclick=");
											out.print('"');
											out.print("	modalEditarProduto(");
											out.print("'"+produto.getNome()+"'");
											out.print(",");
											out.print("'"+produto.getDescricao()+"'");
											out.print(",");
											out.print("'"+produto.getIdCategoriaProduto()+"'");
											out.print(",");
											out.print("'"+produto.getFabricante()+"'");
											out.print(",");
											out.print("'"+produto.getFornecedor()+"'");
											out.print(",");
											out.print("'"+produto.getGrupoPrecificacao()+"'");
											out.print(",");
											out.print("'"+produto.getCodBarras()+"'");
											out.print(",");
											out.print("'"+produto.getImg()+"'");
											out.print(",");
											out.print("'"+produto.getAtivo()+"'");
											out.print(",");
											out.print("'"+produto.getIdProduto()+"'");
											out.print(",");
											out.print("'"+produto.getPrecoCusto()+"'");
											out.print(",");
											out.print("'"+produto.getQuantidade()+"'");
											
											out.print("	)");
											out.print('"');
											out.print("class='btn btn-info'>Editar</button></td>");
											if(produto.getAtivo().equals("1")){
												out.print("<td style='width: 1px;'><buttom onclick='modalInativarProduto("+produto.getIdProduto()+")' class='btn btn-warning'>Inativar</button></td>");
											}
											if(produto.getAtivo().equals("0")){
												out.print("<td style='width: 1px;'><buttom onclick='modalAtivarProduto("+produto.getIdProduto()+")' class='btn btn-warning'>Ativar</button></td>");
											}
											
											
											
											
											
										out.print("</tr>");
									}
									
								%>

							</tbody>
						</table>
				
				
				
				
				</div>
				</div>
				<br>
				
				
				
				
				
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
	
	
	
	
	<div class="modal fade" id="modalEditarProduto" role="dialog">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
<!-- 					<button type="button" class="close" data-dismiss="modal">&times;</button> -->
					<div class="row">
						<div class="col-md-8"><h1 class="modal-title">Visualizar Produto</h1></div>
						
						
						</div>
					
				</div>
				<div class="modal-body">
					
					<form method="post" action="produtosAtualizar">
				
						<div class="row">
							<div class="col-md-4">
								<label class="reduced-input-label" for="txtNomeProduto">Nome Produto</label> <input type="text" class="form-control reduced-input"
									id="txtNomeProduto" name="txtNomeProduto" required>
							</div>
							<div class="col-md-4">
								<label class="reduced-input-label" for="txtDescricao">Descrição
									</label> <input type="text" class="form-control reduced-input"
									id="txtDescricao" name="txtDescricao" required>
							</div>
							<div class="col-md-4">
								<label class="reduced-input-label" for="txtCategoria">Categoria
									</label> <select id="txtCategoria" name="txtCategoria"
									class="form-control reduced-input">
										<option value=""></option>
										<option value="1">Playstation</option>
										<option value="2">Xbox</option>
										<option value="3">Nintendo</option>
										
								</select>
							</div>
						</div>
						<br>
						<div class="row">
							<div class="col-md-4">
								<label class="reduced-input-label" for="txtFabricante">Fabricante
									</label> <input type="text" class="form-control reduced-input"
									id="txtFabricante" name="txtFabricante" required>
							</div>
							<div class="col-md-4">
								<label class="reduced-input-label" for="txtfornecedor">Fornecedor
									</label> <input type="text" class="form-control reduced-input"
									id="txtfornecedor" name="txtfornecedor" required>
							</div>
							<div class="col-md-4">
								<label class="reduced-input-label" for="txtGrupoPrecificacao">Grupo Precificação
									</label> <select id="txtGrupoPrecificacao" name="txtGrupoPrecificacao"
									class="form-control reduced-input">
										<option value=""></option>
										<option value="Grupo A">Grupo A</option>
										<option value="Grupo B">Grupo B</option>
										<option value="Grupo C">Grupo C</option>
										
								</select>
							</div>
						</div>
						<br>
						<div class="row">
							
							<div class="col-md-6">
								<label class="reduced-input-label" for="txtCodigoBarras">Código de Barras
									</label> 
									<input type="text" class="form-control reduced-input"
									id="txtCodigoBarras" name="txtCodigoBarras" required>
							</div>
							<div class="col-md-4">
								<label class="reduced-input-label" for="txtFotoProduto">Foto Produto
									</label> 
									<input type="text" class="form-control reduced-input"
									id="txtFotoProduto" name="txtFotoProduto" required>
							</div>
							<div class="col-md-2">
								<label class="reduced-input-label" for="txtStatusProduto">Status
									</label> 
									<select readonly id="txtStatusProduto" name="txtStatusProduto"
									class="form-control reduced-input">
										
										
										<option value="1">Ativo</option>
										<option value="0">Inativo</option>
										
								</select>
							</div>
							<input type="hidden" class="form-control reduced-input"
									id="txtIdProduto" name="txtIdProduto" >
						</div>
					<br>
					<div class="row">
					
						<div class="col-md-6">
							<label class="reduced-input-label" for="txtQuantidade">Quantidade
								</label> 
								<input type="number" class="form-control reduced-input"
								id="txtQuantidade" name="txtQuantidade" required>
						</div>
						<div class="col-md-6">
							<label class="reduced-input-label" for="txtPreco">Preço
								</label> 
								<input type="number" class="form-control reduced-input"
								id="txtPreco" name="txtPreco" required>
						</div>
					</div>
						<br>
						<br>
						<div class="row">
							
							<div class="col-md-6">
								<button type="submit" class="btn btn-primary" >Salvar</button>
							</div>
							
						</div>
						
						</form>
					
				</div>
				
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="modalAtivarProduto" role="dialog">
		<div class="modal-dialog modal-md">
			<div class="modal-content">
				<div class="modal-header">
<!-- 					<button type="button" class="close" data-dismiss="modal">&times;</button> -->
					<div class="row">
						<div class="col-md-12"><h1 class="modal-title">Ativar Produto</h1></div>
						
						
						</div>
					
				</div>
				<div class="modal-body">
					
					<form method="post" action="produtosAtivar">
				
						<div class="row">
							<div class="col-md-12">
								<label class="reduced-input-label" for="txtMotivo">Digite o motivo para ativar</label> <input type="text" class="form-control reduced-input"
									id="txtMotivo" name="txtMotivo" required>
							</div>
							
						</div>
						
						<div class="row">
							
							
							<input type="hidden" class="form-control reduced-input"
									id="txtIdProduto" name="txtIdProduto" >
									
						</div>
					<br>
					
						<br>
						<br>
						<div class="row">
							
							<div class="col-md-6">
								<button type="submit" class="btn btn-primary" >Salvar</button>
							</div>
							
						</div>
						
						</form>
					
				</div>
				
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="modalInativarProduto" role="dialog">
		<div class="modal-dialog modal-md">
			<div class="modal-content">
				<div class="modal-header">
<!-- 					<button type="button" class="close" data-dismiss="modal">&times;</button> -->
					<div class="row">
						<div class="col-md-12"><h1 class="modal-title">Inativar Produto</h1></div>
						
						
						</div>
					
				</div>
				<div class="modal-body">
					
					<form method="post" action="produtosInativar">
				
						<div class="row">
							<div class="col-md-12">
								<label class="reduced-input-label" for="txtMotivo">Digite o motivo para inativar</label> <input type="text" class="form-control reduced-input"
									id="txtMotivo" name="txtMotivo" required>
							</div>
							
						</div>
						
						<div class="row">
							
							
							<input type="hidden" class="form-control reduced-input"
									id="txtIdProduto" name="txtIdProduto" >
									
						</div>
					<br>
					
						<br>
						<br>
						<div class="row">
							
							<div class="col-md-6">
								<button type="submit" class="btn btn-primary" >Salvar</button>
							</div>
							
						</div>
						
						</form>
					
				</div>
				
			</div>
		</div>
	</div>
	
	
	
	
	
	
	
	<!-- .auth-popup -->

<!-- 	<script src="js/jquery-1.11.1.min.js"></script> -->
<!-- 	<script src="js/plugins.js"></script> -->
	<script>
		$("#header").load("header.jsp");
		$("#footer").load("footer.html");
	</script>


	
	

</body>

</html>