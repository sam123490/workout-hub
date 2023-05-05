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
			<div class="col-md-4 col-sm-12">
				<div class="p-3 border rounded bg-light">
					<form:form action="/login" method="post" modelAttribute="loginUser">
						<form:label for="email" path="email" class="form-label">Email:</form:label>
						<form:errors path="email" class="text-danger" />
						<form:input id="email" path="email" class="form-control" />
						
						<form:label for="password" path="password" class="form-label">Password:</form:label>
						<form:errors path="password" class="text-danger" />
						<form:input id="password" type="password" path="password" class="form-control" />
						
						<input type="submit" class="btn btn-primary mt-3" />
					</form:form>
					<p>Don't have an account?</p>
					<a href="/register">register here</a>
				</div>
			</div>
			<div class="col-md-8 col-sm-12">
				<img src="/static/img/gym_image_1.jpg" class="img-fluid" alt="gym" />
			</div>
		</div>
	</div>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>