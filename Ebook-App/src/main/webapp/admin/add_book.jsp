<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Admin: Add Books</title>
	<%@include file="allCss.jsp"%>
</head>
<body style="background-color: #f7f7f7;">
	<c:if test="${empty userobj}">
		<c:redirect url="../login.jsp" />
	</c:if>
	<div class="card" style="border-radius: 30px;box-shadow: 0 0 4px rgba(0, 0, 0, 0.5);">
		<div class="card-body">
			<form action="../add_books" method="POST"
				enctype="multipart/form-data" style="display: flex;justify-content: center;align-items: center;">
				<div>
					<div class="form-group-sell" style="margin-bottom: 20px;">
						<div class="form-group">
							<label class="label-text" for="exampleInputEmail1">BOOK NAME</label> <input
								name="bname" type="text" class="form-control"
								id="exampleInputEmail1" aria-describedby="emailHelp" required>
						</div>
		
						<div style="margin-left: 50px;margin-right: 50px;">
							<label class="label-text" for="exampleInputEmail1">AUTHOR NAME</label> <input
								name="author" type="text" class="form-control"
								id="exampleInputEmail1" aria-describedby="emailHelp" required>
						</div>
					</div>
					<div class="form-group-sell" style="margin-bottom: 20px;">
						<div class="form-group">
							<label class="label-text" for="exampleInputPassword1">PRICE</label>
							<input name="price" type="number" class="form-control" id="exampleInputPassword1" required min="0">
						</div>
		
						<div style="margin-left: 50px;margin-right: 50px;">
							<label class="label-text" for="inputState">BOOK STATUS</label> 
							<select style="width: 220px;height: 50px;"
								id="inputState" name="bstatus" class="form-control">
								<option selected>--select--</option>
								<option value="Active">Active</option>
								<option value="Inactive">Inactive</option>
							</select>
						</div>
					</div>
					<div class="form-group-sell">
						<div style="margin-right: 50px;">
							<label class="label-text" for="exampleFormControlFile1">UPLOAD PHOTO</label> <input
								name="bimg" type="file" class="form-control-file"
								id="exampleFormControlFile1" required>
						</div>
						<div style="display: flex;align-items: center;margin-left: 80px;">
							<button type="submit" class="btn-active-modal">ADD</button>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>