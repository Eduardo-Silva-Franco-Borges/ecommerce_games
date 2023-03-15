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

List<EntidadeDominio> resultPedidos = (List<EntidadeDominio>) request.getAttribute("pedidos");
String dataInicio = "";
String dataFim = "";
String datagrafico = "";
if(request.getAttribute("dataInicio") != null)dataInicio = (String) request.getAttribute("dataInicio");
if(request.getAttribute("dataFim") != null)dataFim = (String) request.getAttribute("dataFim");

if((request.getAttribute("dataInicio") != null) && (request.getAttribute("dataFim") != null))datagrafico = new DateUtil().getFormatedDateBrasil(new DateUtil().setDate(dataInicio)) + " até " + new DateUtil().getFormatedDateBrasil(new DateUtil().setDate(dataFim));
 
Pedido pedido = new Pedido();

String datas = "";

String playstation = "";
String xbox = "";
String nintendo  = "";

String totalVendido  = "";



for (EntidadeDominio ped : resultPedidos) {
	
	pedido = (Pedido) ped;
	
	datas += "'"+ new DateUtil().getFormatedDateBrasil(pedido.getDt_cadastro())+"',";
	
	playstation += pedido.getPedidosPlaystation()+",";
	xbox += pedido.getPedidosXbox()+",";
	nintendo += pedido.getPedidosNintento()+",";
	
	totalVendido += pedido.getTotalPedidos()+",";
	
}

%>
	
	
	
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0,maximum-scale=1">

<title>Análise de Pedidos</title>

<!-- Loading third party fonts -->
<link href="http://fonts.googleapis.com/css?family=Roboto:100,400,700|"
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


<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<script src="https://code.highcharts.com/modules/accessibility.js"></script>

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
						<h1>Análise de Pedidos</h1>
					</div>
				</div>
				<br>
				<div class="row">
					<div class="col-md-12">
						<h5>*Todos os campos opcionais</h5>
						
					</div>
				</div>
				<form action="AnalisePedidos" method="post">
				
				<div class="row">

					<div class="col-md-6">
						<label class="reduced-input-label" for="txtDtInicio">Data
							Início</label> <input type="date" class="form-control reduced-input"
							id="txtDtInicio" name="txtDtInicio" required>
					</div>
					<div class="col-md-6">
						<label class="reduced-input-label" for="txtDtFim">Data Fim</label>
						<input type="date" class="form-control reduced-input"
							id="txtDtFim" name="txtDtFim" required>
					</div>
				</div>
				<br>
				<div class="row">

					
					<div class="col-md-12">
						<label class="reduced-input-label" for="txtStatus">Status</label>
						<select id="txtStatus" name="txtStatus"
							class="form-control reduced-input">
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
						
					</div>
					
				</div>
				<br>
				<div class="row">
				<div class="col-md-4">
				<button type="submit" class="btn btn-primary py-3 px-3"
				id="operacao" name="operacao">Pesquisar</button>
				</form>
				
				</div>
				</div>
				<br>
				<br>
				<br>
				<br>
				
				<figure class="highcharts-figure">
					<div id="container"></div>

				</figure>
				
				
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

	<script src="js/jquery-1.11.1.min.js"></script>
	<script src="js/plugins.js"></script>
	<script>
		$("#header").load("header.jsp");
		$("#footer").load("footer.html");
	</script>

	
	
	
	
	
	
	
	<script type="text/javascript">
	
	Highcharts.chart('container', {
	    chart: {
	        zoomType: 'xy'
	    },
	    title: {
	        text: 'Volume de vendas por categoria no período: <% out.print(datagrafico);%>'
	    },
	    
	    xAxis: [{
	        categories: [<% out.print(datas); %>],
	        crosshair: true
	    }],
	    yAxis: [{ // Primary yAxis
	        
	        title: {
	            text: 'Quantidade por categoria',
	            style: {
	                color: Highcharts.getOptions().colors[1]
	            }
	        }
	    }, { // Secondary yAxis
	        title: {
	            text: 'Total de vendas',
	            style: {
	                color: Highcharts.getOptions().colors[0]
	            }
	        },
	        
	        opposite: true
	    }],
	    tooltip: {
	        shared: true
	    },
	    legend: {
	        layout: 'vertical',
	        align: 'left',
	        x: 120,
	        verticalAlign: 'top',
	        y: 100,
	        floating: true,
	        backgroundColor:
	            Highcharts.defaultOptions.legend.backgroundColor || // theme
	            'rgba(255,255,255,0.25)'
	    },
	    series: [{
	        name: 'Total de vendas',
	        type: 'column',
	        yAxis: 1,
	        data: [<% out.print(totalVendido); %>],
	        

	    }, {
	        name: 'Quantidade de vendas na categoria Playstation',
	        type: 'spline',
	        data: [<% out.print(playstation); %>],
	        
	    }, {
	        name: 'Quantidade de vendas na categoria Xbox',
	        type: 'spline',
	        data: [<% out.print(xbox); %>],
	        
	    }, {
	        name: 'Quantidade de vendas na categoria Nintendo',
	        type: 'spline',
	        data: [<% out.print(nintendo); %>],
	        
	    }]
	});
	</script>

</body>

</html>