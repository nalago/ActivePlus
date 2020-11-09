<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${ contextPath }/resources/css/mail/mail.css"/>
<style>
/* paging box */
li {
	float: left;
	margin: 0;
	padding: 0;
}

.pagination {
	padding: 30px 0;
}

.pagination ul {
	margin: 0;
	padding: 0;
	list-style-type: none;
}

li a {
	display: inline-block;
	padding: 10px 18px;
	color: #222;
}

.p9 a {
	width: 30px;
	height: 30px;
	line-height: 30px;
	padding: 0;
	text-align: center;
	margin: auto 5px;
}

.p9 a.is-active {
	border: 3px solid #63ab68;
	border-radius: 100%;
}
</style>
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
		<div id="pagingBox" align="center">
		<c:url var="paging" value="temporarybox.ap"/>
				<div class="pagination p9" align="center">
					<ul>
						<c:if test="${ pi.currentPage <= 1 }">
							<li><a href="#" style="color: lightgray">&lt;&nbsp;</a></li>
						</c:if>
						<c:if test="${ pi.currentPage > 1 }">
							<c:url var="before" value="${ paging }">
								<c:param name="page" value="${ pi.currentPage - 1 }" />
							</c:url>
							<li><a href="${ before }">&lt;&nbsp;</a>
						</c:if>
						<!-- 페이지 숫자 -->
						<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
							<c:if test="${ p eq pi.currentPage }">
								<li><a class="is-active" href="#">${ p }</a></li>
							</c:if>
							<c:if test="${ p ne pi.currentPage }">
								<c:url var="pagination" value="${ paging }">
									<c:param name="page" value="${ p }" />
								</c:url>
								<li><a href="${ pagination }" style="color:gray">${ p }&nbsp;</a></li>
							</c:if>
						</c:forEach>
						<c:if test="${ pi.currentPage >= pi.maxPage }">
							<li><a href="#" style="color: lightgray">&gt;&nbsp;</a></li>
						</c:if>
						<c:if test="${ pi.currentPage < pi.maxPage }">
							<c:url var="after" value="${ paging }">
									<c:param name="page" value="${ pi.currentPage + 1 }" />
							</c:url>
							<li><a href="${ after }">&gt;&nbsp;</a></li>
						</c:if>
					</ul>
				</div>
			</div>
		<div id="contentDiv">
			<div id="buttonDiv">
				<input type="checkbox" id="allCheck" class="check" value="all" name="allCheck">
				 <label for="allCheck" >전체선택</label>
				<button id="deleteBtn" class="btn red" onclick="checkedMore(1,'send');">삭제</button>
				<button id="sendBtn" class="btn" onclick="checkedOne(2);">보내기</button>
				<button id="importantBtn" class="btn" onclick="checkedMore(0,'send');">보관</button>
				
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
						</tr>
					</thead>
					<tbody align="center">
						<c:forEach var="tm" items="${ temList }">
						<tr>
							<td><input type="checkbox" value="${ tm.mailId }" class="check" name="checkList"></td>
							<td>${ tm.mwName }</td>
							<td><a href="${contextPath}/mailread.ap?mNo=${tm.mailId}">${ tm.title }</a></td>
							<c:if test="${ tm.attStock > 0 }">
								<td><img src="${contextPath}/resources/images/mail/clip.png" style="width:20px; height:20px"></td>
							</c:if>
							<c:if test="${ tm.attStock <= 0 }">
								<td></td>
							</c:if>
							<td>${ tm.sendDate }</td>
							<td>${ tm.category }</td>
						</tr>
					</c:forEach>
					<c:if test="${ empty temList }">
						<tr>
							<td colspan="6">임시보관함이 비었습니다.</td>
						</tr>
					</c:if>	
					</tbody>
				</table>
				<button class="mailSend" id="writeBtn">메일쓰기</button>
			</div>
		</div>
	</section>
		<script type="text/javascript" src="${ contextPath }/resources/js/mail/mail.js"></script>


</body>
</html>