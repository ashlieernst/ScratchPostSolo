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
<title>Home</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/style.css"> 
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/js/app.js"></script>
</head>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
    <a class="navbar-brand">ScratchPost
    <img class="blackPaw" src="images/blackPaw.svg.png"></a>
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
<div class="homeContainer mt-4">
<div class="card">
  <c:forEach var="post" items="${posts}">
<div class="card-header">

    
  </div>
  <div class="row g-0">
    <div class="col-5 p-2 ">
      <img src="${post.image_url}" class="img-fluid image" alt="card-horizontal-image">
    </div>
    <div class="col-4 textContainer">
      <div class="card-body">
      
        <h5 class="card-title"><u><c:out value="${post.postTitle}"></c:out></u></h5>
        <p class="card-text"><c:out value="${post.postDescription}"></c:out></p>
        <p>@${post.user.userName }</p>
        
        <c:choose>
	<c:when test="${userId == post.user.id }">
	<div class="btn-group" role="group">
	<a class="" href="/posts/edit/${post.id}"><button class="btn btn-light me-2">Edit</button></a>
	<form action="/posts/delete/${post.id}" method="post" >
    <input type="hidden" name="_method" value="delete" >
    <input class="btn btn-light" type="submit" value="Delete">
    </form>
    </div>
    </c:when>
    <c:otherwise>
    	<p><c:out value=""/></p>
    	</c:otherwise>
    	</c:choose>
    	</div>
    </div>
  </div>
        </c:forEach>
</div>
</div>


      
      
     
  



     














	

</body>
</html>