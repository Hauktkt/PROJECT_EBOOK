<%@page import="com.DB.*"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="com.entity.User"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>New Books</title>
	<%@include file="all_component/allCss.jsp"%>
</head>

<style type="text/css">
.crd-ho:hover {
	background-color: #fcf7f7;
}

#toast {
	min-width: 300px;
	position: fixed;
	bottom: 30px;
	left: 50%;
	margin-left: -125px;
	background: #333;
	padding: 10px;
	color: white;
	text-align: center;
	z-index: 1;
	font-size: 18px;
	visibility: hidden;
	box-shadow: 0px 0px 100px #000;
}

#toast.display {
	visibility: visible;
	animation: fadeIn 0.5, fadeOut 0.5s 2.5s;
}

@keyframes fadeIn {
	from {bottom: 0;
	opacity: 0;
}

to {
	bottom: 30px;
	opacity: 1;
}
}
</style>

<body>
	<%
	User u = (User) session.getAttribute("userobj");
	%>

	<c:if test="${not empty addCart}">
		<div id="toast">${addCart}</div>

		<script type="text/javascript">
					showToast();
					function showToast(content)
					{
						$('#toast').addClass("display");
						$('#toast').html(content);
						setTimeout(()=>{
							$("toast").removeClass("display");
						},2000)
					}
	</script>

		<c:remove var="addCart" scope="session" />
	</c:if>



	<%@include file="all_component/navbar.jsp"%>

	<div class="container">
		<h3 class=" text-center">NEW BOOK</h3>

		<div class="row">
			<%
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
			List<BookDtls> list = dao.getAllNewBook();
			for (BookDtls b : list) {
			%>
			<div class="book-all">
				<div class="cont-book" style="align-items: flex-start;">
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
	<hr>
	<%@include file="all_component/footer.jsp"%>
</body>
</html>