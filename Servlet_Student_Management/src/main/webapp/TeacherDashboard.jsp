<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
	
<script src="https://kit.fontawesome.com/048e89476a.js"
	crossorigin="anonymous"></script>

<link rel="stylesheet" href="./TeacherDashboard.css">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha384-KyE0WmmV2XhD+hFpJHEBTZ3+4BR0qX14BlhbnjzCl0B6+eXbsTn+uvEGy3wD6MT2"
	crossorigin="anonymous"></script>

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>

<title>Teacher Dashboard</title>

</head>
<body>

	<nav class="navbar navbar-expand-lg">
		<div>
			<h3 style="padding-left: 5px">Welcome to Dashboard</h3>
		</div>
		<div class="collapse navbar-collapse navbarNav" id="navbarNav"
			style="float: right">
			<div class="btn-group dropstart ms-auto">
				<button type="button" class="btn btn-success dropdown-toggle"
					data-bs-toggle="dropdown" aria-expanded="false">
					<i class="fa-solid fa-user fa-2xl"></i>
				</button>
				<ul class="dropdown-menu ullist">
					<!-- Dropdown menu links -->
					<li><a class="dropdown-item" href="#">Update Profile</a></li>
					<li><a class="dropdown-item" data-bs-toggle="modal"
						data-bs-target="#exampleModal">Log Out</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<c:set var="iobj" value="${sessionScope.error}"></c:set>
	<c:if test="${iobj !=null && iobj==0}">
		<div class="mx-auto" style="width: 500px">
			<div class="alert alert-warning alert-dismissible fade show"
				role="alert">
				<button type="button" class="btn-close" data-bs-dismiss="alert"
					aria-label="Close"></button>
				<i class="fa fa-exclamation-circle" aria-hidden="true"></i> Class
				name and Id is already taken!
			</div>
		</div>
	</c:if>
	<c:remove var="iobj" scope="session" />

	<c:set var="bool" value="${sessionScope.result}" />
	<c:if test="${bool != null && !bool}">
		<div class="mx-auto p-3" style="width: 500px">
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
				The class you are attempting to delete does not exist!
			</div>
		</div>
	</c:if>
	<c:remove var="result" scope="session" />

	<div class="row todocards gx-5">
		<div class="col-sm-3">
			<div class="card">
				<div class="card-body">
					<h4>Create New Class</h4>
					<form action="TeacherDashboardController">
						<div class="mb-3">
							<label style="padding-top: 10px">ClassName</label> <input
								type="text" class="form-control" name="c_name"> <label
								style="padding-top: 10px">Class Id</label> <input type="text"
								class="form-control" name="c_id"> <label
								style="padding-top: 10px">Teacher Id</label> <input type="text"
								class="form-control" name="t_id"> <label
								style="padding-top: 10px">Batch No</label> <input type="text"
								class="form-control" name="batchNo"><br>
							<button type="submit" class="btn btn-success" name="submit">Submit</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		<div class="col-sm-3">
			<div class="card">
				<div class="card-body">
					<h4>Delete A Class</h4>
					<form action="TeacherDashboardController" method="post">
						<label style="padding-top: 10px">Class Name</label> <input
							type="text" class="form-control" name="c_name"> <label
							style="padding-top: 10px">Class Id</label> <input type="text"
							class="form-control" name="c_id"><label
							style="padding-top: 10px">Teacher Id</label> <input type="text"
							class="form-control" name="t_id"> <label
							style="padding-top: 10px">Password</label> <input type="text"
							class="form-control" name="pass"><br>
						<button type="submit" class="btn btn-success" name="del_class"
							style="margin-bottom: 20px">Submit</button>
					</form>
				</div>
			</div>
		</div>
		<div class="col-sm-6">
			<div class="card">
				<div class="card-body">
					<h4>Teacher's To Do List</h4>

					<form id="todo-form" class="row align-items-center">
						<div class="col-auto">
							<label>New Task</label>
							<input type="text" id="todo-input" class="form-control"
								style="width: 500px;">
						</div>
						<div class="col-auto">
							<button type="submit" class="text-center"
								style="background: none; border: none; padding: 0;font-size: 50px;">
								<i class="fa-solid fa-circle-plus text-light"></i>
							</button>
						</div>
					</form>

					<ul style="list-style: none;" id="todo-list"></ul>

					<script src="script.js"></script>
				</div>
			</div>
		</div>
	</div>

	<c:set var="classList" value="${sessionScope.list}" />
	<c:if test="${not empty classList}">
		<h4 style="margin: 20px; padding-left: 30px; padding-top: 20px">Your
			Classes:</h4>
		<c:forEach items="${classList}" var="className">
			<a href="TeacherDashboardController?className=${className}" style="text-decoration: none;">
				<div class="card mx-5 mb-5"
					style="height: 100px; width: 100px; float: left">
					<div
						class="card-body d-flex align-items-center justify-content-center">
						<h5 class="text-center" style="color: black">${className}</h5>
					</div>
				</div>
			</a>
		</c:forEach>
	</c:if>

	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel">Are you
						sure you want to Log Out?</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-success" id="yesButton">Yes</button>
					<button type="button" class="btn btn-success"
						data-bs-dismiss="modal">No</button>
				</div>
			</div>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		$(document).ready(function() {
			$("#yesButton").click(function() {
				// Redirect to the registration page
				window.location.replace("Register.jsp"); // Replace with your registration page URL
			});
		});
	</script>
	
	

</body>
</html>