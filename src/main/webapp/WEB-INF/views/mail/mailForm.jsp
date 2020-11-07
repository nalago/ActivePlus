<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Active Plus::메일작성</title>

<!-- SmartEditor를 사용하기 위해서 다음 js파일을 추가 (경로 확인) -->
<script type="text/javascript"
	src="${ contextPath }/resources/SmartEditor/js/HuskyEZCreator.js"
	charset="utf-8"></script>
<!-- jQuery를 사용하기위해 jQuery라이브러리 추가 -->
<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
<script type="text/javascript">
	var mailContent = "${mailContent}"
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
								[ mailContent ]);
					},
					fCreator : "createSEditor2"
				});
	});
</script>
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

#hiddenFile {
	display: none;
}

.cont-label {
	border-bottom: 1px solid lightgray;
	width: 90px;
	margin-right: 10px;
	color: #67696b;
}

.input-text {
	width: 550px;
}

#fileSelect {
	width: 80px;
	height: 30px;
	border: solid 1px lightgray;
}

#mailForm {
	margin-top: 30px;
	box-sizing: border-box;
	width: 800px;
	float: left;
}

h4 {
	font-family: "S-CoreDream-3Light", serif;
	color: #323334;
}

.mailBtn {
	height: 30px;
	width: 80px;
	border: 1px solid lightgray;
}

.mailBtn:hover, .findEmp:hover, #fileSelect:hover {
	cursor: pointer;
}

.mailBtn:hover, #fileSelect:hover {
	background: #e2e2e2;
}

/* 직원 검색 */
#empList {
	margin-top: 30px;
	float: left;
	border: 1px solid gray;
	border-radius: 3px;
	width: 350px;
	height: 590px;
	padding: 10px;
	background: #f8f8f8;
	display: none;
	opacity: 0;
}

#empContent {
	border: 1px solid lightgray;
	width: 328px;
	height: 70%;
	margin-top: 10px;
	overflow: auto;
	background: white;
}

#emp-container {
	margin-left: 30px;
	margin-top: 10px;
	color: #67696b;
}

