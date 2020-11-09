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
			<div align="center">
				<a style="color:red">*** 모든 직원에게 발송되는 메시지 입니다. 긴급 상황시에만 작성해주세요. ***</a>
				<br><br>
				<span id="topBox">
					<select id="code" onchange="messageChange(value)" name="code">
						<option value="code">코드</option>
						<option value="화이트">화이트</option>
						<option value="그레이">그레이</option>
						<option value="퍼플">퍼플</option>
						<option value="블루">블루</option>
						<option value="그린">그린</option>
						<option value="오렌지">오렌지</option>
						<option value="레드">레드</option>
						<option value="핑크">핑크</option>
						<option value="옐로우">옐로우</option>
						<option value="블랙">블랙</option>
					</select>
					<select id="location" name="location">
						<option style="color:red" value="location">위치</option>
						<option value="전체">전체</option>
						<option value="중환자실">중환자실</option>
						<option style="color:red" value="A">본관</option>
						<option value="a301">301호</option>
						<option value="a302">302호</option>
						<option value="a303">303호</option>
						<option value="a304">304호</option>
						<option value="a305">305호</option>
						<option value="a306">306호</option>
						<option style="color:red" value="B">별관</option>
						<option value="b401">401호</option>
						<option value="b402">402호</option>
						<option value="b403">403호</option>
						<option value="b404">404호</option>
						<option value="b501">501호</option>
						<option value="b502">502호</option>
						
					</select>
					<input type="text" name="message" id="message">
					<button type="button" class="basic" id="submitBtn" onclick="submit()">긴급알림</button>
				</span>
				</div>
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
		</div>
	</section>
	

	<script>
		function messageChange(value){
			switch(value){
			case "화이트":
				$("#message").val("전산장애가 발생했습니다.");
				break;
			case "그레이":
				$("#message").val("위험인물 출현. 통제 및 신고가 필요합니다.");
				break;
			case "퍼플":
				$("#message").val("아동 유괴사건 발생. 의심 인물을 신고해주십시오.");
				break;
			case "블루":
				$("#message").val("심정지 환자가 발생했습니다.");
				break;
			case "그린":
				$("#message").val("긴급재난 발생. 긴급 대피 하십시오.");
				break;
			case "오렌지":
				$("#message").val("재해 및 대량사상자 발생했습니다.");
				break;
			case "레드":
				$("#message").val("화재발생. 화재 진압 및 환자대피가 필요합니다.");
				break;
			case "핑크":
				$("#message").val("산부인과 응급상황이 발생했습니다.");
				break;
			case "옐로우":
				$("#message").val("환자 정보 누락 및 유실되었습니다.");
				break;
			case "블랙":
				$("#message").val("폭탄위협 또는 유해물질 살포가 발생했습니다. 긴급 대피가 필요합니다.");
				break;
			}
			
		}
		
		function submit(){
			loca = $("#location").val();
			code = $("#code").val();
			writer = "${loginUser.id}";
			msg = $("#message").val();
			var em = loca+","+code+","+msg;
			if(code == "code"){
				alert("코드를 확인해주세요.");
				
			} else if(loca == "location" || loca == "A" || loca == "B"){
				alert("위치를 확인해주세요.");
				
			} else {
				$.ajax({
					url:"emergencyCall.ap",
					data:{
						location:loca,
						code:code,
						writer:writer
						},
					success:function(data){
						if(data == "success")
							serverOn(em);
					},
					error:function(e){
						console.log("에러 : " + e);
					}
					
				})
			}
			
		}
		function serverOn(em){
			console.log("성공!"+em);
		}
	
	</script>
</body>
</html>