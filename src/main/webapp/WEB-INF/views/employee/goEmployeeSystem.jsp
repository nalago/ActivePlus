<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#userInfo {
	margin-left:300px;
	width: 300px;
	height: 600px;
	border: 1px solid black;
	float: left;
}

#mainT {
	margin: 30px;
	margin-left:700px;
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
.wrap {
		width:50%;
		margin:auto;
	}
	
	#memberTable{
		width:100%;
		border:solid 1px black;
	}
	
	#memberTable th, #memberTable td {
		text-align:center;
		border:solid 1px black;
	}
	#insertBtn{
		width:500px;
		margin:auto;
	}
</style>
</head>
<body>
	<nav id="side">
		<jsp:include page="../common/menubar.jsp" />
	</nav>
	<br><br>
	<div class="w300" style="padding-right:10px">


    </div>
	<div align="right" id="insertBtn">
		<form action="msearch.ap" name="searchCondition">
			<select id="searchCondition" name="searchCondition">
				<option value="all"
				<c:if test="${ search.searchCondition == 'all' }">selected
				</c:if>>전체</option>
				<option value="name"
				<c:if test="${ search.searchCondition == 'name' }">selected
				</c:if>>이름</option>
				<option value="category"
				<c:if test="${ search.searchCondition == 'category' }">selected
				</c:if>>부서</option>
				<option value="status"
				<c:if test="${ search.searchCondition == 'status' }">selected
				</c:if>>상태</option>
			</select>
			<input type="search" name="searchValue" value="${ search.searchValue }">
			<button>검색</button>
		</form>
		<button onclick="location.href='memberInsertView.ap'">회원등록</button>
	</div>
	<div align="center" class="wrap">
		<table align="center" id="memberTable">
			<tr>
				<th>사번</th>
				<th width="100">회원이름</th>
				<th>부서</th>
				<th>상태</th>
				<th>입사일</th>
			</tr>
			<c:forEach var="m" items="${ list }">
			<tr>
						<c:url var="mdetail" value="mdetail.ap">
							<c:param name="id" value="${ m.id }"/>
							<c:param name="page" value="${ pi.currentPage }"/>
						</c:url>
				<td><a href="${ mdetail }">${ m.id }</a></td>
				<td>${ m.name }
					<c:if test="${ !empty loginUesr }">
						<c:url var="mdetail" value="mdetail.ap">
							<c:param name="id" value="${ m.id }"/>
							<c:param name="page" value="${ pi.currentPage }"/>
						</c:url>
						<a href="${ mdetail }">${ m.id }</a>
					</c:if>
					<c:if test="${ empty loginUser }">
						${ m.name }
					</c:if>
				</td>
				<td>${ m.category }</td>
				<td>${ m.status }</td>
				<td>${ m.hire_date }</td>
			</tr>
			</c:forEach>
			<!-- 페이징 처리 -->
			<tr align="center" height="20">
				<td colspan="6">
				<!-- [이전] -->
				<c:if test="${ pi.currentPage <= 1 }">
					[이전] &nbsp;
				</c:if>
				<c:if test="${ pi.currentPage > 1 }">
					<c:url var="before" value="goMemberSystem.ap">
						<c:param name="page" value="${ pi.currentPage - 1 }"/>
					</c:url>
					<a href="${ before }">[이전]</a> &nbsp;
				</c:if>
				<!-- 페이지 숫자 -->
				<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
					<c:if test="${ p eq pi.currentPage }">
						<font color="red" size="4">[ ${ p } ]</font>
					</c:if>
					<c:if test="${ p ne pi.currentPage }">
						<c:url var="pagination" value="goMemberSystem.ap">
							<c:param name="page" value="${ p }"/>
						</c:url>
						<a href="${ pagination }">${ p }</a> &nbsp;
					</c:if>
				</c:forEach>
				<!-- [다음] -->
				<c:if test="${ pi.currentPage >= pi.maxPage }">
					[다음]
				</c:if>
				<c:if test="${ pi.currentPage < pi.maxPage }">
					<c:url var="after" value="mlist.do">
						<c:param name="page" value="${ pi.currentPage + 1 }"/>
					</c:url>
					<a href="${ after }">[다음]</a>
				</c:if>
				</td>
			</tr>
		</table>
	</div>
	
<!-- <script>
	$(docoment).on('click', '#btnSearch', function(e){
		e.preventDefault();
		var url="${pageContext.request.contextPath}/member/goMemberSystem";
		url = url + "?searchType=" + $('#searchType').val();
		url = url + "&keyword"=$('#keyword').val();
		location.href = url;
		console.log(url);
	})
</script> -->

</body>
</html>