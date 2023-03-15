<%@page import="java.lang.reflect.Array"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1"%>
<%@page import="br.com.projetoles.domain.Pessoa"%>
<%@page import="br.com.projetoles.util.DateUtil"%>
<%@page import="br.com.projetoles.domain.EntidadeDominio"%>
<%@page import="br.com.projetoles.domain.Endereco"%>
<%@page import="br.com.projetoles.domain.Cartao"%>
<%@page import="br.com.projetoles.domain.Result"%>
<%@page import="br.com.projetoles.domain.Cupom"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>

<%@page import="java.text.DateFormat"%>
<%@page import="java.text.ParseException"%>	
<%@page import="java.text.NumberFormat"%>


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
								
Result Resultado = (Result) request.getAttribute("result");
List<EntidadeDominio> pessoasResultado = (List<EntidadeDominio>) Resultado.getEntities();
Pessoa usuarioResultado = new Pessoa();

for (EntidadeDominio pessoaResultado : pessoasResultado) {
	usuarioResultado = (Pessoa) pessoaResultado;
	List<EntidadeDominio> enderecoCompras;
	List<EntidadeDominio> cartaoCompras;
	List<EntidadeDominio> cupons;
	
	
	enderecoCompras = usuarioResultado.getCliente().getEnderecoCompras();
	cartaoCompras = usuarioResultado.getCliente().getCartoes();
	cupons = usuarioResultado.getCliente().getCupons();
	
	StringBuilder tableEnderecoCobranca = new StringBuilder();
	StringBuilder tableEnderecoEntrega = new StringBuilder();
	StringBuilder tableCartao = new StringBuilder();
	StringBuilder tableCupom = new StringBuilder();
	
	tableEnderecoCobranca.append("'");
	tableEnderecoEntrega.append("'");
	tableCartao.append("'");
	tableCupom.append("'");
	
	for (EntidadeDominio enderecos:enderecoCompras) {
		Endereco endereco =  (Endereco) enderecos;
		
		String tipoEnderecoCompra = null;
		
		if(endereco.getTipo_endereco_compra() != null){
			tipoEnderecoCompra = endereco.getTipo_endereco_compra();
			
			if(tipoEnderecoCompra.equals("Cobranca")){
				tableEnderecoCobranca.append("<tr><td>"+endereco.getTipoEndereco().getNome()+"</td><td>"+endereco.getTipoEndereco().getDescricao()+"</td><td>"+endereco.getRua()+"</td><td>"+endereco.getNumero()+"</td><td>"+endereco.getCidade().getDescricao()+"</td></tr>");
			}
			
			if(tipoEnderecoCompra.equals("Entrega")){
				tableEnderecoEntrega.append("<tr><td>"+endereco.getTipoEndereco().getNome()+"</td><td>"+endereco.getTipoEndereco().getDescricao()+"</td><td>"+endereco.getRua()+"</td><td>"+endereco.getNumero()+"</td><td>"+endereco.getCidade().getDescricao()+"</td></tr>");
			}
		}
		
	}
	for (EntidadeDominio cartoes:cartaoCompras) {
		Cartao cartao =  (Cartao) cartoes;
		
		if(cartao.getCodigo_seguranca() != null){
			tableCartao.append("<tr><td>"+cartao.getBandeira_cartao()+"</td><td>"+cartao.getNome_impresso()+"</td><td>"+cartao.getNumero()+"</td></tr>");	
		}
		
	}
	
	for (EntidadeDominio cup :cupons) {
		Cupom cupom =  (Cupom) cup;
		
		
		tableCupom.append("<tr><td>"+cupom.getNomeCupom()+"</td><td>"+NumberFormat.getCurrencyInstance().format(cupom.getValor())+"</td></tr>");	
		
		
	}
	
	tableEnderecoCobranca.append("'");
	tableEnderecoEntrega.append("'");
	tableCartao.append("'");
	tableCupom.append("'");
	
	usuarioResultado.getCliente().setTableEnderecosCobranca(tableEnderecoCobranca);
	usuarioResultado.getCliente().setTableEnderecosEntrega(tableEnderecoEntrega);
	usuarioResultado.getCliente().setTableCartao(tableCartao);
	usuarioResultado.getCliente().setTableCupons(tableCupom);
		
}

%>
	
	
	
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0,maximum-scale=1">

