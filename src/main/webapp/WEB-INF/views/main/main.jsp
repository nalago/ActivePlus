<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#userInfo {
	margin-left:70px;
	width: 300px;
	height: 600px;
	border: 1px solid black;
	float: left;
}

#mainT {
	margin: 30px;
	margin-left:370px;
}
h3{
	margin-left:50px;
}
.mainT{
	width:500px;
}
tbody{
	text-align:center;
}

</style>
</head>
<body>
	<nav id="side">
		<jsp:include page="../common/menubar.jsp" />
	</nav>
	<section>
		<div id="userInfo">
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