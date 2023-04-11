<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>WorkoutHub | Add Exercise</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>

	<div class="container border-bottom">
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
		<div class="row p-3">
			<div class="col">
				<h2>My Workouts</h2>
			</div>
		</div>
		<div class="row p-3 justify-content-center">
			<div class="col-sm-10 col-md-8">
				<table class="table table-striped table-hover">
					<tr>
						<th>Name:</th>
						<th># of Exercises:</th>
						<th>Created: </th>
						<th>actions</th>
					</tr>
					<c:forEach var="workout" items="${ workouts }">
					<tr>
						<td><c:out value="${ workout.name }" /></td>
						<td>${fn:length(workout.exercises)}</td>
						<td><fmt:formatDate type = "date" value = "${workout.createdAt}" /></td>
					</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>