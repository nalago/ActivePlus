<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Active Plus</title>
<style>
#userInfo {
	margin-left:200px;
	width: 300px;
	height: 600px;
	border: 1px solid black;
	float: left;
}

#mainT {
	margin: 30px;
	margin-left:600px;
}
h3{
	margin-top:70px;
}
.mainT{
	width:700px;
}
tbody{
	text-align:center;
	color:#8d8d8d;
}
thead {
}
/*유저 정보 */
#basic {
	border:1px solid yellowGreen;
	width : 200px;
	height: 300px;
	margin:auto;
	margin-top:30px;
}
#picture{
	width:170px;
	height:200px;
	border: 1px solid lightblue;
	margin:auto;
	margin-top:20px;
}
.user{
	border:1px solid yellow;
	width:200px;
	text-align:center;
	margin-top:20px;
	
}
#TNA{
	border:1px solid lightgray;
	width:300px;
	height:50px;
}
#work{
	width:250px;
	height:40px;
	margin-left:25px;
	margin-top:5px;
}
.TNABtn{
	background:none;
	color:#2f2f2f;
	border:none;
	border-radius:10px;
	font-size:15px;
}
.TNABtn:hover{
	cursor:pointer;
}
.half{
	width:125px;
	height:50px;
}

</style>
</head>
<body>
	<nav id="side">
		<jsp:include page="../common/menubar.jsp" />
	</nav>
	<section>
		<div id="userInfo">
			<div id="basic">
				<div id="picture"></div>
				<div class="user">${ loginUser.empId } ${ loginUser.category }, ${ loginUser.name }</div>
			</div>
			<div id="TNA">
				<!-- <button type="button" class="TNABtn" id="work">출근</button> -->
				<c:if test="${ !empty TNA.inTime }">
				</c:if>
				<!-- 출근 버튼 클릭 후 아래 버튼을 보이게한다. -->
				<button type="button" class="TNABtn half" style="margin-left:20px;">퇴근</button>
				<button type="button" class="TNABtn half">반차</button>
			</div>
			
		</div>
		<div id="mainT">
			<h3>메일</h3>
			<table align="center" class="mainT">
			<thead>
				<tr>
					<th>보낸이</th>
					<th>제목</th>
					<th>날짜</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>최나라</td>
					<td>오랜만이에여</td>
					<td>2020-09-22</td>
				</tr>
				<tr>
					<td>최나라</td>
					<td>오랜만이에여</td>
					<td>2020-09-22</td>
				</tr>
				<tr>
					<td>최나라</td>
					<td>오랜만이에여</td>
					<td>2020-09-22</td>
				</tr>
			</tbody>
			</table>
			<h3>공지사항</h3>
			<table align="center" class="mainT">
			<thead>
				<tr>
					<th>제목</th>
					<th>작성자</th>
					<th>날짜</th>
				</tr>
			</thead>	
			<tbody>	
				<tr>
					<td>테스트용 공지사항 입니다.</td>
					<td>관리자</td>
					<td>2020-09-22</td>
				</tr>
				<tr>
					<td>수업 듣기 너무 귀찮다..</td>
					<td>관리자</td>
					<td>2020-09-22</td>
				</tr>
				<tr>
					<td>반가워요. kh병원 직원 여러분</td>
					<td>관리자</td>
					<td>2020-09-22</td>
				</tr>
			</tbody>	
			</table>
			<h3>게시판</h3>
			<table align="center" class="mainT">
			<thead>
				<tr>
					<th>제목</th>
					<th>작성자</th>
					<th>날짜</th>
					
				</tr>
			</thead>
			<tbody>	
				<tr>
					<td>반가워!!!</td>
					<td>반가워!!!</td>
					<td>반가워!!!</td>
				</tr>
				<tr>
					<td>반가워!!!</td>
					<td>반가워!!!</td>
					<td>반가워!!!</td>
				</tr>
				<tr>
					<td>반가워!!!</td>
					<td>반가워!!!</td>
					<td>반가워!!!</td>
				</tr>
			</tbody>
			</table>
		</div>
	</section>

</body>
</html>