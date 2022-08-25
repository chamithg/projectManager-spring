<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="/css/style.css"/>
<!-- For any Bootstrap that uses JS or jQuery-->
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body class="p-5 m-5">
<h1>Welcocome Back! <c:out value="${firstName}"/>  </h1>

<a href="/addProject"> Add project</a>
<br/>

<a href="/process/logout"> LogOut</a>
<div class="w-50">
<h1>Projects</h1>

<table class="table">
  <thead>
    <tr>
      <th scope="col">Project</th>
      <th scope="col">Team Lead</th>
      <th scope="col">due Date</th>
      <th scope="col">Actions</th>
    </tr>
  </thead>
  <tbody>
  <c:forEach items="${projects}" var="project">
    <tr>
      <td><c:out value="${project.title }"/></td>
      <td><c:out value="${project.teamLead }"/></td>
      <td><c:out value="${project.date }"/></td>
      <td>edit</td>
    </tr>
     </c:forEach>
  </tbody>
</table>
</div>

</body>
</html>