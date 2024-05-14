<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/style.css"> 
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/js/app.js"></script>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
    <a class="navbar-brand">ScratchPost
         <img class="blackPaw" src="/images/blackPaw.svg.png"> </a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse show" id="navbarNavAltMarkup">
      <div class="navbar-nav">
        <a class="nav-link active" aria-current="page" href="/home">Home</a>
        
      </div>
    </div>
  </div>
</nav>

	<div class="indexContainer mt-5">
	
	<div class="titleContainer mt-5 me-4">
	<h1>ScratchPost</h1>
	<p>A place for cat owners</p>
	<img class="paw" src="images/paw.png">
	</div>
	
	<div class="userContainer">
	<div class="container-sm card me-2">
	<form:form class="" action="/login" method="POST" modelAttribute="loginUser">
	<div class="card-header"><h4>Login</h4></div>

	
	<div class="mb-3 mt-2">
	<form:label path="email" for="email" class="form-label ">Email:</form:label>
	<form:input path="email" type="email" class="form-control"/>
	<form:errors path="email"/>
	</div>
	<div class="mb-3">
	<form:label path="password" for="password" class="form-label">Password:</form:label>
	<form:input path="password" type="password" class="form-control"/>
	<form:errors path="password" />
	</div>
	<button type="submit" class="btn btn-light mt-2 mb-2">Login</button>
	</form:form>
	<a class="mb-1" href="/user/new">Create new account</a>
	</div>
	
  </div>
  </div>

 
	
	






</body>
</html>