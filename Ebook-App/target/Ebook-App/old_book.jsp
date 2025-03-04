<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="com.entity.User"%>
<%@page import="com.DB.*"%>
<%@page import="java.sql.*"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>User: Old Book</title>
	<%@include file="all_component/allCss.jsp"%>
	<link rel = "stylesheet" href = "all_component/setting.css">

</head>
<body style="background-color: #f0f1f2;">

	<c:if test="${not empty succMsg }">
		<div class = "alert alert-success text-center">${succMsg }</div>
		<c:remove var="succMsg" scope="session" />
	</c:if>

	<div class="card">
		<div class="table-users">
			<div class="header">OLD_BOOK</div>
			<table class="table table-striped">
				<thead class="bg-primary text-white">
					<tr style="text-align:center">
						<th scope="col">Book Name</th>
						<th scope="col">Author</th>
						<th scope="col">Price</th>
						<th scope="col">Category</th>
						<th scope="col"></th>
					</tr>
				</thead>
				<tbody>
	
					<%
					User u = (User) session.getAttribute("userobj");
					String email = u.getEmail();
					BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
					List<BookDtls> list = dao.getBookByOld(email, "Old");
					for (BookDtls b : list) {
					%>
					<tr>
						<td><%=b.getBookName()%></td>
						<td><%=b.getAuthor()%></td>
						<td><%=b.getPrice()%></td>
						<td><%=b.getBookCategory()%></td>
						<td><a href="delete_old_book?em=<%=email%>&&id=<%=b.getBookId() %>"
							><i class="fa-regular fa-circle-xmark fa-1x" title="Remove"></i></a></td>
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