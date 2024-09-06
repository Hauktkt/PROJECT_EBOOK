<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Admin: Home</title>
	<%@include file="allCss.jsp"%>	
	<link rel = "stylesheet" href = "setting.css">
	<style type="text/css">
	a {
		text-decoration: none;
		color: black;
	}
	
	a:hover {
		text-decoration: none;
		color: black;
	}
	</style>
</head>
<body style="background-color: #f0f1f2;">
	<c:if test="${not empty succMsg}">
	    <script>
	        $(document).ready(function () {
	            alert("${succMsg}");
	        });
	    </script>
	    <c:remove var="succMsg" scope="session" />
	</c:if>
	<%@include file="navbar.jsp"%>
	<c:if test="${empty userobj}">
		<c:redirect url="../login.jsp" />
	</c:if>
	<div style="background-color: #C6E2FF;padding-top: 50px;padding-bottom: 50px;">
		<div class="container container_css">
			<div class="" style="display: flex;align-items: center;">
				<div class="row align-middle">
					<i class="fa-solid fa-hands-clapping fa-5x" style="padding-left: 60px;padding-right: 30px;color: #001c41;"></i>
			
					<div class="hands">
						<div>
							<h1 class="cont" style="color: #001c41;padding-top: 10px;font-size: 2rem;"> Hi there<span>, ${userobj.name}</span>!</h1> 
				          	<p style="color: #001c41;">
				            	Thanks for using Ebook Web !!!
				          	</p>
		          		</div>
	          		</div>
				</div>
  			</div>
  			<div style="display: flex;align-items: center;">
  			
  				<i id="closeButton" class="fa-regular fa-circle-xmark fa-2x fi" title="close"></i>
  				
	          	<div class="editprofile">
					<a id="clickeaddbook" >
						<div class="card cardcss">
							<div class="card-body text-center">
								<div class="text-primary">
									<i class="fa-solid fa-square-plus fa-3x"></i>
								</div>
								<h4 style="font-size: 0.7rem;">Add Book </h4>
							</div>
						</div>
					</a>
				</div>
				<div class="selloldbook">
					<a id="clickallbook">
						<div class="card cardcss">
							<div class="card-body text-center">
								<div class="text-warning">
									<i class="fa-solid fa-book-open fa-3x"></i>
								</div>
								<h4 style="font-size: 0.7rem;">All Book</h4>
							</div>
						</div>
					</a>
				</div>
				
				<div class="myorder">
					<a id="clickorders" >
						<div class="card cardcss">
							<div class="card-body text-center">
								<div class="text-danger">
									<i class="fa-solid fa-cart-shopping fa-3x"></i>
								</div>

								<h4 style="font-size: 0.7rem;">Orders</h4>
							</div>
						</div>
					</a>
				</div>				
	  		</div>
	  		
  		</div>
  		
  		<div class="container">
			<div class="col-md-4" id="contentDiv">
				<script>
			        document.getElementById('closeButton').addEventListener('click', function() {
			            // Gọi hàm loadContent với tham số là đường dẫn của trang edit_profile.jsp
			            loadContent('page.jsp');
			            var styleTag = document.createElement('style');
			            styleTag.innerHTML = `
			            	.myorder ,.selloldbook,  .editprofile {
			                    border-radius: 0px!important;
			                    border: 0px solid!important;
			            		background: none!important;
			                }
			            	.fi {
			            		visibility: hidden!important;
			            	}
			            `;
			            document.head.appendChild(styleTag);
			        });

			    </script>
			    <script>
			        document.getElementById('clickeaddbook').addEventListener('click', function() {
			            // Gọi hàm loadContent với tham số là đường dẫn của trang edit_profile.jsp
			            loadContent('add_book.jsp');
			            var styleTag = document.createElement('style');
			            styleTag.innerHTML = `
			                .editprofile {
			                    border-radius: 200px!important;
			                    border: 1px solid!important;
			            		background: radial-gradient(black, transparent)!important;
			                }
			            	.myorder ,.selloldbook {
			                    border-radius: 0px!important;
			                    border: 0px solid!important;
			            		background: none!important;
			                }
			            	.fi {
			            		visibility: visible!important;
			            	}
			            `;
			            document.head.appendChild(styleTag);
			        });
			    </script>
			    <script>
			        document.getElementById('clickorders').addEventListener('click', function() {
			            // Gọi hàm loadContent với tham số là đường dẫn của trang order.jsp
			            loadContent('orders.jsp');
			            var styleTag = document.createElement('style');
			            styleTag.innerHTML = `
			                .myorder {
			                    border-radius: 200px!important;
			                    border: 1px solid!important;
			            		background: radial-gradient(black, transparent)!important;
			                }
			            	.editprofile ,.selloldbook, .oldbook {
			                    border-radius: 0px!important;
			                    border: 0px solid!important;
			            		background: none!important;
			                }
			            	.fi {
			            		visibility: visible!important;
			            	}
			            `;
			            document.head.appendChild(styleTag);
			        });
			    </script>
			    <script>
			        document.getElementById('clickallbook').addEventListener('click', function() {
			            // Gọi hàm loadContent với tham số là đường dẫn của trang sell_book.jsp
			            loadContent('all_book.jsp');
			            var styleTag = document.createElement('style');
			            styleTag.innerHTML = `
			                .selloldbook {
			                    border-radius: 200px!important;
			                    border: 1px solid!important;
				            	background: radial-gradient(black, transparent)!important;
			                }
			            	.myorder ,.editprofile, .oldbook {
			                    border-radius: 0px!important;
			                    border: 0px solid!important;
			            		background: none!important;
			                }
			            	.fi {
			            		visibility: visible!important;
			            	}
			            `;
			            document.head.appendChild(styleTag);
			        });
			    </script>
			</div>
						
			<script>
			    function loadContent(page) {
			        // Sử dụng AJAX để load nội dung của trang vào div
			        var xhttp = new XMLHttpRequest();
			        xhttp.onreadystatechange = function() {
			            if (this.readyState == 4 && this.status == 200) {
			                // Thay đổi nội dung của div bằng nội dung của trang
			                document.getElementById("contentDiv").innerHTML = this.responseText;
			            }
			        };
			        // Mở một yêu cầu GET đến trang JSP
			        xhttp.open("GET", page, true);
			        xhttp.send();
			    }
			</script>
		</div>
	</div>
	<!-- <div class="container">
		<div class="row p-5">
			<div class="col-md-3">
				<a href="add_book.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fa-solid fa-square-plus fa-3x text-primary"></i><br>
							<h4>Add Book</h4>
							-----------------
						</div>
					</div>
				</a>
			</div>

			<div class="col-md-3">
				<a href="all_book.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fa-solid fa-book-open fa-3x text-danger"></i><br>
							<h4>All Book</h4>
							-----------------
						</div>
					</div>
				</a>
			</div>

			<div class="col-md-3">
				<a href="orders.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fa-solid fa-cart-shopping fa-3x text-warning"></i><br>
							<h4>Orders</h4>
							-----------------
						</div>
					</div>
				</a>
			</div>

			<div class="col-md-3">
				<a data-toggle="modal" data-target="#exampleModalCenter">
					<div class="card">
						<div class="card-body text-center">
							<i class="fa-solid fa-right-from-bracket fa-3x text-primary"></i><br>
							<h4>Logout</h4>
							-----------------
						</div>
					</div>
				</a>
			</div>
		</div>
	</div> -->

</body>
</html>