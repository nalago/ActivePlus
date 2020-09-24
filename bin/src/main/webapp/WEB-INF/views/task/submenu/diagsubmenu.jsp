<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="subMenu">
		<c:url var="goDiagDetail" value="DiagDetail.ap"/>
			<a class="menu" href="${ goDiagDetail }">진료</a>
			<a class="menu" href="#">진료기록</a>
			<a class="menu" href="#">예약조회</a>
			<br><br>
	</div>

</body>
</html>