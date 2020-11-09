<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Active Plus</title>

<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>

<style>
@font-face {
	font-family: 'S-CoreDream-3Light';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-3Light.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

#userInfo {
	margin-left:5%;
	width: 300px;
	height: 500px;
	border: 3px solid white;
	box-shadow: 2px 0px 5px gray;
	background:#fafafa;
	margin-top:100px;
	float: left;
}

#mainT {
	margin: 30px;
	margin-left:40%;
	margin-right:10px;
	float:left;
	margin-top:-550px;
}
h3{
	margin-top:70px;
	border-bottom:2px solid #63ab68;
	color:#2f2f2f;
}
.mainT{
	width:700px;
}
tbody{
	text-align:center;
	color:#4f4f4f;
}
thead {
}
/*유저 정보 */
#basic {
	border:1px solid #93d097;
	background:#93d097;
	width : 200px;
	height: 300px;
	margin:auto;
	margin-top:30px;
}
#picture{
	width:170px;
	height:200px;
	margin:auto;
	margin-top:20px;
	background:white;
}
.user{
	width:200px;
	text-align:center;
	margin-top:20px;
	
}
#TNA{
	width:300px;
	height:50px;
	float:left;
}
#work{
	width:250px;
	height:40px;
	margin-left:25px;
	margin-top:5px;
	color:#ff4d4d;
}
.TNABtn{
	background:none;
	color:#2f2f2f;
	border:none;
	
	/* border-radius:10px; */
	font-size:15px;
}
.TNABtn:hover{
	cursor:pointer;
}
.half{
	width:125px;
	height:50px;
}
#tt th{
	font-weight:500;
	color:#2f2f2f;
}
#tt td{
	font-weight:500;
	color:#8d8d8d;
}
.mainT th, td, h3, section a{
	font-family:'S-CoreDream-3Light', serif;
}
a{
	text-decoration:none;
	color:#2f2f2f;
	font-weight:500;
}
table a:hover{
	text-decoration:underline;
}

