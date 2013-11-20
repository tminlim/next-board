<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> <title>NEXT</title>
<link rel="stylesheet" media="screen" type="text/css" href="/stylesheets/newWrite.css" />
</head>
<body>
<!-- <a href="/user/login">login</a> -->
	<div class = "sub_wrap">
		<c:choose>
			<c:when test="${not empty sessionScope.userId}">
			<h1 class ="title"><a href = "/user.logout">logout</a></h1>
			</c:when>
			<c:otherwise>
			<h1 class ="title"><a href = "/user/login">login</a></h1> 
			</c:otherwise>
		</c:choose>
		<h1 class ="title"><a href = "/user/signup">signup</a></h1>	
	</div>
</body>
</html>