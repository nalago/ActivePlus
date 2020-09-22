<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script>
		$(document).ready(function(){
			<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
		});
	</script>
</head>
<body>
	<div align="center">
		<button onclick="location.href='main.ap'">Click me!</button>
	</div>
</body>
</html>