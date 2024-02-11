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

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Bootstrap JavaScript (requires jQuery) -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
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

.card:hover span, .card:hover h2, .card:hover .card-icon, .card:hover table,
	.card:hover .card-title {
	color: #fff;
}

.attendenceCard {
	box-shadow: 0 4px 8px rgba(0, 128, 0, 0.5);
	margin-top: 35px;
	margin-left: 25px;
	width: 550px;
	margin-left: 25px;
	width: 550px;
	height: 450px;
}

span {
	font-size: 25px;
}

.modal-content {
	width: 45rem;
	height: 30rem;
}

.scrollable-content {
	max-height: 350px; /* Adjust the height as needed */
	overflow-y: auto;
}

.close-icon {
	cursor: pointer;
}
</style>

</head>

<body>

	<div class="row ">
		<div class="col-2 bg-success text-center">
			<c:set var="cName" value="${sessionScope.cl}" />
			<h3 style="margin-left: 15px;margin-top: 10px">${cName}</h3>

			<ul>
				<a data-bs-toggle="modal" data-bs-target="#Attendence"><li><i
						class="fa fa-calendar fa-lg list-icon" aria-hidden="true"></i>
						<h5>View Attendence</h5></li></a>
				<a data-bs-toggle="modal" data-bs-target="#Assignment"><li><i
						class="fa fa-file fa-lg list-icon" aria-hidden="true"></i>
						<h5>Add Assignment</h5></li></a>
				<a href="#"><li><i class="fa fa-times fa-lg list-icon"
						aria-hidden="true"></i>
						<h5>Delete Assignment</h5></li></a>
				<a href="#"><li><i class="fa fa-book fa-lg list-icon"
						aria-hidden="true"></i>
						<h5>Send Notes</h5></li></a>
				<a href="#"><li><i class="fa fa-trash fa-lg list-icon"
						aria-hidden="true"></i>
						<h5>Delete Notes</h5></li></a>
			</ul>
		</div>

		<div class="col ">

			<c:set var="iobj" value="${sessionScope.error}"></c:set>
			<c:if test="${iobj !=null && iobj==2}">
				<div class="mx-auto" style="width: 500px; margin-top: 20px">
					<div class="alert alert-warning alert-dismissible fade show"
						role="alert">
						<button type="button" class="btn-close" data-bs-dismiss="alert"
							aria-label="Close"></button>
						<i class="fa fa-exclamation-circle" aria-hidden="true"></i> No
						enrollment was done for this class!
					</div>
				</div>
			</c:if>
			<c:remove var="error" scope="session" />

			<div class="row">
				<div class="col-4 ">
					<a data-bs-toggle="modal" data-bs-target="#Enrolled">
						<div class="card p-4 justify-content-center">
							<div class="card-content">
								<div
									class="card-body d-flex align-items-center justify-content-center">
									<i class="fa fa-graduation-cap fa-7x pe-5 card-icon"
										aria-hidden="true"></i>
									<div class="text-center">
										<h2 class="card-title">Enrolled</h2>
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
									<h2>Submission</h2>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-4 ">
					<a data-bs-toggle="modal" data-bs-target="#Attendence">
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
			
			<div class="card attendenceCard text-center scrollable-content " 
			style="float: right;margin-right: 30px;width: 600px">
					<h5 class="card-title d-flex justify-content-between align-items-center">
						<h2>Uploaded Assignments</h2>
						<div class="card-block">
					</h5>
					<div class="card-content">
						<div
							class="card-body d-flex align-items-center justify-content-center">
							<div class="text-center">
								<table class="table table-bordered" border="1" cellpadding="3">
									<tr>
										<th>Assignment Name</th>
										<th>Date</th>
										<th>File</th>
									</tr>
								</table>
							</div>
						</div>
					</div>
				</div>
		</div>

			<c:set var="lstAdd" value="${requestScope.attendenceList}"></c:set>
			<c:if test="${lstAdd!=null}">
				<div class="card attendenceCard text-center scrollable-content ">
					<h5
						class="card-title d-flex justify-content-between align-items-center">
						<h2>View Attendance</h2>
						<span class="pull-right clickable close-icon"
							data-effect="fadeOut"><i class="fa fa-times"></i></span>
						<div class="card-block">
					</h5>
					<div class="card-content">
						<div
							class="card-body d-flex align-items-center justify-content-center">
							<div class="text-center">
								<table class="table table-bordered" border="1" cellpadding="3">
									<tr>
										<th>Class Name</th>
										<th>Date</th>
										<th>Student Name</th>
										<th>Student Roll</th>
										<th>Status</th>
									</tr>
									<c:forEach items="${lstAdd}" var="a">
										<tr>
											<td>${a.c_name}</td>
											<td>${a.date}</td>
											<td>${a.s_name}</td>
											<td>${a.s_no}</td>
											<td>${a.status}</td>
										</tr>
									</c:forEach>
								</table>
							</div>
						</div>
					</div>
				</div>
		</div>
		</c:if>
		<c:remove var="attendenceList" scope="session" />

		<c:set var="rs" value="${sessionScope.enroll}"></c:set>
		<c:if test="${rs != null}">
			<div class="card attendanceCard text-center scrollable-content">
				<h5
					class="card-title d-flex justify-content-between align-items-center">
					<h2>View Enrollment List</h2>
					<span class="pull-right clickable close-icon" data-effect="fadeOut">
						<i class="fa fa-times"></i>
					</span>
				</h5>
				<div class="card-block">
					<div class="card-content">
						<div
							class="card-body d-flex align-items-center justify-content-center">
							<div class="text-center">
								<table class="table table-bordered" border="1" cellpadding="3">
									<tr>
										<th>Class Name</th>
										<th>Class ID</th>
										<th>Student Name</th>
										<th>Student Roll</th>
									</tr>
									<c:choose>
										<c:when test="${rs.next()}">
											<tr>
												<td>${rs.getString(1)}</td>
												<td>${rs.getString(2)}</td>
												<td>${rs.getString(3)}</td>
												<td>${rs.getInt(4)}</td>
											</tr>
										</c:when>
										<c:otherwise>
											<tr>
												<td colspan="4">No enrollment records found.</td>
											</tr>
										</c:otherwise>
									</c:choose>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:if>
		<c:remove var="enroll" scope="session" />

		<script>
			$('.close-icon').on('click', function() {
				$(this).closest('.attendenceCard').fadeOut();
			})
		</script>

		<div class="modal fade" id="Enrolled" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-header">
						<h1 class="modal-title fs-5" id="exampleModalLabel">Enrollment
							Sheet</h1>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body" style="width: 30rem; height: 10rem">
						<form action="ClassController" style="width: 25rem;">
							<label style="padding-top: 20px; font-size: 20px;">Class
								Name</label> <input class="form-control" type="text"
								value="${cName}"
								aria-label="readonly input example" name="className" readonly>
							<br>
							<button type="submit" class="btn btn-success" name="enrollment"
								style="margin-bottom: 20px">Submit</button>
						</form>
					</div>
				</div>
			</div>
		</div>

		<div class="modal fade" id="Attendence" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-header">
						<h1 class="modal-title fs-5" id="exampleModalLabel">Attendence
							Sheet</h1>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body mx-auto p-2">
						<form action="ClassController" style="width: 25rem;">
							<label style="padding-top: 20px; font-size: 20px;">Class
								Name</label> <input class="form-control" type="text"
								value="${cName}"
								aria-label="readonly input example" name="className" readonly>
							<label style="padding-top: 20px; font-size: 20px;">Date</label> <input
								type="date" class="text form-control" name="date" /> <br>
							<button type="submit" class="btn btn-success" name="attendence"
								style="margin-bottom: 20px">Attendence</button>
						</form>
					</div>
				</div>
			</div>
		</div>

		<div class="modal fade" id="Assignment" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-header">
						<h1 class="modal-title fs-5" id="exampleModalLabel">Upload
							Assignment</h1>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body mx-auto p-2">
						<form action="ClassController" method="post" style="width: 25rem;" enctype="multipart/form-data" onsubmit="return validateForm();">
    <label style="padding-top: 20px; font-size: 20px;">Class Name</label>
    <input class="form-control" type="text" value="${cName}" aria-label="readonly input example" name="className" readonly>

    <label style="padding-top: 20px; font-size: 20px;">Assignment</label>
    <div class="input-group mb-3">
        <input type="file" class="form-control" id="inputGroupFile02" name="aFile">
    </div>

    <label style="padding-top: 20px; font-size: 20px;">Assignment Name</label>
    <input type="text" class="form-control" name="aName" style="margin-bottom: 20px">

    <button type="submit" class="btn btn-success" name="assignment" style="margin-bottom: 20px">Upload</button>
</form>

<script>
function validateForm() {
    var fileInput = document.getElementById("inputGroupFile02");
    var assignmentNameInput = document.getElementsByName("aName")[0];

    // Check if a file is selected
    if (fileInput.files.length === 0) {
        alert("Please select a file.");
        return false;
    }

    // Get the selected file
    var file = fileInput.files[0];

    // Check if the file is a PDF
    if (file.type !== "application/pdf") {
        alert("Please select a PDF file.");
        return false;
    }

    // Check if the file size is less than or equal to 500 KB
    var fileSizeInKB = file.size / 1024;
    if (fileSizeInKB > 500) {
        alert("File size should be less than 500 KB.");
        return false;
    }

    // Check if assignment name is provided
    if (assignmentNameInput.value.trim() === "") {
        alert("Please enter the assignment name.");
        return false;
    }

    // All validations passed, allow form submission
    return true;
}
</script>
						
					</div>
				</div>
			</div>
		</div>
</body>
</html>