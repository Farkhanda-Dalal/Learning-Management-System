<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Class</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
	crossorigin="anonymous"></script>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
body {
	overflow: hidden;
}

.col-2 {
	left: 0;
	top: 0;
	height: 100vh;
	color: #fff; /* Text color */
}

a {
	text-decoration: none;
	color: #fff;
}

ul {
	align-items: center;
	list-style: none;
	text-align: center;
	padding-top: 15px;
}

li {
	padding-top: 10px;
	display: flex;
	align-items: center;
}

li:hover {
	color: black;
}

.list-icon {
	padding-right: 15px;
}

.card {
	box-shadow: 0 4px 8px rgba(0, 128, 0, 0.5);
	margin-top: 35px;
	margin-left: 25px;
	width: 350px;
	height: 200px;
}

.card:hover {
	background-color: rgb(25, 135, 84);
}

.card:hover span, .card:hover h2, .card:hover .card-icon {
	color: #fff;
}

span {
	font-size: 25px;
}

.modal-content {
	width: 45rem;
	height: 30rem;
}
</style>

</head>

<body>

	<div class="row ">
		<div class="col-2 bg-success text-center">
			<!-- Column Content -->
			<h2 style="padding-top: 10px">${param.className.toUpperCase()}</h2>

			<ul>
				<a href="#"><li><i class="fa fa-calendar fa-lg list-icon"
						aria-hidden="true"></i>
						<h5>Mark Attendence</h5></li></a>
				<a href="#"><li><i class="fa fa-file fa-lg list-icon"
						aria-hidden="true"></i>
						<h5>View Assignment</h5></li></a>
				<a href="#"><li><i class="bi bi-send fa-lg list-icon"></i>
						<h5>Send Assignment</h5></li></a>
				<a href="#"><li><i class="fa fa-times fa-lg list-icon"
						aria-hidden="true"></i>
						<h5>Delete Assignment</h5></li></a>
				<a href="#"><li><i class="fa-solid fa-eye fa-lg list-icon"></i>
						<h5>View Notes</h5></li></a>
			</ul>
		</div>
		<div class="col bg-light">
			<!-- Column Content -->

			<c:set var="iobj" value="${sessionScope.error}"></c:set>
			<c:if test="${iobj !=null && iobj==1}">
				<div class="mx-auto" style="width: 500px;margin-top: 20px">
					<div class="alert alert-warning alert-dismissible fade show"
						role="alert">
						<button type="button" class="btn-close" data-bs-dismiss="alert"
							aria-label="Close"></button>
						<i class="fa fa-exclamation-circle" aria-hidden="true"></i>
						Attendence submitted successfully!
					</div>
				</div>
			</c:if>
			<c:remove var="error" scope="session" />
			<div class="row">
				<div class="col-4 ">
					<a>
						<div class="card p-4 justify-content-center">
							<div class="card-content">
								<div
									class="card-body d-flex align-items-center justify-content-center">
									<i class="bi bi-book pe-4 card-icon" style="font-size: 8em;"></i>

									<div class="text-center">
										<h2 class="card-title">Notes</h2>
									</div>
								</div>
							</div>
						</div>
					</a>
				</div>
				<div class="col-4 ">
					<div class="card p-4 justify-content-center">
						<div class="card-content">
							<div
								class="card-body d-flex align-items-center justify-content-center">
								<i class="bi bi-clipboard2-check fa-7x pe-4 card-icon"></i>
								<div class="text-center">
									<h2>Assignment</h2>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-4 ">
					<a data-bs-toggle="modal" data-bs-target="#attendenceModal">
						<div class="card p-4 justify-content-center">
							<div class="card-content">
								<div
									class="card-body d-flex align-items-center justify-content-center">
									<i class="bi bi-calendar2-day fa-7x pe-4 card-icon"></i>
									<div class="text-center">
										<h2 class="card-title">Attendence</h2>
									</div>
								</div>
							</div>
						</div>
					</a>
				</div>
			</div>
		</div>

		<div class="modal fade" id="attendenceModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-header">
						<h1 class="modal-title fs-5" id="exampleModalLabel">Submit
							Attendence Sheet</h1>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body mx-auto p-2">
						<form action="StudentClassController" style="width: 25rem;">
							<label style="padding-top: 20px; font-size: 20px;">Class
								Name</label>
							<c:set var="classList" value="${sessionScope.list}" />
							<c:if test="${not empty classList}">
								<select class="form-select" aria-label="Default select example"
									name="className">
									<option selected>Open this select menu</option>
									<c:forEach items="${classList}" var="className">
										<option>${className}</option>
									</c:forEach>
								</select>
							</c:if>
							<label style="padding-top: 20px; font-size: 20px;">Date</label> <input
								type="date" class="text form-control" name="date" /> <label
								style="padding-top: 20px; font-size: 20px;">Attendence
								Status</label>
							<div class="form-check">
								<input class="form-check-input" type="radio" name="status"
									id="flexRadioDefault1" value="present"> <label
									class="form-check-label" for="flexRadioDefault1">
									Present </label>
							</div>
							<div class="form-check">
								<input class="form-check-input" type="radio" name="status"
									id="flexRadioDefault2" checked value="absent"> <label
									class="form-check-label" for="flexRadioDefault2">
									Absent </label>
							</div>
							<br>

							<button type="submit" class="btn btn-success" name="Attendence"
								style="margin-bottom: 20px">Submit</button>
						</form>


					</div>
				</div>
			</div>
		</div>
</body>
</html>