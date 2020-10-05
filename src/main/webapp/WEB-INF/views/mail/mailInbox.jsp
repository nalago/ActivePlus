<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
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
			<c:url var="goMail" value="mail.ap" scope="application"/>
			<c:url var="goSendbox" value="sendbox.ap" scope="application"/>
			<c:url var="goImbox" value="importantbox.ap" scope="application"/>
			<c:url var="goTembox" value="temporarybox.ap" scope="application"/>
			<c:url var="goWastebox" value="wastebox.ap" scope="application"/>
			<a class="menu" href="${ goMail }" style="color:#113f36; ">받은 메일함</a>
			<a class="menu" href="${ goSendbox }">보낸메일함</a>
			<a class="menu" href="${ goImbox }">보관함</a>
			<a class="menu" href="${ goTembox }">임시보관함</a>
			<a class="menu" href="${ goWastebox }">휴지통</a>
			<br><br>
		</div>
		<h1 id="submenuTitle">받은 메일함</h1>
		<div id="contentDiv">
			<div id="buttonDiv">
				<input type="checkbox" id="allCheck" class="check" value="all" name="allCheck"">
				 <label for="allCheck" >전체선택</label>
				<button id="deleteBtn" class="btn red" onclick="checkedMore(1);">삭제</button>
				<button id="sendBtn" class="btn" onclick="checkedOne(0);">답장</button>
				<button id="deliverBtn" class="btn" onclick="checkedOne(1);" >전달</button>
				<button id="importantBtn" class="btn" onclick="checkedMore(0);" >보관</button>
			</div>
			<div id="mailTable">
				<table width="90%" >
					<thead>
						<tr>
							<th width="30px"></th>
							<th>보낸이</th>
							<th width="40%">제목</th>
							<th>첨부파일</th>
							<th>보낸날짜</th>
							<th>상태</th>
							<th>중요표시</th>
						</tr>
					</thead>
					<tbody align="center">
						<tr>
							<td><input type="checkbox" class="check" name="checkList"></td>
							<td>최나라</td>
							<td>메일 테스트 가데이터</td>
							<td></td>
							<td>2020-09-23</td>
							<td>읽음</td>
							<td>중요</td>
						</tr>
						<tr>
							<td><input type="checkbox" value="1" class="check" name="checkList" value="123"></td>
							<td>최나라</td>
							<td>메일 테스트 가데이터</td>
							<td></td>
							<td>2020-09-23</td>
							<td>읽음</td>
							<td>중요</td>
						</tr>
						<tr>
							<td><input type="checkbox" value="1" class="check" name="checkList"></td>
							<td>최나라</td>
							<td>메일 테스트 가데이터</td>
							<td></td>
							<td>2020-09-23</td>
							<td>읽음</td>
							<td>중요</td>
						</tr>
						<tr>
							<td><input type="checkbox" value="1" class="check" name="checkList"></td>
							<td>최나라</td>
							<td>메일 테스트 가데이터</td>
							<td></td>
							<td>2020-09-23</td>
							<td>읽음</td>
							<td>중요</td>
						</tr>
						<tr>
							<td><input type="checkbox" value="1" class="check" name="checkList"></td>
							<td>최나라</td>
							<td>메일 테스트 가데이터</td>
							<td></td>
							<td>2020-09-23</td>
							<td>읽음</td>
							<td>중요</td>
						</tr>
						<tr>
							<td><input type="checkbox" value="1" class="check" name="checkList"></td>
							<td>최나라</td>
							<td>메일 테스트 가데이터</td>
							<td></td>
							<td>2020-09-23</td>
							<td>읽음</td>
							<td>중요</td>
						</tr>
						<tr>
							<td><input type="checkbox" value="1" class="check" name="checkList"></td>
							<td>최나라</td>
							<td>메일 테스트 가데이터</td>
							<td></td>
							<td>2020-09-23</td>
							<td>읽음</td>
							<td>중요</td>
						</tr>
						<tr>
							<td><input type="checkbox" value="1" class="check" name="checkList"></td>
							<td>최나라</td>
							<td>메일 테스트 가데이터</td>
							<td></td>
							<td>2020-09-23</td>
							<td>읽음</td>
							<td>중요</td>
						</tr>
						<tr>
							<td><input type="checkbox" value="1" class="check" name="checkList"></td>
							<td>최나라</td>
							<td>메일 테스트 가데이터</td>
							<td></td>
							<td>2020-09-23</td>
							<td>읽음</td>
							<td>중요</td>
						</tr>
						<tr>
							<td><input type="checkbox" value="1" class="check" name="checkList"></td>
							<td>최나라</td>
							<td>메일 테스트 가데이터</td>
							<td></td>
							<td>2020-09-23</td>
							<td>읽음</td>
							<td>중요</td>
						</tr>
					</tbody>
				</table>
				<button class="mailSend">메일쓰기</button>
			
			</div>
		</div>
	</section>
	<script>
	
	</script>
	<script type="text/javascript" src="${ contextPath }/resources/js/mail/mail.js"></script>
	

</body>
</html>