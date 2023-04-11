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
				<h2><c:out value="${ workout.name }" /></h2>
			</div>
		</div>
		<div class="row justify-content-center">
			<div class="col-sm-12 col-md-4">
				<p>Next let's add some exercises...</p>
				<div class="p-3 border rounded bg-light">
					<form:form action="/workouts/${workout.id}/add_exercise" method="post" modelAttribute="newExercise">
						<form:input type="hidden" path="workout" value="${ workout.id }" />
						<form:input type="hidden" path="user" value="${ user.id }" />
						
						<form:label for="name" path="name" class="form-label">Name:</form:label>
						<form:errors path="name" class="text-danger" />
						<form:input id="name" type="text" path="name" class="form-control" />

						<form:label for="sets" path="sets" class="form-label">Sets:</form:label>
						<form:errors path="sets" class="text-danger" />
						<form:input id="sets" type="number" path="sets" class="form-control" />

						<form:label for="repetitions" path="repetitions" class="form-label">Reps:</form:label>
						<form:errors path="repetitions" class="text-danger" />
						<form:input id="repetitions" type="number" path="repetitions" class="form-control" />

						<form:label for="unit" path="unit" class="form-label">Unit:</form:label>
						<form:errors path="unit" class="text-danger" />
						<form:select id="unit" path="unit" class="form-select" aria-label="Default select example">
							<option disabled selected>SELECT A UNIT</option>
							<option value="lbs">lbs</option>
							<option value="kg">Kg</option>
							<option value="Other">Other</option>
						</form:select>

						<form:label for="weight" path="weight" class="form-label">Weight:</form:label>
						<form:errors path="weight" class="text-danger" />
						<form:input id="weight" type="number" path="weight" class="form-control" />

						<form:label for="note" path="note" class="form-label">Note:</form:label>
						<form:errors path="note" class="text-danger" />
						<form:input id="note" type="text" path="note" class="form-control" placeholder="optional" />
							
						<input type="submit" value="add exercise" class="btn btn-primary mt-3" />
						<a href="/workouts/${ workout.id }" class="btn btn-success mt-3">complete workout</a>
					</form:form>
				</div>
			</div>
			<div class="col-sm-12 col-md-6">
				<p>Exercises:</p>
				<table class="table table-striped">
					<tr>
						<th>name</th>
						<th>sets</th>
						<th>reps</th>
						<th>weight</th>
						<th>note</th>
					</tr>
					<c:forEach var="exercise" items="${ workout.exercises }">
					<tr>
						<td><c:out value="${ exercise.name }" /></td>
						<td><c:out value="${ exercise.sets }" /></td>
						<td><c:out value="${ exercise.repetitions }" /></td>
						<td><c:out value="${ exercise.weight }" /> <c:out value="${ exercise.unit }" /></td>
						<td><c:out value="${ exercise.note }" /></td>
					</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>