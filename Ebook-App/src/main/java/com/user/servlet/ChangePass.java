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

@WebServlet("/change_pass")
public class ChangePass extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try 
		{
			int id = Integer.parseInt(req.getParameter("id"));
			String currentpass = req.getParameter("currentpass");
			String newpass = req.getParameter("newpass");
			String confirmpass = req.getParameter("confirmpass");
			User us = new User();
			us.setId(id);
			us.setPassword(newpass);
			
			HttpSession session = req.getSession();
			UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());
			
			boolean f = dao.checkPassword(id, currentpass);
			if(f) {
				if(newpass.equals(confirmpass)) {
					boolean f2 = dao.changepass(us);
					if(f2)
					{
						session.setAttribute("succMsg", "Password Update Successfully");
						resp.sendRedirect("login.jsp");
						session.removeAttribute("userobj");
					}else
					{
						session.setAttribute("failedMsg", "SomeThing Wrong On Server...");
						resp.sendRedirect("setting.jsp");
					}
				}
				else {
					session.setAttribute("failedMsg", "Confirms Password Is Incorrect");
					resp.sendRedirect("setting.jsp");
				}
			}
			else
			{
				session.setAttribute("failedMsg", "Your Password Is Incorrect");
				resp.sendRedirect("setting.jsp");
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	

}
