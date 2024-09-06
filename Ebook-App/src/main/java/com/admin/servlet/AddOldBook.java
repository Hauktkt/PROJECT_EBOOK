package com.admin.servlet;

import java.io.File;
import java.io.IOException;


import com.DAO.BookDAOImpl;
import com.DB.DBConnect;
import com.entity.BookDtls;


import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

@WebServlet("/add_old_book")
@MultipartConfig


public class AddOldBook extends HttpServlet {
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		
		try {
			String bookName = req.getParameter("bname");
			String author = req.getParameter("author");
			String price = req.getParameter("price");
			String categories = "Old";
			String status = "Active";
			Part part = req.getPart("bimg");
			String fileName = part.getSubmittedFileName();
			
			String useremail = req.getParameter("user");
			
			
			BookDtls b = new BookDtls(bookName, author, price, categories, status, fileName, useremail);
			
			
		
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());			
			boolean f = dao.addBook(b);
			
			HttpSession session = req.getSession();
			
			if (f) {
				String path = getServletContext().getRealPath("")+ "book";
			
//				File file = new File(path);
				
				part.write(path+File.separator + fileName);
			
				session.setAttribute("succMsg", "Book Add Succesfully");
				resp.sendRedirect("setting.jsp");
				
			}else {
			
				session.setAttribute("failedMsg", "Something wrong on Server");
				resp.sendRedirect("setting.jsp");
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
}
