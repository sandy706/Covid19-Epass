package com.main.controllers;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.main.entity.User;
import com.main.util.JConnect;

@WebServlet("/loginController")
public class LoginController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		
		String email=request.getParameter("email");
		String password=request.getParameter("password");
	
		User user=new User();
		
		Statement st=JConnect.getStatement();
		try {
			ResultSet rs=st.executeQuery("select * from user where email='"+email+"' and password='" + password + "'");
			if(rs.next()){
				user.setEmail(request.getParameter("email"));
				user.setPassword(request.getParameter("password"));
				
				Cookie loginCookie=new Cookie("id",email);
				response.addCookie(loginCookie);
				response.sendRedirect("Applyepass.jsp");
			  }
			   else if(email.equals("admin@gmail.com") && password.equals("admin"))
				{
					response.sendRedirect("Admin.jsp");
				}
			
			 else{
				RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
				request.setAttribute("msg","Email doesn't exists.create an account");
				rd.forward(request,response);
			}
			
			
		} catch (SQLException e){
			e.printStackTrace();
		}
		
	}
	
	protected void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		doGet(request,response);
	}
	
}