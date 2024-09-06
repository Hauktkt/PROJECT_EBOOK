<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@page import="com.DB.*"%>
<%@page import="java.sql.*"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.BookDtls"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Admin: Add Books</title>
	<%@include file="allCss.jsp"%>
	<link rel = "stylesheet" href = "giaodien.css">
	<link rel = "stylesheet" href = "style.css">
</head>
<body style="background-color: #f0f2f2;">
	<%@include file="navbar.jsp"%>
		<div class="container" style="display: flex;justify-content: center;">
	
	<div class="card" style="border-radius: 30px;box-shadow: 0 0 4px rgba(0, 0, 0, 0.5);width: 800px;margin-top:30px">
		<div class="card-body">
			<h4 class="text-center">Edit Books</h4>

			<%
			int id = Integer.parseInt(request.getParameter("id"));
			BookDAOImpl dao1 = new BookDAOImpl(DBConnect.getConn());
			BookDtls b = dao1.getBookById(id);
			%>


			<form action="../editbooks" method="POST" style="display: flex;justify-content: center;align-items: center;">
				<input type="hidden" name="id" value="<%=b.getBookId()%>">
				<div>
					<div class="form-group-sell" style="margin-bottom: 20px;display: flex;">
						<div class="form-group">
							<label class="label-text" for="exampleInputEmail1">BOOK NAME</label> <input
								name="bname" type="text" class="form-control"
								id="exampleInputEmail1" aria-describedby="emailHelp"
								value="<%=b.getBookName()%>">
						</div>

						<div style="margin-left: 50px;margin-right: 50px;">
							<label class="label-text" for="exampleInputEmail1">AUTHOR NAME</label> <input
								name="author" type="text" class="form-control"
								id="exampleInputEmail1" aria-describedby="emailHelp"
								value="<%=b.getAuthor()%>">
						</div>
					</div>
					<div class="form-group-sell" style="margin-bottom: 20px;display: flex;">
						<div class="form-group">
							<label class="label-text" for="exampleInputPassword1">PRICE</label> <input
								name="price" type="number" class="form-control"
								id="exampleInputPassword1" value="<%=b.getPrice()%>">
						</div>

						<div style="margin-left: 50px;margin-right: 50px;">
							<label class="label-text" for="inputState">BOOK STATUS</label> 
							<select style="width: 220px;height: 50px;"
								id="inputState" name="bstatus" class="form-control">
								<%
								if ("Active".equals(b.getStatus())) {
								%>
								<option value="Active">Active</option>
								<option value="Inactive">Inactive</option>
								<%
								} else {
								%>
								<option value="Inactive">Inactive</option>
								<option value="Active">Active</option>
								<%
								}
								%>
							</select>
						</div>
						<div style="display: flex;align-items: center;justify-content: center;">
							<button type="submit" class="btn-active-modal">Add</button>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
	</div>
</body>
</html>