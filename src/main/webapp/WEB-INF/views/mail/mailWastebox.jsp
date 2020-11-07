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
							<th>작성자</th>
							<th width="40%">제목</th>
							<th>삭제날짜</th>
							<th>작성날짜</th>
							<th>첨부파일</th>
							<th>중요표시</th>
						</tr>
					</thead>
					<tbody align="center">
						<c:forEach var="w" items="${ temList }">
						<tr>
							<td><input type="checkbox" value="${ tm.mailId }" class="check" name="checkList"></td>
							<td>${ w.mwName }</td>
							<td><a href="${contextPath}/mailread.ap?mNo=${tm.mailId}">${ tm.title }</a></td>
							<td>${ w.deleteDate }</td>
							<td>${ w.sendDate }</td>
							<c:if test="${ tm.attStock > 0 }">
								<td><img src="${contextPath}/resources/images/mail/clip.png" style="width:20px; height:20px"></td>
							</c:if>
							<c:if test="${ tm.attStock <= 0 }">
								<td></td>
							</c:if>
							<c:if test="${ send.rIptMark eq 'Y'  }">
								<td><img src="${contextPath}/resources/images/mail/impMark.jpg" style="width:20px; height:20px"></td>
							</c:if>
							<c:if test="${ send.rIptMark ne 'N' }">
								<td></td>
							</c:if>
						</tr>
					</c:forEach>
					<c:if test="${ empty temList }">
						<tr>
							<td colspan="7">휴지통이 비었습니다.</td>
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