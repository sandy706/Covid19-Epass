<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>Login</title>
		<link rel="stylesheet" type="text/css" href="assets/css/main.css">
	</head>
	<body>
						<% 
							if(request.getAttribute("msg")!=null){
								out.println(request.getAttribute("msg"));
							}
						%>
						
					
		<body class="is-preload">
		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Main -->
					<div id="main">
						<div class="inner">

							<!-- Header -->
								<header id="header">
									<h2>REGISTER</h2>
									
								</header>
				
					<!-- Banner -->
								<section id="banner">
									<div class="content">
									
											               <div class="row">

                    <div class="col-md-12 col-sm-12">
                         <form id="contact-form" role="form" action="RegisterController" method="post">
                              

                              <div class="col-md-12 col-sm-12">
                        
                                   <input type="text" class="form-control" placeholder="Enter Name" name="name" required="">
                    <br>               
                                   <input type="text" class="form-control" placeholder="Enter Email" name="email" required="">
                    <br>               
                                   <input type="password" class="form-control" placeholder="Enter Password" name="password" required=" ">
                    <br>               
                                   <input type="password" class="form-control" placeholder="Confirm password" name="password" required="">
                    <br>               
                                  
                                   
                              </div>

                              <div class="col-md-4 col-sm-12">
                                   <input type="submit" class="form-control" name="REGISTER" value="REGISTER">
                              </div>

                         </form>
                    </div>

                    

               </div>
									
									
									
									
									</div>
									
								</section>

						</div>
					</div>

				<!-- Sidebar -->
					<div id="sidebar">
						<div class="inner">

							<!-- Menu -->
								<nav id="menu">
									<header class="major">
									<h1>Covid19 ePass</h1>
										<h2>Menu</h2>
									</header>
									<ul>
										<li><a href="login.jsp">LOGIN</a></li>
										<li><a href="index.jsp">REGISTER</a></li>
										
									</ul>
								</nav>


							

						</div>
					</div>

			</div>

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>
				
	</body>
</html>