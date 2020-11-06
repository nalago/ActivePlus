<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Active Plus::공지사항</title>

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
	border:none;
	resize:none;
	float:left;
	width:900px;
	height:100%;
	overflow-y:scroll;
}
button{
	width:80px;
	height:30px;
	border:1px solid lightgray;
	margin-top:10px;
}

.basic:hover{
	cursor:pointer;
	background:#e2e2e2;
}
.attachment{
	margin-top:20px;
	margin-left:30px;
	float:left;
	width:300px;
	height:550px;
	overflow-y:scroll;
}
.attachment::-webkit-scrollbar{
	display:none;
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
#green{
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
			<c:url var="boardUpdate" value="noticeupdate.ap"/>
			
			<a class="menu" href="${ goNotice }" style="color:#113f36;">공지사항</a>
			<a class="menu" href="${ goBoard }">원내게시판</a> 
			<br><br>
		</div>
		<img alt="green-back-icon" src="${contextPath}/resources/images/board/green-back-icon.png"
		 width="50px" height="50px" id="green" onclick="backFunc()">
		<div id="contentDiv">
			<div class="main">
				<h3 style="color:#63ab68; font-weight:normal;">${ notice.category }</h3>
				<h2 style="font-weight:normal">${notice.title }</h2>
				<p style="float:left">작성 : ${date} ${ notice.writerName }</p>
				<c:if test="${ notice.writer eq loginUser.id }">
					<div id="btnDiv" style="float:right">
						<input type="password" name="pwd" placeholder="비밀번호 입력 ">
						<button id="editBtn" onclick="checkPwd('edit')">수정하기</button>
						<button id="deleteBtn" onclick="checkPwd('del')">삭제하기</button>
					</div>
				</c:if>
				<br clear="all">
			</div>
			<hr style="border-bottom:#lightgray">
			<div id="content">${ notice.content }</div>
			<div class="attachment">
				<c:if test="${ !empty at }">
					<h4 style="color:#63ab68">첨부파일</h4>
						<ul>
							<c:if test="${ !empty at }">
								<li>${ at.originalFile }<button type="button">다운로드</button></li>
							</c:if>
						</ul>
				</c:if>
			</div>
			<br>
		</div>
	</section>
	<script>
	// 뒤로가기
	function backFunc(){
		window.history.back();
	}
	
	function checkPwd(kind){
		pwd = $("input[name='pwd']").val();
		nId = ${ notice.noticeId };
		attachment = ${ notice.attachment };
		
		$.ajax({
			url:"pwdconfirm.ap",
			type:"POST",
			data:{pwd:pwd},
			success:function(data){
				if(data > 0){
					// 비밀번호 일치
					if(kind == "edit"){
						location.href="${contextPath}/noticeupdate.ap?nId=${notice.noticeId}";
					} else {
						if(confirm("게시물을 삭제하시겠습니까?")){
							$.ajax({
								url:"noticedelete.ap",
								data:{nId:nId, attachment:attachment},
								success:function(data){
									if(data > 0){
										alert("성공적으로 삭제되었습니다.");
										location.href="${contextPath}/notice.ap";
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
	$(document).ready(function(){
		// console.log("${notice.attachment}");
	});
	
	</script>
</body>
</html>