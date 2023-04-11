<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>WorkoutHub | Create Workout</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>

	<div class="container">
		<div class="row p-3 align-items-center">
			<div class="col-md-4 col-sm-12">
				<h1>Workout Hub</h1>
			</div>
			<nav class="col-md-4 col-sm-12 offset-4 d-flex justify-content-end">
				<a href="/dashboard">Home</a>
				<a href="#" class="ms-4">My Account</a>
				<a href="/logout" class="ms-4">Logout</a>
			</nav>
		</div>
	</div>

	<div class="container">
		<div class="row justify-content-center">
			<div class="col-sm-12 col-md-10 col-lg-8">
				<h2>New Workout</h2>
				<p>Let's start by giving your workout a name...</p>
				<div class="p-3 border rounded bg-light">
					<form:form action="/workouts/create" method="post" modelAttribute="newWorkout">
						<form:input type="hidden" path="user" value="${ user.id }" />
					
						<form:label for="name" path="name" class="form-label">Name:</form:label>
						<form:errors path="name" class="text-danger" />
						<form:input id="name" path="name" class="form-control" />
						
						<input type="submit" class="btn btn-primary mt-3" />
					</form:form>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-12 d-flex justify-content-center">
				<a href="/dashboard" class="mt-3">cancel</a>
			</div>
		</div>
	</div>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>