<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Active Plus::공지사항</title>

<style type="text/css">
@font-face {
	font-family: 'S-CoreDream-3Light';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-3Light.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

table {
	border-collapse: collapse;
	width: 100%;
}

th, td, td a {
	font-family: "S-CoreDream-3Light", serif;
	padding: 8px;
	text-align: left;
	color: #2f2f2f;
	text-align: center;
}
tr{
	border-bottom: 1px solid #ddd;

}

th {
	background: #effff0;
	border-top: 2px solid #63ab68;
}

td {
	text-overflow: ellipsis;
	height: 40px;
}

a {
	text-decoration: none;
}

td:nth-child(2) {
	color: #63ab68;
}

td a:hover {
	text-decoration: underline;
}

tbody tr:hover {
	background: #efefef;
}

input[type=search] {
	width: 400px;
	height: 30px;
	vertical-align: middle;
	border: 1px solid #63ab68;
}

select {
	vertical-align: middle;
	width: 50px;
	height: 30px;
	border: 1px solid #63ab68;
}

#writeBtn {
	width: 80px;
	height: 30px;
	border: none;
	margin-left: 10%;
}

.basic:hover {
	cursor: pointer;
	background: #e2e2e2;
}

#topBox {
	height: 50px;
}

#search-icon {
	width: 30px;
	height: 30px;
	background: #63ab68;
	vertical-align: middle;
	margin-left: -5px;
}
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
img:hover{
	cursor:pointer;
}
</style>
</head>
<body>
	<nav id="side">
		<jsp:include page="../common/menubar.jsp" />
	</nav>
	<section>
		<div id="subMenu">
			<c:url var="goBoard" value="hosboard.ap" scope="application" />
			<a class="menu" href="${ goNotice }" style="color: #113f36;">공지사항</a>
			<a class="menu" href="${ goBoard }">원내게시판</a> <br>
			<br>
		</div>
		<h1 id="submenuTitle">공지사항</h1>
		
		<c:url var="noticeForm" value="noticewrite.ap" />
		<c:url var="noticeDetail" value="noticedetail.ap" />
		
		<div id="contentDiv">
		<c:url var="paging" value="notice.ap"/>
		<c:if test="${!empty sList }">
			<c:url var="paging" value="search.ap">
				<c:param name="searchCondition" value="${ search.searchCondition }"/>
				<c:param name="searchValue" value="${ search.searchValue }"/>
				<c:param name="kind" value="NOTICE"/>
				<c:if test="${ empty search.empId }">
					<c:param name="empId" value="null"/>
				</c:if>
				<c:if test="${!empty search.empId }">
					<c:param name="empId" value="${ search.empId }"/>
				</c:if>
			</c:url>
			
			<c:set var="key" value="${ search.searchValue}"/>
			
			<c:if test="${search.searchCondition eq 'all' }">
				<c:set var="cAll" value="selected"/>
			</c:if>
			<c:if test="${search.searchCondition eq 'content' }">
				<c:set var="cContent" value="selected"/>
			</c:if>	
			<c:if test="${search.searchCondition eq 'title' }">
				<c:set var="cTitle" value="selected"/>
			</c:if>	
			<c:if test="${!empty search.empId}">
				<c:set var="check" value="checked"/>
			</c:if>
		</c:if>
			<div id="topBox" align="right">
			<form action="search.ap" onsubmit="return searchValidate()">
			<input type="hidden" value="NOTICE" name="kind">
				<select name="searchCondition">
					<option value="all" ${cAll }>전체</option>
					<option value="content" ${cContent }>내용</option>
					<option value="title" ${cTitle }>제목</option>
				</select> 
				<input type="search" name="searchValue" id="keyword" value="${ key }"> <input type="submit" style="display:none">
				<img alt="search-icon" src="${contextPath}/resources/images/board/search-icon.png"
					class="basic" id="search-icon" />
					&nbsp;&nbsp;<input type="checkbox" id="myN" name="myN"
					 value="${ loginUser.empId }" ${ check }>
					<label for="myN" style="color:#404040; font-size:13px"> 내 작성글</label>
				<button type="button" id="writeBtn" class="basic">글작성</button>
			</form>	
			</div>
			<div id="tableBox" align="center">
				<table>
					<thead>
						<tr>
							<th width="10%">No</th>
							<th width="15%">분류</th>
							<th width="30%">제목</th>
							<th width="10%">첨부파일</th>
							<th width="20%">작성일</th>
							<th width="10%">작성자</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="no" items="${nList}">
						<fmt:formatDate value="${ no.createDate }" var="editDate" pattern="yyyy-MM-dd"/>
							<tr>
								<td>${no.noticeId}</td>
								<td>${no.category}</td>
								<td><a href="${noticeDetail}?nId=${no.noticeId}">${no.title}</a></td>
								<td><c:if test="${no.attachment != 0}">
										○
									</c:if></td>
								<td>${ editDate }</td>
								<td>${no.writerName}</td>
							</tr>
						</c:forEach>
						<c:forEach var="no" items="${sList}">
						<fmt:formatDate value="${ no.createDate }" var="editDate" pattern="yyyy-MM-dd"/>
							<tr>
								<td>${no.noticeId}</td>
								<td>${no.category}</td>
								<td><a href="${noticeDetail}?nId=${no.noticeId}">${no.title}</a></td>
								<td><c:if test="${no.attachment != 0}">
										○
									</c:if></td>
								<td>${ editDate }</td>
								<td>${no.writerName}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div id="pagingBox" align="center">
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
		</div>
	</section>
	<script>
		$("#writeBtn").on("click", function() {
			location.href = "${noticeForm}";
		});
		$("#search-icon").on("click",function(){
			$("input[type=submit]").click();
		});
		$(document).ready(function(){
			console.log("${ search.empId }");
		});
		function searchValidate(){
			key = $("input[type=search]").val();
			
			if($("#myN").prop("checked") == false && key.trim() == ""){
				/* 내 게시글 체크 X, 입력값 없을 때*/
				alert("검색어를 입력하세요.");
				return false;
			} else {
				return true;
			}
		}
	</script>
</body>
</html>