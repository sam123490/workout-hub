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
<title>WorkoutHub | Login</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>

	<div class="container">
		<div class="row mt-5">
			<div class="col-sm-12 col-md-4">
				<h1>Workout Hub</h1>
				<div class="p-3 border rounded bg-light">
					<form:form action="/login" method="post" modelAttribute="loginUser">
						<form:errors path="email" class="text-danger" />
						<div class="form-floating mb-3">
							<form:input id="email" path="email" class="form-control" placeholder="name@example.com" />
							<form:label for="email" path="email" class="form-label">Email:</form:label>
						</div>
						
						<form:errors path="password" class="text-danger" />
						<div class="form-floating mb-3">
							<form:input id="password" type="password" path="password" class="form-control" placeholder="password" />
							<form:label for="password" path="password" class="form-label">Password:</form:label>
						</div>
						
						<input type="submit" class="btn btn-primary mt-3" />
					</form:form>
					<p class="mt-4">Don't have an account?</p>
					<a href="/register">register here</a>
				</div>
			</div>
			<div class="col-sm-12 col-md-8">
				<img src="/static/img/gym_image_1.jpg" class="img-fluid" alt="gym" />
			</div>
		</div>
	</div>
	
</body>
</html>