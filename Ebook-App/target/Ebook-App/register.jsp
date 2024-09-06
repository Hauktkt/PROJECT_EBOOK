<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Ebook: Register</title>
    <link rel="stylesheet" type="text/css" href="./all_component/loginform.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />

</head>
<body style="background-color: #f0f1f2;margin: 0px;">
	<%@include file="all_component/navbar.jsp"%>
	<style>
        .search-open{
            visibility: hidden;
        }
    </style>
	<div class="cont-css">
		<div class="css" style="background: linear-gradient(to left, #f0f1f3 0%, #06877b);">
    	</div>
    	<div style="	padding-top: 50px;padding-bottom: 80px;">
	        <div class="cont"> 
	            <h1 class="mb-2 text-3xl font-semibold sm:mb-5 sm:text-5xl" style="font-size: 3rem; line-height: 1; margin-bottom: 1.25rem; font-weight: 600;">
	                Register
	            </h1> 
	            <p class="text-base text-gray-600 leading-6 mb-3">
	                Create a new account to get started.
	            </p> 
	        </div>
	        <form action="register" method="POST">
	            <div class="container" style="height:450px">
	                <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script> 
					<c:if test="${not empty Message}">
					    <script>
					        $(document).ready(function () {
					            alert("${Message}");
					        });
					    </script>
					    <c:remove var="Message" scope="session" />
					</c:if>	
	                <div class="sigh-in-container">
	                    <div class="login_logo" style="padding-bottom: 100px;">
	                        <img alt="EBOOK" src="https://img.upanh.tv/2023/11/30/Screenshot-2023-11-30-112757_preview_rev_1.png" class="logo"><br>
	                    </div>   
	                    <div  style="padding-top:80px;font-family: initial;">
	                        <input type="text" id="exampleInputEmail1" placeholder="Full Name" name="fname" required> 
	                        <br>
	                        <input type="text" id="exampleInputEmail1" placeholder="Email address" name="email" required> 
	                        <br>
	                        <input type="text" id="exampleInputEmail1" placeholder="Phone Number" name="phno" required>
	                        <br>
	                        <input type="password" id="exampleInputEmail1" placeholder="Password" name="password" required> 
	                        <br>
	                        <input type="password" placeholder="Confirm Password" name="confirmPassword" required>  
	                        <br>
	                        <button type="submit">Register</button>  
	                        <div class="container_1 sigh-in-container1" style="padding-top: 20px;">
	                            <span data-cy="sign-in-link">Already have an account?<a href="login.jsp"> Sign in</a></span>
	                        </div>
	                    </div> 
	                </div>
	                
	            </div>
	        </form>
		</div>
    	<div class="css" style="background: linear-gradient(to right, #f0f1f3 0%, #06877b);">
    	</div>
    </div>
</body>
</html>