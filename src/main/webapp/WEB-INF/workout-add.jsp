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

	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  		<div class="container">
    		<a class="navbar-brand" href="/dashboard">Workout Hub</a>
    		<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      		<span class="navbar-toggler-icon"></span>
    		</button>
    	<div class="collapse navbar-collapse" id="navbarSupportedContent">
      		<ul class="navbar-nav me-auto mb-2 mb-lg-0">
        		<li class="nav-item">
          		<a class="nav-link active" aria-current="page" href="#">My Account</a>
        		</li>
        		<li class="nav-item dropdown">
          		<a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Dropdown</a>
          	<ul class="dropdown-menu">
	            <li><a class="dropdown-item" href="/workouts/my_workouts">My Workouts</a></li>
	            <li><a class="dropdown-item" href="/workouts/create">Create a Workout</a></li>
	            <li><a class="dropdown-item" href="#">Personal Records</a></li>
	            <li><a class="dropdown-item" href="#">Find Workouts</a></li>
          	</ul>
        	</li>
      		</ul>
      		<div>  			
        		<a href="/logout" class="text-decoration-none link-light">Logout</a>
      		</div>
    	</div>
  		</div>
	</nav>
	
	<c:choose>
         <c:when test = "${success != null}">
         	<div class="alert alert-success alert-dismissible fade show" role="alert">
         		<c:out value="${ success }" />
  				<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
			</div>
         </c:when>
	</c:choose>
	
	<div class="container">
		<div class="row mt-5">
			<div class="col-12">
				<h2>Workout: <c:out value="${ workout.name }" /></h2>
			</div>
		</div>
		<div class="row justify-content-center">
			<div class="mt-3 col-sm-12 col-md-4">
				<h4>Add Exercise</h4>
				<div class="p-3 border rounded bg-light">
					<form:form action="/workouts/${workout.id}/edit" method="post" modelAttribute="newExercise">
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
							<option value="Other">other</option>
						</form:select>

						<form:label for="weight" path="weight" class="form-label">Weight:</form:label>
						<form:errors path="weight" class="text-danger" />
						<form:input id="weight" type="number" path="weight" class="form-control" />

						<form:label for="note" path="note" class="form-label">Note:</form:label>
						<form:errors path="note" class="text-danger" />
						<form:input id="note" type="text" path="note" class="form-control" placeholder="optional" />
							
						<input type="submit" value="Add Exercise" class="btn btn-primary mt-3" />
						<a href="/workouts/my_workouts" class="btn btn-outline-success mt-3">Finish</a>
					</form:form>
				</div>
			</div>
			<div class="mt-3 col-sm-12 col-md-8">
				<h4>Exercises</h4>
				<div class="table-responsive">
					<table class="table table-striped table-hover align-middle">
						<thead>
							<tr>
								<th>name</th>
								<th>sets</th>
								<th>reps</th>
								<th>weight</th>
								<th>note</th>
								<th>actions</th>
							</tr>
						</thead>
						<tbody class="table-group-divider">
							<c:forEach var="exercise" items="${ workout.exercises }">
							<tr>
								<td><c:out value="${ exercise.name }" /></td>
								<td><c:out value="${ exercise.sets }" /></td>
								<td><c:out value="${ exercise.repetitions }" /></td>
								<td><c:out value="${ exercise.weight }" /> <c:out value="${ exercise.unit }" /></td>
								<td><c:out value="${ exercise.note }" /></td>
								<td class="d-flex align-items-center">
									<a href="/workouts/${workout.id}/exercises/${exercise.id}/edit" class="me-2">edit</a>
									<form action="/workouts/${workout.id}/exercises/${exercise.id}/delete" method="post">
		    							<input type="hidden" name="_method" value="delete">
		    							<input type="submit" class="btn btn-link text-danger" value="delete">
									</form>
								</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>