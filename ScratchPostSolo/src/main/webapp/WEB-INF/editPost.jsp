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
<title>Edit Post</title>
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
    </a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse show" id="navbarNavAltMarkup">
      <div class="navbar-nav">
        <a class="nav-link active" aria-current="page" href="/home">Home</a>
         <a class="nav-link active" aria-current="page" href="/posts/new">New post</a>
         <a class="nav-link active" aria-current="page" href="/logout">Logout</a>
      </div>
    </div>
  </div>
</nav>

<div class="updateContainer mt-4 p-4 mb-4">
<div class="card">
<div class="card-header">
   Edit post
  </div>
	<form:form action="/posts/edit/${id}" method="POST" modelAttribute="post" class="">
	<input type="hidden" name="_method" value="PUT" />
	
	<div class="mb-2 p-4">
	
	<form:label path="postTitle" class="form-label">Post Title: </form:label>
	<form:input path="postTitle"  class="form-control"></form:input>
	<form:errors path="postTitle"/>
	</div>
	<div class="mb-2 p-4">
	<form:label path="postDescription" class="form-label">Post Description:</form:label>
	<form:input path="postDescription"  class="form-control"></form:input>
	<form:errors path="postDescription"/>
	</div>
	<div class="mb-2 p-4">
	
	<form:label path="image_url" class="form-label">Photo Url: </form:label>
	<form:input path="image_url"  class="form-control"></form:input>
	<form:errors path="image_url"/>
	</div>
	<button class=" btn btn-light mt-2 mb-4 ms-4">Submit</button>
	</form:form>
	</div>
	</div>
	


</body>
</html>