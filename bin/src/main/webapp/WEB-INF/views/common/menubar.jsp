<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${ contextPath }/resources/css/basic.css">
</head>
<body>
	
		<div id="profile">
			<span id="user" class="profile">${ loginUser.userTeam }, ${ loginUser.userName }님</span>
			<span ><a id="info" class="profile" href="#">개인정보</a></span>
			<a href="main.ap">
			<img id="logo" src="${ contextPath }/resources/images/ActivePlus_Logo.png" style="float:right;">
			</a>
		</div>
		<div class="sidenav">
			<c:url var="goCal" value="calendar.ap"/>
			<c:url var="goTask" value="diagnosisList.ap"/>
			<a href="${ goCal }">일정관리</a>
			<a href="${ goTask }">업무관리</a>
			<a href="#">게시판</a>
			<a href="#">메신저</a> 
			<a href="#">메일</a>
			<a href="#">라이브러리</a>
		</div>
</body>
</html>