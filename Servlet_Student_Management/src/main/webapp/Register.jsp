<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Registation form</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
<link rel="stylesheet" href="style2.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

</head>
<body>

<c:set var="bool" value="${sessionScope.result}" />

<c:if test="${bool != null && !bool}">
  <div class="mx-auto p-3" style="width: 700px">
    <div class="alert alert-warning alert-dismissible fade show" role="alert">
      <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
      <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-exclamation-triangle-fill" viewBox="0 0 16 16">
        <path d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z" />
      </svg>
      Password and Confirm Password Fields should be the same
    </div>
  </div>
</c:if>
<c:remove var="reult" scope="session" />

<c:set var="iobj" value="${sessionScope.message}" />
<c:if test="${iobj != null}">
  <c:choose>
    <c:when test="${iobj == 0}">
      <div class="mx-auto p-3" style="width: 700px">
        <div class="alert alert-warning alert-dismissible fade show" role="alert">
          <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-exclamation-triangle-fill" viewBox="0 0 16 16">
            <path d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z" />
          </svg>
          You have already logged in with this Email or Mobile No or Id.
          <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
      </div>
    </c:when>
  </c:choose>
</c:if>

<c:remove var="message" scope="session" />


	<div class="container register">
		<div class="row">
			<div class="col-md-3 register-left">
				<img src="./Images/Rocket.png" alt="Logo">
				<h3>Welcome</h3>
				<p>Welcome to Student Management System</p>
				<p>Already Registed? Go to Login Page by clicking button given below</p>
				<a href="Login.jsp"><input type="submit" name="Login" value="Login"></a>
			</div>
			<div class="col-md-9 register-right" style="background-color: white; border-top-left-radius: 10% 50%;
    border-bottom-left-radius: 10% 50%;border-top-left-radius: 10% 50%;">

				<div class="d-flex justify-content-end p-3">
					<button id="studentButton">Student</button>
					<button id="teacherButton">Teacher</button>
				</div>

				<form action="RegisterController" class="Register-form" id="studentForm"
					style="display: none;" onsubmit="return validateForm()" method="Post">
					<div class="tab control" id="myTabContent">
						<div class="tab-pane fade show active" id="student"
							role="tabpanel" aria-labelledby="student-tab">
							<h3 class="register-heading">Register as a Student</h3>
							<div class="row register-form">
								<div class="col-md-6">
									<div class="form-group">
										<input type="text" class="form-control"
											placeholder="First Name" name="fname" maxlength="20">
										<div id="nameError" style="color: red"></div>
									</div>
									<br>
									<div class="form-group">
										<input type="text" class="form-control"
											placeholder="Last Name" name="lname" maxlength="20">
										<div id="nameError" style="color: red"></div>
									</div>
									<br>
									<div class="form-group">
										<input type="text" class="form-control" placeholder="Roll No" name="rollNo" maxlength="6">
										<div id="passError" style="color: red"></div>
									</div>
									<br>
									<div class="form-group">
										<input type="text" class="form-control" placeholder="Batch no" name="bNo" maxlength="6" >
										<div id="passError" style="color: red"></div>
									</div>
									<br>
									<div class="form-group">
										<input type="text" class="form-control"
											placeholder="Password "  name="pass" maxlength="8">
										<div id="passError" style="color: red"></div>
									</div>
									<br>
									<div class="form-group">
										<div class="max1">
											<label class="radio inline padding-right-10"> <input
												type="radio" name="gender" value="male" checked="checked">
												<span>Male</span>
											</label> <label class="radio inline"> <input type="radio"
												name="gender" value="female" checked="checked"> <span>Female</span>
											</label>
										</div>
									</div>
									<br>
								</div>

								<div class="col-md-6">
									<div class="form-group">
										<input type="email" class="form-control"
											placeholder="Your Email address"  name="email" maxlength="45">
										<div id="emailError" style="color: red"></div>
									</div>
									<br>
									<div class="form-group">
										<input type="text" class="form-control" minlength="10"
											maxlength="10" placeholder="Your Mobile Number" 
											name="mobNo">
										<div id="mobError" style="color: red"></div>
									</div>
									<br>
									<div class="form-group">
										<select class="form-control" name="secQuest">
											<option class="hidden" selected="selected"
												disabled="disabled">Please select your Security
												Question</option>
											<option>What is your Birth Year?</option>
											<option>What is your Favourite Colour?</option>
											<option>What is your Pet Name?</option>
										</select>
									</div>
									<br>
									<div class="form-group">
										<input type="text" class="form-control"
											placeholder="Enter your Answer" name="secAns" maxlength="10">
									</div>
									<br>
									<div class="form-group">
										<input type="password" class="form-control"
											placeholder="Confirm Password" name="conPass" maxlength="8">
										<div id="passError" style="color: red"></div>
									</div>
									<br>
								</div>
								<br> <input type="submit" class="btnRegister"
									value="Register" name="studentForm">
							</div>
						</div>
					</div>
				</form>

				<form id="teacherForm" style="display: none;" action="RegisterController" method="Post">
				 <div class="tab-pane fade show " id="teacher" role="tabpanel" aria-labelledby="teacher-tab">
                    <h3 class="register-heading">Register as a Teacher</h3>
                    <div class="row register-form">
                        <div class="col-md-6">
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="First Name" name="fname" maxlength="20">
                                <div id="nameError" style="color: red"></div>
                            </div><br>
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Last Name" name="lname" maxlength="20">
                                <div id="passError" style="color: red"></div>
                            </div><br>
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Teacher's Id"  name="tId" maxlength="6">
                            </div><br>
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Password" name="pass" maxlength="8">
                            </div><br>
                            <div class="form-group">
                                <input type="password" class="form-control" placeholder="Confirm Password" name="conPass" maxlength="8">
                                <div id="passError" style="color: red"></div>
                            </div><br>
                            
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <input type="email" class="form-control" placeholder="Your Email address" name="email" maxlength="40">
                                <div id="emailError" style="color: red"></div>
                            </div><br>
                            <div class="form-group">
                                <input type="text" class="form-control" minlength="10" maxlength="10" placeholder="Your Mobile Number" name="mobNo">
                                <div id="mobError" style="color: red"></div>
                            </div><br>
                            <div class="form-group">
                                <select class="form-control" name="secQuest">
                                    <option class="hidden" selected="selected" disabled="disabled">Please select your Security Question</option>
                                    <option>What is your Birth Year?</option>
                                    <option>What is your Favourite colour?</option>
                                    <option>What is your Pet Name?</option>
                                </select>
                            </div><br>
                             <div class="form-group">
                                <input type="text" class="form-control" placeholder="Enter your Answer" maxlength="10" name="secAns">
                             </div><br>
                             <div class="form-group">
                                <div class="max1">
                                    <label class="radio inline padding-right-10">
                                        <input type="radio" name="gender" value="male" checked="checked">
                                        <span>Male</span>
                                    </label>
                                    <label class="radio inline">
                                        <input type="radio" name="gender" value="female" checked="checked">
                                        <span>Female</span>
                                    </label>
                                </div>
                            </div><br>
                        </div><br>
                        <input type="submit" class="btnRegister" value="Register" name="teacherForm">
                    </div>
				</form>

			</div>
		</div>
	</div>

	<script>
		document.addEventListener('DOMContentLoaded', function() {
			var studentButton = document.getElementById('studentButton');
			var teacherButton = document.getElementById('teacherButton');
			var studentForm = document.getElementById('studentForm');
			var teacherForm = document.getElementById('teacherForm');

			studentButton.addEventListener('click', function() {
				studentForm.style.display = 'block';
				teacherForm.style.display = 'none';
			});

			teacherButton.addEventListener('click', function() {
				teacherForm.style.display = 'block';
				studentForm.style.display = 'none';
			});
		});
	</script>


</body>
</html>