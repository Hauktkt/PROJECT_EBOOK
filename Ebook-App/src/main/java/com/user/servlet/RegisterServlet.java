package com.user.servlet;

import java.io.IOException;

import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.User;



@WebServlet("/register")
public class RegisterServlet extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		try
		{
			String name = req.getParameter("fname");
			String email = req.getParameter("email");
			String phno = req.getParameter("phno");
			String password = req.getParameter("password");
			String check = req.getParameter("check");
			
			User us = new User();
			us.setName(name);
			us.setEmail(email);
			us.setPhno(phno);
			us.setPassword(password);
			
			HttpSession session = req.getSession();
			
			if(check != null) {
				UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());
				boolean f2 = dao.checkUser(email);
				
				if(f2)
				{
					boolean f = dao.userRegister(us);
					if(f)
					{			
						session.setAttribute("succMsg", "Registration Succesfully...");
						resp.sendRedirect("register.jsp");
						
					} else {
						session.setAttribute("failedMsg", "Something wrong on server...");
						resp.sendRedirect("register.jsp");
					}
				}
				else
				{
					session.setAttribute("failedMsg", "User Already Exist Try Another Email Id");
					resp.sendRedirect("register.jsp");
				}
				
			} else {
				session.setAttribute("failedMsg", "Please Check Agree and Terms Condition");
				resp.sendRedirect("register.jsp");
			}

		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
}