</style>
</head>
<body>
		<jsp:include page="../common/menubar.jsp" />
	<section>
		<div id="userInfo">
			<div id="basic">
				<div id="picture">
					<img src="${ contextPath }/${ img }" width="170px" height="200px">
				</div>

				<div class="user">${ loginUser.id } ${ loginUser.category }, ${ loginUser.name }</div>
			</div>
			<div id="TNA"> 
			<c:if test="${ empty TNA }">
				<button type="button" class="TNABtn" id="work">출근</button>
			</c:if>
			<c:if test="${ Tmsg eq 'END' }">
				<p style="color:#ff4d4d; text-align:center">오늘의 업무를 마치셨습니다.</p>
			</c:if>
			<c:if test="${ !empty TNA }">
				<c:if test="${ Tmsg ne 'END' }">
					<!-- 출근 버튼 클릭 후 아래 버튼을 보이게한다. -->
					<button type="button" class="TNABtn half" style="margin-left:20px; color:#ff4d4d" id="endWork"onclick="endWork('end')">퇴근</button>
					<button type="button" class="TNABtn half" id="halfWork" onclick="endWork('half')">반차</button>
				</c:if>
				<div align="center" style="border-bottom:1px solid #f6f6f6; border-top:1px solid #f6f6f6">
				<a href="#" style="text-decoration:none; color:#2f2f2f">휴가 신청하기</a>
				</div> 
				<br>
				<table width="100%" id="tt">
					<thead>
						<tr>
							<th style="color:#63ab68">일자</th>
							<th>출근</th>
							<th>퇴근</th>
							<th>사유</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="t" items="${ TNA }">
						<fmt:formatDate value="${ t.startDate }" var="sDate" pattern="yy.MM.dd"/>
						<fmt:formatDate value="${ t.startDate }" var="sTime" pattern="HH:mm"/>
						<fmt:formatDate value="${ t.leaveDate }" var="lTime" pattern="HH:mm"/>
							<tr>
								<td>${ sDate }</td>
								<td>${ sTime }</td>
								<td>${ lTime }</td>
								<td>${ t.reason }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</c:if>
		</div>
		</div>
		
		<div id="mainT">
			<h3>메일</h3>
			<a href="${ goMail }" style="float:right; text-decoration:none; color:#63ab68">더보기</a>
			<br clear="right">
			<table align="center" class="mainT">
			<thead>
				<tr>
					<th>보낸이</th>
					<th>제목</th>
					<th>날짜</th>
				</tr>
			</thead>
			<tbody>
			<c:if test="${ !empty mList }">
				<c:forEach var="m" items="${ mList }">
					<fmt:formatDate value="${ m.sendDate }" var="editDate" pattern="yyyy-MM-dd"/>
					<tr>
						<td>${ m.mwName }</td>
						<td><a href="#">${ m.title }</a></td>
						<td>${ editDate }</td>
					</tr>
				</c:forEach>	
			</c:if>
			<c:if test="${ empty mList }">
				<tr><td colspan="3" rowspan="3">조회된 메일이 없습니다.</td></tr>
			</c:if>
			</tbody>
			</table>
			<h3>공지사항</h3>
			<a href="${ goNotice }" style="float:right; text-decoration:none; color:#63ab68">더보기</a>
			<br clear="right">
			<table align="center" class="mainT">
			<thead>
				<tr>
					<th>분류</th>
					<th width="40%">제목</th>
					<th>작성자</th>
					<th width="20%">날짜</th>
				</tr>
			</thead>	
			<tbody>	
			<c:if test="${ !empty nList }">
				<c:forEach var="n" items="${nList}">
				<fmt:formatDate value="${ n.createDate }" var="editDate" pattern="yyyy-MM-dd"/>
					<tr>
						<td>${ n.category }</td>
						<td><a href="noticedetail.ap?nId=${n.noticeId}">${ n.title }</a></td>
						<td>${ n.writerName }</td>
						<td>${ editDate }</td>
					</tr>
				</c:forEach>
			</c:if>
			</tbody>	
			</table>
			<h3>게시판</h3>
			<a href="hosboard.ap" style="float:right; text-decoration:none; color:#63ab68">더보기</a>
			<br clear="right">
			<table align="center" class="mainT">
			<thead>
				<tr>
					<th>제목</th>
					<th>작성자</th>
					<th>날짜</th>
				</tr>
			</thead>
			<tbody>	
			<c:if test="${ !empty hbList }">
				<c:forEach var="hb" items="${hbList}">
				<fmt:formatDate value="${ hb.createDate }" var="editDate" pattern="yyyy-MM-dd"/>
					<tr>
						<td><a href="boarddetail.ap?hbId=${hb.hbId}">${ hb.title }</a></td>
						<td>${ hb.writerName }</td>
						<td>${ editDate }</td>
					</tr>
				</c:forEach>
			</c:if>
			</tbody>
			</table>
		</div>
	</section>
	<script>
		$("#work").on("click",function(){
			var id = ${ loginUser.id };
			$.ajax({
				url:"workstart.ap",
				type:"POST",
				data:{id:id},
				dataType:"json",
				success:function(data){
					if(data != null){
						alert("출근 완료");
						location.href="main.ap";
					} else {
						alert("출근 처리에 실패했습니다. 잠시후 다시 시도해주세요.");
					}
				},
				error:function(e){
					console.log(e);
				}
			
			});
		});
		
		function endWork(kind){
			var tid = "${ tid }";
			
			$.ajax({
				url:"workend.ap",
				type:"POST",
				data:{tid:tid, kind:kind},
				success:function(data){
					if(data == "success"){
						alert("퇴근 완료");
						location.href="main.ap";
					} else if("overHalf") {
						alert("사용하실 수 있는 반차의 개수가 없습니다.(총 12개)");
					}  else {
						alert("퇴근 처리에 실패했습니다. 잠시후 다시 시도해주세요.");
					}
				},
				error:function(e){
					console.log(e);
				}
			
			});
		}
	
	$(document).ready(function(){
		console.log("TMsg = " + "${Tmsg}");
	});
	</script>
</body>
</html>