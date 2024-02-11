<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>

<link rel="stylesheet" type="text/css" href="./login.css">
<link
	href="https://fonts.googleapis.com/css?family=Poppins:600&display=swap"
	rel="stylesheet">
<script src="https://kit.fontawesome.com/a81368914c.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
	crossorigin="anonymous"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
</head>
<body>

<c:set var="bool" value="${sessionScope.result}" />
<c:if test="${bool != null && !bool}">
  <div class="mx-auto p-3" style="width: 500px">
    <div class="alert alert-warning alert-dismissible fade show" role="alert">
      <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
      <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-exclamation-triangle-fill" viewBox="0 0 16 16">
        <path d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z" />
      </svg>
     	Invalid Email or Password! Please Login Again
    </div>
  </div>
</c:if>
<c:remove var="reult" scope="session" />

<c:set var="iobj" value="${sessionScope.pass}" />
<c:if test="${iobj !=null && iobj!=0}">
  <div class="mx-auto p-3" style="width: 600px">
    <div class="alert alert-warning alert-dismissible fade show" role="alert">
      <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
     <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-check-circle-fill" viewBox="0 0 16 16">
  <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
</svg>
     Password Reset Successfull! Please Login with new password
    </div>
  </div>
</c:if>
<c:remove var="pass" scope="session" />

	<div class="container">
		<div class="img">
			<img class="wave" src="./Images/loginbg.png">
		</div>
		<div class="login-content" >
			<form action="LoginController" method="Post">

				<h2 class="title">LOGIN HERE !</h2>
				<div class="form-group" style="padding-bottom: 20px">
					<div class="max1">
						Login As: <label class="radio inline" style="padding: 20px">
							<input type="radio" name="user" value="teacher" checked="checked">
							<span>Teacher</span>
						</label> <label class="radio inline"> <input type="radio"
							name="user" value="student" checked="checked"> <span>Student</span>
						</label>
					</div>
				</div>
				<div class="input-div one">
					<div class="i">
						<i class="fas fa-user"></i>
					</div>
					<div class="div">
						<h5>Email</h5>
						<input type="text" class="input" maxlength="40" name="email">
					</div>
				</div>
				<div class="input-div pass">
					<div class="i">
						<i class="fas fa-lock"></i>
					</div>
					<div class="div">
						<h5>Password</h5>
						<input type="password" class="input" maxlength="8" name="pass">
					</div>
				</div>
				<a href="ForgotPassword.jsp">Forgot Password?</a> <input type="submit" class="btn"
					value="Login">
			</form>
		</div>
	</div>
	<script type="text/javascript" src="./login.js"></script>
</body>
</html>

