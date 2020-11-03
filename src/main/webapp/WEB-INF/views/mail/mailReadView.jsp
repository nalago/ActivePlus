<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Active Plus::메일세부내용</title>

<!-- SmartEditor를 사용하기 위해서 다음 js파일을 추가 (경로 확인) -->
<script type="text/javascript"
	src="${ contextPath }/resources/SmartEditor/js/HuskyEZCreator.js"
	charset="utf-8"></script>
<!-- jQuery를 사용하기위해 jQuery라이브러리 추가 -->
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

label, input {
	display: inline-block;
}

li {
	list-style: none;
	margin-bottom: 10px;
}

#content {
	width: 700px;
	height: 400px;
}

.input-text {
	width: 550px;
}

#mailForm {
	margin-top: 30px;
	box-sizing: border-box;
	width: 1200px;
	float: left;
}

#attachment-content a{
	text-decoration:none;
	margin-right:8px;
	font-size:13px;
}

h1, h5, #attachment-content a {
	font-family: "S-CoreDream-3Light", serif;
	color: #323334;
}

.mailBtn {
	height: 30px;
	width: 80px;
	border: 1px solid lightgray;
}

.mailBtn:hover {
	cursor: pointer;
}

.mailBtn:hover, #fileSelect:hover {
	background: #e2e2e2;
}

#attachment-content {
	padding:10px;
	border: 1px solid #e2e2e2;
	border-radius: 1px;
	width: 30%;
	height: 100px;
	margin-bottom: 0;
	overflow:scroll;
}

#send {
	background: white;
	border: 1px solid #63ab68;
	color: #67696b;
}

#send:hover {
	background: #63ab68;
	color: white;
}

#contentBox {
	border: 1px solid black;
	width: 100%;
	height: 400px;
}
</style>
</head>
<body>
	<nav id="side">
		<jsp:include page="../common/menubar.jsp" />
	</nav>
	<section>
		<div id="subMenu">
			<a class="menu" href="${ goMail }">받은 메일함</a> <a class="menu"
				href="${ goSendbox }">보낸메일함</a> <a class="menu" href="${ goImbox }">보관함</a>
			<a class="menu" href="${ goTembox }">임시보관함</a> <a class="menu"
				href="${ goWastebox }">휴지통</a>
		</div>
		<div id="contentDiv">
			<span>
				<button type="button" id="writeBack" class="mailBtn">답장</button>
				<button type="button" id="" class="mailBtn">전달하기</button>
				<button type="button" id="importantSave" class="mailBtn">보관하기</button>
				<button type="button" class="mailBtn">삭제</button>
			</span> <br>
			<div id="mailForm">
				<form name="mailForm" action="" method="post">

					<div id="topContent" class="form-content">
						<ul>
							<li><h1>제목이 출력되는 곳</h1></li>
							<li><h5>보낸사람</h5>
								<a></a></li>
							<li><h5>받는사람</h5>
								<a></a></li>
							<li><h5>참조</h5>
								<a></a></li>
						</ul>
						<hr style="border-bottom: gray; margin-bottom:10px;">
						<h5>첨부파일</h5>
						<div id="attachment-content">
							<c:forEach var="file" items="${ fileList }">
								<c:if test="file != null">
									<a href="/download.ap?fNo=${ file.fNo }">${ file.originalName }</a><button>다운로드</button>
								</c:if>
							</c:forEach>
							<a href="/download.ap?fNo=${ file.fNo }">${ file.originalName }파일이름</a><button>다운로드</button>
						</div>
						<br>
					</div>
					<div id="contentBox" class="form-content">
						<p></p>
					</div>
					<br>
				</form>
			</div>
		</div>
	</section>
	<script>
	/* 파일 다운 ajax */
		
	</script>
</body>
</html>