<title>Clientes</title>

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
	function modalVerClientes(id,end_id,nome,
							  sobrenome,
							  nascimento,
							  genero,
							  tipoDocumento,
							  numeroDocumento,
							  ValidadeDocumento,
							  tipoTelefone,
							  Telefone,
							  TipoCliente,
							  NomeEnderecoResidenccial,
							  TipoResidenciaEnderecoResidenccial,
							  TipoLogradouroEnderecoResidenccial,
							  LogradouroEnderecoResidenccial,
							  NumeroEnderecoResidenccial,
							  CepEnderecoResidenccial,
							  BairroEnderecoResidenccial,
							  PaisEnderecoResidenccial,
							  EstadoEnderecoResidenccial,
							  CidadeEnderecoResidenccial,
							  ObservacaoEnderecoResidenccial, 
							  email,
							  login,
							  senha,
							  confirmacaoSenha,
							  cli_id,
							  tabelaEnderCobranca,
							  tabelaEnderEntrega,tabelaCartao,tabelaCupom) {
		
		
		
		
		$('#txtIdCliente').val(id);
		$('#txtEnd_id').val(end_id);
		$('#txtName').val(nome);
		$('#txtLastName').val(sobrenome);
		$('#txtBirthDate').val(nascimento);
		$('#txtGender').val(genero);
		$('#txtTypeDocument').val(tipoDocumento);
		$('#txtDocument').val(numeroDocumento);
		$('#txtValidadeDocument').val(ValidadeDocumento);
		$('#txtPhoneType').val(tipoTelefone);
		$('#txtPhone').val(Telefone);
		$('#txtTypeClient').val(TipoCliente);
		$('#txtNameEnder').val(NomeEnderecoResidenccial);
		$('#txtResidenceType').val(TipoResidenciaEnderecoResidenccial);
		$('#txtStreetType').val(TipoLogradouroEnderecoResidenccial);
		$('#txtStreetName').val(LogradouroEnderecoResidenccial);
		$('#txtNumber').val(NumeroEnderecoResidenccial);
		$('#txtCep').val(CepEnderecoResidenccial);
		$('#txtNeighnorhood').val(BairroEnderecoResidenccial);
		$('#txtCountryHome').val(PaisEnderecoResidenccial);
		$('#txtStateHome').val(EstadoEnderecoResidenccial);
		$('#txtCity').val(CidadeEnderecoResidenccial);
		$('#txtObservation').val(ObservacaoEnderecoResidenccial);
		
		$('#txtEmail').val(email);
		$('#txtLogin').val(login);
		$('#txtPassword').val(senha);
		$('#txtPasswordConfirmation').val(confirmacaoSenha);
		
		
		
		
		$('#2txtIdCliente').val(id);
		$('#2txtEnd_id').val(end_id);
		$('#2txtName').val(nome);
		$('#2txtLastName').val(sobrenome);
		$('#2txtBirthDate').val(nascimento);
		$('#2txtGender').val(genero);
		$('#2txtTypeDocument').val(tipoDocumento);
		$('#2txtDocument').val(numeroDocumento);
		$('#2txtValidadeDocument').val(ValidadeDocumento);
		$('#2txtPhoneType').val(tipoTelefone);
		$('#2txtPhone').val(Telefone);
		$('#2txtTypeClient').val(TipoCliente);
		$('#2txtNameEnder').val(NomeEnderecoResidenccial);
		$('#2txtResidenceType').val(TipoResidenciaEnderecoResidenccial);
		$('#2txtStreetType').val(TipoLogradouroEnderecoResidenccial);
		$('#2txtStreetName').val(LogradouroEnderecoResidenccial);
		$('#2txtNumber').val(NumeroEnderecoResidenccial);
		$('#2txtCep').val(CepEnderecoResidenccial);
		$('#2txtNeighnorhood').val(BairroEnderecoResidenccial);
		$('#2txtCountryHome').val(PaisEnderecoResidenccial);
		$('#2txtStateHome').val(EstadoEnderecoResidenccial);
		$('#2txtCity').val(CidadeEnderecoResidenccial);
		$('#2txtObservation').val(ObservacaoEnderecoResidenccial);
		
		$('#idClienteEnderecoCobranca').val(id);
		$('#idClienteEnderecoEntrega').val(id);
		$('#idClienteCartao').val(id);
		$('#idClienteCupom').val(id);
		
		
		
		
		$('#txtCliIdBA').val(cli_id);
		$('#txtCliIdDA').val(cli_id);
		$('#txtCliIdCartao').val(cli_id);
		
		
		
		document.getElementById("tabelaEnderecosCobranca").innerHTML = tabelaEnderCobranca;
		document.getElementById("tabelaEnderecosEntrega").innerHTML = tabelaEnderEntrega;
		document.getElementById("tabelaCartaoCompra").innerHTML = tabelaCartao;
		document.getElementById("tabelaCupons").innerHTML = tabelaCupom;
		
		
		
		$('#modalVerClientes').modal('show');
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
					<% if (user.equals("Adm")) { %>
						<h1>Clientes</h1>
					<% } %>
					<% if (user.equals("Cliente")) { %>
						<h1>Meus Dados</h1>
					<% } %>
					</div>
				</div>
				<% if (user.equals("Adm")) { %>
				<br>
				
				<div class="row">
					<div class="col-md-12">
						<h5>*Todos os campos opcionais</h5>
						
					</div>
				</div>
				<div class="row">
				<table id="tabelafiltro" style="width:100%;">
		            <thead>
		                <tr>
		                    <th style="padding-right:50px;padding-left:15px;">
<!-- 		                    	<div class="col-md-12"> -->
									<label  class="reduced-input-label" for="txtNomeCliente">Nome</label> 
										<input data-cy="nomeFiltroCliente" type="text" class="form-control reduced-input"
										id="txtColuna1" name="txtColuna1" >
<!-- 								</div> -->
		                    </th>
		                    <th style="padding-right:50px;">
<!-- 		                    	<div class="col-md-12"> -->
									<label  class="reduced-input-label" for="txtDocumento">Documento</label>
									<input data-cy="docFiltroCliente" type="text" class="form-control reduced-input"
										id="txtColuna2" name="txtColuna2">
<!-- 								</div> -->
		                    </th>
		                    <th style="padding-right:15px;">
<!-- 		                    	<div class="col-md-12"> -->
									<label class="reduced-input-label" for="txtDocumento">Gênero</label>
									<select id="txtGender" name="txtGender"
										class="form-control reduced-input">
										<option value=""></option>
										<option value="M">Masculino</option>
										<option value="F">Feminino</option>
										<option value="O">Outro</option>
									</select>
<!-- 								</div> -->
		                    </th>
		                    
		                    
		                </tr>  
		            </thead>
		        </table>
								
								
								
				</div>
				<br>
				<div class="row">

					<div class="col-md-6">
						<label class="reduced-input-label" for="txtClienteEmail">E-mail
							</label> <input type="text" class="form-control reduced-input"
							id="txtClienteEmail" name="txtClienteEmail">
					</div>
					<div class="col-md-6">
						<label class="reduced-input-label" for="txtClienteLogin">Login
							</label> <input type="text" class="form-control reduced-input"
							id="txtClienteLogin" name="txtClienteLogin">
					</div>
					
				</div>
				<br>
				<div class="row">
				<div class="col-md-4">
				<input data-cy="pesquisarFitro" type="button" class="btn btn-primary py-3 px-3"
				id="operacao" name="operacao" onclick="mudartabela();" value="Pesquisar">
				<input type="submit" class="btn btn-primary py-3 px-3"
				id="operacao" name="operacao" value="Limpar">
				</div>
				<div class="col-md-8" style="text-align: right;">
				
					<a type="submit" class="btn btn-success py-3 px-3"
						id="operacao" name="operacao" href="usuarioCriacaoLogin">+ Adicionar Novo</a>
				
				</div>
				</div>
				<% } %>
				<br>
				<br>
				<br>
				<br>
				
				
				<table class="table table-hover" id="tabelaClientes">
							<thead>
								<tr>
									<th>Nome</th>
									<th>Documento</th>
									<th>Ranking</th>
									<th>&nbsp;</th>
									
								</tr>
							</thead>
							<tbody>
							
								<%	
								
									Result result = (Result) request.getAttribute("result");
									List<EntidadeDominio> pessoas = (List<EntidadeDominio>) result.getEntities();
									Pessoa usuario = new Pessoa();
									
									if (user.equals("Cliente")) {
// 									for (EntidadeDominio pessoa : pessoas.get(0)) {
										usuario = (Pessoa) pessoas.get(0);
										out.print("<tr>");
											out.print("<td>");
											out.print(usuario.getNome());
											out.print("</td>");
											out.print("<td>");
											out.print(usuario.getCliente().getDocumento().getCodigo());
											out.print("</td>");
											out.print("<td>");
											if(usuario.getCliente().getTipoCliente().getDescricao().equals("1"))
												out.print("Gold");
											if(usuario.getCliente().getTipoCliente().getDescricao().equals("2"))
												out.print("Silver");
											if(usuario.getCliente().getTipoCliente().getDescricao().equals("3"))
												out.print("Black");
											out.print("</td>");
											out.print("<td>");
											out.print("<button type='button' class = 'btn btn-primary' onclick=");
											out.print('"');
											out.print("modalVerClientes(");
											out.print("'"+usuario.getCliente().getId_cli()+"'");
											out.print(",");
											out.print("'"+usuario.getCliente().getEnd_id()+"'");
											out.print(",");
											out.print("'"+usuario.getNome()+"'");
											out.print(",");
											out.print("'"+usuario.getSobrenome()+"'");
											out.print(",");
											out.print("'"+ new DateUtil().getFormatedDate(usuario.getDt_nascimento())+"'");
											out.print(",");
											out.print("'"+usuario.getGenero()+"'");
											out.print(",");
											out.print("'"+usuario.getCliente().getDocumento().getTipoDocumento().getDescricao()+"'");
											out.print(",");
											out.print("'"+usuario.getCliente().getDocumento().getCodigo()+"'");
											out.print(",");
											out.print("'"+ new DateUtil().getFormatedDate(usuario.getCliente().getDocumento().getValidade())+"'");
											out.print(",");
											out.print("'"+usuario.getCliente().getTipoTelefone()+"'");
											out.print(",");
											out.print("'"+usuario.getCliente().getTelefone()+"'");
											out.print(",");
											out.print("'"+usuario.getCliente().getTipoCliente().getDescricao()+"'");
											out.print(",");
											out.print("'"+usuario.getCliente().getEndereco().getTipoEndereco().getNome()+"'");
											out.print(",");
											out.print("'"+usuario.getCliente().getEndereco().getTipoEndereco().getDescricao()+"'");
											out.print(",");
											out.print("'"+usuario.getCliente().getEndereco().getTipoRua()+"'");
											out.print(",");
											out.print("'"+usuario.getCliente().getEndereco().getRua()+"'");
											out.print(",");
											out.print("'"+usuario.getCliente().getEndereco().getNumero()+"'");
											out.print(",");
											out.print("'"+usuario.getCliente().getEndereco().getCep()+"'");
											out.print(",");
											out.print("'"+usuario.getCliente().getEndereco().getBairro()+"'");
											out.print(",");
											out.print("'"+usuario.getCliente().getEndereco().getPais()+"'");
											out.print(",");
											out.print("'"+usuario.getCliente().getEndereco().getCidade().getEstado().getSigla()+"'");
											out.print(",");
											out.print("'"+usuario.getCliente().getEndereco().getCidade().getDescricao()+"'");
											out.print(",");
											out.print("'"+usuario.getCliente().getEndereco().getObs()+"'");
											
											out.print(",");
											out.print("'"+usuario.getCliente().getEmail()+"'");
											out.print(",");
											out.print("'"+usuario.getCliente().getLogin()+"'");
											out.print(",");
											out.print("'"+usuario.getCliente().getSenha()+"'");
											out.print(",");
											out.print("'"+usuario.getCliente().getConfimacaoSenha()+"'");
											out.print(",");
											out.print(usuario.getCliente().getId_cli());
											
											
											out.print(",");
											out.print(usuario.getCliente().getTableEnderecosCobranca());
											out.print(",");
											out.print(usuario.getCliente().getTableEnderecosEntrega());
											out.print(",");
											out.print(usuario.getCliente().getTableCartao());
											out.print(",");
											out.print(usuario.getCliente().getTableCupons());
											
											out.print(")");
											out.print('"');
											out.print(" ><i class='fa fa-pencil' title='Ver Cliente'></i></button>&nbsp;<button onclick='inativacao_alerta(this.parentNode.parentNode.rowIndex)' type='button' class = 'btn btn-danger'  ><i class='fa fa-times' title='Excluir Cliente'></i></button>");
											out.print("</td>");

										out.print("<tr/>");
// 									}
									}else{
										for (EntidadeDominio pessoa : pessoas) {
											usuario = (Pessoa) pessoa;
											out.print("<tr>");
												out.print("<td>");
												out.print(usuario.getNome());
												out.print("</td>");
												out.print("<td>");
												out.print(usuario.getCliente().getDocumento().getCodigo());
												out.print("</td>");
												out.print("<td>");
												if(usuario.getCliente().getTipoCliente().getDescricao().equals("1"))
													out.print("Gold");
												if(usuario.getCliente().getTipoCliente().getDescricao().equals("2"))
													out.print("Silver");
												if(usuario.getCliente().getTipoCliente().getDescricao().equals("3"))
													out.print("Black");
												out.print("</td>");
												out.print("<td>");
												out.print("<button type='button' class = 'btn btn-primary' onclick=");
												out.print('"');
												out.print("modalVerClientes(");
												out.print("'"+usuario.getCliente().getId_cli()+"'");
												out.print(",");
												out.print("'"+usuario.getCliente().getEnd_id()+"'");
												out.print(",");
												out.print("'"+usuario.getNome()+"'");
												out.print(",");
												out.print("'"+usuario.getSobrenome()+"'");
												out.print(",");
												out.print("'"+ new DateUtil().getFormatedDate(usuario.getDt_nascimento())+"'");
												out.print(",");
												out.print("'"+usuario.getGenero()+"'");
												out.print(",");
												out.print("'"+usuario.getCliente().getDocumento().getTipoDocumento().getDescricao()+"'");
												out.print(",");
												out.print("'"+usuario.getCliente().getDocumento().getCodigo()+"'");
												out.print(",");
												out.print("'"+ new DateUtil().getFormatedDate(usuario.getCliente().getDocumento().getValidade())+"'");
												out.print(",");
												out.print("'"+usuario.getCliente().getTipoTelefone()+"'");
												out.print(",");
												out.print("'"+usuario.getCliente().getTelefone()+"'");
												out.print(",");
												out.print("'"+usuario.getCliente().getTipoCliente().getDescricao()+"'");
												out.print(",");
												out.print("'"+usuario.getCliente().getEndereco().getTipoEndereco().getNome()+"'");
												out.print(",");
												out.print("'"+usuario.getCliente().getEndereco().getTipoEndereco().getDescricao()+"'");
												out.print(",");
												out.print("'"+usuario.getCliente().getEndereco().getTipoRua()+"'");
												out.print(",");
												out.print("'"+usuario.getCliente().getEndereco().getRua()+"'");
												out.print(",");
												out.print("'"+usuario.getCliente().getEndereco().getNumero()+"'");
												out.print(",");
												out.print("'"+usuario.getCliente().getEndereco().getCep()+"'");
												out.print(",");
												out.print("'"+usuario.getCliente().getEndereco().getBairro()+"'");
												out.print(",");
												out.print("'"+usuario.getCliente().getEndereco().getPais()+"'");
												out.print(",");
												out.print("'"+usuario.getCliente().getEndereco().getCidade().getEstado().getSigla()+"'");
												out.print(",");
												out.print("'"+usuario.getCliente().getEndereco().getCidade().getDescricao()+"'");
												out.print(",");
												out.print("'"+usuario.getCliente().getEndereco().getObs()+"'");
												
												out.print(",");
												out.print("'"+usuario.getCliente().getEmail()+"'");
												out.print(",");
												out.print("'"+usuario.getCliente().getLogin()+"'");
												out.print(",");
												out.print("'"+usuario.getCliente().getSenha()+"'");
												out.print(",");
												out.print("'"+usuario.getCliente().getConfimacaoSenha()+"'");
												out.print(",");
												out.print(usuario.getCliente().getId_cli());
												
												
												out.print(",");
												out.print(usuario.getCliente().getTableEnderecosCobranca());
												out.print(",");
												out.print(usuario.getCliente().getTableEnderecosEntrega());
												out.print(",");
												out.print(usuario.getCliente().getTableCartao());
												out.print(",");
												out.print(usuario.getCliente().getTableCupons());
												
												out.print(")");
												out.print('"');
												out.print(" ><i class='fa fa-pencil' title='Ver Cliente'></i></button>&nbsp;<button onclick='inativacao_alerta(this.parentNode.parentNode.rowIndex)' type='button' class = 'btn btn-danger'  ><i class='fa fa-times' title='Excluir Cliente'></i></button>");
												out.print("</td>");

											out.print("<tr/>");
										}
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
	
	
	
	
	
	
	
	
	<div class="modal fade" id="modalVerClientes" role="dialog">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
<!-- 					<button type="button" class="close" data-dismiss="modal">&times;</button> -->
					<h1 class="modal-title">Visualizar Cliente</h1>
				</div>
				<div class="modal-body">
					
					
					<ul class="nav nav-tabs" id="myTab" role="tablist">
						<li class="nav-item active"><a data-cy="dadosPessoais" class="nav-link active"
							id="dados-pessoais" data-toggle="tab" href="#DadosPessoais"
							role="tab" aria-selected="true">Dados Pessoais</a></li>

						<li class="nav-item"><a data-cy="dadosUsuario" class="nav-link" id="dados-usuario"
							data-toggle="tab" href="#DadosUsuario" role="tab"
							aria-selected="false">Dados de Usuário</a></li>

						<li class="nav-item"><a data-cy="enderecoCobranca" class="nav-link"
							id="endereco-cobranca" data-toggle="tab" href="#EnderecoCobranca"
							role="tab" aria-selected="false">Endereço Cobrança</a></li>

						<li class="nav-item"><a data-cy="enderecoEntrega" class="nav-link"
							id="endereco-entrega" data-toggle="tab" href="#EnderecoEntrega"
							role="tab" aria-selected="false">Endereço Entrega</a></li>

						<li class="nav-item"><a data-cy="Cartoes" class="nav-link" id="cartao-credito"
							data-toggle="tab" href="#CartaoCredito" role="tab"
							aria-selected="false">Cartões</a></li>
						<li class="nav-item"><a data-cy="Cupons" class="nav-link" id="cupons"
							data-toggle="tab" href="#cupons-desconto" role="tab"
							aria-selected="false">Cupons</a></li>
						<li class="nav-item"><a data-cy="Transacoes" class="nav-link" id="transacoes"
							data-toggle="tab" href="#transacoes-cliente" role="tab"
							aria-selected="false">Transações</a></li>
					</ul>
					<div class="tab-content" id="myTabContent">
						<div class="tab-pane fade active in " id="DadosPessoais" role="tabpanel">
							<br>
							<h1>Dados Pessoais</h1>
							<form id="formPersonalData" name="formPersonalData"
								action="usuarioAtualizacaoLogin" method="post">
								<div class="row">
									
									<input type="hidden" id="txtIdCliente" name="txtIdCliente">
									<input type="hidden" id="txtEnd_id" name="txtEnd_id">

									<div class="col-md-6">
										<label class="reduced-input-label" for="txtName">Nome*</label>
										<input type="text" class="form-control reduced-input"
											id="txtName" name="txtName" data-cy="txtName">
									</div>
									<div class="col-md-6">
										<label class="reduced-input-label" for="txtLastName">Sobrenome*</label>
										<input type="text" class="form-control reduced-input"
											id="txtLastName" name="txtLastName" data-cy="txtLastName">
									</div>
								</div>
								<br>
								<div class="row">
									<div class="col-md-2">
										<label class="reduced-input-label" for="txtBirthDate">Nascimento*</label> <input type="date"
											class="form-control reduced-input" id="txtBirthDate"
											autocomplete='off' name="txtBirthDate" data-cy="txtBirthDate">
									</div>
									<div class="col-md-2">
										<label class="reduced-input-label" for="txtGender">Gênero*</label>
										<select id="txtGender" name="txtGender"
											class="form-control reduced-input" data-cy="txtGender">
											<option value=""></option>
											<option value="M">Masculino</option>
											<option selected value="F">Feminino</option>
											<option value="O">Outro</option>
										</select>
									</div>
									<div class="col-md-2">
										<label class="reduced-input-label" for="txtTypeDocument">Tipo
											Documento*</label> <select data-cy="txtTypeDocument" id="txtTypeDocument"
											name="txtTypeDocument" class="form-control reduced-input">
											<option value=""></option>
											<option value="1">RG</option>
											<option selected value="2">CPF</option>
											<option value="3">CNH</option>
										</select>
									</div>
									<div class="col-md-3">
										<label class="reduced-input-label" for="txtDocument">Número
											Documento*</label> <input data-cy="txtDocument" type="text"
											class="form-control reduced-input" id="txtDocument"
											name="txtDocument">
									</div>
									<div class="col-md-3">
										<label class="reduced-input-label" for="txtValidadeDocument">Validade
											Documento*</label> <input data-cy="txtValidadeDocument" type="date"
											class="form-control reduced-input" id="txtValidadeDocument"
											name="txtValidadeDocument">
									</div>
								</div>
								<br> <input type="hidden" id="pageReturn" name="pageReturn">

								<div class="row">
									<div class="col-md-4">
										<label class="reduced-input-label" for="txtPhoneType">Tipo
											Telefone* </label> <select data-cy="txtPhoneType" id="txtPhoneType" name="txtPhoneType"
											class="form-control">
											<option value=""></option>
											<option value="Celular">Celular</option>
											<option value="Telefone">Telefone</option>
										</select>

									</div>
									<div class="col-md-4">
										<label class="reduced-input-label" for="txtPhone">Telefone*</label>
										<input data-cy="txtPhone" type="text" class="form-control reduced-input"
											id="txtPhone" name="txtPhone">
									</div>
									<div class="col-md-4">
										<label class="reduced-input-label" for="txtTypeClient">Tipo
											Cliente*</label> <select data-cy="txtTypeClient" id="txtTypeClient" name="txtTypeClient"
											class="form-control">
											<option value=""></option>
											<option value="1">Gold</option>
											<option value="2">Silver</option>
											<option value="3">Black</option>
										</select>
									</div>


								</div>
								<br>
								<hr>
								<br>
								<h1>Endereço Residencial</h1>

								<div class="row">

									<div class="col-md-12">
										<label class="reduced-input-label" for="txtNameEnder">Nome
											Endereço</label> <input type="text"
											class="form-control reduced-input" name="txtNameEnder"
											id="txtNameEnder" value="Minha Casa">
									</div>

								</div>
								<br>

								<div class="row">
									<div class="col-md-4">
										<label class="reduced-input-label" for="txtResidenceTypeHome">Tipo
											de residência*</label> <select id="txtResidenceType"
											name="txtResidenceType" class="form-control reduced-input">
											<option value=""></option>
											<option value="Casa">Casa</option>
											<option selected value="Apartamento">Apartamento</option>
											<option value="Sobrado">Sobrado</option>
											<option value="Loja">Loja</option>
											<option value="Galpão">Galpão</option>
											<option value="Outros">Outros</option>
										</select>
									</div>
									<div class="col-md-4">
										<label class="reduced-input-label" for="txtStreetType">Tipo
											do logradouro*</label> <select id="txtStreetType"
											name="txtStreetType" class="form-control reduced-input">
											<option value=""></option>
											<option value="Rua">Rua</option>
											<option selected value="Avenida">Avenida</option>
											<option value="Travessa">Travessa</option>
											<option value="Passagem">Passagem</option>
											<option value="Outros">Outros</option>
										</select>

									</div>
									<div class="col-md-4">
										<label class="reduced-input-label" for="txtStreetName">Logradouro*</label>
										<input type="text" class="form-control reduced-input"
											name="txtStreetName" id="txtStreetName"
											value="Avenida não antes vista">
									</div>
								</div>
								<br>
								<div class="row">
									<div class="col-md-4">
										<label class="reduced-input-label" for="txtNumber">Número*</label>
										<input type="text" class="form-control reduced-input"
											name="txtNumber" id="txtNumber" value="4524">
									</div>

									<div class="col-md-4">
										<label class="reduced-input-label" for="txtCep">CEP*</label> <input
											type="text" class="form-control reduced-input" name="txtCep"
											id="txtCep" value="45544488">
									</div>
									<div class="col-md-4">
										<label class="reduced-input-label" for="txtNeighnorhood">Bairro*</label>
										<input type="text" class="form-control reduced-input"
											name="txtNeighnorhood" id="txtNeighnorhood"
											value="Vila do chaves">
									</div>
								</div>
								<br>
								<div class="row">
									<div class="col-md-4">
										<label class="reduced-input-label" for="txtCountryHome">País*</label>
										<select id="txtCountryHome" name="txtCountryHome"
											class="form-control reduced-input">
											<option value="0"></option>

											<option value="1" selected>Brasil</option>

											<option value="2">Estados Unidos</option>

											<option value="3">Espanha</option>

										</select>
									</div>

									<input type="hidden" id="formAddressType"
										name="formAddressType" value="Home">
									<div class="col-md-4">
										<label class="reduced-input-label" for="txtStateHome">Estado*</label>
										<select id="txtStateHome" name="txtStateHome"
											class="form-control reduced-input">
											<option value="0"></option>

											<option value="1">Acre</option>

											<option value="2">Alagoas</option>

											<option value="3">Amapá</option>

											<option value="4">Amazonas</option>

											<option value="5" selected>Bahia</option>

											<option value="6">Ceará</option>

											<option value="7">Espírito Santo</option>

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
										<label class="reduced-input-label" for="txtCity">Cidade*</label>
										<input type="text" class="form-control reduced-input"
											name="txtCity" id="txtCity" value="Porto Seguro">
									</div>

								</div>
								<br>
								<div class="row">
									<div class="col-md-12">
										<label class="reduced-input-label" for="txtObservation">Observações</label>
										<input type="text" class="form-control reduced-input"
											name="txtObservation" id="txtObservation"
											>
									</div>
								</div>
								<br>
								<div class="col-sm form-group text-lg-right">
									
									<button data-cy="salvarDadosPessoais" type="submit" class="btn btn-primary py-3 px-3"
										id="operacao" name="operacao" value="Salvar" onclick="execucao_alerta()">Salvar</button>
							</form>
						</div>

						

					</div>
					<div class="tab-pane fade" id="DadosUsuario" role="tabpanel">
						<br>
						<h1>Dados de Usuário</h1>
						<form action="usuarioAtualizacaoLogin" method="post">
						
<input type="hidden" id="2txtIdCliente" name="txtIdCliente">
<input type="hidden" id="2txtEnd_id" name="txtEnd_id">

									
<input type="hidden" class="form-control reduced-input" id="2txtName" name="txtName" data-cy="txtName">
									
<input type="hidden" class="form-control reduced-input" id="2txtLastName" name="txtLastName" data-cy="txtLastName">
<input type="hidden" class="form-control reduced-input" id="2txtBirthDate" autocomplete='off' name="txtBirthDate" data-cy="txtBirthDate">
									
<input type="hidden" id="2txtGender" name="txtGender" class="form-control reduced-input" data-cy="txtGender">
											
<input type="hidden" data-cy="txtTypeDocument" id="2txtTypeDocument" name="txtTypeDocument" class="form-control reduced-input">
											
<input data-cy="txtDocument" type="hidden" class="form-control reduced-input" id="2txtDocument" name="txtDocument">
<input data-cy="txtValidadeDocument" type="hidden"class="form-control reduced-input" id="2txtValidadeDocument"name="txtValidadeDocument">
									
								
								

<input type="hidden" data-cy="txtPhoneType" id="2txtPhoneType" name="txtPhoneType"class="form-control">
											

									
<input data-cy="txtPhone" type="hidden" class="form-control reduced-input"id="2txtPhone" name="txtPhone">
<input type="hidden" data-cy="txtTypeClient" id="2txtTypeClient" name="txtTypeClient"class="form-control">
											
<input type="hidden"class="form-control reduced-input" name="txtNameEnder"id="2txtNameEnder" value="Minha Casa">
<input type="hidden" id="2txtResidenceType"name="txtResidenceType" class="form-control reduced-input">
											
<input type="hidden" id="2txtStreetType"name="txtStreetType" class="form-control reduced-input">
											

									
<input type="hidden" class="form-control reduced-input"name="txtStreetName" id="2txtStreetName"value="Avenida não antes vista">
									
<input type="hidden" class="form-control reduced-input"name="txtNumber" id="2txtNumber" value="4524">
<input type="hidden" class="form-control reduced-input" name="txtCep"id="2txtCep" value="45544488">
									
<input type="hidden" class="form-control reduced-input"name="txtNeighnorhood" id="2txtNeighnorhood"value="Vila do chaves">
									
<input type="hidden" id="2txtCountryHome" name="txtCountryHome"class="form-control reduced-input">
											
									
<input type="hidden" id="2txtStateHome" name="txtStateHome" class="form-control reduced-input">
											

									
<input type="hidden" class="form-control reduced-input"name="txtCity" id="2txtCity" value="Porto Seguro">
									
<input type="hidden" class="form-control reduced-input"name="txtObservation" id="2txtObservation">
								
							

							<div class="row">
								<div class="col-md-6">
									<label for="txtEmail" class="reduced-input-label">Email</label>
									<input type="email" data-cy="txtEmail" class="form-control reduced-input"
										id="txtEmail" name="txtEmail" placeholder="E-Mail" value="" />
								</div>
								<div class=" col-md-6">
									<label for="txtLogin" class="reduced-input-label"> Nome
										de usuário </label> <input type="text" value="Cliente"
										class="form-control reduced-input" id="txtLogin"
										name="txtLogin" placeholder="Nome de usuário" />
								</div>
							</div>
							<br>
							<div class="row">
								<div class="col-md-6">
									<label for="txtPassword" class="reduced-input-label">Senha</label>
									<input type="password" class="form-control reduced-input pass"
										id="txtPassword" name="txtPassword"
										placeholder="Digite a senha" value="null" />
								</div>
								<div class="col-md-6">
									<label for="txtConfirmPassword" class="reduced-input-label">Confirme
										a senha</label> <input type="password"
										class="form-control reduced-input pass"
										id="txtPasswordConfirmation" name="txtPasswordConfirmation"
										placeholder="Confirme a senha" value="null" />
								</div>
							</div>
						
						<br>
						<div class="col-sm form-group text-lg-right">
							
								<button type="submit" class="btn btn-primary py-3 px-3"
										id="operacao" name="operacao" value="Salvar" onclick="execucao_alerta()">Salvar</button>
							</form>
						</div>
					</div>
					
					<div class="tab-pane fade" id="cupons-desconto" role="tabpanel">
						<br>
						<div class="row">
						<div class="col-md-9"><h1>Cupons Disponíveis</h1></div>
						
						</div>
						<% if (user.equals("Adm")) { %>
						<form action="AdicionarCupom" method="post">
						<input type="hidden" name="idClienteCupom" id="idClienteCupom">
						<div class="row">
						
						<div class="col-md-4"><input type="text" class="form-control reduced-input" id="nomeCupom" name="nomeCupom"  placeholder="Nome Cupom" required></div>
						<div class="col-md-4"><input type="text" class="form-control reduced-input" id="valorCupom" name="valorCupom"  placeholder="Valor Cupom" required></div>
						<div class="col-md-3" ><button type='submit' class="btn btn-info"> + Adicionar cupom</button></div>
						</div>
						</form>
						
						<br>
						
						<hr>
						<% } %>
						<table class="table" id="tabelaCupom">
							<thead class="thead-light">
								<tr>
									<th>Nome Cupom</th>
									<th>Valor</th>
									
									
								</tr>
							</thead>
							<tbody id="tabelaCupons">

								
								

							</tbody>
						</table>
						<br>
						
					</div>
					
					
					<div class="tab-pane fade" id="transacoes-cliente" role="tabpanel">
						<br>
						<h1>Transações Realizadas</h1>
						<table class="table">
							<thead class="thead-light">
								<tr>
									<th>Produto</th>
									<th>Status</th>
									<th>Data</th>
									
								</tr>
							</thead>
							<tbody>

								<tr >

									<td class="product-name">Jogo mídia física FIFA 2021</td>
									<td class="product-name"><button type="button" class="btn btn-success btn-sm">Entregue </button></td>
									<td class="product-name">08/08/2021</td>
									
								</tr>
								<tr >

									<td class="product-name">Jogo mídia física PES 2010</td>
									<td class="product-name"><button type="button" class="btn btn-danger btn-sm">Reprovada </button></td>
									<td class="product-name">08/01/2021</td>
									
								</tr>
								<tr >

									<td class="product-name">Jogo mídia física Call of Duty III</td>
									<td class="product-name"><button type="button" class="btn btn-warning btn-sm">Em processamento </button></td>
									<td class="product-name">08/03/2021</td>
									
								</tr>
								<tr >

									<td class="product-name">Jogo mídia física Fortnite</td>
									<td class="product-name"><button type="button" class="btn btn-info btn-sm">Troca autorizada </button></td>
									<td class="product-name">08/05/2021</td>
									
								</tr>
								<tr >

									<td class="product-name">Jogo mídia física PUBG</td>
									<td class="product-name"><button type="button" class="btn btn-secondary btn-sm">Em troca </button></td>
									<td class="product-name">08/07/2021</td>
									
								</tr>
								
								<tr >

									<td class="product-name">Jogo mídia física Free Fire</td>
									<td class="product-name"><button type="button" class="btn btn-primary btn-sm">Em transporte </button></td>
									<td class="product-name">08/08/2021</td>
									
								</tr>
								
								
								
								

							</tbody>
						</table>
						<br>
						
					</div>
					<div class="tab-pane fade" id="EnderecoCobranca" role="tabpanel">
						<br>
						<h1>Endereço de Cobrança</h1>
						<form method="POST" action="enderecoCriacaoCobrancaLogin" id="formBillingAddresses">


							<div class="row">
								<div class="col-md-4">
									<label class="reduced-input-label" for="txtNameBA">Nome
										de identificação*</label> <input required type="text"
										class="form-control reduced-input " value="" name="txtNameBA"
										id="txtNameBA" data-cy="txtNameBA" required>
								</div>
								<div class="col-md-8">
									<label class="reduced-input-label" for="txtDescriptionBA">Descrição*</label>
									<input required type="text" class="form-control reduced-input"
										name="txtDescriptionBA" id="txtDescriptionBA" value="" data-cy="txtDescriptionBA" required>
								</div>
							</div>
							<br>
							<div class="row">
								<div class="col-md-4">
									<label class="reduced-input-label" for="txtResidenceTypeHomeBA">Tipo
										de residência*</label> <select data-cy="txtResidenceTypeBA" id="txtResidenceTypeBA"
										name="txtResidenceTypeBA" class="form-control reduced-input" required>
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
									<label class="reduced-input-label" for="txtStreetTypeBA">Tipo
										do logradouro*</label> <select data-cy="txtStreetTypeBA" id="txtStreetTypeBA"
										name="txtStreetTypeBA" class="form-control reduced-input" required>
										<option value=""></option>
										<option value="Rua">Rua</option>
										<option value="Avenida">Avenida</option>
										<option value="Travessa">Travessa</option>
										<option value="Passagem">Passagem</option>
										<option value="Outros">Outros</option>
									</select>

								</div>
								<div class="col-md-4">
									<label class="reduced-input-label" for="txtStreetNameBA">Logradouro*</label>
									<input type="text" data-cy="txtStreetNameBA" class="form-control reduced-input"
										name="txtStreetNameBA" id="txtStreetNameBA" value="" required>
								</div>
							</div>
							<br>
							<div class="row">
								<div class="col-md-4">
									<label class="reduced-input-label" for="txtNumberBA">Número*</label>
									<input data-cy="txtNumberBA" type="text" class="form-control reduced-input"
										name="txtNumberBA" id="txtNumberBA" value="" required>
								</div>

								<div class="col-md-4">
									<label class="reduced-input-label" for="txtCepBA">CEP*</label>
									<input data-cy="txtCepBA" type="text" class="form-control reduced-input"
										name="txtCepBA" id="txtCepBA" value="" required>
								</div>
								<div class="col-md-4">
									<label class="reduced-input-label" for="txtNeighnorhoodBA">Bairro*</label>
									<input data-cy="txtNeighnorhoodBA" type="text" class="form-control reduced-input"
										name="txtNeighnorhoodBA" id="txtNeighnorhoodBA" value="" required>
								</div>
							</div>
							<br>
							<div class="row">
								<div class="col-md-4">
									<label class="reduced-input-label" for="txtCountryBA">País*</label>
									<select id="txtCountryBA"  data-cy="txtCountryBA" name="txtCountryBA"
										class="form-control reduced-input" required>
										<option value="0"></option>

										<option value="1">Brasil</option>

										<option value="2">Estados Unidos</option>

										<option value="3">Espanha</option>

									</select>
								</div>

								
								<div class="col-md-4">
									<label class="reduced-input-label" for="txtStateBA">Estado*</label>
									<select id="txtStateBA" data-cy="txtStateBA" name="txtStateBA"
										class="form-control reduced-input" required>
										<option value="0"></option>

										<option value="1">Acre</option>

										<option value="2">Alagoas</option>

										<option value="3">Amapá</option>

										<option value="4">Amazonas</option>

										<option value="5" selected>Bahia</option>

										<option value="6">Ceará</option>

										<option value="7">Espírito Santo</option>

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
									<label class="reduced-input-label" for="txtCityBA">Cidade*</label>
									<input type="text" data-cy="txtCityBA"  class="form-control reduced-input"
										name="txtCityBA" id="txtCityBA" value="" required>
								</div>

							</div>
							<br>
							<div class="row">
								<div class="col-md-12">
									<label class="reduced-input-label" for="txtObservationBA">Observações</label>
									<input data-cy="txtObservationBA" type="text" class="form-control reduced-input"
										name="txtObservationBA" id="txtObservationBA" value="">
								</div>
							</div>
							<p>
							<div>
							<input type="hidden" name="txtIdRowEndereco" id="txtIdRowEndereco" >
							<input type="hidden" name="txtTipoEnderecoCompraBA" id="txtTipoEnderecoCompraBA" value="Cobranca">
							<input type="hidden" name="txtCliIdBA" id="txtCliIdBA">

								
								<button type="submit" class="btn btn-primary py-3 px-3" id="MudarTabelaEndereco"  value="Adicionar">Adicionar</button>
							</div>
							<p>
						</form>
						<br>
						<table id='tabelaEndereco' class='table'>
						<thead class='thead-light'>
							<tr>
								
								<th>Nome</th>
								<th>Tipo</th>
								<th>Logradouro</th>
								<th>Número</th>
								<th>Cidade</th>
								
							</tr>
						</thead>
						<tbody id="tabelaEnderecosCobranca">

						</tbody>
						</table>
						<form action="enderecoLeituraLogin" method="post">
							<input type='hidden' id='idClienteEnderecoCobranca' name='idClienteEndereco'>
							<button class="btn btn-success" type = "submit">Editar Endereços</button>
						</form>
<!-- 						<table id="tabelaEndereco" class="table"> -->
<!-- 							<thead class="thead-light"> -->
<!-- 								<tr> -->
<!-- 									<th>Padrão</th> -->
<!-- 									<th>Nome</th> -->
<!-- 									<th>Tipo</th> -->
<!-- 									<th>Logradouro</th> -->
<!-- 									<th>Número</th> -->
<!-- 									<th>Cidade</th> -->
<!-- 									<th>&nbsp;</th> -->
<!-- 									<th>&nbsp;</th> -->
<!-- 								</tr> -->
<!-- 							</thead> -->
<!-- 							<tbody> -->

<!-- 								<tr id="1"> -->
<!-- 									<td class="product-name" style="width: 0%"><input type="radio" name="defaultAddress" checked></td> -->
<!-- 									<td class="product-name"><object name="textoNomeEndereco">aaaa</object> </td> -->
<!-- 									<td class="product-name" style="width: 0%"><object name="textoTipoResidencia">Apartamento</object><input type="hidden" name="valorTipoResidencia" value="Apartamento"></td> -->
<!-- 									<td class="product-name" style="width: 50%"><object name="textoTipoLogradouro">Rua</object><input type="hidden" name="valorTipoLogradouro" value="Rua"></td> -->
<!-- 									<td class="product-name" style="width: 0%"><object name="textoNumeroEndereco">45</object></td> -->
<!-- 									<td class="product-name" style="width: 10%"><object name="textoCidade">São Paulo</object></td> -->
<!-- 									<td class="product-name" style="width: 5%"><a href="#"><i data-cy="btnEditarEndereco1" class="fa fa-pencil" onclick="alterarDadoEndereco(1)"></i></a></td> -->
<!-- 									<td class="product-name" style="width: 5%"><a href="#"><i  class="fa fa-times" onclick="inativacao_alerta_endereco(1)"></i></a> -->
<!-- 										<input type="hidden" name="txtDescriptionBA" id="txtDescriptionBA" value="TesteDescricao"> -->
<!-- 										<input type="hidden" name="txtNomeLogradouroBA" id="txtNomeLogradouroBA" value="Rua das Couves"> -->
<!-- 										<input type="hidden" name="txtCepBA" id="txtCepBA" value="08738040"> -->
<!-- 										<input type="hidden" name="txtNeighnorhoodBA" id="txtNeighnorhoodBA" value="Teste"> -->
<!-- 										<input type="hidden" name="txtCountryBA" id="txtCountryBA" value="1"> -->
<!-- 										<input type="hidden" name="txtStateBA" id="txtStateBA" value="3"> -->
<!-- 										<input type="hidden" name="txtObservationBA" id="txtObservationBA" value="testeObservacao"> -->
										
<!-- 									</td> -->
<!-- 								</tr> -->
<!-- 								<tr id="2"> -->
<!-- 									<td class="product-name" style="width: 0%"><input type="radio" name="defaultAddress" checked></td> -->
<!-- 									<td class="product-name"><object name="textoNomeEndereco">Casa Principal</object> </td> -->
<!-- 									<td class="product-name" style="width: 0%"><object name="textoTipoResidencia">Casa</object><input type="hidden" name="valorTipoResidencia" value="Casa"></td> -->
<!-- 									<td class="product-name" style="width: 50%"><object name="textoTipoLogradouro">Avenida</object><input type="hidden" name="valorTipoLogradouro" value="Avenida"></td> -->
<!-- 									<td class="product-name" style="width: 0%"><object name="textoNumeroEndereco">46</object></td> -->
<!-- 									<td class="product-name" style="width: 10%"><object name="textoCidade">São Jose</object></td> -->
<!-- 									<td class="product-name" style="width: 5%"><a href="#"><i  class="fa fa-pencil" onclick="alterarDadoEndereco(2)"></i></a></td> -->
<!-- 									<td class="product-name" style="width: 5%"><a href="#"><i data-cy="btnExcluirEndereco2" class="fa fa-times" onclick="inativacao_alerta_endereco(2)"></i></a> -->
<!-- 										<input type="hidden" name="txtDescriptionBA" id="txtDescriptionBA" value="TesteDescricao2"> -->
<!-- 										<input type="hidden" name="txtNomeLogradouroBA" id="txtNomeLogradouroBA" value="Rua das Couves2"> -->
<!-- 										<input type="hidden" name="txtCepBA" id="txtCepBA" value="087380402"> -->
<!-- 										<input type="hidden" name="txtNeighnorhoodBA" id="txtNeighnorhoodBA" value="Teste2"> -->
<!-- 										<input type="hidden" name="txtCountryBA" id="txtCountryBA" value="12"> -->
<!-- 										<input type="hidden" name="txtStateBA" id="txtStateBA" value="2"> -->
<!-- 										<input type="hidden" name="txtObservationBA" id="txtObservationBA" value="testeObservacao2"> -->
										
<!-- 									</td> -->
<!-- 								</tr> -->
<!-- 								<tr id="3"> -->
<!-- 									<td class="product-name" style="width: 0%"><input type="radio" name="defaultAddress" checked></td> -->
<!-- 									<td class="product-name"><object name="textoNomeEndereco">Casa Vó</object> </td> -->
<!-- 									<td class="product-name" style="width: 0%"><object name="textoTipoResidencia">Apartamento</object><input type="hidden" name="valorTipoResidencia" value="Apartamento"></td> -->
<!-- 									<td class="product-name" style="width: 50%"><object name="textoTipoLogradouro">Ruaa</object><input type="hidden" name="valorTipoLogradouro" value="Rua"></td> -->
<!-- 									<td class="product-name" style="width: 0%"><object name="textoNumeroEndereco">50</object></td> -->
<!-- 									<td class="product-name" style="width: 10%"><object name="textoCidade">São João</object></td> -->
<!-- 									<td class="product-name" style="width: 5%"><a href="#"><i class="fa fa-pencil" onclick="alterarDadoEndereco(3)" ></i></a></td> -->
<!-- 									<td class="product-name" style="width: 5%"><a href="#"><i class="fa fa-times" onclick="inativacao_alerta_endereco(3)"></i></a> -->
<!-- 										<input type="hidden" name="txtDescriptionBA" id="txtDescriptionBA" value="TesteDescricao3"> -->
<!-- 										<input type="hidden" name="txtNomeLogradouroBA" id="txtNomeLogradouroBA" value="Rua das Couves3"> -->
<!-- 										<input type="hidden" name="txtCepBA" id="txtCepBA" value="087380403"> -->
<!-- 										<input type="hidden" name="txtNeighnorhoodBA" id="txtNeighnorhoodBA" value="Teste3"> -->
<!-- 										<input type="hidden" name="txtCountryBA" id="txtCountryBA" value="3"> -->
<!-- 										<input type="hidden" name="txtStateBA" id="txtStateBA" value="6"> -->
<!-- 										<input type="hidden" name="txtObservationBA" id="txtObservationBA" value="testeObservacao3"> -->
										
<!-- 									</td> -->
<!-- 								</tr> -->

<!-- 							</tbody> -->
<!-- 						</table> -->
					</div>
					<div class="tab-pane fade" id="EnderecoEntrega" role="tabpanel">
						<br>
						<h1>Endereço de Entrega</h1>

						<form method="POST" id="" action="enderecoCriacaoEntregaLogin">
							

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
<!-- 							<input type="hidden" name="txtIdRowEndereco" id="txtIdRowEndereco" > -->
							<input type="hidden" name="txtTipoEnderecoCompraDA" id="txtTipoEnderecoCompraDA" value="Entrega">
							<input type="hidden" name="txtCliIdDA" id="txtCliIdDA">
							<p>
								<br>
							<div class="row">
								<div class="col-md-4">

									<button type="submit" class="btn btn-primary py-3 px-3" id="MudarTabelaEnderecoEntrega"  value="Adicionar">Adicionar</button>

								</div>
								
								
							</div>
							<p>
						</form>
						<br>
						<table id='tabelaEndereco' class='table'>
						<thead class='thead-light'>
							<tr>
								
								<th>Nome</th>
								<th>Tipo</th>
								<th>Logradouro</th>
								<th>Número</th>
								<th>Cidade</th>
								
							</tr>
						</thead>
						<tbody id="tabelaEnderecosEntrega">

						</tbody>
						</table>
						<form action="enderecoLeituraLogin" method="post">
							<input type='hidden' id='idClienteEnderecoEntrega' name='idClienteEndereco'>
							<button class="btn btn-success" type = "submit">Editar endereços</button>
						</form>
<!-- 						<table id="tableDeliveryAddresses" class="table"> -->
<!-- 							<thead class="thead-light"> -->
<!-- 								<tr> -->
<!-- 									<th>Padrão</th> -->
<!-- 									<th>Nome</th> -->
<!-- 									<th>Tipo</th> -->
<!-- 									<th>Logradouro</th> -->
<!-- 									<th>Número</th> -->
<!-- 									<th>Cidade</th> -->
<!-- 									<th>&nbsp;</th> -->
<!-- 									<th>&nbsp;</th> -->
<!-- 								</tr> -->
<!-- 							</thead> -->
<!-- 							<tbody> -->

<!-- 								<tr> -->
<!-- 									<td class="product-name" style="width: 0%"><input -->
<!-- 										type="radio" name="defaultAddressDA" checked></td> -->

<!-- 									<td class="product-name">Name <input type="hidden" -->
<!-- 										name="idAddressDA" id="idAddressDA" -->
<!-- 										form="formDeliveryAddresses"> -->
<!-- 									</td> -->
<!-- 									<td class="product-name" style="width: 0%">Casa</td> -->
<!-- 									<td class="product-name" style="width: 50%">Neverland -->
<!-- 										Downtown</td> -->
<!-- 									<td class="product-name" style="width: 0%">4524a</td> -->
<!-- 									<td class="product-name" style="width: 10%">Porto Seguro</td> -->
<!-- 									<td class="product-name" style="width: 5%"><a href="#"><i -->
<!-- 											class="fa fa-pencil"></i></a></td> -->
<!-- 									<td class="product-name" style="width: 5%"><a href="#"><i -->
<!-- 											class="fa fa-times" onclick="inativacao_alerta()"></i></a></td> -->
<!-- 								</tr> -->

<!-- 								<tr> -->
<!-- 									<td class="product-name" style="width: 0%"><input -->
<!-- 										type="radio" name="defaultAddressDA"></td> -->

<!-- 									<td class="product-name">Laura <input type="hidden" -->
<!-- 										name="idAddressDA" id="idAddressDA" -->
<!-- 										form="formDeliveryAddresses"> -->
<!-- 									</td> -->
<!-- 									<td class="product-name" style="width: 0%">Apartamento</td> -->
<!-- 									<td class="product-name" style="width: 50%">saSas</td> -->
<!-- 									<td class="product-name" style="width: 0%">saSAs</td> -->
<!-- 									<td class="product-name" style="width: 10%">SAsaSA</td> -->
<!-- 									<td class="product-name" style="width: 5%"><a href="#"><i -->
<!-- 											class="fa fa-pencil"></i></a></td> -->
<!-- 									<td class="product-name" style="width: 5%"><a href="#"><i -->
<!-- 											class="fa fa-times" onclick="inativacao_alerta()"></i></a></td> -->
<!-- 								</tr> -->

<!-- 								<tr> -->
<!-- 									<td class="product-name" style="width: 0%"><input -->
<!-- 										type="radio" name="defaultAddressDA"></td> -->

<!-- 									<td class="product-name">Eduardo Borges <input -->
<!-- 										type="hidden" name="idAddressDA" id="idAddressDA" -->
<!-- 										form="formDeliveryAddresses"> -->
<!-- 									</td> -->
<!-- 									<td class="product-name" style="width: 0%">Sobrado</td> -->
<!-- 									<td class="product-name" style="width: 50%">dadadada</td> -->
<!-- 									<td class="product-name" style="width: 0%">dadada</td> -->
<!-- 									<td class="product-name" style="width: 10%">dsadsadada</td> -->
<!-- 									<td class="product-name" style="width: 5%"><a href="#"><i -->
<!-- 											class="fa fa-pencil"></i></a></td> -->
<!-- 									<td class="product-name" style="width: 5%"><a href="#"><i -->
<!-- 											class="fa fa-times" onclick="inativacao_alerta()"></i></a></td> -->
<!-- 								</tr> -->

<!-- 								<tr> -->
<!-- 									<td class="product-name" style="width: 0%"><input -->
<!-- 										type="radio" name="defaultAddressDA"></td> -->

<!-- 									<td class="product-name">End show <input type="hidden" -->
<!-- 										name="idAddressDA" id="idAddressDA" -->
<!-- 										form="formDeliveryAddresses"> -->
<!-- 									</td> -->
<!-- 									<td class="product-name" style="width: 0%">Casa</td> -->
<!-- 									<td class="product-name" style="width: 50%">Abacate</td> -->
<!-- 									<td class="product-name" style="width: 0%">919</td> -->
<!-- 									<td class="product-name" style="width: 10%">Cidade</td> -->
<!-- 									<td class="product-name" style="width: 5%"><a href="#"><i -->
<!-- 											class="fa fa-pencil"></i></a></td> -->
<!-- 									<td class="product-name" style="width: 5%"><a href="#"><i -->
<!-- 											class="fa fa-times" onclick="inativacao_alerta()"></i></a></td> -->
<!-- 								</tr> -->

<!-- 								<tr> -->
<!-- 									<td class="product-name" style="width: 0%"><input -->
<!-- 										type="radio" name="defaultAddressDA"></td> -->

<!-- 									<td class="product-name">End show <input type="hidden" -->
<!-- 										name="idAddressDA" id="idAddressDA" -->
<!-- 										form="formDeliveryAddresses"> -->
<!-- 									</td> -->
<!-- 									<td class="product-name" style="width: 0%">Casa</td> -->
<!-- 									<td class="product-name" style="width: 50%">Abacate</td> -->
<!-- 									<td class="product-name" style="width: 0%">919</td> -->
<!-- 									<td class="product-name" style="width: 10%">Cidade</td> -->
<!-- 									<td class="product-name" style="width: 5%"><a href="#"><i -->
<!-- 											class="fa fa-pencil"></i></a></td> -->
<!-- 									<td class="product-name" style="width: 5%"><a href="#"><i -->
<!-- 											class="fa fa-times" onclick="inativacao_alerta()"></i></a></td> -->
<!-- 								</tr> -->

<!-- 								<tr> -->
<!-- 									<td class="product-name" style="width: 0%"><input -->
<!-- 										type="radio" name="defaultAddressDA"></td> -->

<!-- 									<td class="product-name">End show <input type="hidden" -->
<!-- 										name="idAddressDA" id="idAddressDA" -->
<!-- 										form="formDeliveryAddresses"> -->
<!-- 									</td> -->
<!-- 									<td class="product-name" style="width: 0%">Casa</td> -->
<!-- 									<td class="product-name" style="width: 50%">Abacate</td> -->
<!-- 									<td class="product-name" style="width: 0%">919</td> -->
<!-- 									<td class="product-name" style="width: 10%">Cidade</td> -->
<!-- 									<td class="product-name" style="width: 5%"><a href="#"><i -->
<!-- 											class="fa fa-pencil"></i></a></td> -->
<!-- 									<td class="product-name" style="width: 5%"><a href="#"><i -->
<!-- 											class="fa fa-times" onclick="inativacao_alerta()"></i></a></td> -->
<!-- 								</tr> -->

<!-- 								<tr> -->
<!-- 									<td class="product-name" style="width: 0%"><input -->
<!-- 										type="radio" name="defaultAddressDA"></td> -->

<!-- 									<td class="product-name">End <input type="hidden" -->
<!-- 										name="idAddressDA" id="idAddressDA" -->
<!-- 										form="formDeliveryAddresses"> -->
<!-- 									</td> -->
<!-- 									<td class="product-name" style="width: 0%">Sobrado</td> -->
<!-- 									<td class="product-name" style="width: 50%">log</td> -->
<!-- 									<td class="product-name" style="width: 0%">456</td> -->
<!-- 									<td class="product-name" style="width: 10%">cid</td> -->
<!-- 									<td class="product-name" style="width: 5%"><a href="#"><i -->
<!-- 											class="fa fa-pencil"></i></a></td> -->
<!-- 									<td class="product-name" style="width: 5%"><a href="#"><i -->
<!-- 											class="fa fa-times" onclick="inativacao_alerta()"></i></a></td> -->
<!-- 								</tr> -->

<!-- 							</tbody> -->
<!-- 						</table> -->
					</div>
					<div class="tab-pane fade" id="CartaoCredito" role="tabpanel">
						<br>
						<h1>Cartão de Crédito</h1>

						<form method="POST" id="formCreditCard" action="cartaoCriacao">
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
							<input type="hidden" name="txtCliIdCartao" id="txtCliIdCartao">
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
						<br>
						<table id='tabelaCartao' class='table'>
						<thead class='thead-light'>
							<tr>
								
									<th>Bandeira</th>
									<th>Nome</th>
									<th>Número</th>
									
							</tr>
						</thead>
						<tbody id="tabelaCartaoCompra">

						</tbody>
						</table>
						<form action="cartaoLeitura" method="post">
							<input type='hidden' id='idClienteCartao' name='idClienteCartao'>
							<button class="btn btn-success" type = "submit">Editar Cartões</button>
						</form>
						
<!-- 						<table id="tabelaCartao" class="table"> -->
<!-- 							<thead class="thead-light"> -->
<!-- 								<tr> -->
<!-- 									<th>Padrão</th> -->
<!-- 									<th>Bandeira</th> -->
<!-- 									<th>Nome</th> -->
<!-- 									<th>Número</th> -->
<!-- 									<th>&nbsp;</th> -->
<!-- 									<th>&nbsp;</th> -->
<!-- 								</tr> -->
<!-- 							</thead> -->
<!-- 							<tbody> -->

<!-- 								<tr id="1"> -->
<!-- 									<td class="product-name" style="width: 0%"><input type="radio" checked></td> -->

<!-- 									<td class="product-name"><object name="textoValorBandeiraCartao">Visa</object><input type="hidden" name="valorBandeira" value="1"> -->
<!-- 									</td> -->
<!-- 									<td class="product-name"><object name="valorNomeCartao">Laura</object></td> -->
<!-- 									<td class="product-name"><object name="valorNumeroCartao">1234 5678</object><input type="hidden" name="valorCodigoSeguranca" value="852"></td> -->
<!-- 									<td class="product-name" style="width: 5%"><a href="#" data-cy="editarCartao1" onclick="alterarDadoCartao(1)"><i class="fa fa-pencil"></i></a></td> -->
<!-- 									<td class="product-name" style="width: 5%"><a href="#"><i class="fa fa-times" onclick='inativacao_alerta_cartao(1)'></i></a></td> -->
<!-- 								</tr> -->

<!-- 								<tr id="2"> -->
<!-- 									<td class="product-name" style="width: 0%"><input type="radio"></td> -->

<!-- 									<td class="product-name">MasterCard<input type="hidden" name="valorBandeira" value="2"> -->
<!-- 									</td> -->
<!-- 									<td class="product-name"><object name="valorNomeCartao">Vendas</object></td> -->
<!-- 									<td class="product-name"><object name="valorNumeroCartao">88888888888</object><input type="hidden" name="valorCodigoSeguranca" value="987"></td> -->
<!-- 									<td class="product-name" style="width: 5%"><a href="#" onclick="alterarDadoCartao(2)"><i class="fa fa-pencil"></i></a></td> -->
<!-- 									<td class="product-name" style="width: 5%"><a href="#"><i  data-cy="btnExcluirCartao2" class="fa fa-times" onclick='inativacao_alerta_cartao(2)'></i></a></td> -->
<!-- 								</tr> -->

<!-- 								<tr id="3"> -->
<!-- 									<td class="product-name" style="width: 0%"><input type="radio"></td> -->

<!-- 									<td class="product-name">Elo<input type="hidden" name="valorBandeira" value="3"> -->
<!-- 									</td> -->
<!-- 									<td class="product-name"><object name="valorNomeCartao">Divulgação</object></td> -->
<!-- 									<td class="product-name"><object name="valorNumeroCartao">9999999999</object><input type="hidden" name="valorCodigoSeguranca" value="456"></td> -->
<!-- 									<td class="product-name" style="width: 5%"><a href="#" onclick="alterarDadoCartao(3)"><i class="fa fa-pencil"></i></a></td> -->
<!-- 									<td class="product-name" style="width: 5%"><a href="#"><i class="fa fa-times" onclick='inativacao_alerta_cartao(3)'></i></a></td> -->
<!-- 								</tr> -->

<!-- 							</tbody> -->
<!-- 						</table> -->
					</div>
					
					
				</div>
				
			</div>
		</div>
	</div>	
	
	
	<script>
	       function alterarDadoCartao(idRow){
	    	   
	           $('#txtBandeiraCartao').val($('#tabelaCartao').find('#'+idRow).find('input[name="valorBandeira"]').val());
	           $('#txtNumeroCartao').val($('#tabelaCartao').find('#'+idRow).find('object[name="valorNumeroCartao"]').text());
	           $('#txtNomeCartao').val($('#tabelaCartao').find('#'+idRow).find('object[name="valorNomeCartao"]').text());
	           $('#txtcodigoSegurancaCartao').val($('#tabelaCartao').find('#'+idRow).find('input[name="valorCodigoSeguranca"]').val());
	           $('#txtIdRowCartao').val(idRow);
	
	           document.getElementById("MudarTabelaCartao").value = "Editar";
	       
	      }
	      
	</script>
	
	
	<script>
	       function alterarDadoEndereco(idRow){
	    	   
// 	           $('#txtBandeiraCartao').val($('#tabelaCartao').find('#'+idRow).find('input[name="valorBandeira"]').val());
// 	           $('#txtNumeroCartao').val($('#tabelaCartao').find('#'+idRow).find('object[name="valorNumeroCartao"]').text());
	           
	           $('#txtNameBA').val($('#tabelaEndereco').find('#'+idRow).find('object[name="textoNomeEndereco"]').text());
	           $('#txtDescriptionBA').val($('#tabelaEndereco').find('#'+idRow).find('input[name="txtDescriptionBA"]').val());
	           $('#txtResidenceTypeBA').val($('#tabelaEndereco').find('#'+idRow).find('input[name="valorTipoResidencia"]').val());
	           $('#txtStreetTypeBA').val($('#tabelaEndereco').find('#'+idRow).find('input[name="valorTipoLogradouro"]').val());
	           $('#txtStreetNameBA').val($('#tabelaEndereco').find('#'+idRow).find('input[name="txtNomeLogradouroBA"]').val());
	           $('#txtNumberBA').val($('#tabelaEndereco').find('#'+idRow).find('object[name="textoNumeroEndereco"]').text());
	           $('#txtCepBA').val($('#tabelaEndereco').find('#'+idRow).find('input[name="txtCepBA"]').val());
	           $('#txtNeighnorhoodBA').val($('#tabelaEndereco').find('#'+idRow).find('input[name="txtNeighnorhoodBA"]').val());
	           $('#txtCountryBA').val($('#tabelaEndereco').find('#'+idRow).find('input[name="txtCountryBA"]').val());
	           $('#txtStateBA').val($('#tabelaEndereco').find('#'+idRow).find('input[name="txtStateBA"]').val());
	           $('#txtCityBA').val($('#tabelaEndereco').find('#'+idRow).find('object[name="textoCidade"]').text());
	           $('#txtObservationBA').val($('#tabelaEndereco').find('#'+idRow).find('input[name="txtObservationBA"]').val());
	           
	           
	           
	           
	           
	           
	           
	           
	           
	           
	           
	           
	           $('#txtIdRowEndereco').val(idRow);
	
	           document.getElementById("MudarTabelaEndereco").value = "Editar";
	       
	      }
	      
	</script>
	
	
	<script type="text/javascript">

	    function mudartabela(){
				
	            var index = $("#tabelafiltro input[name='txtColuna1']").parent().index();
	            
	            var nth = "#tabelaClientes td:nth-child("+(index+1).toString()+")";
	            
	            var valor = $("#tabelafiltro input[name='txtColuna1']").val().toUpperCase();
	
	            $("#tabelaClientes tbody tr").show();
	            $(nth).each(function(){
	                if($(this).text().toUpperCase().indexOf(valor) < 0){
	                    $(this).parent().hide();
	                }
	            });
	
	            var index2 = $("#tabelafiltro input[name='txtColuna2']").parent().index();
	
	            var nth2 = "#tabelaClientes td:nth-child("+(index2+1).toString()+")";
	            
	            var valor2 = $("#tabelafiltro input[name='txtColuna2']").val().toUpperCase();
	
	            $("#tabelaClientes tbody tr").show();
	            $(nth2).each(function(){
	                if($(this).text().toUpperCase().indexOf(valor2) < 0){
	                    $(this).parent().hide();
	                }
	            });
	        
	     
	    }   
	
	</script>
	
	
	<script language="javascript">
	        // Função responsável por inserir linhas na tabela
	        function mudarTabelaCartao() {
	
	          var EstadoBotão = document.getElementById("MudarTabelaCartao").value;
	          
	
	          if (EstadoBotão == "Editar") {
	            
	
	            var idRowAtual = $('#txtIdRowCartao ').val();
	
	            $('#tabelaCartao').find('#'+idRowAtual).find('input[name="valorBandeira"]').text($('#txtBandeiraCartao').val());
	            if ($('#txtBandeiraCartao').val() == 1)$('#tabelaCartao').find('#'+idRowAtual).find('object[name="textoValorBandeiraCartao"]').text('Visa');
	            if ($('#txtBandeiraCartao').val() == 2)$('#tabelaCartao').find('#'+idRowAtual).find('object[name="textoValorBandeiraCartao"]').text('Mastercad');
	            if ($('#txtBandeiraCartao').val() == 3)$('#tabelaCartao').find('#'+idRowAtual).find('object[name="textoValorBandeiraCartao"]').text('Elo');
	            if ($('#txtBandeiraCartao').val() == 4)$('#tabelaCartao').find('#'+idRowAtual).find('object[name="textoValorBandeiraCartao"]').text('American Express');
	            
	            $('#tabelaCartao').find('#'+idRowAtual).find('object[name="valorNumeroCartao"]').text($('#txtNumeroCartao').val());
	            $('#tabelaCartao').find('#'+idRowAtual).find('object[name="valorNomeCartao"]').text($('#txtNomeCartao').val());
	            $('#tabelaCartao').find('#'+idRowAtual).find('input[name="valorCodigoSeguranca"]').text($('#txtcodigoSegurancaCartao').val());
	            
	            
	
	          }
	
	          
	          
	
	
	          if (EstadoBotão == "Adicionar") {
	
	            // Captura a referência da tabela com id minhaTabela
	            var table = document.getElementById("tabelaCartao");
	            // Captura a quantidade de linhas já existentes na tabela
	            var numOfRows = table.rows.length;
	            // Captura a quantidade de colunas da última linha da tabela
	            var numOfCols = table.rows[numOfRows-1].cells.length;
	
	            // Insere uma linha no fim da tabela.
	            var newRow = table.insertRow(numOfRows);
	
	            var idRowNova = numOfRows+1;
	
	                newRow.setAttribute("id", idRowNova, 0);
	
	            
	                newCell1 = newRow.insertCell(0);
	                newCell2 = newRow.insertCell(1);
	                newCell3 = newRow.insertCell(2);
	                newCell4 = newRow.insertCell(3);
	                newCell5 = newRow.insertCell(4);
	                newCell6 = newRow.insertCell(5);
	                // Insere um conteúdo na coluna
	                newCell1.innerHTML = "<input type='radio'>";
	                
	                
	                
	                if ($('#txtBandeiraCartao').val() == 1)newCell2.innerHTML = "Visa<input type='hidden' name='valorBandeira' value='"+$('#txtBandeiraCartao').val()+"'>";
		            if ($('#txtBandeiraCartao').val() == 2)newCell2.innerHTML = "MasterCard<input type='hidden' name='valorBandeira' value='"+$('#txtBandeiraCartao').val()+"'>";
		            if ($('#txtBandeiraCartao').val() == 3)newCell2.innerHTML = "Elo<input type='hidden' name='valorBandeira' value='"+$('#txtBandeiraCartao').val()+"'>";
		            if ($('#txtBandeiraCartao').val() == 4)newCell2.innerHTML = "American Express<input type='hidden' name='valorBandeira' value='"+$('#txtBandeiraCartao').val()+"'>";
	                
	                newCell3.innerHTML = "<object name='valorNomeCartao'>"+$('#txtNomeCartao ').val()+"</object>";
	                newCell4.innerHTML = "<object name='valorNumeroCartao'>"+$('#txtNumeroCartao ').val()+"</object><input type='hidden' name='valorCodigoSeguranca' value='"+$('#txtcodigoSegurancaCartao ').val()+"'>";
	                newCell5.innerHTML = "<a href='#' onclick='alterarDadoCartao("+idRowNova+")'><i class='fa fa-pencil'></i></a>";
	                newCell6.innerHTML = "<a href='#'><i class='fa fa-times' onclick='inativacao_alerta_cartao("+idRowNova+")'></i></a>";
	                            
	
	          }
	            
	          execucao_alerta();
	        }
	</script>
	
	
	
	<script language="javascript">
	        // Função responsável por inserir linhas na tabela
	        function mudarTabelaEndereco() {
	        	
	          var EstadoBotão = document.getElementById("MudarTabelaEndereco").value;
	          
	          
	          if (EstadoBotão == "Editar") {
	            
	
	            var idRowAtual = $('#txtIdRowEndereco ').val();

	            $('#tabelaEndereco').find('#'+idRowAtual).find('object[name="textoNomeEndereco"]').text($('#txtNameBA').val());
	            $('#tabelaEndereco').find('#'+idRowAtual).find('object[name="textoTipoResidencia"]').text($('#txtResidenceTypeBA').val());
	            $('#tabelaEndereco').find('#'+idRowAtual).find('object[name="textoTipoLogradouro"]').text($('#txtStreetTypeBA').val());
	            $('#tabelaEndereco').find('#'+idRowAtual).find('input[name="valorTipoResidencia"]').text($('#txtResidenceTypeBA').val());
	            $('#tabelaEndereco').find('#'+idRowAtual).find('input[name="valorTipoLogradouro"]').text($('#txtStreetTypeBA').val());
	            $('#tabelaEndereco').find('#'+idRowAtual).find('object[name="textoNumeroEndereco"]').text($('#txtNumberBA').val());
	            $('#tabelaEndereco').find('#'+idRowAtual).find('object[name="textoCidade"]').text($('#txtCityBA').val());
	            
	            
	
	          }
	
	          
	          
	
	
	          if (EstadoBotão == "Adicionar") {
	        	  
	            // Captura a referência da tabela com id minhaTabela
	            var table = document.getElementById("tabelaEndereco");
	            // Captura a quantidade de linhas já existentes na tabela
	            var numOfRows = table.rows.length;
	            // Captura a quantidade de colunas da última linha da tabela
	            var numOfCols = table.rows[numOfRows-1].cells.length;
	
	            // Insere uma linha no fim da tabela.
	            var newRow = table.insertRow(numOfRows);
	
	            var idRowNova = numOfRows+1;
	
	                newRow.setAttribute("id", idRowNova, 0);
	
	            
	                newCell1 = newRow.insertCell(0);
	                newCell2 = newRow.insertCell(1);
	                newCell3 = newRow.insertCell(2);
	                newCell4 = newRow.insertCell(3);
	                newCell5 = newRow.insertCell(4);
	                newCell6 = newRow.insertCell(5);
	                newCell7 = newRow.insertCell(6);
	                newCell8 = newRow.insertCell(7);
	                
	                
	                
	                
	                
	                
	                // Insere um conteúdo na coluna
	                newCell1.innerHTML = "<input type='radio' name='defaultAddress'>";
	                newCell2.innerHTML = "<object name='textoNomeEndereco'>"+$('#txtNameBA').val()+"</object> ";
	                newCell3.innerHTML = "<object name='textoTipoResidencia'>"+$('#txtResidenceTypeBA').val()+"</object><input type='hidden' name='valorTipoResidencia' value='"+$('#txtResidenceTypeBA').val()+"'>";
	                newCell4.innerHTML = "<object name='textoTipoLogradouro'>"+$('#txtStreetTypeBA').val()+"</object><input type='hidden' name='valorTipoLogradouro' value='"+$('#txtStreetTypeBA').val()+"'>"
	                newCell5.innerHTML = "<object name='textoNumeroEndereco'>"+$('#txtNumberBA').val()+"</object>";
	                newCell6.innerHTML = "<object name='textoCidade'>"+$('#txtCityBA').val()+"</object>";
	                newCell7.innerHTML = "<a href='#'><i class='fa fa-pencil' onclick='alterarDadoEndereco("+idRowNova+")' ></i></a>";
	                newCell8.innerHTML = "<a href='#'><i class='fa fa-times' onclick='inativacao_alerta_endereco("+idRowNova+")'></i></a>";
	                            
	
	          }
	          execucao_alerta();
	
	        }
	</script>
	

	<script >
        
        function mudarTabelaCupom() {


            
            var table = document.getElementById("tabelaCupom");
            
            var numOfRows = table.rows.length;
            
            var numOfCols = table.rows[numOfRows-1].cells.length;

            
            var newRow = table.insertRow(numOfRows);

            var idRowNova = numOfRows+1;

                newRow.setAttribute("id", idRowNova, 0);

            
                newCell1 = newRow.insertCell(0);
                newCell2 = newRow.insertCell(1);
                
                // Insere um conteúdo na coluna
                newCell1.innerHTML = $('#nomeCupom ').val();
                newCell2.innerHTML = $('#valorCupom ').val();
                
                $('#nomeCupom ').val("");
                $('#valorCupom ').val("");
                

        }
	</script>
	
	<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
    <script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="http://andti.com.br/bootstrap-strong-password/js/bootstrap-strong-password.js"></script>
    <script type="text/javascript">
        $('.pass').bsStrongPass();
    </script>
	
	
	
	

</body>

</html>