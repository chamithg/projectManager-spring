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
<body class="m-5 p-5">
<div class="d-flex justify-content-between">
<div class="w-75">
<h3>Create Project</h3>
<form:form class="w-50" action="/process/create" method="post" modelAttribute="newProject">
    <p>
        <form:label path="title">Title</form:label>
        <br>
        <form:errors path="title" class="text-danger"/>
        <br>
        <form:input path="title" class="form-control"/>
    </p>
    
    
    <p>
        <form:label path="description">Description</form:label>
        <br>
        <form:errors path="description" class="text-danger"/>
        <br>
        <form:textarea path="description" class="form-control"/>
    </p>
    
    <p>
        <form:label path="date">Due Date</form:label>
        <br>
        <form:errors path="date" class="text-danger"/>
        <br>
        <form:input path="date" type="date" class="form-control"/>
    </p>
    <form:input path="teamLead" type="hidden" value="${firstName}" class="form-control"/>
   
    <input type="submit" class="btn btn-primary" value="Submit"/>
</form:form>


</div>
</div>

</body>
</html>