<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="java.sql.*,java.util.*"%>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>
	<head>
		<title>E-Pass</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
	</head>
	<body class="is-preload">
   
		<!-- Wrapper -->
		<div id="wrapper">
				<!-- Main -->
					<div id="main">
						<div class="inner">

							<!-- Header -->
								<header id="header">
									<h2>ADMIN</h2>
									
								</header>
 						<!-- Banner -->
								<section id="banner">
									<div class="content">
									
											               <div class="row">

                    
                         <form id="contact-form" role="form" action="Admin.jsp" method="post">
                              

                             <div class="row"  style="font-size: 12px;padding: 10px;background-color:grey;color:White;">
                                              <div class="col-sm-3" style="width:100px">Id</div>
										      <div class="col-sm-3" style="width:100px">Name</div>
										      <div class="col-sm-3" style="width:100px">Mobile</div>
										      <div class="col-sm-3" style="width:100px">VehicleRegNo</div>
										      <div class="col-sm-3" style="width:100px">FromDate</div>
										      <div class="col-sm-3" style="width:100px">ToDate</div>
										      <div class="col-sm-3" style="width:100px">PurposeOfTravel</div>
										      <div class="col-sm-3" style="width:100px">FromLocation</div>
										      <div class="col-sm-3" style="width:100px">ToLocation</div>
										      <div class="col-sm-3" style="width:100px">Status</div>
										     
										</div> 
                              		
                                   

									<%
									
									
									try
									{
										
									ResultSet resultSet = null;
									Class.forName("com.mysql.cj.jdbc.Driver");
									Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/covid19", "root", "sandhya");
									Statement st=conn.createStatement();
									String sql="Select * from userdetails ";
									resultSet = st.executeQuery(sql);
										while (resultSet.next()) {
											
										%>
										<div class="row"  style="font-size: 12px;padding: 5px;">
									    <div class="col-sm-2" style="width:100px"><%=resultSet.getString("Id") %></div>
										<div class="col-sm-2" style="width:100px"><%=resultSet.getString("FullNameOfTheApplicant") %></div>
										<div class="col-sm-2" style="width:100px"><%=resultSet.getString("MobileNo") %></div>
										<div class="col-sm-2" style="width:100px"><%=resultSet.getString("VehicleRegistrationNo") %></div>
										<div class="col-sm-2" style="width:100px"><%=resultSet.getString("PassFromDate") %></div>
										<div class="col-sm-2" style="width:100px"><%=resultSet.getString("PassToDate") %></div>
										<div class="col-sm-2" style="width:100px"><%=resultSet.getString("PurposeOfTravel") %></div>
										<div class="col-sm-2" style="width:100px"><%=resultSet.getString("FromLocation") %></div>
										<div class="col-sm-2" style="width:100px"><%=resultSet.getString("ToLocation") %></div>
										<div class="col-sm-2" style="width:100px"><%=resultSet.getString("epassStatus") %></div>
										
										
										
										
										
										</div>
										<hr>
										<%
										}
									}
									catch(Exception e)
									{
									System.out.print(e);
									e.printStackTrace();
									}
									
									%>

                         </form>
                    

                    

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
										<h2>Menu</h2>
									</header>
									<ul>
										<li><a href="Admin.jsp">Admin</a></li>
										<li><a href="index.jsp">Logout</a></li>
									</ul>
								</nav>


							
						</div>
					</div>

			</div>

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/main.js"></script>
			<script src="assets/js/util.js"></script>

	</body>
</html>