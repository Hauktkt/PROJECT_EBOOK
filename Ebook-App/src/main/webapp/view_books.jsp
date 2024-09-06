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
	<meta charset="UTF-8">
	<title>Details Book</title>
	<%@include file="all_component/allCss.jsp"%>
</head>

<body style="background-color: #f0f1f2;">
	<%@include file="all_component/navbar.jsp"%>

	<%
	int bid = Integer.parseInt(request.getParameter("bid"));
	BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
	BookDtls b = dao.getBookById(bid);
	%>
	
	<%
	User u = (User) session.getAttribute("userobj");
	%>

	<div class="container p-3">
		<div class="row " style="display: flex;justify-content: center;">
			<div class="col-md-6 text-center p-5 border bg-white" style="border-radius: 30px;">
				<div class="card-body text-center" style="padding: 0rem;">
					<div class="css-img-index">
						<div>

							<img data-perfmatters-preload="" width="110" height="150" src="book/<%=b.getPhotoName()%>" sizes="(max-width: 110px) 100vw, 110px" class="img-responsive" style="border: 1px solid #a6a2a2;" alt="the-gioi-khong-xxoo">
						</div>
						<div class="book-info">
							<p class="book-name"><%=b.getBookName()%></p>
							<a style="display: flex;margin-bottom: 1rem;">
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
						</div>
					</div>
				</div>
				<div class="text-center p-3" style="margin-bottom: 20px;border-bottom: 1px solid #dad5d5;">
					<a href="#" class="btn btn-danger"> <i class="fa-solid fa-dollar-sign"></i> <%=b.getPrice() %>
					</a>
                    <a id="addToCartBtn" style="margin-left:60px" data-toggle="modal" data-target="#exampleModalCenter" class="btn btn-primary btn-center"><i class="fa-solid fa-cart-shopping">
                    	</i> Add Cart</a> 
                    
				</div>
                <div>
					<h8>With Voucher</h8>
                </div>
				<div class="row" style="justify-content: center;">
					<div class="text-danger text-center p-2" >
						<i class="fa-solid fa-money-bill-wave fa-2x " title="Cash On Delivery"></i>
					</div>
					<div class="text-danger text-center p-2 " >
						<i class="fa-solid fa-rotate-left fa-2x" title="Return Available"></i>
					</div>
					<div class="text-danger text-center p-2 " >
						<i class="fa-solid fa-truck fa-2x" title="Free Shipping"></i>
					</div>
				</div>
			</div>
		</div>
		<!-- Modal -->
		<div class="modal fade" id="exampleModalCenter" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalCenterTitle"
			aria-hidden="true" >
			<div class="modal-dialog modal-dialog-centered" role="document" >
				<div class="modal-content" style="border-radius: 20px;background: radial-gradient(white,95%, black);">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLongTitle"> <i class="fa-regular fa-bell"></i><i class="fa-regular fa-bell"></i><i class="fa-regular fa-bell"></i></h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<%
						if ("Old".equals(b.getBookCategory())) {
						%>
						<div class="text-center">
							<h5 style="padding-bottom:20px">Contact To Seller!!!</h5>
							<h6 style="padding-bottom:20px"><i class="fa-regular fa-envelope"></i> <%=b.getEmail()%></h6>
							<button type="button" class="btn btn-secondary btn-center"
								data-dismiss="modal">Close <i class="fa-solid fa-xmark"></i></button>
						</div>
						<%
						}else {
		                    if (u == null) {
                        %>
                        <div class="text-center">
							<h5 style="padding-bottom:20px">Vui Lòng Đăng Nhập!!!</h5>
							<a href="login.jsp" type="button" class="btn btn-primary btn-center">Đăng nhập <i class="fa-solid fa-right-to-bracket"></i>
							</a>
							<a>or	</a>
							<button type="button" class="btn btn-secondary btn-center"
								data-dismiss="modal">Close <i class="fa-solid fa-xmark"></i></button>
						</div>
                        <%
                            } else {
                        %>
                        <script>
					        // Thêm sự kiện nhấn vào nút "Add Cart"
					        document.getElementById('addToCartBtn').addEventListener('click', function() {
					            // Kiểm tra và chuyển hướng nếu cần
					            window.location.href = 'cart?bid=<%=b.getBookId()%>&uid=<%=u.getId()%>';
					        });
					    </script>
                        <%
                            }
                        }
                        %>
					</div>
					<div class="modal-footer"></div>
				</div>
			</div>
		</div>
		
		
	</div>
</body>
</html>