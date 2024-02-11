<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<title>New Password</title>
<link
	href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.css'
	rel='stylesheet'>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-social/5.1.1/bootstrap-social.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
	crossorigin="anonymous"></script>
<style>
    
.container {
	border: solid;
	border-color: green;
	width: 400px;
	height: 400px;
	border-radius: 20px;
}

input {
	border: solid;
	border-color: green;
	border-radius: 5px;
}
</style>
</head>
<body>
	<c:set var="bool" value="${sessionScope.result}" />

	<c:if test="${bool != null && !bool}">
		<div class="mx-auto p-3" style="width: 700px">
			<div class="alert alert-warning alert-dismissible fade show"
				role="alert">
				<button type="button" class="btn-close" data-bs-dismiss="alert"
					aria-label="Close"></button>
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
					fill="currentColor" class="bi bi-exclamation-triangle-fill"
					viewBox="0 0 16 16">
        <path
						d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z" />
      </svg>
				Password and Confirm Password Fields should be the same
			</div>
		</div>
	</c:if>

	<div
		class="container mx-auto p-2 d-flex justify-content-center align-items-center">
		<form action="NewPasswordController" method="post">
			<strong class="d-flex justify-content-center" style="font-size: 25px">RESET PASSWORD</strong>
			<div>
				Login As: <label class="radio inline" style="padding: 20px">
					<input type="radio" name="user" value="teacher" checked="checked">
					<span>Teacher</span>
				</label> <label class="radio inline"> <input type="radio"
					name="user" value="student" checked="checked"> <span>Student</span>
				</label>
			</div>
			<div style="display: flex; flex-direction: column; align-items: center;"> <input type="email" name="email" maxlength="35"
				placeholder="Your Email"> <br> <input type="password"
				name="pass" maxlength="8" placeholder="New Password"><br>
			<input type="password" name="conPass" maxlength="8"
				placeholder="Confirm Password"><br>
		<button type="submit" class="btn btn-success">SUBMIT</button>
		</div>
		</form>
	</div>
</body>
</html>