#attachment-content {
	border: 1px solid #e2e2e2;
	border-radius: 1px;
	width: 515px;
	height: 30px;
	margin-bottom: 0;
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
				href="${ goWastebox }">휴지통</a> <br>
			<br>
		</div>
		<!-- switch문을 이용하여 변경 -->
		<h1 id="submenuTitle">메일작성</h1>
		<div id="contentDiv">
			<span>
				<button type="button" id="send" class="mailBtn"
					onclick="validateForm('send')">보내기</button>
				<button type="button" id="sendToMe" class="mailBtn"
					onclick="validateForm('self')">내게쓰기</button>
				<button type="button" id="temporarySave" class="mailBtn"
					onclick="validateForm('temp')">임시저장</button>
				<button type="button" class="mailBtn" onclick="validateForm('res')">예약발송</button>
			</span> <br>
			<div id="mailForm">
				<c:url var="mailSend" value="send.ap" />
				<form name="mailForm" action="${ mailSend }" method="post"
					enctype="multipart/from-date" onsubmit="">

					<div id="topContent" class="form-content">
						<ul>
							<li><label class="cont-label recipient" id="recipient">받는사람</label><input
								type="text" class="input-text" onclick="inputClick('recipient')"
								placeholder="직원을 입력하세요." id="rInput"> <input
								type="hidden" name="receiver">
								<button type="button" style="width: 45px" class="findEmp"
									id="sendEmp">찾기</button></li>
							<li><label class="cont-label ref-person">참조</label><input
								type="text" class="input-text" onclick="inputClick('ref')"
								placeholder="직원을 입력하세요." id="refInput"> <input
								type="hidden" name="refReceiver">
								<button type="button" style="width: 45px" class="findEmp"
									id="refEmp">찾기</button></li>
							<li><label class="cont-label title">제목</label><input
								type="text" name="title" class="input-text" style="width: 600px"
								onclick="inputClick('title')" id="title"></li>
							<li><label class="cont-label">파일첨부</label><input
								type="button" value="파일선택" id="fileSelect"> <input
								type="file" multiple="multiple" id="hiddenFile" name="files">
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
				<br>
				<hr style="border-bottom: gray">
				<br> <select id="dept">
					<option>부서</option>
					<option value="전체">전체</option>
					<option value="운영과">운영과</option>
					<option value="인사과">인사과</option>
					<option value="원무과">원무과</option>
					<option value="총무과">총무과</option>
					<option value="의료진">의료진</option>
				</select> <select id="job" onchange="detailSelect('job')">
					<option>직급</option>
					<option value="사원">사원</option>
					<option value="대리">대리</option>
					<option value="차장">차장</option>
					<option value="과장">과장</option>
					<option value="부장">부장</option>
					<option value="원장">원장</option>
					<option value="대표원장">대표원장</option>
				</select> <select id="medi" style="display: none"
					onchange="detailSelect('medi')">
					<option>계열</option>
					<option value="내과">내과</option>
					<option value="외과">외과</option>
					<option value="치과">치과</option>
					<option value="간호과">간호과</option>
					<option value="의료기과">의료기과</option>
				</select>
				<button type="button">조회하기</button>
				<br>
				<br> 
				<select id="empSelect">
					<option>이름</option>
					<option>사번</option>
				</select> <input type="search" style="width: 150px" id="key">
				<button type="button" id="empSearch" onclick="empSearch()">검색하기</button>
				<br>
				<div id="empContent">
					<!-- for문을 이용해서 작성 -->
					<ul id="emp-container">
					</ul>
				</div>
			</div>
		</div>
	</section>
	<script>
		// 스크립트에 저장해서 필터링
		var eList, bKind;
		var sendEmp=[];
		var refEmp = [];

		/* 파일 첨부 js */
		$(function() {
			$("#fileSelect").on("click", function() {
				$("#hiddenFile").click();
			});
		});
		$("#hiddenFile").on("change", function() {
			var files = $("#hiddenFile")[0].files;
			var fileName;
			for (var i = 0; i < files.length; i++) {
				if (i <= 0)
					fileName = '"' + files[i].name + '" ';
				else
					fileName += '"' + files[i].name + '" ';
				console.log(fileName);
			}
			$("#attachment-content").val(fileName);
		});

		// 체크박스 체크 
		$(document).on("click", "input[name=refEmp]", function() {
			var eId = this.value;
			var chk = true;
			if (this.checked) {
				for ( var i in refEmp) {
					if (refEmp[i] == eId) {
						chk = false;
					}
				}

				if (chk) {
					refEmp.push(eId);
				}

			} else {

				for ( var i in refEmp) {
					if (refEmp[i] == eId) {
						refEmp.splice(refEmp.indexOf(i), 1);
					}
				}
			}
			$("input[name=refEmp]").val(refEmp);
			$("#refInput").val(refEmp);
		});

		$(document).on("click", "input[name=sendEmp]", function() {
			var eId = this.value;
			var chk = true;
			if (this.checked) {
				for ( var i in sendEmp) {
					if (sendEmp[i] == eId) {
						chk = false;
					}
				}
				if (chk)
					sendEmp.push(eId);

			} else {
				for ( var i in sendEmp) {
					if (sendEmp[i] == eId) {
						sendEmp.splice(sendEmp.indexOf(i), 1);
					}
				}
			}
				$("input[name=sendEmp]").val(sendEmp);
				$("#rInput").val(sendEmp);
		});

		// submit function
		function validateForm(kind) {
			oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
			if (kind == 'self') {
				$("#rInput").val("${loginUser.id}");
			}

			var receiver = $("#rInput").val();
			var title = $("#title").val();
			var content = $("#content").val();

			if (receiver.trim() == "") {
				alert("받는 사람이 지정되지 않았습니다.");
			} else if (title.trim() == "") {
				if (confirm("제목이 입력되지 않았습니다. 메일을 보내시겠습니까?")) {
					$("form").submit();
				}

			} else if (content == "" || content == null || content == '&nbsp;'
					|| content == '<p>&nbsp;</p>') {
				if (confirm("내용이 입력되지 않았습니다. 메일을 보내시겠습니까?")) {
					$("form").submit();
				}
			}

		}

		// 밑줄
		function inputClick(kind) {
			switch (kind) {
			case "recipient":
				$(".cont-label").css("border-color", "lightgray");
				$(".recipient").css({
					borderColor : "#63ab68",
					transition : "all 0.25s"
				});

				break;
			case "ref":
				$(".cont-label").css("border-color", "lightgray");
				$(".ref-person").css({
					borderColor : "#63ab68",
					transition : "all 0.25s"
				});
				break;
			case "title":
				$(".cont-label").css("border-color", "lightgray");
				$(".title").css({
					borderColor : "#63ab68",
					transition : "all 0.25s"
				});
				break;

			}
		}

		/* 직원조회 ajax */
		function empList(kind) {
			$.ajax({
						url : "openemp.ap",
						type : "GET",
						dataType : "json",
						success : function(data) {
							var $container = $("#emp-container");
							$container.html("");
							// console.log(data);
							if (data.length > 0) {
								eList = data;
								for ( var i in data) {
									// console.log(data[i]);
									var chk = "";
									var $li = $("<li>");
									var $input;
									var team, grade;
									if (data[i].category == '사무') {
										team = data[i].department;
										grade = data[i].jobGrade;
									} else if (data[i].category != '사무') {
										team = data[i].field;
										grade = data[i].grade;
									}
									if (kind == "ref") {
										for ( var j in refEmp) {
											if (refEmp[j] == data[i].id) {
												chk = "checked";
											}
										}
										$input = $("<input type='checkbox' name='refEmp' id='select" + i + "' value='"+data[i].id+"'"+chk+">");
									} else {
										for ( var j in sendEmp) {
											if (sendEmp[j] == data[i].id) {
												chk = "checked";
											}
										}
										$input = $("<input type='checkbox' name='sendEmp' id='select" + i + "' value='"+data[i].id+"'"+chk+">");
									}
									var $label = $(
											"<label for='select"+ i +"'>")
											.text(
													" " + data[i].name + " "
															+ team + " "
															+ grade);

									$li.append($input);
									$li.append($label);

									$container.append($li);
								}
							} else {
								$li = $("<li>");
								$input = $("<p style='text-align:center'>")
										.text("조회된 직원이 없습니다.");

								$li.append($input);

								$container.append($li);
							}
						},
						error : function(e) {
							console.log(e);
						}
					});
		}

		/* 직원조회 버튼 클릭 */
		$("#sendEmp").on("click", function() {

			$(".cont-label").css("border-color", "lightgray");
			$(".recipient").css({
				borderColor : "#63ab68",
				transition : "all 0.25s"
			});
			$("h4").html('직원조회');
			$("#empList").css({
				display : "inline-block",
				opacity : 1
			});
			empList('send');
			bKind = 'send';
		});

		$("#refEmp").on("click", function() {
			$(".cont-label").css("border-color", "lightgray");
			$(".ref-person").css({
				borderColor : "#63ab68",
				transition : "all 0.25s"
			});
			$("h4").html('직원조회(참조)');
			$("#empList").css({
				display : "inline-block",
				opacity : 1
			});
			empList('ref');
			bKind = 'ref';
		});

		// select box 변경
		$("#dept").on("change", function() {
			var dept = $("#dept").val();
			var d = [];
			if (dept == '의료진') {
				$("#job").css("display", "none");
				$("#medi").css("display", "inline-block");

				for ( var i in eList) {
					if (eList[i].category == '의료') {
						d.push(eList[i]);
					}
				}
				react(d);
			} else if (dept != '의료진') {
				$("#medi").css("display", "none");
				$("#job").css("display", "inline-block");

			}
			if (dept != '전체') {
				for ( var i in eList) {
					if (eList[i].department == dept) {

						d.push(eList[i]);
					}
				}
				react(d);
			} else {
				react(eList);
			}

		});

		// 직급 select 변경 
		function detailSelect(kind) {
			var job;
			var d = []
			if (kind == 'medi') {
				job = $("#medi").val();
				for ( var i in eList) {
					if (eList[i].category == '의료') {
						if (eList[i].field == job)
							d.push(eList[i]);
					}
				}
				react(d);

			} else {
				job = $("#job").val();

				for ( var i in eList) {
					if (eList[i].category == '사무') {
						if (eList[i].jobGrade == job)
							d.push(eList[i]);
					}
				}
				react(d);

			}

		}
		// 검색
		function empSearch(){
			$empSelect = $("#empSelect").val();
			$key = $("#key").val();
			sList = [];
			console.log("$empSelect : "+ $empSelect);
			console.log("$key : "+ $key);
			if($empSelect == '이름'){
				for(var i in eList){
					if(eList[i].name == $key){
						console.log("이름 일치");
						sList.push(eList[i]);
					}
					
				}
			} else {
				for(var i in eList){
					if(eList[i].id == $key){
						console.log("사번 일치")
						sList.push(eList[i]);
					}
					
				}
				
			}
			
			react(sList)
			
		}
		
		// 필터링시 작동
		function react(d) {
			var $container = $("#emp-container");
			$container.html("");
			console.log(d);
			if (d.length > 0) {
				for ( var i in d) {
					var $li = $("<li>");
					var $input;
					var team, grade;
					var chk = "";
					if (d[i].category == '사무') {
						team = d[i].department;
						grade = d[i].jobGrade;
					} else if (d[i].category != '사무') {
						team = d[i].field;
						grade = d[i].grade;
					}
					if (bKind == "ref") {
						for ( var j in refEmp) {
							if (refEmp[j] == d[i].id) {
								chk = "checked";
							}
						}
						$input = $("<input type='checkbox' name='refEmp' id='select" + i + "' value='" + d[i].id + "'"+chk+">");
					} else {
						for ( var j in sendEmp) {
							if (sendEmp[j] == d[i].id) {
								chk = "checked";
							}
						}
						$input = $("<input type='checkbox' name='sendEmp' id='select" + i + "' value='"+d[i].id+"'"+chk+">");
					}
					var $label = $("<label for='select"+ i +"'>").text(
							" " + d[i].name + " " + team + " " + grade);

					$li.append($input);
					$li.append($label);

					$container.append($li);
				}
			} else {
				$li = $("<li>");
				$input = $("<p style='text-align:center'>").text(
						"조회된 직원이 없습니다.");

				$li.append($input);

				$container.append($li);
			}
		}
	</script>
</body>
</html>