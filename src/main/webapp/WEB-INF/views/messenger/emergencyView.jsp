<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Active Plus::긴급메시지</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
<style type="text/css">
@font-face { 
	font-family: 'S-CoreDream-3Light'; 
	src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-3Light.woff') format('woff'); 
	font-weight: normal; 
	font-style: normal; 
}
table
{
    border-collapse: collapse;
    width:70%;
    margin-top:50px;
}
th, td
{
	font-family: "S-CoreDream-3Light", serif;
    padding: 8px;
    text-align: left;
    border: 1px solid #ddd;
    color:#2f2f2f;
    text-align:center;
}
th{
	background:#effff0;
}
td{
	text-overflow: ellipsis;
	height:40px;
}
tbody tr:hover{
	background:#efefef;
}

input[type=text]{
	width:500px;
	height:30px;
	
}
select{
	width:80px;
	height:30px;
	margin-right:2px;
}
button{
	width:80px;
	height:30px;
	color:red;
	background:white;
	border:none;
	font-size:15px;
}
.basic:hover{
	cursor:pointer;
}
a{	
	text-align:center;
}

</style>
</head>
<body>
	<nav id="side">
		<jsp:include page="../common/menubar.jsp" />
	</nav> 
	<section>
		<div id="subMenu">
			<c:url var="goEmergency" value="emergency.ap" scope="application"/>
			<a class="menu" href="${ goMessenger }">메신저</a> 
			<a class="menu" href="${ goEmergency }" style="color:red">긴급메시지</a>
			<br><br>
		</div>
		<h1 id="submenuTitle" style="color:red">긴급메시지</h1>
		<div id="contentDiv">
			<form action="" align="center">
				<a style="color:red">*** 모든 직원에게 발송되는 메시지 입니다. 긴급 상황시에만 작성해주세요. ***</a>
				<br><br>
				<span id="topBox">
					<select id="code" onchange="messageChange(value)">
						<option >코드</option>
						<option value="white">화이트</option>
						<option value="gray">그레이</option>
						<option value="purple">퍼플</option>
						<option value="blue">블루</option>
						<option value="green">그린</option>
						<option value="orange">오렌지</option>
						<option value="red">레드</option>
						<option value="pink">핑크</option>
						<option value="yellow">옐로우</option>
						<option value="black">블랙</option>
					</select>
					<select id="location">
						<option style="color:red">위치</option>
						<option value="전체">전체</option>
						<option value="중환자실">중환자실</option>
						<option style="color:red">본관</option>
						<option value="a301">301호</option>
						<option value="a302">302호</option>
						<option value="a303">303호</option>
						<option value="a304">304호</option>
						<option value="a305">305호</option>
						<option value="a306">306호</option>
						<option style="color:red">별관</option>
						<option value="b401">401호</option>
						<option value="b402">402호</option>
						<option value="b403">403호</option>
						<option value="b404">404호</option>
						<option value="b501">501호</option>
						<option value="b502">502호</option>
						
					</select>
					<input type="text" name="message" id="message">
					<button type="button" class="basic" id="submitBtn">긴급알림</button>
				</span>
			</form>
			<div id="tableBox" align="center">
				<table>
					<thead>
						<tr>
							<th>No</th>
							<th>코드</th>
							<th>위치</th>
							<th>일자</th>
							<th>작성자</th>
							<th>상태</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>102</td>
							<td>블루</td>
							<td>34병동 342호</td>
							<td>2020-10-21</td>
							<td>최나라</td>
							<c:choose>
								<c:when test="${ emergency.status eq 'ongoing' && emergency.eWriter eq loginUser.empId}">
									<td><button type="button" style="color:red; font-weight:900">진행</button></td>
								</c:when>
								<c:when test="${ emergency.status eq 'ongoing' && emergency.eWriter ne loginUser.empId}">
									<td>진행중</td>
								</c:when>
								<c:otherwise>
									<td style=" font-weight:900">종료</td>
								</c:otherwise>
								
							</c:choose>
						</tr>
					</tbody>
				</table>
			</div>
			<div id="pagingBox">
				
			</div>
		</div>
	</section>
	<script>
		$(document).ready(function(){
			$("#submitBtn").on("click",function(){
				$.ajax({
					url:""
				});
			});
			
		});
		function messageChange(value){
			switch(value){
			case "white":
				$("#message").val("전산장애가 발생했습니다.");
				break;
			case "gray":
				$("#message").val("위험인물 출현, 통제 및 신고가 필요합니다.");
				break;
			case "purple":
				$("#message").val("아동 유괴사건 발생. 의심 인물을 신고해주십시오.");
				break;
			case "blue":
				$("#message").val("심정지 환자가 발생했습니다.");
				break;
			case "green":
				$("#message").val("긴급재난 발생, 긴급 대피 하십시오.");
				break;
			case "orange":
				$("#message").val("재해 및 대량사상자 발생했습니다.");
				break;
			case "red":
				$("#message").val("화재발생, 화재 진압 및 환자대피가 필요합니다.");
				break;
			case "pink":
				$("#message").val("산부인과 응급상황이 발생했습니다.");
				break;
			case "yellow":
				$("#message").val("환자 정보 누락 및 유실되었습니다.");
				break;
			case "black":
				$("#message").val("폭탄위협 또는 유해물질 살포가 발생했습니다. 긴급 대피가 필요합니다.");
				break;
			}
			
		}
	</script>
</body>
</html>