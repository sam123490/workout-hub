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
<title>WorkoutHub | Dashboard</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>

	<div class="container border-bottom">
		<div class="row p-3 align-items-center">
			<div class="col-md-4 col-sm-12">
				<h1>Welcome <c:out value="${ user.firstName }" />...</h1>
			</div>
			<nav class="col-md-4 col-sm-12 offset-4 d-flex justify-content-end">
				<a href="#">My Account</a>
				<a href="/logout" class="ms-4">Logout</a>
			</nav>
		</div>
	</div>
	
	<div class="container">
		<div class="row p-3 justify-content-evenly">
			<div class="col-md-5 col-sm-12">
				<div class="card" >
				  	<img src="..." class="card-img-top" alt="...">
				  	<div class="card-body">
				    	<h5 class="card-title">My Workouts</h5>
				    	<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
				    	<a href="/my_workouts" class="btn btn-primary">View</a>
				  	</div>
				</div>
			</div>
			<div class="col-md-5 col-sm-12">
				<div class="card" >
				  	<img src="..." class="card-img-top" alt="...">
				  	<div class="card-body">
				    	<h5 class="card-title">Create a Workout</h5>
				    	<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
				    	<a href="/workouts/create" class="btn btn-primary">Start!</a>
				  	</div>
				</div>
			</div>
		</div>
		<div class="row p-3 justify-content-evenly">
			<div class="col-md-5 col-sm-12">
				<div class="card" >
				  	<img src="..." class="card-img-top" alt="...">
				  	<div class="card-body">
				    	<h5 class="card-title">My Personal Records</h5>
				    	<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
				    	<a href="#" class="btn btn-primary">My Account</a>
				  	</div>
				</div>
			</div>
			<div class="col-md-5 col-sm-12">
				<div class="card" >
				  	<img src="..." class="card-img-top" alt="...">
				  	<div class="card-body">
				    	<h5 class="card-title">Find Workouts made by Others</h5>
				    	<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
				    	<a href="#" class="btn btn-primary">Explore</a>
				  	</div>
				</div>
			</div>
		</div>
	</div>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>