<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Sell Book</title>
	<%@include file="all_component/allCss.jsp"%>
	<link rel = "stylesheet" href = "all_component/table.css">
</head>

<body style="background-color: #f7f7f7;">
	<div class="card" style="border-radius: 30px;box-shadow: 0 0 4px rgba(0, 0, 0, 0.5);">
		<div class="card-body">						
			<c:if test="${not empty succMsg}">
				<p class="text-center text-success">${succMsg}</p>
				<c:remove var="succMsg" scope="session" />
			</c:if>

			<c:if test="${not empty failedMsg}">
				<p class="text-center text-danger">${failedMsg}</p>
				<c:remove var="failedMsg" scope="session" />
			</c:if>
		
			<form action="add_old_book" method="POST"
				enctype="multipart/form-data" style="display: flex;justify-content: center;align-items: center;">
				
				<input type = "hidden" value = "${userobj.email}" name = "user">
				
				<div >
					<div class="form-group-sell" style="margin-bottom: 20px;">
						<div >
							<label class="label-text" for="exampleInputEmail1">BOOK NAME</label> <input
							name="bname" type="text" class="form-control"
							id="exampleInputEmail1" aria-describedby="emailHelp">
						</div>
						<div style="margin-left: 50px;margin-right: 50px;">
							<label class="label-text" for="exampleInputEmail1">AUTHOR NAME</label> <input
							name="author" type="text" class="form-control"
							id="exampleInputEmail1" aria-describedby="emailHelp">
						</div>
						<div>
							<label class="label-text" for="exampleInputPassword1">PRICE</label> <input
							name="price" type="number" class="form-control"
							id="exampleInputPassword1">
						</div>
					</div>
	
	
					<div class="form-group-sell">
						
						<div style="margin-right: 50px;">
							<label class="label-text" for="exampleFormControlFile1">UPLOAD PHOTO</label> <input
							name="bimg" type="file" class="form-control-file"
							id="exampleFormControlFile1">
						</div>
						<div style="display: flex;align-items: center;margin-left: 130px;">
							<button type="submit" class="btn-active-modal" style="width: 150px;">Sell</button>
						</div>	
					</div>
				</div>
							
			</form>			
		</div>
		<%@include file="old_book.jsp"%>
		<div style="padding-bottom:50px"></div>
	</div>
</body>
</html>