<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@page isELIgnored="false"%>
<%@page import="com.DB.*"%>
<%@page import="java.sql.*"%>
<%@page import="com.DAO.BookOrderImpl"%>
<%@page import="com.entity.Book_Order"%>
<%@page import="com.entity.User"%>
<%@page import="java.util.List"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Order book</title>
	<%@include file="all_component/allCss.jsp"%>
	<link rel = "stylesheet" href = "all_component/table.css">
</head>

<body style="background-color: #f0f1f2;">
	<c:if test="${empty userobj}">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>

	<div class="card" style="border-radius: 30px;box-shadow: 0 0 4px rgba(0, 0, 0, 0.5);">
		<div class="table-users" style="width:1000px;margin-top:40px;margin-bottom:40px;">
			<div class="header">BILL'S ${userobj.name}</div>
			<table class="table table-striped mt-3">
				<thead class="bg-primary text-white">
					<tr style="text-align:center">
						<th scope="col">Order Id</th>
						<th scope="col">Name</th>
						<th scope="col">Book Name</th>
						<th scope="col">Author</th>
						<th scope="col">Price</th>
						<th scope="col">Payment Type</th>
						<th scope="col">Date</th>
						
					</tr>
				</thead>
	
				<tbody>
					<%
					User u = (User) session.getAttribute("userobj");
					BookOrderImpl dao = new BookOrderImpl(DBConnect.getConn());
					List<Book_Order> blist = dao.getBook(u.getEmail());
					for (Book_Order b : blist) {
					%>
	
					<tr>
						<td scope="row"><%=b.getOrderId()%></td>
						<td><%=b.getUserName()%></td>
						<td><%=b.getBookName()%></td>
						<td><%=b.getAuthor()%></td>
						<td><%=b.getPrice()%></td>
						<td><%=b.getPaymentType()%></td>
						<td><%=b.getDate()%></td>
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