<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.5.1.js" 
integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script>
		$(document).ready(function(){
			<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
			document.location.href="loginform.ap";
		});
	</script>
</head>
<body>
	<div align="center">
		<button onclick="location.href='main.ap'">로그인</button>
	</div>
</body>
</html>