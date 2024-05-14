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
<title>Register</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/style.css"> 
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/js/app.js"></script>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
    <a class="navbar-brand">ScratchPost
    
    </a>
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

<div class="indexContainer mt-4">
	
	<div class="titleContainer mt-5 me-4">
	<h1>ScratchPost</h1>
	<p>A place for cat owners</p>
	
	</div>

<div class="registerContainer card mt-4 mb-4">
	<form:form class="p-2" action="/register" method="POST" modelAttribute="registerUser">
  <h4 class="mb-3 card-header">SignUp</h4>
  
    <form:label path="userName" for="userName" class="form-label">Username:</form:label>
    <form:input path="userName" type="text" class="form-control" id=""/>
  	<form:errors path="userName"/>
  
  <div class="mb-3">
   <form:label path="email" for="email" class="form-label">Email:</form:label>
    <form:input path="email" type="email" class="form-control" id=""/>
  	<form:errors path="email"/>
  </div>
  
  <div class="mb-3">
    <form:label path="password" for="" class="form-label">Password:</form:label>
    <form:input path="password" type="password" class="form-control" id=""/>
  	<form:errors path="password"/>
  </div>
  <div class="mb-3">
  <form:label path="confirm" for="confirm" class="form-label">Confirm Password:</form:label>
    <form:input path="confirm" type="password" class="form-control" id=""/>
  	<form:errors path="confirm"/>
  	</div>
  <button type="submit" class="btn btn-light mt-2">Register</button>
</form:form>

<a class="mb-1 ms-3" href="/">login</a>
  </div>
  </div>

</body>
</html>