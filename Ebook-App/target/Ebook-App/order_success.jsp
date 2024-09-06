<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@include file="all_component/navbar.jsp"%>
	
	<div class = "container text-center mt-3">
		<i class = "fas fa-check-circle fa-5x text-success"></i>
		<h1>Thank You</h1>
		<h2>Your Order Successfully</h2>
		<h5>With in 7 Days Your Product Will Be Delivered In Your Address</h5>
		<a href = "index.jsp" class = " btn-active-modal ">Home</a>
		<a href = "setting.jsp" class = " btn-active-modal ">View Order</a>
	</div>


</body>
</html>