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
<link rel="stylesheet" href="../static/CSS/style.css" />
</head>
<body>

	<nav class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top">
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
         <c:when test = "${welcomeMessage != null}">
         	<div class="alert alert-primary alert-dismissible fade show mb-0" role="alert">
         		<c:out value="${ welcomeMessage }" />
  				<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
			</div>
         </c:when>
	</c:choose>
	
	<div class="color-overlay">
		<div class="container text-center">
			<div id="title-height" class="row align-items-center">
				<div class="col">
					<h1 id="title-header" class="text-white">workouthub</h1>
					<a href="/dashboard#main" id="title-btn" class="btn btn-dark mt-3">Do Something Today</a>
				</div>
			</div>
		</div>
		
		<div id="main" class="container-fluid">
			<div class="row justify-content-evenly">
				<div class="mt-4 col-sm-12 col-md-5 col-lg-4">
					<div class="card" >
					  	<div class="card-body">
					    	<h5 class="card-title">My Workouts</h5>
					    	<p class="card-text">All of your workouts online. No more struggling to keep track of your programs.</p>
					    	<a href="/workouts/my_workouts" class="btn btn-primary">View</a>
					  	</div>
					</div>
				</div>
				<div class="mt-4 col-sm-12 col-md-5 col-lg-4">
					<div class="card" >
					  	<img src="..." class="card-img-top" alt="...">
					  	<div class="card-body">
					    	<h5 class="card-title">Create a Workout</h5>
					    	<p class="card-text">Craft your perfect workout!</p>
					    	<a href="/workouts/create" class="btn btn-primary">Start!</a>
					  	</div>
					</div>
				</div>
			</div>
			<div class="row justify-content-evenly">
				<div class="mt-4 col-sm-12 col-md-5 col-lg-4">
					<div class="card" >
					  	<img src="..." class="card-img-top" alt="...">
					  	<div class="card-body">
					    	<h5 class="card-title">My Personal Records</h5>
					    	<p class="card-text">Save all of your personal records and one-rep maxes here.</p>
					    	<a href="#" class="btn btn-primary">My Account</a>
					  	</div>
					</div>
				</div>
				<div class="mt-4 mb-4 col-sm-12 col-md-5 col-lg-4">
					<div class="card" >
					  	<img src="..." class="card-img-top" alt="...">
					  	<div class="card-body">
					    	<h5 class="card-title">Find Workouts Made By Others</h5>
					    	<p class="card-text">Want to try something new? Explore other people's workouts.</p>
					    	<a href="#" class="btn btn-primary">Explore</a>
					  	</div>
					</div>
				</div>
			</div>
			<hr />
			<div class="row">
				<div class="col text-center">
					<p>coded by Samuel Rodriguez</p>
				</div>
			</div>
		</div>
	</div>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>