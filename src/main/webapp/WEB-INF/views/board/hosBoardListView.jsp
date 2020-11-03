<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Active Plus::원내게시판</title>

<!-- jQuery를 사용하기위해 jQuery라이브러리 추가 -->
<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
<style type="text/css">
@font-face { 
	font-family: 'S-CoreDream-3Light'; 
	src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-3Light.woff') format('woff'); 
	font-weight: normal; 
	font-style: normal; 
}
table
{
    border-collapse: collapse;
    width:100%;
}
th, td, td a
{
	font-family: "S-CoreDream-3Light", serif;
    padding: 8px;
    text-align: left;
    border-bottom: 1px solid #ddd;
    color:#2f2f2f;
    text-align:center;
}
th{
	background:#ffeef3;
	border-top:2px solid #ff0e57;
	
}
td{
	white-spacing:nowrap;
	text-overflow: ellipsis;
	height:40px;
}
td a {
	text-decoration:none;
}

td a:hover{
	text-decoration:underline;
}
tbody tr:hover{
	background:#efefef;
}

input[type=search]{
	width:400px;
	height:30px;
	vertical-align:middle;
	border:1px solid #ff0e57;
	
}
select{
	width:50px;
	height:30px;
	vertical-align:middle;
	border:1px solid #ff0e57;
	
}

#writeBtn{
	width:80px;
	height:30px;
	margin-left:10%;
	border:none;
}
#topBox{
	height:50px;
}
.basic:hover{
	cursor:pointer;
	background:#e2e2e2;
}

.hotPosting p{
	font-weight:bold;
	float:left;
	color:#ff0e57;
}
.hotPosting td{
	background:#fff7f9;
}
#search-icon{
	width:30px;
	height:30px;
	background:#ff0e57;
	vertical-align:middle;
}
</style>
</head>
<body>
	<nav id="side">
		<jsp:include page="../common/menubar.jsp" />
	</nav>
	<section>
		<div id="subMenu">
			<c:url var="goBoard" value="hosboard.ap" scope="application"/>
			<a class="menu" href="${ goNotice }">공지사항</a>
			<a class="menu" href="${ goBoard }" style="color:#113f36;">원내게시판</a> 
			<br><br>
		</div>
		<h1 id="submenuTitle">원내게시판</h1>
		
		<c:url var="hosBoardForm" value="boardwrite.ap"/>
		<c:url var="hosBoardDetail" value="boarddetail.ap"/>
		<div id="contentDiv">
		
		<c:url var="paging" value="hosboard.ap"/>
		<c:if test="${!empty sList }">
			<c:url var="paging" value="search.ap">
				<c:param name="searchCondition" value="${ search.searchCondition }"/>
				<c:param name="searchValue" value="${ search.searchValue }"/>
				<c:param name="kind" value="HOS_BOARD"/>
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
			<form action="search.ap"onsubmit="return searchValidate()">
			<input type="hidden" value="HOS_BOARD" name="kind">
				<select>
					<option value="all">전체</option>
					<option value="writer">내용</option>
					<option value="title">제목</option>
				</select>
				<input type="search" name="search" id="keyword"><img alt="search-icon" src="${contextPath}/resources/images/board/search-icon.png" 
				class="basic" id="search-icon"/>
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
							<th width="15%">No</th>
							<th width="15%">작성자</th>
							<th width="40%">제목</th>
							<th width="10%">조회수</th>
							<th width="20%">작성일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="t" items="${top}">
						<fmt:formatDate value="${ t.createDate }" var="editDate" pattern="yyyy-MM-dd"/>
							<tr class="hotPosting">
								<td>${t.hbId}</td>
								<td>${t.writerName}</td>
								<td><p style="font-size:12px">HOT</p><a href="${hosBoardDetail}?hbId=${t.hbId}">${t.title}</a></td>
								<td>${t.count }</td>
								<td>${ editDate }</td>
							</tr>
						</c:forEach>
						<c:forEach var="hb" items="${bList}">
						<fmt:formatDate value="${ hb.createDate }" var="editDate" pattern="yyyy-MM-dd"/>
							<tr>
								<td>${hb.hbId}</td>
								<td>${hb.writerName}</td>
								<td><a href="${hosBoardDetail}?hbId=${hb.hbId}">${hb.title}</a></td>
								<td>${hb.count }</td>
								<td>${ editDate }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div id="pagingBox">
				
			</div>
		</div>
	</section>
	<script>
		$("#writeBtn").on("click",function(){
			location.href="${hosBoardForm}";
		});
		
		function searchValidate(){
			key = $("input[type=search]").val();
			
			if($("#myN").prop("checked") == false && key.trim() == ""){
				alert("검색어를 입력하세요.");
				return false;
			} else {
				return true;
			}
		}
		
		var color_arr = ['red',"yellow","blue","#ff0e57","#0fff27"]; //색상설정
		var index=0;
		
		$(document).ready(function(){
			setInterval(function(){
				if((index) > color_arr.length){
					index=0;
				}
				$(".hotPosting p").css("color",color_arr[index++]);
			}, 500);
			
			var aMsg = "${aMsg}";
			if(aMsg != "null" && aMsg != ""){
				alert(aMsg);
			}			
		});
	</script>
</body>
</html>