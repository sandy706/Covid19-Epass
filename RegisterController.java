package com.main.controllers;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.main.entity.User;
import com.main.util.JConnect;

@WebServlet("/registerController")
public class RegisterController  extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException{
			
			Statement st=JConnect.getStatement();
		
			RequestDispatcher rd=null;
			ResultSet rs=null;
			
			User user=new User();
			user.setName(request.getParameter("name"));
			user.setEmail(request.getParameter("email"));
			user.setPassword(request.getParameter("password"));
			user.setConfirm(request.getParameter("confirm"));
			
			try {
				rs = st.executeQuery("select * from user where email='"+user.getEmail()+"'");
				if(rs.next()){
					rd=request.getRequestDispatcher("index.jsp");
					request.setAttribute("msg","Email already exists");
					rd.forward(request, response);
				}
				else {
					if(user.getPassword().equals(user.getConfirm())){
						rd=request.getRequestDispatcher("index.jsp");
						request.setAttribute("msg","Password and Confirm Password doesn't match");
						rd.forward(request, response);
				       }
				  else{
						st.executeUpdate("insert into user values('"+user.getName()+"','"+user.getEmail()+"','"+user.getPassword()+"')");			
						rd=request.getRequestDispatcher("login.jsp");
						request.setAttribute("msg","Registered Successfully. You can login now!");
						rd.forward(request, response);
				     }
					}
				
			}catch (SQLException e1){
				e1.printStackTrace();
			}
	
	}
	
	protected void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException{
		doGet(request,response);
	}
	
	
}