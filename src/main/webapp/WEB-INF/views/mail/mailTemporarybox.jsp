<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${ contextPath }/resources/css/mail/mail.css"/>

</head>
<body>
	<nav id="side">
		<jsp:include page="../common/menubar.jsp"/>
	</nav>
	
	<section>
		<div id="subMenu">
			<a class="menu" href="${ goMail }">받은 메일함</a>
			<a class="menu" href="${ goSendbox }">보낸메일함</a>
			<a class="menu" href="${ goImbox }">보관함</a>
			<a class="menu" href="${ goTembox }" style="color:#113f36; ">임시보관함</a>
			<a class="menu" href="${ goWastebox }">휴지통</a>
			<br><br>
		</div>
		<h1 id="submenuTitle">임시보관함</h1>
		<div id="contentDiv">
			<div id="buttonDiv">
				<input type="checkbox" id="allCheck" class="check" value="all" name="allCheck">
				 <label for="allCheck" >전체선택</label>
				<button id="deleteBtn" class="btn red">삭제</button>
				<button id="sendBtn" class="btn">보내기</button>
				<button id="importantBtn" class="btn" >보관</button>
				
			</div>
			<div id="mailTable">
				<table width="90%" style="float:left;">
					<thead>
						<tr>
							<th width="30px"></th>
							<th>받는이</th>
							<th width="40%">제목</th>
							<th>첨부파일</th>
							<th>작성날짜</th>
							<th>분류</th>
							<th>비고</th>
						</tr>
					</thead>
					<tbody align="center">
						<tr>
							<td><input type="checkbox" value="1" class="check"></td>
							<td>최나라</td>
							<td>임시보관함 테스트용 데이터</td>
							<td></td>
							<td>2020-09-23</td>
							<td>발신</td>
							<td><input type="button" value="보내기"></td>
						</tr>
						<tr>
							<td><input type="checkbox" value="1" class="check"></td>
							<td>최나라</td>
							<td>임시보관함 테스트용 데이터</td>
							<td></td>
							<td>2020-09-23</td>
							<td>답장</td>
							<td><input type="button" value="보내기"></td>
						</tr>
						<tr>
							<td><input type="checkbox" value="1" class="check"></td>
							<td>최나라</td>
							<td>임시보관함 테스트용 데이터</td>
							<td></td>
							<td>2020-09-23</td>
							<td>전달</td>
							<td><input type="button" value="보내기"></td>
						</tr>
						<tr>
							<td><input type="checkbox" value="1" class="check"></td>
							<td>최나라</td>
							<td>임시보관함 테스트용 데이터</td>
							<td></td>
							<td>2020-09-23</td>
							<td>발신</td>
							<td><input type="button" value="보내기"></td>
						</tr>
						<tr>
							<td><input type="checkbox" value="1" class="check"></td>
							<td>최나라</td>
							<td>임시보관함 테스트용 데이터</td>
							<td></td>
							<td>2020-09-23</td>
							<td>발신</td>
							<td><input type="button" value="보내기"></td>
						</tr>
						<tr>
							<td><input type="checkbox" value="1" class="check"></td>
							<td>최나라</td>
							<td>임시보관함 테스트용 데이터</td>
							<td></td>
							<td>2020-09-23</td>
							<td>발신</td>
							<td><input type="button" value="보내기"></td>
						</tr>
						<tr>
							<td><input type="checkbox" value="1" class="check"></td>
							<td>최나라</td>
							<td>임시보관함 테스트용 데이터</td>
							<td></td>
							<td>2020-09-23</td>
							<td>발신</td>
							<td><input type="button" value="보내기"></td>
						</tr>
						<tr>
							<td><input type="checkbox" value="1" class="check"></td>
							<td>최나라</td>
							<td>임시보관함 테스트용 데이터</td>
							<td></td>
							<td>2020-09-23</td>
							<td>발신</td>
							<td><input type="button" value="보내기"></td>
						</tr>
						<tr>
							<td><input type="checkbox" value="1" class="check"></td>
							<td>최나라</td>
							<td>임시보관함 테스트용 데이터</td>
							<td></td>
							<td>2020-09-23</td>
							<td>발신</td>
							<td><input type="button" value="보내기"></td>
						</tr>
						<tr>
							<td><input type="checkbox" value="1" class="check"></td>
							<td>최나라</td>
							<td>임시보관함 테스트용 데이터</td>
							<td></td>
							<td>2020-09-23</td>
							<td>발신</td>
							<td><input type="button" value="보내기"></td>
						</tr>
					</tbody>
				</table>
				<button class="mailSend">메일쓰기</button>
			</div>
		</div>
	</section>
		<script type="text/javascript" src="${ contextPath }/resources/js/mail/mail.js"></script>


</body>
</html>