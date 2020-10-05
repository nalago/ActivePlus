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
			<a class="menu" href="${ goImbox }" style="color:#113f36; ">보관함</a>
			<a class="menu" href="${ goTembox }">임시보관함</a>
			<a class="menu" href="${ goWastebox }">휴지통</a>
			<br><br>
		</div>
		<h1 id="submenuTitle">보관함</h1>
		<div id="contentDiv">
			<div id="buttonDiv">
				<input type="checkbox" id="allCheck" class="check" value="all" name="allCheck">
				 <label for="allCheck" >전체선택</label>
				<button id="deleteBtn" class="btn red">삭제</button>
				<button id="deliverBtn" class="btn" >전달</button>
				<button id="sendBtn" class="btn" >답장</button>
				<button id="clearBtn" class="long" >보관해제</button>
			</div>
			<div id="mailTable">
				<table width="90%" >
					<thead>
						<tr>
							<th width="30px"></th>
							<th>보낸이</th>
							<th>받는이</th>
							<th width="40%">제목</th>
							<th>날짜</th>
							<th>상태</th>
							<th>분류</th>
						</tr>
					</thead>
					<tbody align="center">
						<tr>
							<td><input type="checkbox" value="1" class="check" name="checkList"></td>
							<td>최나라</td>
							<td>김낑깡</td>
							<td>보관함 입니다. 계춘할망 슬픈데 빡치는 영화.. 할망 너무 안타까워 가나다라마바사아자차카타파하</td>
							<td>2020-09-23</td>
							<td>읽음</td>
							<td>발신</td>
						</tr>
						<tr>
							<td><input type="checkbox" value="1" class="check"></td>
							<td>최나라</td>
							<td>김낑깡</td>
							<td>보관함 입니다. 계춘할망 슬픈데 빡치는 영화.. 할망 너무 안타까워</td>
							<td>2020-09-23</td>
							<td>읽음</td>
							<td>발신</td>
						</tr>
						<tr>
							<td><input type="checkbox" value="1" class="check"></td>
							<td>최나라</td>
							<td>김낑깡</td>
							<td>보관함 입니다. 계춘할망 슬픈데 빡치는 영화.. 할망 너무 안타까워</td>
							<td>2020-09-23</td>
							<td>읽음</td>
							<td>수신</td>
						</tr>
						<tr>
							<td><input type="checkbox" value="1" class="check"></td>
							<td>최나라</td>
							<td>김낑깡</td>
							<td>보관함 입니다. 계춘할망 슬픈데 빡치는 영화.. 할망 너무 안타까워</td>
							<td>2020-09-23</td>
							<td>읽음</td>
							<td>임시보관</td>
						</tr>
						<tr>
							<td><input type="checkbox" value="1" class="check"></td>
							<td>최나라</td>
							<td>김낑깡</td>
							<td>보관함 입니다. 계춘할망 슬픈데 빡치는 영화.. 할망 너무 안타까워</td>
							<td>2020-09-23</td>
							<td>읽음</td>
							<td>발신</td>
						</tr>
						<tr>
							<td><input type="checkbox" value="1" class="check"></td>
							<td>최나라</td>
							<td>김낑깡</td>
							<td>보관함 입니다. 계춘할망 슬픈데 빡치는 영화.. 할망 너무 안타까워</td>
							<td>2020-09-23</td>
							<td>읽음</td>
							<td>발신</td>
						</tr>
						<tr>
							<td><input type="checkbox" value="1" class="check"></td>
							<td>최나라</td>
							<td>김낑깡</td>
							<td>보관함 입니다. 계춘할망 슬픈데 빡치는 영화.. 할망 너무 안타까워</td>
							<td>2020-09-23</td>
							<td>읽음</td>
							<td>발신</td>
						</tr>
						<tr>
							<td><input type="checkbox" value="1" class="check"></td>
							<td>최나라</td>
							<td>김낑깡</td>
							<td>보관함 입니다. 계춘할망 슬픈데 빡치는 영화.. 할망 너무 안타까워</td>
							<td>2020-09-23</td>
							<td>읽음</td>
							<td>발신</td>
						</tr>
						<tr>
							<td><input type="checkbox" value="1" class="check"></td>
							<td>최나라</td>
							<td>김낑깡</td>
							<td>보관함 입니다. 계춘할망 슬픈데 빡치는 영화.. 할망 너무 안타까워</td>
							<td>2020-09-23</td>
							<td>읽음</td>
							<td>발신</td>
						</tr>
						<tr>
							<td><input type="checkbox" value="1" class="check"></td>
							<td>최나라</td>
							<td>김낑깡</td>
							<td>보관함 입니다. 계춘할망 슬픈데 빡치는 영화.. 할망 너무 안타까워</td>
							<td>2020-09-23</td>
							<td>읽음</td>
							<td>발신</td>
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