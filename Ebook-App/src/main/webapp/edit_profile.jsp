<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Edit Profile</title>
	<%@include file="all_component/allCss.jsp"%>
	<link rel="stylesheet" type="text/css" href="all_component/giaodien.css">
    <link rel="stylesheet" type="text/css" href="all_component/style.css">
</head>

<body style="background-color: #f7f7f7;">
	<div class="card" style=" border-radius: 30px;box-shadow: 0 0 4px rgba(0, 0, 0, 0.5);">
		<div class="card-body">
			<form action="update_profile" method="POST" style="display: flex;justify-content: center;">
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
	
	
				<div style="width:300px;margin-right:150px">
					<input type="hidden" value="${userobj.id}" name="id">
					<div class="form-group">
						<label class="label-text" for="exampleInputEmail1">NAME</label> 
						<input
							type="text" class="form-control" id="exampleInputEmail1"
							aria-describedby="emailHelp" required="required" name="fname"
							value="${userobj.name }">
		
					</div>
		
		
					<div class="form-group">
						<label class="label-text" for="exampleInputEmail1">EMAIL ADDRESS</label> <input
							type="email" class="form-control" id="exampleInputEmail1"
							aria-describedby="emailHelp" required="required" name="email"
							value="${userobj.email }">
		
					</div>
		
					<div class="form-group">
						<label class="label-text" for="exampleInputEmail1">PHONE NUMBER</label> <input
							type="number" class="form-control" id="exampleInputEmail1"
							aria-describedby="emailHelp" required="required" name="phno"
							value="${userobj.phno }">
		
					</div>
									
				</div>
				<div>
					<div><i class="fa-solid fa-user fa-10x" style="margin-bottom:10px;"></i></div>
					<div class="form-group" style="text-align: center;">
						<a data-toggle="modal" data-target="#exampleModalCenter" >Change password</a>
					</div>
					<div style="display: flex;justify-content: center;">
						<button type="submit" class="btn-active-modal">Update</button>
					</div>
					
				</div>
	
			</form>
	
		</div>
	</div>
	<!-- Modal -->
		<div class="modal fade" id="exampleModalCenter" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalCenterTitle"
			aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content" style="border-radius: 50px;background: radial-gradient(white,95%, black);">
					<div class="modal-header" style="justify-content: center;">
						<h5 class="modal-title" id="exampleModalLongTitle"> <i class="fa-regular fa-bell fa-2x"></i><i class="fa-regular fa-bell fa-2x"></i><i class="fa-regular fa-bell fa-2x"></i></h5>
					</div>
					<div class="modal-body">
						<div class="">
							<form action="change_pass" method="POST" style="display: flex;justify-content: center;">
								<div>
									<input type="hidden" value="${userobj.id}" name="id">
									<div class="form-group">
										<label class="label-text" for="exampleInputEmail1">CURRENT PASSWORD</label> 
										<input class="form-control" type="password" placeholder=" Current Password" name="currentpass" required="required">
						
									</div>
						
						
									<div class="form-group">
										<label class="label-text" for="exampleInputEmail1">NEW PASSWORD</label> 
										<input class="form-control" type="password" placeholder="New Password" name="newpass" required="required">
						
									</div>
						
									<div class="form-group">
										<label class="label-text" for="exampleInputEmail1">CONFIRM NEW PASSWORD</label> 
										<input class="form-control" type="password" placeholder="Confirm New Password" name="confirmpass" required="required">
						
									</div>
									<button type="submit" class="btn btn-secondary btn-center">Change <i class="fa-solid fa-right-to-bracket"></i></button>
									<button type="button" class="btn btn-secondary btn-center"
										data-dismiss="modal">Close <i class="fa-solid fa-xmark"></i></button>
								</div>
								
							</form>
						</div>
					</div>
					<div class="modal-footer"></div>
				</div>
			</div>
		</div>
</body>
</html>