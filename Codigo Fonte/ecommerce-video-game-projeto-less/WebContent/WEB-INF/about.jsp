<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1">
		
		<title>Ecommerce Video Game | Single</title>

		<!-- Loading third party fonts -->
		<link href="http://fonts.googleapis.com/css?family=Roboto:100,300,400,700|" rel="stylesheet" type="text/css">
		<link href="fonts/font-awesome.min.css" rel="stylesheet" type="text/css">
		<link href="fonts/lineo-icon/style.css" rel="stylesheet" type="text/css">

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
					<div class="page">
						
						<h2>Neque porro quisquam dolorem ipsum</h2>
						<p>Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam quis nostrum exercitationem ullam corporis suscipit laboriosam nisi ut aliquid ex ea commodi consequatur<a href="#"> quis autem vel eum iure </a>reprehenderit qui in ea voluptate velit esse quam nihil molestiae. At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa officia deserunt mollitia animi.</p>

						<h2>Nemo enim ipsam voluptatem quia voluptas</h2>
						<p>Vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est.</p>
						<ol>
							<li>Phasellus vitae enim non quam adipiscing suscipit nec quis mauris.</li>
							<li>Vivamus feugiat erat vel pellentesque luctus.</li>
							<li>Nullam ac urna facilisis, fringilla arcu in, sodales velit.</li>
							<li>Nam tempus nisi ornare urna mollis cursus.</li>
						</ol>

						<div class="row">
							<div class="col-md-3">
								<div class="feature">
									<div class="feature-icon">
										<i class="icon-box-check"></i>
									</div>
									<h3 class="feature-title">Safe pack</h3>
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt.</p>
								</div> <!-- .feature -->
							</div> <!-- .column -->
							<div class="col-md-3">
								<div class="feature">
									<div class="feature-icon">
										<i class="icon-plane-globe"></i>
									</div>
									<h3 class="feature-title">World wide</h3>
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt.</p>
								</div> <!-- .feature -->
							</div> <!-- .column -->
							<div class="col-md-3">
								<div class="feature">
									<div class="feature-icon">
										<i class="icon-car"></i>
									</div>
									<h3 class="feature-title">Fast Delivery</h3>
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt.</p>
								</div> <!-- .feature -->
							</div> <!-- .column -->
							<div class="col-md-3">
								<div class="feature">
									<div class="feature-icon">
										<i class="icon-customer-service"></i>
									</div>
									<h3 class="feature-title">24/h Support</h3>
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt.</p>
								</div> <!-- .feature -->
							</div> <!-- .column -->
						</div> <!-- .row -->

						<h2>Nemo enim ipsam voluptatem quia voluptas</h2>
						<p>Vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est.</p>
						
					</div>
				</div> <!-- .container -->
			</main> <!-- .main-content -->

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
				</div> <!-- .column -->
				<div class="col-md-6">
					<h2 class="section-title">Crie sua conta</h2>
					<form action="CtrlCliente" method="post">
						<input type="text" name="username" id="username" placeholder="Username...">
						<input type="text" name="emailAddress" id="emailAddress" placeholder="Email address...">
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
		
	</body>

</html>