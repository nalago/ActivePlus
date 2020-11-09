<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${ contextPath }/resources/css/mail/mail.css" />

</head>
<body>
	<nav id="side">
		<jsp:include page="../common/menubar.jsp" />
	</nav>

	<section>
		<div id="subMenu">
			<a class="menu" href="${ goMail }">받은 메일함</a> <a class="menu"
				href="${ goSendbox }">보낸메일함</a> <a class="menu" href="${ goImbox }"
				style="color: #113f36;">보관함</a> <a class="menu" href="${ goTembox }">임시보관함</a>
			<a class="menu" href="${ goWastebox }">휴지통</a> <br>
			<br>
		</div>
		<h1 id="submenuTitle">보관함</h1>
		<div id="contentDiv">
			<div id="buttonDiv">
				<input type="checkbox" id="allCheck" class="check" value="all"
					name="allCheck"> <label for="allCheck">전체선택</label>
				<button id="deleteBtn" class="btn red">삭제</button>
				<button id="deliverBtn" class="btn">전달</button>
				<button id="sendBtn" class="btn">답장</button>
				<button id="clearBtn" class="long">보관해제</button>
			</div>
			<div id="mailTable">
				<table width="90%">
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
						<c:forEach var="tm" items="${ temList }">
							<tr>
								<td><input type="checkbox" value="${ tm.mailId }"
									class="check" name="checkList"></td>
								<td>${ tm.mwName }</td>
								<td>${ tm.mrName }</td>
								<td><a href="${contextPath}/mailread.ap?mNo=${tm.mailId}">${ tm.title }</a></td>
								<td>${ tm.sendDate }</td>
								<td>${ tm.readValue }</td>
								<td>${ tm.category }</td>
							</tr>
						</c:forEach>
						<c:if test="${ empty temList }">
							<tr>
								<td colspan="7">보관함이 비었습니다.</td>
							</tr>
						</c:if>
					</tbody>
				</table>
				<button class="mailSend" id="writeBtn">메일쓰기</button>

			</div>
		</div>
	</section>
	<script type="text/javascript"
		src="${ contextPath }/resources/js/mail/mail.js"></script>


</body>
</html>