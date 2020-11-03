<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.5.1.js" 
integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>Active Plus</title>
<link rel="stylesheet" href="${ contextPath }/resources/css/basic.css"/>
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
			<c:url var="goSchd" value="calendar.ap">
				<c:param name="scd_sq" value="1"/>
			</c:url>
			<c:url var="goItem" value="itemList.ap"/>
			<c:url var="goMail" value="mail.ap"/>
			<c:url var="goTask" value="diagnosisList.ap"/>
			<c:url var="goMail" value="mail.ap"/>
			<c:url var="goApproval" value="approvalMain.ap"/>
			<a href="${ goSchd }">일정관리</a>
			<a href="${ goApproval }">전자결재</a>
			<a href="#">게시판</a>
			<a href="#">메신저</a> 
			<a href="${ goMail }">메일</a>
			<a href="#">인사관리</a>
		</div>
</body>
</html>