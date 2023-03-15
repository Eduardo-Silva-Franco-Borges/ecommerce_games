<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%			
			String user = "";
			Cookie[] cookies = request.getCookies();
			for(Cookie atual: cookies){
				if(atual.getName().equals("nomeUsuario")){
					 user = atual.getValue();
				}
			}
%>

<div class="site-header">
    <div class="container" >
        <a href="index.jsp" id="branding">
            <img src="images/logo.png" alt="" class="logo">
            <div class="logo-text">
                <h1 class="site-title">Games Fun</h1>
                <small class="site-description">A divers&atilde;o em suas m&atilde;os</small>
            </div>
        </a> <!-- #branding -->

        <div class="right-section pull-right">
            <a href="home" class="cart"> Home</a>
            
<%--             <% if (user.equals("Cliente")) { %> --%>
<!--             <a href="about.jsp" class="cart">Sobre</a> -->
<%--             <% } %> --%>
            
            <% if (user.equals("Adm")) { %>
            <a href="produtosLeitura" class="cart">Gestão de produtos</a>
            <% } %>
            
            
<!--             <a href="products.jsp" class="cart">Produtos</a> -->
            
            <% if (user.equals("Cliente")) { %>
            <a href="cupom" class="cart">Cupons</a>
            <% } %>
            
            
            
            <% if (user.equals("Cliente") || user.equals("Adm")) { %>
            <a href="pedidos" class="cart">Pedidos</a>
            <% } %>
            
            <% if (user.equals("Adm")) { %>
            <a href="usuarioLeituraLogin" class="cart">Clientes</a>
            <% } %>
            
            
            
            <% if (user.equals("Adm")) { %>
            <a href="AnalisePedidos" class="cart">An&aacute;lise de Pedidos</a>
            <% } %>
            
            <% if (user.equals("Cliente")) { %>
            <a href="usuarioLeituraLogin" class="cart">Meus dados</a>
            <% } %>
            
            
            <a href="#"  class="login-button">Login/Registrar</a>
            
            <% if (user.equals("Cliente")) { %>
            <a href="carrinho" ><i class="icon-cart-trolley" id="valorCarrinho" name="valorCarrinho"> </i></a>
            <% } %>
            
            
        </div> <!-- .right-section -->

        <div class="main-navigation">
            <button class="toggle-menu"><i class="fa fa-bars"></i></button>
            <ul class="menu">
                <li class="menu-item home current-menu-item"><a href="home"><i class="icon-home"></i></a></li>
                <li class="menu-item"><a href="">Jogos Playstation</a></li>
                <li class="menu-item"><a href="">Jogos XBOX</a></li>
                <li class="menu-item"><a href="">Jogos Nintendo</a></li>
                
            </ul> <!-- .menu -->
            

            <div class="mobile-navigation"></div> <!-- .mobile-navigation -->
        </div> <!-- .main-navigation -->
    </div> <!-- .container -->
    <br><br><br><br>
</div> <!-- .site-header -->


<script type="text/javascript">
(function($, document, window){
	
	$(document).ready(function(){

		// Cloning main navigation for mobile menu
		$(".mobile-navigation").append($(".main-navigation .menu").clone());

		// Mobile menu toggle 
		$(".toggle-menu").click(function(){
			$(".mobile-navigation").slideToggle();
		});

		$(".home-slider").flexslider({
			controlNav: true,
			directionNav: false
		});

		$(".login-button").on("click",function(){
			$(".overlay").fadeIn();
			$(".auth-popup").toggleClass("active");
		});

		$(".close, .overlay").on("click",function(){
			$(".overlay").fadeOut();
			$(".popup").toggleClass("active");
		});

		initLightbox({
	    	selector : '.product-images a',
	    	overlay: true,
	    	closeButton: true,
	    	arrow: true
	    });


		$(document).keyup(function(e) {
			if( $(".popup").hasClass("active")){
		  		if (e.keyCode === 27) {
		  			$(".overlay").fadeOut();
					$(".popup").toggleClass("active");
		  		}   
			}
		});
	});

	$(window).load(function(){

	});

})(jQuery, document, window);
</script>

