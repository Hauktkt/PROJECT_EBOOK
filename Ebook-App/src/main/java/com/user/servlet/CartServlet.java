package com.user.servlet;

import java.io.IOException;

import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

import com.DB.DBConnect;
import com.entity.BookDtls;
import com.entity.Cart;
import com.DAO.BookDAOImpl;
import com.DAO.CartDAOImpl;

@WebServlet("/cart")
public class CartServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			
			int bid = Integer.parseInt(req.getParameter("bid"));
			int uid = Integer.parseInt(req.getParameter("uid"));
			
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
			BookDtls b = dao.getBookById(bid);
			
			Cart c = new Cart();
			c.setBid(bid);
			c.setUserId(uid);
			c.setBookName(b.getBookName());
			c.setAuthor(b.getAuthor());
			c.setPrice(Double.parseDouble(b.getPrice()));
			c.setTotalPrice(Double.parseDouble(b.getPrice()));
			c.setPhotoName(b.getPhotoName());
			CartDAOImpl dao2 = new CartDAOImpl(DBConnect.getConn());
			boolean f = dao2.addCart(c);
			
			HttpSession session = req.getSession();
			
			if(f)
			{
				session.setAttribute("addCart", "Book Added To Cart");
				resp.sendRedirect("all_new_book.jsp");
			}
			else
			{
				session.setAttribute("failed", "Something Wrong On Server ");
				resp.sendRedirect("all_new_book.jsp");
			}
			
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
