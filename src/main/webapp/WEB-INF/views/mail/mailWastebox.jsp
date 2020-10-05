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
			<a class="menu" href="${ goTembox }">임시보관함</a>
			<a class="menu" href="${ goWastebox }" style="color:#113f36;">휴지통</a>
			<br><br>
		</div>
		<h1 id="submenuTitle">휴지통</h1>
		<div id="contentDiv">
			<div id="buttonDiv">
				<input type="checkbox" id="allCheck" class="check" value="all" name="allCheck">
				 <label for="allCheck" >전체선택</label>
				<button id="deleteBtn" class="long red">영구삭제</button>
				<button id="restoreBtn" class="btn" >복원</button>
				
			</div>
			<div id="mailTable">
				<table width="90%" >
					<thead>
						<tr>
							<th width="30px"></th>
							<th>분류</th>
							<th width="40%">제목</th>
							<th>삭제날짜</th>
							<th>작성날짜</th>
							<th>첨부파일</th>
							<th>중요표시</th>
						</tr>
					</thead>
					<tbody align="center">
						<tr>
							<td><input type="checkbox" value="1" class="check"></td>
							<td>임시보관</td>
							<td>휴지통 테스트 데이터. 빔프로젝터 사고싶은데 서치하는건 귀찮은 날아..</td>
							<td>2020-09-24</td>
							<td>2020-09-23</td>
							<td>◎</td>
							<td>중요</td>
						</tr>
						<tr>
							<td><input type="checkbox" value="1" class="check"></td>
							<td>발신</td>
							<td>휴지통 테스트 데이터. 빔프로젝터 사고싶은데 서치하는건 귀찮은 날아..</td>
							<td>2020-09-24</td>
							<td>2020-09-23</td>
							<td>◎</td>
							<td>중요</td>
						</tr>
						<tr>
							<td><input type="checkbox" value="1" class="check"></td>
							<td>수신</td>
							<td>휴지통 테스트 데이터. 빔프로젝터 사고싶은데 서치하는건 귀찮은 날아..</td>
							<td>2020-09-24</td>
							<td>2020-09-23</td>
							<td>◎</td>
							<td>중요</td>
						</tr>
						<tr>
							<td><input type="checkbox" value="1" class="check"></td>
							<td>임시보관</td>
							<td>휴지통 테스트 데이터. 빔프로젝터 사고싶은데 서치하는건 귀찮은 날아..</td>
							<td>2020-09-24</td>
							<td>2020-09-23</td>
							<td>◎</td>
							<td>중요</td>
						</tr>
						<tr>
							<td><input type="checkbox" value="1" class="check"></td>
							<td>임시보관</td>
							<td>휴지통 테스트 데이터. 빔프로젝터 사고싶은데 서치하는건 귀찮은 날아..</td>
							<td>2020-09-24</td>
							<td>2020-09-23</td>
							<td>◎</td>
							<td>중요</td>
						</tr>
						<tr>
							<td><input type="checkbox" value="1" class="check"></td>
							<td>임시보관</td>
							<td>휴지통 테스트 데이터. 빔프로젝터 사고싶은데 서치하는건 귀찮은 날아..</td>
							<td>2020-09-24</td>
							<td>2020-09-23</td>
							<td>◎</td>
							<td>중요</td>
						</tr>
						<tr>
							<td><input type="checkbox" value="1" class="check"></td>
							<td>임시보관</td>
							<td>휴지통 테스트 데이터. 빔프로젝터 사고싶은데 서치하는건 귀찮은 날아..</td>
							<td>2020-09-24</td>
							<td>2020-09-23</td>
							<td>◎</td>
							<td>중요</td>
						</tr>
						<tr>
							<td><input type="checkbox" value="1" class="check"></td>
							<td>임시보관</td>
							<td>휴지통 테스트 데이터. 빔프로젝터 사고싶은데 서치하는건 귀찮은 날아..</td>
							<td>2020-09-24</td>
							<td>2020-09-23</td>
							<td>◎</td>
							<td>중요</td>
						</tr>
						<tr>
							<td><input type="checkbox" value="1" class="check"></td>
							<td>임시보관</td>
							<td>휴지통 테스트 데이터. 빔프로젝터 사고싶은데 서치하는건 귀찮은 날아..</td>
							<td>2020-09-24</td>
							<td>2020-09-23</td>
							<td>◎</td>
							<td>중요</td>
						</tr>
						<tr>
							<td><input type="checkbox" value="1" class="check"></td>
							<td>임시보관</td>
							<td>휴지통 테스트 데이터. 빔프로젝터 사고싶은데 서치하는건 귀찮은 날아..</td>
							<td>2020-09-24</td>
							<td>2020-09-23</td>
							<td>◎</td>
							<td>중요</td>
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