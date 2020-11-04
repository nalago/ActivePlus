<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Active Plus::원내게시판</title>
<!-- SmartEditor를 사용하기 위해서 다음 js파일을 추가 (경로 확인) -->
<script type="text/javascript"
	src="${ contextPath }/resources/SmartEditor/js/HuskyEZCreator.js"
	charset="utf-8"></script>
<!-- jQuery를 사용하기위해 jQuery라이브러리 추가 -->
<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
<script type="text/javascript">
	var mailContent = "${ mailContent }"
	if( mailContent == 0){
		  mailContent = "";
	}
	
	
	var oEditors = [];
	$(function(){
	      nhn.husky.EZCreator.createInIFrame({
	          oAppRef: oEditors,
	          elPlaceHolder: "content", //textarea에서 지정한 id와 일치해야 합니다. 
	          //SmartEditor2Skin.html 파일이 존재하는 경로
	          sSkinURI: "${contextPath}/resources/SmartEditor/SmartEditor2Skin.html",  
	          htParams : {
	              // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
	              bUseToolbar : true,             
	              // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
	              bUseVerticalResizer : false,     
	              // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
	              bUseModeChanger : true,         
	              fOnBeforeUnload : function(){
	                   
	              }
	          }, 
	          fCreator: "createSEditor2"
	      });
	});
</script>
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
	margin-top: 50px;
}

th, td {
	font-family: "S-CoreDream-3Light", serif;
	padding: 8px;
	text-align: left;
	border-bottom: 1px solid #ddd;
	color: #2f2f2f;
	text-align: left;
}

th {
	width: 104px;
}

input[type=text] {
	height: 30px;
	border: none;
	border-bottom: 1px solid #63ab68;
}

#title {
	width: 400px;
}

#content {
	width: 750px;;
}

button {
	width: 80px;
	height: 30px;
	border: 1px solid lightgray;
}

.basic:hover {
	cursor: pointer;
	background: #e2e2e2;
}
</style>
</head>
<body>
	<nav id="side">
		<jsp:include page="../common/menubar.jsp" />
	</nav>
	<section>
		<c:url var="single" value="/singleImageUpload.ap" scope="application" />
		<div id="subMenu">
			<c:url var="goBoard" value="hosboard.ap" scope="application" />
			<a class="menu" href="${ goNotice }">공지사항</a> <a class="menu"
				href="${ goBoard }" style="color: #113f36;">원내게시판</a> <br>
			<br>
		</div>
		<h1 id="submenuTitle">게시판 글 작성</h1>
		<div id="contentDiv">
			<div id="topBox" align="left">
				<form id="insertForm" action="boardinsert.ap" onsubmit="return validateSubmit()">
					<button id="submitBtn" class="basic">등록하기</button>
					<table width="900px">
						<tr>
							<th>제목</th>
							<td><input type="text" name="title" id="title"
								placeholder="제목은 5자 이상 30자 이하로 작성(띄어쓰기 포함)"></td>
						</tr>
						<tr>
							<th>작성자</th>
							<td><input type="text" name="writerName" id="writerName"
								value="${ loginUser.name }" readonly> <input
								type="hidden" name="writer" id="writer"
								value="${ loginUser.id }"></td>
						</tr>
						<tr>
							<th>내용</th>
							<td><textarea name="content" name="content" id="content"
									cols="70" rows="20"></textarea></td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td><input type="password" name="boardPwd" id="boardPwd"
								placeholder="수정/삭제시 이용"></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</section>
	<script>
		// 뒤로가기
		function backFunc(){
			if(confirm("이전 화면으로 돌아가면 현재 페이지 정보는 저장되지 않습니다.")){
				window.history.back();
			}
		}
	
		// 유효성검사
		function validateSubmit() {
			oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
			var flag = false;
			var $title = $("#title").val();
			var $content = $("#content").val();
			var pwd = $("#boardPwd").val();
			
			if($title.trim() == "" || $title.length > 30 || $title.length < 5){
				alert("제목을 입력하세요.(5-30자)");
				$("#title").focus();
				return flag;
								
			} else if( $content == ""  || $content == null || $content == '&nbsp;' || $content == '<p>&nbsp;</p>')  {
	             alert("내용을 입력하세요.");
	             oEditors.getById["content"].exec("FOCUS"); //포커싱
	             return flag;
	        }
			if(pwd == "" ){
				alert("비밀번호를 입력하세요.");
				$("#boardPwd").focus();
				return flag;
			} else {
				$.ajax({
					url:"pwdconfirm.ap",
					type:"POST",
					data:{pwd:pwd},
					async:false,
					success:function(data){
						if(data == 1){
							flag = true;
							console.log(data);
						} else {
							console.log(data);
							alert("비밀번호가 틀렸습니다.");
							flag = false;
						}
					},
					error:function(error){
						console.log(error);
						flag = false;
					}
				});
			}
			return flag;
		}
	</script>
</body>
</html>