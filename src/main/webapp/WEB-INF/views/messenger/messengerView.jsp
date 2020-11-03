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
    width:80%;
    margin-top:50px;
}
th, td
{
	font-family: "S-CoreDream-3Light", serif;
    padding: 8px;
    text-align: left;
    border-bottom: 1px solid #ddd;
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
select{
	width:80px;
	height:30px;
	margin-right:2px;
	font-family: "S-CoreDream-3Light", serif;
}
.contentDiv{
	border:1px solid #f7f7f7;
	background:#f7f7f7;
	margin-left:0;
	width:100%;
	height:115%;
}
#mkChat{
	border-top:2px solid lightgray;
	background:white;
	width:500px;
	height:700px;
	margin-top:30px;
	margin-left:70px;
	padding:20px;
}
#keyword{
	width:200px;
	height:30px;
}
#searchBtn{
	width:80px;
	height:30px;
	border:1px solid lightgray;
	font-family: "S-CoreDream-3Light", serif;
}
span{
	margin:44px;
}
#searchBtn:hover{
	background:#e2e2e2;
	cursor:pointer;
}
#chatting{
	float:left;
	width:500px; 
	height:700px; 
	margin-top:30px; 
	margin-left:100px; 
	background:white;
	box-shadow:0px 0px 10px gray inset;
	overflow-y:scroll;
}
.scrolled::-webkit-scrollbar{
	display:none;
}
#search-box{
margin-top:10px; 
height:80%;
overflow-y:scroll;
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
			<a class="menu" href="${ goMessenger }" style="color:#113f36;">메신저</a> 
			<a class="menu" href="${ goEmergency }" style="color:red">긴급메시지</a>
			<br><br>
		</div>
		<h1 id="submenuTitle">메신저</h1>
		<div class="contentDiv">
			<form action="" id="mkChat" style="float:left">
				<span>
					<select name="search-item">
						<option value="name">이름</option>
						<option value="department">부서</option>
						<option value="job">직급</option>
					</select>
					<input type="search" name="keyword" id="keyword">
					<button type="button" id="searchBtn">찾아보기</button>
				</span>
				<!-- 검색 결과에 따라 보여줌 -->
				<div class="scrolled" id="search-box">
				</div>
				<div id="select-box" style="margin-top:5px; height:15%; box-shadow:0px 0px 5px gray inset;">
					
				</div>
			</form>
			<div id="chatting" class="scrolled">
			
			</div>
		</div>
	</section>
	<script>
		
	</script>
</body>
</html>