<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>
	<head>
		<title>E-Pass</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	</head>
	                    <h1 style="text-align:center">COVID19 EPASS</h1> 
	                    <h2 style="text-align:right;"><a href="index.jsp">Logout</a></h2>    
	                    <body style="background-color:pink;">                                                                                                                                                                                                                                                                       
						            <% 	
										
									try
									{
										Cookie[] cookies = request.getCookies();

										if (cookies != null) {
										 for (Cookie cookie : cookies) {
										   if (cookie.getName().equals("id")) {
										     
												ResultSet resultSet = null;
												Class.forName("com.mysql.cj.jdbc.Driver");
												Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/covid19", "root", "sandhya");
												Statement st=conn.createStatement();
												String sql="Select * from userdetails where Email='"+cookie.getValue()+"'";
												resultSet = st.executeQuery(sql);
													while (resultSet.next()) {
														
													%>
											
													<div class="row"  style="font-size: 25px;padding: 15px;">
													<div class="col-sm-2" style="text-align:center">NAME:<%=resultSet.getString("FullNameOfTheApplicant") %></div>
													<br>
													<div class="col-sm-2" style="text-align:center">MOBILENO:<%=resultSet.getString("MobileNo") %></div>
													<br>
													<div class="col-sm-2" style="text-align:center">EMAIL:<%=resultSet.getString("Email") %></div>
													<br>
													<div class="col-sm-2" style="text-align:center">VEHICLE.REG.NO:<%=resultSet.getString("VehicleRegistrationNo") %></div>
													<br>
													<div class="col-sm-2" style="text-align:center">FROMLOCATION:<%=resultSet.getString("FromLocation") %></div>
													<br>
													<div class="col-sm-2" style="text-align:center">TOLOCATION:<%=resultSet.getString("ToLocation") %></div>
													<br>
													<div class="col-sm-2" style="text-align:center">PASSFROMDATE:<%=resultSet.getString("PassFromDate") %></div>
													<br>
													<div class="col-sm-2" style="text-align:center">PASSTODATE:<%=resultSet.getString("PassToDate") %></div>
													<br>
													<div class="col-sm-2" style="text-align:center">STATUS:<%=resultSet.getString("epassStatus") %></div>
													<br>
													</div>													
													
							
													<%
													}
										    }
										  }
										}
									
									}
									catch(Exception e)
									{
									System.out.print(e);
									e.printStackTrace();
									}
									
									%>