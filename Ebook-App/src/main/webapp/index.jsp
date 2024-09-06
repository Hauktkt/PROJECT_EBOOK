<%@page import="com.DB.*"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="com.entity.User"%>
<%@page import="com.entity.Cart"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>EBook: index</title>
	<%@include file="all_component/allCss.jsp"%>
	
	<style type="text/css">
	.back-img {
		background: url("img/book_ne.jpg");
		height: 33vh;
		width: 100%;
		background-repeat: no-repeat;
		background-size: cover;
	}
	
	.crd-ho:hover {
		background-color: #fcf7f7;
	}
	</style>
	
</head>

<body style="background-color: #f7f7f7;">
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script> 
	<c:if test="${not empty failedMsg}">
	    <script>
	        $(document).ready(function () {
	            alert("${failedMsg}");
	        });
	    </script>
	    <c:remove var="failedMsg" scope="session" />
	</c:if>	
	
	<c:if test="${not empty succMsg}">
	    <script>
	        $(document).ready(function () {
	            alert("${succMsg}");
	        });
	    </script>
	    <c:remove var="succMsg" scope="session" />
	</c:if>

	<%
	User u = (User) session.getAttribute("userobj");
	%>



	<%@include file="all_component/navbar.jsp"%>
	<div class="container-fluid back-img"></div>


	<!-- Start All Book -->

	<div class="container" style="margin-top: 30px;">
		<div style="background: beige;width: 1140px;box-shadow: 0 0 4px rgba(0, 0, 0, 0.5);border-radius: 30px;border: 1px solid #ccc;">
			<h3 class=" text-center" style="padding-top:20px">ALL BOOK</h3>
			<div class="row" >
	
				<%
				BookDAOImpl dao2 = new BookDAOImpl(DBConnect.getConn());
				List<BookDtls> list2 = dao2.getRecentBooks();
				for (BookDtls b : list2) {
				%>
				<div class="book-all">
					<div class="cont-book">
						<div class="card-body text-center">
							<div class="css-img-index">
								<div>
	
									<img data-perfmatters-preload="" width="110" height="150" src="book/<%=b.getPhotoName()%>" sizes="(max-width: 110px) 100vw, 110px" class="img-responsive" style="border: 1px solid #a6a2a2;" alt="the-gioi-khong-xxoo">
								</div>
								<div class="book-info">
									<p class="book-name"><%=b.getBookName()%></p>
									<a href="">
	                    				<div>
											<div class="">
												<i class="ion-ios-star ratings_stars rating_current"></i>
												<i class="ion-ios-star ratings_stars rating_current"></i>
												<i class="ion-ios-star ratings_stars rating_current"></i>
												<i class="ion-ios-star ratings_stars rating_current"></i>
												<i class="ion-ios-star ratings_stars rating_current"></i>
											</div>                    
										</div>
									</a>
									<p><i class="fas fa-user-edit" style="padding-right:10px"></i><%=b.getAuthor()%></p>
							
									<p><i class="fas fa-tags" style="padding-right:10px"></i>
									<%
									if (b.getBookCategory().equals("Old")) {
									%>
									Categories:
									<%=b.getBookCategory()%></p>
									
									<div style="padding-top:15px">
										<a href="view_books.jsp?bid=<%=b.getBookId()%>" class="btn btn-success btn-sm ml-1">
											<i class="fa-solid fa-circle-info"></i> Details
										</a>
									</div>
								</div>
							</div>
							<div>
								<%
								} else {	
								%>
									Categories:
									<%=b.getBookCategory()%></p>
								<div style="padding-top:15px">
									<a href="view_books.jsp?bid=<%=b.getBookId()%>" class="btn btn-success btn-sm ml-1">
										<i class="fa-solid fa-circle-info"></i> Details
									</a>
								</div>
								</div>
						</div>
							<div>
								<%
								}
								%>
							</div>
					</div>
				</div>
			</div>
				<%
				}
				%>
			</div>
		</div>
		<div class="text-center mt-1" style="margin-top:20px!important">
			<a href="all_recent_book.jsp"
				class="btn btn-danger btn-sm text-white"><i
				class="fa-solid fa-list"></i> View All</a>
		</div>
	</div>
	<!-- End All Book -->

	<!-- <hr> -->
	<br>

	<!-- Start New Book -->
	<div class="container">
		<div style="background: beige;width: 1140px;box-shadow: 0 0 4px rgba(0, 0, 0, 0.5);border-radius: 30px;border: 1px solid #ccc;">
			<h3 class=" text-center" style="padding-top:20px">NEW BOOK</h3>
			<div class="row" >
	
				<%
				BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
				List<BookDtls> list = dao.getNewBook();
				for (BookDtls b : list) {
				%>
				<div class="book-all">
					<div class="cont-book">
						<div class="card-body text-center">
							<div class="css-img-index">
								<div>
	
									<img data-perfmatters-preload="" width="110" height="150" src="book/<%=b.getPhotoName()%>" sizes="(max-width: 110px) 100vw, 110px" class="img-responsive" style="border: 1px solid #a6a2a2;" alt="the-gioi-khong-xxoo">
								</div>
								<div class="book-info">
									<p class="book-name"><%=b.getBookName()%></p>
									<a href="">
	                    				<div>
											<div class="">
												<i class="ion-ios-star ratings_stars rating_current"></i>
												<i class="ion-ios-star ratings_stars rating_current"></i>
												<i class="ion-ios-star ratings_stars rating_current"></i>
												<i class="ion-ios-star ratings_stars rating_current"></i>
												<i class="ion-ios-star ratings_stars rating_current"></i>
											</div>                    
										</div>
									</a>
									<p><i class="fas fa-user-edit" style="padding-right:10px"></i><%=b.getAuthor()%></p>
							
									<p><i class="fas fa-tags" style="padding-right:10px"></i>Categories:<%=b.getBookCategory()%></p>
									
									<div style="padding-top:15px">
										<a href="view_books.jsp?bid=<%=b.getBookId()%>" class="btn btn-success btn-sm ml-1">
											<i class="fa-solid fa-circle-info"></i> Details
										</a>
									</div>
								</div>
							</div>
					</div>
				</div>
			</div>
				<%
				}
				%>
			</div>
		</div>
		<div class="text-center mt-1" style="margin-top:20px!important">
			<a href="all_new_book.jsp"
				class="btn btn-danger btn-sm text-white"><i
				class="fa-solid fa-list"></i> View All</a>
		</div>
	</div>
	<!-- End New Book -->

	<!-- <hr> -->
	<br>
	
	<!-- Start Old Book -->
	<div class="container">
		<div style="background: beige;width: 1140px;box-shadow: 0 0 4px rgba(0, 0, 0, 0.5);border-radius: 30px;border: 1px solid #ccc;">
			<h3 class=" text-center" style="padding-top:20px">OLD BOOK</h3>
			<div class="row" >
	
				<%
				BookDAOImpl dao3 = new BookDAOImpl(DBConnect.getConn());
				List<BookDtls> list3 = dao3.getOldBooks();
				for (BookDtls b : list3) {
				%>
				<div class="book-all">
					<div class="cont-book">
						<div class="card-body text-center">
							<div class="css-img-index">
								<div>
	
									<img data-perfmatters-preload="" width="110" height="150" src="book/<%=b.getPhotoName()%>" sizes="(max-width: 110px) 100vw, 110px" class="img-responsive" style="border: 1px solid #a6a2a2;" alt="the-gioi-khong-xxoo">
								</div>
								<div class="book-info">
									<p class="book-name"><%=b.getBookName()%></p>
									<a href="">
	                    				<div>
											<div class="">
												<i class="ion-ios-star ratings_stars rating_current"></i>
												<i class="ion-ios-star ratings_stars rating_current"></i>
												<i class="ion-ios-star ratings_stars rating_current"></i>
												<i class="ion-ios-star ratings_stars rating_current"></i>
												<i class="ion-ios-star ratings_stars rating_current"></i>
											</div>                    
										</div>
									</a>
									<p><i class="fas fa-user-edit" style="padding-right:10px"></i><%=b.getAuthor()%></p>
							
									<p><i class="fas fa-tags" style="padding-right:10px"></i>Categories:<%=b.getBookCategory()%></p>
									
									<div style="padding-top:15px">
										<a href="view_books.jsp?bid=<%=b.getBookId()%>" class="btn btn-success btn-sm ml-1">
											<i class="fa-solid fa-circle-info"></i> Details
										</a>
									</div>
								</div>
							</div>
					</div>
				</div>
			</div>
				<%
				}
				%>
			</div>
		</div>
		<div class="text-center mt-1" style="margin-top:20px!important">
			<a href="all_old_book.jsp"
				class="btn btn-danger btn-sm text-white"><i
				class="fa-solid fa-list"></i> View All</a>
		</div>
	</div>
	<!-- End Old Book -->
	<hr>
	<%@include file="all_component/footer.jsp"%>

</body>
</html>