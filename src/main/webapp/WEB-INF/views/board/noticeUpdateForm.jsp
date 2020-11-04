<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Active Plus::공지사항</title>

<!-- SmartEditor를 사용하기 위해서 다음 js파일을 추가 (경로 확인) -->
<script type="text/javascript"
	src="${ contextPath }/resources/SmartEditor/js/HuskyEZCreator.js"
	charset="utf-8"></script>
<!-- jQuery를 사용하기위해 jQuery라이브러리 추가 -->
<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
<script type="text/javascript">
	/* var mailContent = "${notice.content}";
	if (mailContent == 0) {
		mailContent = "";
	} */

	var oEditors = [];
	$(function() {
		nhn.husky.EZCreator
				.createInIFrame({
					oAppRef : oEditors,
					elPlaceHolder : "content", //textarea에서 지정한 id와 일치해야 합니다. 
					//SmartEditor2Skin.html 파일이 존재하는 경로
					sSkinURI : "${contextPath}/resources/SmartEditor/SmartEditor2Skin.html",
					htParams : {
						// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
						bUseToolbar : true,
						// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
						bUseVerticalResizer : false,
						// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
						bUseModeChanger : true,
						fOnBeforeUnload : function() {

						}
					},
					fOnAppLoad : function() {
						// 기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
						// 수정시 사용
						oEditors.getById["content"].exec("PASTE_HTML",
								[ '${notice.content}' ]);
					},
					fCreator : "createSEditor2"
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

#editBtn {
	width: 80px;
	height: 30px;
	border: 1px solid lightgray;
}

select {
	width: 50px;
	height: 30px;
}

.basic:hover {
	cursor: pointer;
	background: #e2e2e2;
}
#hiddenFile {
	display: none;
}

#attachment-content {
	border: 1px solid #e2e2e2;
	border-radius: 1px;
	width: 515px;
	height: 30px;
	margin-bottom: 0;
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
			<c:url var="goBoard" value="hosboard.ap" scope="application" />
			<a class="menu" href="${ goNotice }" style="color: #113f36;">공지사항</a>
			<a class="menu" href="${ goBoard }">원내게시판</a> <br>
			<br>
		</div>
		<img alt="green-back-icon" src="${contextPath}/resources/images/board/green-back-icon.png"
		 width="50px" height="50px" id="green" onclick="backFunc()">
		<h1 id="submenuTitle">공지사항 수정</h1>
		<div id="contentDiv">
			<form action="updatenotice.ap" onsubmit="return validateSubmit()">
				<input type="submit" id="editBtn" class="basic" value="수정하기">
				<input type="hidden" name="noticeId" value="${ notice.noticeId }">
				<div id="topBox" align="left">
					<c:if test="${ notice.category } eq '전체'">
						<c:set var="selectA" value="selected" />
					</c:if>
					<c:if test="${ notice.category } eq '사무'">
						<c:set var="selectC" value="selected" />
					</c:if>
					<c:if test="${ notice.category } eq '의료'">
						<c:set var="selectM" value="selected" />
					</c:if>
					<c:if test="${ notice.category } eq '필독'">
						<c:set var="selectI" value="selected" />
					</c:if>
					<table width="900px">
						<tr>
							<th>분류</th>
							<td><select name="category">
									<option value="전체" ${ selectA }>전체</option>
									<option value="사무" ${ selectC }>사무</option>
									<option value="의료" ${ selectM }>의료</option>
									<option value="필독" ${ selectI }>필독</option>
							</select></td>
						</tr>
						<tr>
							<th>제목</th>
							<td><input type="text" name="title" id="title"
								placeholder="최대 20자" value="${ notice.title }"></td>
						</tr>
						<tr>
							<th>작성자</th>
							<td><input type="text" name="writerName" id="writerName"
								value="${ loginUser.name }" readonly> <input
								type="hidden" name="writer" id="writer"
								value="${ loginUser.id }" readonly></td>
						</tr>
						<tr>
							<th>작성일</th>
							<td><input type="text" name="writeDate" id="writeDate"
								value="${date}" readonly></td>
						</tr>
						<tr>
							<th>내용</th>
							<td><textarea name="content" id="content" cols="70"
									rows="20"></textarea></td>
						</tr>
						<tr>
							<th>첨부파일</th>
							<td><input type="file" id="hiddenFile" name="uploadFiles" value="${ at }">
								<input type="text" id="attachment-content" value="${at.originalFile }" name="reFile" readonly> <input
								type="button" value="파일선택" id="fileSelect"></td>
						</tr>
					</table>
				</div>
			</form>
		</div>
	</section>
	<script>
		// 뒤로가기
		function backFunc(){
			if(confirm("이전 화면으로 돌아가면 현재 페이지 정보는 저장되지 않습니다.")){
				window.history.back();
			}
		}
	
		$("#fileSelect").on("click", function() {
			$("#hiddenFile").click();

		});

		$("#hiddenFile").on("change", function() {
			var file = $("#hiddenFile").val();
			var fileSplit = file.split('\\');
			var fileName = fileSplit[fileSplit.length - 1];
			$("#attachment-content").val(fileName);
		});

		function validateSubmit() {
			
			oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
			
			var flag = false;
			var $title = $("#title").val();
			var $content = $("#content").val();

			if ($title.trim() == "" || $title.length > 30 || $title.length < 5) {
				alert("제목을 입력하세요.(5-30자)");
				$("#title").focus();
				return flag;

			} else if ($content == "" || $content == null
					|| $content == '&nbsp;' || $content == '<p>&nbsp;</p>') {
				alert("내용을 입력하세요.");
				oEditors.getById["content"].exec("FOCUS"); //포커싱
				return flag;
			}
			flag = true;
			
			if($("#hiddenFile").val() == null){
				$("#attachment-content").val("${at.renameFile}");
			}
			return flag;
		}
	</script>
</body>
</html>