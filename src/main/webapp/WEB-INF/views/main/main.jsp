<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Active Plus</title>
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
	margin-left:10%;
	width: 300px;
	height: 370px;
	border: 3px solid white;
	background:#fafafa;
	margin-top:100px;
	float: left;
}

#mainT {
	margin: 30px;
	margin-left:40%;
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
	margin-left:10%;
}
#work{
	width:250px;
	height:40px;
	margin-left:25px;
	margin-top:5px;
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
.mainT th, td, h3{
	font-family:'S-CoreDream-3Light', serif;
}

</style>
</head>
<body>
	<nav id="side">
		<jsp:include page="../common/menubar.jsp" />
	</nav>
	<section>
		<div id="userInfo">
			<div id="basic">
				<div id="picture"></div>

				<div class="user">${ loginUser.id } ${ loginUser.category }, ${ loginUser.name }</div>
			</div>
		</div>
		<div id="TNA"> 
			<c:if test="${ empty TNA }">
				<button type="button" class="TNABtn" id="work">출근</button>
			</c:if>
			<c:if test="${ !empty TNA }">
				<!-- 출근 버튼 클릭 후 아래 버튼을 보이게한다. -->
				<button type="button" class="TNABtn half" style="margin-left:20px; color:#ff4d4d" id="endWork">퇴근</button>
				<button type="button" class="TNABtn half" id="halfWork">반차</button>
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
				<tr>
					<td>최나라</td>
					<td>오랜만이에여</td>
					<td>2020-09-22</td>
				</tr>
				<tr>
					<td>최나라</td>
					<td>오랜만이에여</td>
					<td>2020-09-22</td>
				</tr>
				<tr>
					<td>최나라</td>
					<td>오랜만이에여</td>
					<td>2020-09-22</td>
				</tr>
			</tbody>
			</table>
			<h3>공지사항</h3>
			<a href="${ goNotice }" style="float:right; text-decoration:none; color:#63ab68">더보기</a>
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
				<tr>
					<td>테스트용 공지사항 입니다.</td>
					<td>관리자</td>
					<td>2020-09-22</td>
				</tr>
				<tr>
					<td>수업 듣기 너무 귀찮다..</td>
					<td>관리자</td>
					<td>2020-09-22</td>
				</tr>
				<tr>
					<td>반가워요. kh병원 직원 여러분</td>
					<td>관리자</td>
					<td>2020-09-22</td>
				</tr>
			</tbody>	
			</table>
			<h3>게시판</h3>
			<a href="${ goHosboard }" style="float:right; text-decoration:none; color:#63ab68">더보기</a>
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
				<tr>
					<td>반가워!!!</td>
					<td>반가워!!!</td>
					<td>반가워!!!</td>
				</tr>
				<tr>
					<td>반가워!!!</td>
					<td>반가워!!!</td>
					<td>반가워!!!</td>
				</tr>
				<tr>
					<td>반가워!!!</td>
					<td>반가워!!!</td>
					<td>반가워!!!</td>
				</tr>
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
						$("#work").css("display","none");
						$(".half").css({display:'inline-block'});
						console.log("data : " + data);
					} else {
						alert("출근 처리에 실패했습니다. 잠시후 다시 시도해주세요.");
					}
				},
				error:function(e){
					console.log(e);
				}
			
			});
		});
		
		$("#endWork").on("click",function(){
			
		});
	
	
	</script>
</body>
</html>