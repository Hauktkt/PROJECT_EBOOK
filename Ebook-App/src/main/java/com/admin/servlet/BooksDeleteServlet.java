package com.admin.servlet;

import java.io.IOException;

import com.DAO.BookDAOImpl;
import com.DB.DBConnect;

import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

@WebServlet("/delete")
public class BooksDeleteServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try
		{
			int id = Integer.parseInt(req.getParameter("id"));
			
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
			
			boolean f = dao.deleteBooks(id);
			
			HttpSession session = req.getSession();
			if(f)
			{
				
				session.setAttribute("succMsg", "Delete Book Successfully...");
				resp.sendRedirect("admin/home.jsp");
				
			}else
			{
				session.setAttribute("failedMsg", "Something wrong on server");
				resp.sendRedirect("admin/home.jsp");
			}
			
		} catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