<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<script type="text/javascript">

	window.execucao_alerta_register = function(obs)
      {
		var nome;
		var sobrenome;
		var nascimento;
		var genero;
		var tipoDocumento;
		var numeroDocumento;
		var validadeDocumento;
		var tipoTelefone;
		var telefone;
		var tipoCliente;
		var nomeEndereco;
		var tipoResidencia;
		var tipoLogradouro;
		var logradouro;
		var numero;
		var cep;
		var bairro;
		var pais;
		var estado;
		var cidade;
		var obs;
		var email;
		var nomeUsuario;
		var senha;
		var confirmacaoSenha;
		
		
		
		
		nome = $('#txtName').val();
		sobrenome = $('#txtLastName').val();
		nascimento = $('#txtBirthDate').val();
		genero = $('#txtGender').val();
		tipoDocumento = $('#txtTypeDocument').val();
		numeroDocumento = $('#txtDocument').val();
		validadeDocumento = $('#txtValidadeDocument').val();
		tipoTelefone = $('#txtPhoneType').val();
		telefone = $('#txtPhone').val();
		tipoCliente = $('#txtTypeClient').val();
		nomeEndereco = $('#txtNameEnder').val();
		tipoResidencia = $('#txtResidenceType').val();
		tipoLogradouro = $('#txtStreetType').val();
		logradouro = $('#txtStreetName').val();
		numero = $('#txtNumber').val();
		cep = $('#txtCep').val();
		bairro = $('#txtNeighnorhood').val();
		pais = $('#txtCountryHome').val();
		estado = $('#txtStateHome').val();
		cidade = $('#txtCity').val();
		obs = $('#txtObservation').val();
		email = $('#txtEmail').val();
		nomeUsuario = $('#txtLogin').val();
		senha = $('#txtPassword').val();
		confirmacaoSenha = $('#txtPasswordConfirmation').val();
		
		
// 		alert('nome '+!nome);
// 		alert('sobrenome '+!sobrenome);
// 		alert('nascimento '+!nascimento);
// 		alert('genero '+!genero);
// 		alert('tipoDocumento '+!tipoDocumento);
// 		alert('numeroDocumento '+!numeroDocumento);
// 		alert('validadeDocumento '+!validadeDocumento);
// 		alert('tipoTelefone '+!tipoTelefone);
// 		alert('telefone '+!telefone);
// 		alert('tipoCliente '+!tipoCliente);
// 		alert('nomeEndereco '+!nomeEndereco);
// 		alert('tipoResidencia '+!tipoResidencia);
// 		alert('tipoLogradouro '+!tipoLogradouro);
// 		alert('logradouro '+!logradouro);
// 		alert('numero '+!numero);
// 		alert('cep '+!cep);
// 		alert('bairro '+!bairro);
// 		alert('pais '+ !pais);
// 		alert('estado '+!estado);
// 		alert('cidade '+!cidade);
// 		alert('obs '+!obs);
// 		alert('email '+!email);
// 		alert('nomeUsuario '+!nomeUsuario);
// 		alert('senha '+ !senha );
// 		alert('confirmacaoSenha '+ !confirmacaoSenha );

		
		if(!((!nome)||
				(!sobrenome)||
				(!nascimento)||
				(!genero)||
				(!tipoDocumento)||
				(!numeroDocumento)||
				(!validadeDocumento)||
				(!tipoTelefone)||
				(!telefone)||
				(!tipoCliente)||
				(!nomeEndereco)||
				(!tipoResidencia)||
				(!tipoLogradouro)||
				(!logradouro)||
				(!numero)||
				(!cep)||
				(!bairro)||
				(!cidade)||
				(!email)||
				(!nomeUsuario)||
				(!senha )||
				(!confirmacaoSenha)))
			{
				Swal.fire({
					  title: 'Informações salvas com Sucesso!',
					  position: 'center',
					  icon: 'success',
					  confirmButtonText: 'OK'
					})
			}
			
		else {
			Swal.fire({
				  title: 'Infomações Faltantes, verifique!',
				  position: 'center',
				  icon: 'warning',
				  confirmButtonText: 'OK'
				})
		}
		
        
      }
	
	window.execucao_alerta = function(obs)
    {
      Swal.fire({
		  title: 'Informações salvas com Sucesso!',
		  position: 'center',
		  icon: 'success',
		  confirmButtonText: 'OK'
		})
    }
	window.execucao_alerta_carrinho = function(obs)
    {
      Swal.fire({
		  title: 'Informações salvas com Sucesso!',
		  position: 'center',
		  icon: 'success',
		  confirmButtonText: 'OK'
		}).then((result) => {
			  if (result.isConfirmed) {
				  window.location.href = "http://localhost:8080/ecommerce-video-game-projeto-less/carrinho";
				    
				  }
				})
    }
	
	window.execucao_alerta_fecharPedido = function(obs)
    {
      Swal.fire({
		  title: 'Informações salvas com Sucesso!',
		  position: 'center',
		  icon: 'success',
		  confirmButtonText: 'OK'
		}).then((result) => {
			  if (result.isConfirmed) {
				  window.location.href = "http://localhost:8080/ecommerce-video-game-projeto-less/fecharPedido";
				    
				  }
				})
    }
	
	window.execucao_alerta_atualizarPedido = function(obs)
    {
      Swal.fire({
		  title: 'Atualização salva com Sucesso!',
		  position: 'center',
		  icon: 'success',
		  confirmButtonText: 'OK'
		}).then((result) => {
			  if (result.isConfirmed) {
				  window.location.href = "http://localhost:8080/ecommerce-video-game-projeto-less/pedidos";
				    
				  }
				})
    }
	
	window.execucao_alerta_atualizarPedido_erro = function(obs)
    {
      Swal.fire({
		  title: 'Erro, status fora do fluxo esperado!',
		  position: 'center',
		  icon: 'error',
		  confirmButtonText: 'OK'
		}).then((result) => {
			  if (result.isConfirmed) {
				  window.location.href = "http://localhost:8080/ecommerce-video-game-projeto-less/pedidos";
				    
				  }
				})
    }
	
	window.execucao_alerta_erro_valor_carrinho_ultrapassado= function(obs)
    {
      Swal.fire({
		  title: 'Erro, o valor inserido ultrapassa o valor total do pedido!',
		  position: 'center',
		  icon: 'error',
		  confirmButtonText: 'OK'
		}).then((result) => {
			  if (result.isConfirmed) {
				  window.location.href = "http://localhost:8080/ecommerce-video-game-projeto-less/fecharPedido";
				    
				  }
				})
    }
	
	window.execucao_alerta_fecharPedidoCupom = function(obs)
    {
      Swal.fire({
		  title: 'Cupom aplicado com Sucesso!',
		  position: 'center',
		  icon: 'success',
		  confirmButtonText: 'OK'
		}).then((result) => {
			  if (result.isConfirmed) {
				  window.location.href = "http://localhost:8080/ecommerce-video-game-projeto-less/fecharPedido";
				    
				  }
				})
    }
	
	window.execucao_alerta_fechamentoPedido = function(obs)
    {
      Swal.fire({
		  title: 'Seu Pedido foi finalizado com Sucesso!!',
		  position: 'center',
		  icon: 'success',
		  confirmButtonText: 'OK'
		}).then((result) => {
			  if (result.isConfirmed) {
				  window.location.href = "http://localhost:8080/ecommerce-video-game-projeto-less/home";
				    
				  }
				})
    }
	
	window.inativacao_alerta = function(obs)
    {	
		
		Swal.fire({
			  title: 'Deseja realmente deletar?',
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  cancelButtonText: 'Não',
			  confirmButtonText: 'Sim',
			  
			}).then((result) => {
			  if (result.isConfirmed) {
			    Swal.fire(
			      'Deletado!',
			      'Registro deletado!',
			      'success'
			    )
			    document.getElementById('tabelaClientes').deleteRow(obs);
			  }
			})
    }
	
	window.inativacao_alerta_cartao = function(obs)
    {	
		
		Swal.fire({
			  title: 'Deseja realmente deletar?',
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  cancelButtonText: 'Não',
			  confirmButtonText: 'Sim',
			  
			}).then((result) => {
			  if (result.isConfirmed) {
			    Swal.fire(
			      'Deletado!',
			      'Registro deletado!',
			      'success'
			    )
			    document.getElementById('tabelaCartao').deleteRow(obs);
			  }
			})
    }
	
	
	window.inativacao_alerta_endereco = function(obs)
    {	
		
		Swal.fire({
			  title: 'Deseja realmente deletar?',
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  cancelButtonText: 'Não',
			  confirmButtonText: 'Sim',
			  
			}).then((result) => {
			  if (result.isConfirmed) {
			    Swal.fire(
			      'Deletado!',
			      'Registro deletado!',
			      'success'
			    )
			    document.getElementById('tabelaEndereco').deleteRow(obs);
			  }
			})
    }
	
	window.cancelamento_alerta_pedido = function(id_pedido)
    {	
		
		Swal.fire({
			  title: 'Deseja realmente cancelar esse pedido?',
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  cancelButtonText: 'Não',
			  confirmButtonText: 'Sim',
			  
			}).then((result) => {
			  if (result.isConfirmed) {
				  
				  $.ajax({
		 				url : "/ecommerce-video-game-projeto-less/cancelarPedido",
		 				type : "POST",
		 				
						data: {
							'ajax':'true',
							'id_pedido':id_pedido,
							
						},
		 				success : function(e) {	
		 					Swal.fire({
		 						  title: 'Cancelado!',
		 						  position: 'center',
		 						  icon: 'success',
		 						  confirmButtonText: 'OK'
		 						}).then((result) => {
		 							if (result.isConfirmed) {
		 								window.location.href = "http://localhost:8080/ecommerce-video-game-projeto-less/pedidos";
		 							}
		 							
		 						})
		 					
		 				},
		 				error: function(e) {
		 					alert("cancelamento com erro");
		 					
		 	            }  
		 			});
			    
			    
			  }
			})
    }
	
	
	window.finalizarPedido = function()
    {
      Swal.fire({
		  title: 'Pedido finalizado com Sucesso!',
		  position: 'center',
		  icon: 'success',
		  confirmButtonText: 'OK'
		}).then((result) => {
			if (result.isConfirmed) {
				window.location.href = "http://localhost:8080/ecommerce-video-game-projeto-less/";
			}
			
		})
		
		
    }
	
	window.alertFecharPedidoNaoZerado = function(obs)
    {
		Swal.fire({
			  icon: 'error',
			  title: 'Oops...',
			  text: 'Seu pedido ainda tem valores a serem pagos, por favor selecione mais formas de pagamento',
			})
    }
	window.alertFecharPedidoSemFrete = function(obs)
    {
		Swal.fire({
			  icon: 'error',
			  title: 'Oops...',
			  text: 'Não foi selecionado um endereço de entrega!',
			})
    }
	window.alertFecharPedidoSemCartão = function(obs)
    {
		Swal.fire({
			  icon: 'error',
			  title: 'Oops...',
			  text: 'Não foi selecionado nenhum cartão para pagamento deste pedido!',
			})
    }
	
	
	
	
	window.troca_alerta_pedido = function(obs)
    {	
		
		Swal.fire({
			  title: 'Deseja realmente solicitar a troca?',
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  cancelButtonText: 'Não',
			  confirmButtonText: 'Sim',
			  
			}).then((result) => {
			  if (result.isConfirmed) {
			    Swal.fire({
			    	title: 'Troca solicitada',
			    	
					icon: 'success',
					  
			    }).then((result) => {
			    	if (result.isConfirmed){
			    		var regform = document.getElementById("formTroca");
						regform.submit();
			    	}
			    	
			    })
			    
				
			  }
			})
    }
	
	
		
</script>



