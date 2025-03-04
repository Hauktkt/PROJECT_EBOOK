package com.user.servlet;

import java.io.IOException;

import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/update_profile")
public class UpdateProfileServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try 
		{
			int id = Integer.parseInt(req.getParameter("id"));
			String name = req.getParameter("fname");
			String email = req.getParameter("email");
			String phno = req.getParameter("phno");
			
			User us = new User();
			us.setId(id);
			us.setName(name);
			us.setEmail(email);
			us.setPhno(phno);
			
			HttpSession session = req.getSession();
			UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());
			
			boolean f2 = dao.updateProfile(us);
			if(f2)
			{
				session.setAttribute("succMsg", "Profile Update Successfully");
				resp.sendRedirect("setting.jsp");

			    // Cập nhật lại session
			    session.setAttribute("userobj", us);
			}else
			{
				session.setAttribute("failedMsg", "SomeThing Wrong On Server...");
				resp.sendRedirect("setting.jsp");
			}
				
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	

}
