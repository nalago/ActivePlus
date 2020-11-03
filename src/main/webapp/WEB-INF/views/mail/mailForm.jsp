<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Active Plus::메일작성</title>

<!-- SmartEditor를 사용하기 위해서 다음 js파일을 추가 (경로 확인) -->
<script type="text/javascript" src="${ contextPath }/resources/SmartEditor/js/HuskyEZCreator.js" charset="utf-8"></script>
<!-- jQuery를 사용하기위해 jQuery라이브러리 추가 -->
<script src="https://code.jquery.com/jquery-3.5.1.js" 
integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/validate.js/0.12.0/validate.min.js"></script>
<script type="text/javascript">
	var mailContent = ${ mailContent } + ""
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
	          fOnAppLoad : function(){
	              // 기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
	              // 수정시 사용
	              oEditors.getById["content"].exec("PASTE_HTML", [mailContent]);
	          },
	          fCreator: "createSEditor2"
	      });
	});
</script>
<style>
@font-face { 
	font-family: 'S-CoreDream-3Light'; 
	src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-3Light.woff') format('woff'); 
	font-weight: normal; 
	font-style: normal; 
}
label, input {
	display:inline-block;
}
li{
	list-style:none;
	margin-bottom:10px;
}
#content{
	width:700px;
	height:400px;
}
#hiddenFile{
	display:none;
}
.cont-label{
	border-bottom:1px solid lightgray;
	width:90px;
	margin-right:10px;
	color:#67696b;
}
.input-text{
	width:550px;
	
}
#fileSelect{
	width:80px;
	height:30px;
	border:solid 1px lightgray;
}
#mailForm{
	margin-top:30px;
	box-sizing:border-box;
	width:800px;
	float:left;
} 

h4{
	font-family: "S-CoreDream-3Light", serif;
	color: #323334;
}
.mailBtn{
	height:30px;
	width:80px;
	border:1px solid lightgray;
}
.mailBtn:hover, .findEmp:hover, #fileSelect:hover{
	cursor:pointer;
}
.mailBtn:hover,#fileSelect:hover{
	background:#e2e2e2;
}

/* 직원 검색 */
#empList{
	margin-top:30px;
	float:left;
	border:1px solid gray;
	border-radius:3px;
	width:350px;
	height:590px;
	padding:10px;
	background:#f8f8f8;
	display:none;
	opacity:0;
}

#empContent{
	border:1px solid lightgray;
	width:328px;
	height:70%;
	margin-top:10px;
	overflow: auto;
	background:white;
}

#emp-container{
	margin-left:30px;
	margin-top:10px;
	color:#67696b;
}
#attachment-content{
	border:1px solid #e2e2e2;
	border-radius:1px;
	width:515px;
	height:30px;
	margin-bottom:0;
}
#send{
	background:white; border:1px solid #63ab68; color:#67696b;
}
#send:hover{
	background:#63ab68;
	color:white;
}


