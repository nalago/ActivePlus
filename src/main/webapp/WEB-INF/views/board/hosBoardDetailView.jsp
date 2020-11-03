<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Active Plus::원내게시판</title>

<!-- SmartEditor를 사용하기 위해서 다음 js파일을 추가 (경로 확인) -->
<script type="text/javascript" src="${ contextPath }/resources/SmartEditor/js/HuskyEZCreator.js" charset="utf-8"></script>
<!-- jQuery를 사용하기위해 jQuery라이브러리 추가 -->
<script src="https://code.jquery.com/jquery-3.5.1.js" 
integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/validate.js/0.12.0/validate.min.js"></script>
<style type="text/css">
@font-face { 
	font-family: 'S-CoreDream-3Light'; 
	src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-3Light.woff') format('woff'); 
	font-weight: normal; 
	font-style: normal; 
}

p, h4
{
	font-family: "S-CoreDream-3Light", serif;
    color:gray;
    margin-top:10px;
}

#content{
	margin-top:20px;
	float:left;
	width:90%;
	height:70%;
}
button{
	width:80px;
	height:30px;
	margin-top:10px;
}

.basic:hover{
	cursor:pointer;
	background:#e2e2e2;
}

li{
	list-style:none;
}
li p{	
	width:200px;
	overflow: hidden;
	white-space:nowrap;
	text-overflow:ellipsis;
	float:left;
}
.main{
	width:100%;
	height:100px;
}
#pink{
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
			<c:url var="goBoard" value="hosboard.ap" scope="application"/>
			<a class="menu" href="${ goNotice }">공지사항</a>
			<a class="menu" href="${ goBoard }" style="color:#113f36;">원내게시판</a> 
			<br><br>
		</div>
		<img alt="pink-back-icon" src="${contextPath}/resources/images/board/pink-back-icon.png"
		 width="50px" height="50px" id="pink" onclick="backFunc()">
		<div id="contentDiv">
		<c:url var="boardUpdate" value="boardupdate.ap">
			<c:param name="hbId" value="${ hb.hbId }"/>
		</c:url>
			<div class="main">
				<h2 style="font-weight:normal">${ hb.title }</h2>
				<p style="float:left">작성 : ${ date } ${ hb.writerName }</p>
				<c:if test="${ hb.writer eq loginUser.empId }">
					<div id="btnDiv" style="float:right">
						<input type="password" name="pwd" placeholder="비밀번호 입력 ">
						<button id="editBtn" onclick="checkPwd('edit')">수정하기</button>
						<button id="deleteBtn" onclick="checkPwd('del')">삭제하기</button>
					</div>
				</c:if>
				<br clear="all">
			</div>
			<hr style="border-bottom:#lightgray">
			<div id="content">${ hb.content }</div>
		</div>
	</section>
	<script>
	// 뒤로가기
	function backFunc(){
		window.history.back();
	}
	
	function checkPwd(kind){
		pwd = $("input[name='pwd']").val();
		hbId = ${hb.hbId};
		$.ajax({
			url:"pwdconfirm.ap",
			type:"POST",
			data:{pwd:pwd},
			success:function(data){
				if(data > 0){
					// 비밀번호 일치
					if(kind == "edit"){
						location.href="${boardUpdate}";
					} else {
						if(confirm("게시물을 삭제하시겠습니까?")){
							$.ajax({
								url:"boarddelete.ap",
								data:{hbId:hbId},
								success:function(data){
									if(data > 0){
										alert("성공적으로 삭제되었습니다.");
										location.href="${contextPath}/hosboard.ap";
									}	
								},
								error:function(error){
									console.log(error);
								}
							});
						}
					}
						
				} else {
					alert("비밀번호가 일치하지 않습니다.");
				}
			},
			error:function(error){
				console.log("실패");
			}
		});
	}
	</script>
</body>
</html>