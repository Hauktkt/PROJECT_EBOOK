<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@page isELIgnored="false"%>
<%@page import="com.DAO.CartDAOImpl"%>
<%@page import="com.DB.*"%>
<%@page import="java.sql.*"%>
<%@page import="com.entity.Cart"%>
<%@page import="com.DAO.CartDAO"%>
<%@page import="com.entity.User"%>
<%@page import="java.util.List"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Cart Page</title>
	<%@include file="all_component/allCss.jsp"%>
	<link rel = "stylesheet" href = "all_component/table.css">

</head>

<body style="background-color: #f0f1f2;">
	<%@include file="all_component/navbar.jsp"%>

	<c:if test="${empty userobj}">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>

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



	<div class="container" style="background: white;">
		<div class="row p-2" style="padding-top: 3rem!important; padding-bottom: 3rem!important;">
		    <div class="col-md-6">
		        <div class="card" style="    box-shadow: 0 0 4px rgba(0, 0, 0, 0.5);">
		            <div class="table-users">
						<div class="header">YOUR CART</div>
		                <table class="table table-striped" >
		                    <thead>
		                        <tr style="text-align:center">
		                            <!-- <th scope="col"></th> -->
		                            <th scope="col">Book Name</th>
		                            <th scope="col">Author</th>
		                            <th scope="col">Price</th>
		                            <th scope="col"></th>
		                        </tr>
		                    </thead>
		                    <tbody>
		
		                        <%
		                        User u = (User) session.getAttribute("userobj");
		
		                        CartDAOImpl dao = new CartDAOImpl(DBConnect.getConn());
		                        List<Cart> cart = dao.getBookByUser(u.getId());
		                        Double totalPrice = 0.00;
		
		                        for (Cart c : cart) {
									totalPrice = c.getTotalPrice();
								%>
		                        <tr>
		                        	<%-- <td><input type="checkbox" class="item-checkbox" data-price="<%=c.getPrice()%>" data-cid="<%=c.getCid()%>">
		                        	</td> --%>
		                            <td scope="row"><img data-perfmatters-preload="" width="20" height="30" src="book/<%=c.getPhotoName()%>" sizes="(max-width: 110px) 100vw, 110px" class="img-responsive" style="border: 1px solid #a6a2a2;" alt="the-gioi-khong-xxoo">
		                            <%=c.getBookName()%></td>
		                            <td><%=c.getAuthor()%></td>
		                            <td><%=c.getPrice()%></td>
		                            <td>
		                                <a href="remove_book?bid=<%=c.getBid()%>&&uid=<%=c.getUserId()%>&&cid=<%=c.getCid()%>"><i class="fa-regular fa-circle-xmark fa-2x" title="Remove"></i></a>
		                            </td>
		                        </tr>
		                        <%
		                        }
		                        %>
		
		                    </tbody>
		                </table>
		                	
		            </div>
		            <div style="
		                		text-align: center;
		                		display: flex;
							    justify-content: space-around;
							    padding-top: 10px;
							    border-top: 1px solid rgba(0,0,0,.1);
							    border-bottom: 1px solid rgba(0,0,0,.1);
							    padding-bottom: 10px;">
		                    <div>
		                        <a id="">Delivery Time:</a><br>
		                        <a id="">Total Price:</a>
		                    </div>
		                    <div>
		                        <a id="">7-day</a><br>
								<span id="total-price" class="col_or" name="totalPrice" required>$ <%=totalPrice%> USD</span>
		                    </div>
		                </div>
		                <div >
		                    <div>
		                        <a id="total-price" style="
								    font-size: 12px;
								    line-height: normal;
								    font-family: OpenSans,Arial,sans-serif;
								">Your subscription begins today with a 7-day free trial. If you decide to stop during the trial period, visit My Purchases to cancel before December 09, 2023 and your card won’t be charged. We can’t issue refunds once your card is charged.</a>
		                    </div>
		                </div>
		        </div>
		    </div>


			<div class="col-md-6">
				<div class="card-checkout">
					<div class="card-body">
						<h3 class="text-orders">CHECKOUT</h3>
						<form action = "order" method = "POST">
							<input type = "hidden" value = "${userobj.id }" name = "id">
							<div class="form-row " style="border-top: 1px solid rgba(0,0,0,.1);padding-top: 10px;">
								<div class="form-group col-md-6">
									<label class="label-text" for="inputEmail4">NAME</label> 
									<input type="text" name = "username"
										class="form-control " id="inputEmail4" value="<%=u.getName()%>"
										readonly="readonly">
								</div>
								<div class="form-group col-md-6 ">
									<label class="label-text" for="inputEmail4">PHONE NUMBER</label> 
									<input name = "phno" type="text" class="form-control " id="inputEmail4"
										value="<%=u.getPhno()%>" readonly="readonly">
								</div>
							</div>
							<div class="form-row ">
								
								<div class="form-group col-md-6 ">
									<label class="label-text" for="inputPassword4">EMAIL</label> 
									<input style="width: 495px;" type="email" name = "email" class="form-control " id="inputPassword4"
										value="<%=u.getEmail()%>" readonly="readonly">
								</div>
							</div>

							<div class="form-row">
								<div class="form-group col-md-6">
									<label class="label-text" for="inputPassword4">ADDRESS</label> 
									<input type="text" name = "address" class="form-control" id="inputPassword4" required>
								</div>
								<div class="form-group col-md-6">
									<label class="label-text" for="inputEmail4">LANDMARK</label> 
									<input type="text" name = "landmark" class="form-control" id="inputEmail4" required>
								</div>
								
							</div>

							<div class="form-row">
								<div class="form-group col-md-6">
									<label class="label-text" for="inputPassword4">CITY</label> 
									<input type="text" name = "city" class="form-control" id="inputPassword4" required>
								</div>
								<div class="form-group col-md-6">
									<label class="label-text">PAYMENT MODE</label> 
									<select class="form-control" name = "payment" style="width: 240px;height: 49.33px;"> 
										<option value = "noselect">--Select--</option>
										<option value = "COD">Cash On Delivery</option>
									</select>
								</div>
							</div>
							<div style="display: flex;justify-content: space-between;padding-bottom: 10px;margin-bottom: 20px; border-bottom: 1px solid rgba(0,0,0,.1);">
							    <img style="margin:0 2px;aspect-ratio:13 / 8" src="https://d3njjcbhbojbot.cloudfront.net/web/images/signature/cc/visa-2.png" height="24" alt="Visa">
							    <img style="margin:0 2px;aspect-ratio:13 / 8" src="https://d3njjcbhbojbot.cloudfront.net/web/images/signature/cc/mastercard-2.png" height="24" alt="MasterCard">
							    <img style="margin:0 2px;aspect-ratio:13 / 8" src="https://d3njjcbhbojbot.cloudfront.net/web/images/signature/cc/amex-2.png" height="24" alt="American Express">
							    <img style="margin:0 2px;aspect-ratio:13 / 8" src="https://d3njjcbhbojbot.cloudfront.net/web/images/signature/cc/discover.png" height="24" alt="Discover">
							    <img style="margin:0 2px;aspect-ratio:13 / 8" src="https://d3njjcbhbojbot.cloudfront.net/web/images/signature/cc/jcb.png" height="24" alt="JCB">
							    <img src="https://d3njjcbhbojbot.cloudfront.net/api/utilities/v1/imageproxy/https://coursera_assets.s3.amazonaws.com/growth/payments/paypal-logo.png?auto=format%2Ccompress&amp;dpr=1&amp;w=&amp;h=" class="paypal-logo" style="aspect-ratio:13 /8" width="20%" height="24" alt="PayPal">
							</div>
							<div class="text-center">
								<button class="btn-active-modal">Orders Now <i class="fa-solid fa-comments-dollar"></i>	</button>
								<a href="index.jsp" class="btn-active-modal">Continue
									Shopping <i class="fa-solid fa-rotate-right"></i></a>
							</div>
						</form>
					</div>
				</div>
			</div>

		</div>
	</div>
</body>
</html>