</style>
</head>
<body>
	<nav id="side">
		<jsp:include page="../common/menubar.jsp"/>
	</nav>
	<section>
		<div id="subMenu">
			<a class="menu" href="${ goMail }">받은 메일함</a>
			<a class="menu" href="${ goSendbox }">보낸메일함</a>
			<a class="menu" href="${ goImbox }">보관함</a>
			<a class="menu" href="${ goTembox }">임시보관함</a>
			<a class="menu" href="${ goWastebox }">휴지통</a>
			<br><br>
		</div>
		<!-- switch문을 이용하여 변경 -->
		<h1 id="submenuTitle">메일작성</h1>
		<div id="contentDiv">
			<span>
				<button type="button" id="send" class="mailBtn">보내기</button>
				<button type="button" id="sendToMe" class="mailBtn">내게쓰기</button>
				<button type="button" id="temporarySave" class="mailBtn">임시저장</button>
				<button type="button" class="mailBtn">예약발송</button>
			</span>
			<br>
			<div id="mailForm">
				<c:url var="mailSend" value="mailsend.ap"/>
				<form name="mailForm" action="" method="post" enctype="multipart/from-date" onsubmit="function validateForm()">
					
					<div id="topContent" class="form-content">
						<ul>
							<li><label class="cont-label recipient" id="testlavel">받는사람</label><input type="text" name="recipient" class="input-text"
							onclick="inputClick('recipient')" placeholder="직원이름을 입력하세요.">
							<button type="button" style="width:45px" class="findEmp" onclick="openEmp('send')">찾기</button></li>
							<li><label class="cont-label ref-person">참조</label><input type="text" name="ref-person" class="input-text"
							onclick="inputClick('ref')" placeholder="직원이름을 입력하세요.">
							<button type="button" style="width:45px" class="findEmp" onclick="openEmp('ref')">찾기</button></li>
							<li><label class="cont-label title">제목</label><input type="text" name="title" class="input-text" style="width:600px"
							onclick="inputClick('title')"></li>
							<li><label class="cont-label">파일첨부</label><input type="button" value="파일선택" id="fileSelect">
							<input type="file" multiple="multiple" id="hiddenFile" name="files">
							<input type="text" id="attachment-content" readonly></li>
						</ul>
					</div>
					<div id="contentBox" class="form-content">
						<textarea rows="30" cols="30" id="content" name="content"></textarea>
					</div>
				</form>
			</div>
			<div id="empList">
				<h4>직원조회</h4>
				<br><hr style="border-bottom:gray"><br>
				<select>
					<option>부서</option>
					<option>전체</option>
					<option>ㅁㅁ</option>
					<option>ㅇㅇ</option>
					<option>ㄴㄴ</option>
					<option>ㄹㄹ</option>
					<option>ㄱㄱ</option>
				</select>
				<select>
					<option>직급</option>
					<option>전체</option>
					<option>ㅁㅁㅁ</option>
					<option>ㅇㅇ</option>
					<option>ㄹㄹㄹ</option>
					<option>ㅇㄱㄱㅇ</option>
					<option>ㅇㅁㅇ</option>
				</select>
				<button type="button">조회하기</button>
				<br><br>
				<select>
					<option>이름</option>
					<option>사번</option>
				</select>
				<input type="search" style="width:150px">
				<button type="button">검색하기</button>
				<br>
				<div id="empContent">
					<!-- for문을 이용해서 작성 -->
					<ul id="emp-container">
					<%-- <c:forEach var="eList" items="${ empList }" varStatus="status">
						<li><input type="checkbox" name="selectEmp" id="select1"> <label for="select1">부서 직급 이름 사번</label></li>
					</c:forEach> --%>
						<li><input type="checkbox" name="selectEmp" id="select2"> <label for="select2">부서 직급 이름 사번</label></li>
						<li><input type="checkbox" name="selectEmp" id="select3"> <label for="select3">부서 직급 이름 사번</label></li>
						<li><input type="checkbox" name="selectEmp" id="select3"> <label for="select3">부서 직급 이름 사번</label></li>
						<li><input type="checkbox" name="selectEmp" id="select3"> <label for="select3">부서 직급 이름 사번</label></li>
						<li><input type="checkbox" name="selectEmp" id="select3"> <label for="select3">부서 직급 이름 사번</label></li>
						<li><input type="checkbox" name="selectEmp" id="select3"> <label for="select3">부서 직급 이름 사번</label></li>
						<li><input type="checkbox" name="selectEmp" id="select3"> <label for="select3">부서 직급 이름 사번</label></li>
						<li><input type="checkbox" name="selectEmp" id="select3"> <label for="select3">부서 직급 이름 사번</label></li>
						<li><input type="checkbox" name="selectEmp" id="select3"> <label for="select3">부서 직급 이름 사번</label></li>
						<li><input type="checkbox" name="selectEmp" id="select3"> <label for="select3">부서 직급 이름 사번</label></li>
						<li><input type="checkbox" name="selectEmp" id="select3"> <label for="select3">부서 직급 이름 사번</label></li>
						<li><input type="checkbox" name="selectEmp" id="select3"> <label for="select3">부서 직급 이름 사번</label></li>
						<li><input type="checkbox" name="selectEmp" id="select3"> <label for="select3">부서 직급 이름 사번</label></li>
						<li><input type="checkbox" name="selectEmp" id="select3"> <label for="select3">부서 직급 이름 사번</label></li>
						<li><input type="checkbox" name="selectEmp" id="select3"> <label for="select3">부서 직급 이름 사번</label></li>
						<li><input type="checkbox" name="selectEmp" id="select3"> <label for="select3">부서 직급 이름 사번</label></li>
						<li><input type="checkbox" name="selectEmp" id="select3"> <label for="select3">부서 직급 이름 사번</label></li>
						<li><input type="checkbox" name="selectEmp" id="select3"> <label for="select3">부서 직급 이름 사번</label></li>
						<li><input type="checkbox" name="selectEmp" id="select3"> <label for="select3">부서 직급 이름 사번</label></li>
						<li><input type="checkbox" name="selectEmp" id="select3"> <label for="select3">부서 직급 이름 사번</label></li>
						<li><input type="checkbox" name="selectEmp" id="select3"> <label for="select3">부서 직급 이름 사번</label></li>
						<li><input type="checkbox" name="selectEmp" id="select3"> <label for="select3">부서 직급 이름 사번</label></li>
						<li><input type="checkbox" name="selectEmp" id="select3"> <label for="select3">부서 직급 이름 사번</label></li>
						<li><input type="checkbox" name="selectEmp" id="select3"> <label for="select3">부서 직급 이름 사번</label></li>
						<li><input type="checkbox" name="selectEmp" id="select3"> <label for="select3">부서 직급 이름 사번</label></li>
					</ul>
				</div>
			</div>
		</div>
	</section>
	<script>
	
	
	/* 파일 첨부 js */
		$(function(){
			$("#fileSelect").on("click",function(){
				$("#hiddenFile").click();
				
			});
		});
	
		$("#hiddenFile").on("change",function(){
			var files = $("#hiddenFile")[0].files;
			console.log(files)
			var fileName;
			for(var i= 0; i<files.length; i++){
				if( i <= 0)
					fileName = '"'+files[i].name+'" ';
				else
					fileName += '"'+files[i].name+'" ';
	        	console.log(fileName);
	        }
			$("#attachment-content").val(fileName);
	  
		});
		
		// submit function
		function validateForm(){
			oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD",[]);

			
		}
	
	
		function inputClick(kind){
			switch(kind){
			case "recipient":
				$(".cont-label").css("border-color","lightgray");
				$(".recipient").css({borderColor:"#63ab68", transition:"all 0.25s"});
				break;
			case "ref":
				$(".cont-label").css("border-color","lightgray");
				$(".ref-person").css({borderColor:"#63ab68", transition:"all 0.25s"});
				break;
			case "title":
				$(".cont-label").css("border-color","lightgray");
				$(".title").css({borderColor:"#63ab68", transition:"all 0.25s"});
				break;
			
			}
		}
		function openEmp(kind){
			
			if(kind == 'ref'){
				$(".cont-label").css("border-color","lightgray");
				$(".ref-person").css({borderColor:"#63ab68", transition:"all 0.25s"});
				$("h4").html('직원조회(참조)');
				$("input [type='checkbox']").on("click",function(e){
					console.log(e);
				});
			} else {
				$(".cont-label").css("border-color","lightgray");
				$(".recipient").css({borderColor:"#63ab68", transition:"all 0.25s"});
				$("h4").html('직원조회');
			}	
			$("#empList").css({display:"inline-block", opacity:1});
		}
		/* 직원 조회 ajax */
		
	</script>
</body>
</html>