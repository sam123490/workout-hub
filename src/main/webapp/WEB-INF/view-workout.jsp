<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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

	<div class="container">
		<div class="row mt-5 justify-content-center">
			<div class="col-sm-12 col md-10 col-lg-8 d-flex justify-content-between align-items-center">
				<h3><c:out value="${ workout.name }" /></h3>
				<p>Created: <fmt:formatDate type = "date" value = "${workout.createdAt}" /></p>
				<a href="#" class="btn btn-primary">Work Out!</a>
			</div>
		</div>
		<c:forEach var="exercise" items="${ workout.exercises }">
		<div class="row mt-2 justify-content-center">
			<div class="col-sm-12 col-md-10 col-lg-8">
				<div class="p-2 border rounded bg-light">
					<div class="row">
						<div class="col-12">
							<h4>name: <c:out value="${ exercise.name }" /></h4>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-12 col-md-8 d-flex justify-content-between">
							<p>sets: <c:out value="${ exercise.sets }" /></p>
							<p>reps: <c:out value="${ exercise.repetitions }" /></p>
							<p>weight: <c:out value="${ exercise.weight }" /> <c:out value="${ exercise.unit }" /></p>
						</div>
						<div class="col-sm-12 col-md-4">
							<p>note: <c:out value="${ exercise.note }" /></p>
						</div>
					</div>
				</div>
			</div>
		</div>
		</c:forEach>
	</div>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>