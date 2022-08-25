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
<h3>Registration</h3>
<form:form class="w-50" action="/process/registration" method="post" modelAttribute="newUser">
    <p>
        <form:label path="firstName">First Name</form:label>
        <br>
        <form:errors path="firstName" class="text-danger"/>
        <br>
        <form:input path="firstName" class="form-control"/>
    </p>
    
    
    <p>
        <form:label path="lastName">Last Name</form:label>
        <br>
        <form:errors path="lastName" class="text-danger"/>
        <br>
        <form:input path="lastName" class="form-control"/>
    </p>
    
    <p>
        <form:label path="email">Email</form:label>
        <br>
        <form:errors path="email" class="text-danger"/>
        <br>
        <form:input path="email" class="form-control"/>
    </p>
    <p>
        <form:label path="password">Password</form:label>
        <br>
        <form:errors path="password" class="text-danger"/>    
        <br> 
        <form:input path="password" type="password"  class="form-control"/>
    </p>  
    <p>
        <form:label path="confirmPassword">Confirm Password</form:label>
        <br>
        <form:errors path="confirmPassword" class="text-danger"/>
        <br>
        <form:input path="confirmPassword" type="password" class="form-control"/>
    </p>  
    <input type="submit" class="btn btn-primary" value="Submit"/>
</form:form>
</div>
<div class="w-75">
<h3>Login</h3>
<form:form class="w-50" action="/process/login" method="POST" modelAttribute="loginAuth" >
    <p>
        <form:label path="email">Email</form:label>
        <br>
        <form:errors path="email" class="text-danger"/>
        <br>
        <form:input path="email" class="form-control"/>
    </p>
    <p>
        <form:label path="password">Password</form:label>
        <br>
        <form:errors path="password" class="text-danger"/>    
        <br> 
        <form:input path="password"  type="password" class="form-control"/>
    </p>  
    <input type="submit" class="btn btn-primary" value="Submit"/>
</form:form>

</div>
</div>



</body>
</html>