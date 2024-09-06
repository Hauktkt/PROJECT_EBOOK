<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	<title>Admin: All Books</title>
	<%@include file="allCss.jsp"%>
	<link rel = "stylesheet" href = "table.css">
</head>
<body>
	<c:if test="${empty userobj}">
		<c:redirect url="../login.jsp" />
	</c:if>
	<c:if test="${not empty succMsg}">
		<p class="text-center text-success">${succMsg}</p>
		<c:remove var="succMsg" scope="session" />
	</c:if>

	<c:if test="${not empty failedMsg}">
		<p class="text-center text-danger">${failedMsg}</p>
		<c:remove var="failedMsg" scope="session" />
	</c:if>
	<div class="card" style="border-radius: 30px;box-shadow: 0 0 4px rgba(0, 0, 0, 0.5);">
		<div class="table-users" style="width:1000px;margin-top:40px;margin-bottom:40px;">
			<div class="header">ALL BOOK</div>
			<table class="table table-striped">
				<thead class="bg-primary text-white">
					<tr style="text-align:center">
						<th scope="col">ID</th>
						<th scope="col">Image</th>
						<th scope="col">Book Name</th>
						<th scope="col">Author</th>
						<th scope="col">Price</th>
						<th scope="col">Categories</th>
						<th scope="col">Status</th>
						<th scope="col">Seller</th>
						<th scope="col"></th>
					</tr>
				</thead>
				<tbody>
		
					<%
					BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
					List<BookDtls> list = dao.getAllBooks();
					for (BookDtls b : list) {
					%>
					<tr>
						<td><%=b.getBookId()%></td>
						<td><img src="../book/<%=b.getPhotoName()%>"
							style="width: 50px; height: 50px;"></td>
						<td><%=b.getBookName()%></td>
						<td><%=b.getAuthor()%></td>
						<td><%=b.getPrice()%></td>
						<td><%=b.getBookCategory()%></td>
						<td><%=b.getStatus()%></td>
						<td><%=b.getEmail()%></td>
						<td>
							<a href="edit_books.jsp?id=<%=b.getBookId()%>"><i class="fa-regular fa-pen-to-square" ></i> </a>
							<a href="../delete?id=<%=b.getBookId()%>"><i class="fa-solid fa-trash" ></i></a>
						</td>
					</tr>
					
					<%
					}
					%>
		
				</tbody>
			</table>
		</div>
	</div>
	
</body>
</html>