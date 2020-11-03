<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 부트스트랩 관련 -->
<script src="https://code.jquery.com/jquery-3.5.1.js" 
integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- 알러트창 디자인 -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="${ contextPath }/resources/css/basic.css"/>
<style type="text/css">

	body{
	margin:0;
	}
	
	#content{
		margin-left: 50px;
		margin-right: 50px;
		overflow:hidden;
	}
	#title{
		border-bottom: 2px solid #727377;
	}
	
	#title>*, #leftTop>* {
		display: inline-block;
	}
	
	#leftMenu, #rightMenu {
		margin-top: 10px;
		
	}
	#leftMenu{
		float: left;
		margin-top: 10px;
	}
	
	#rightMenu{
	
		float: right;
	
	}
	
	.scheduleSelect{
		height: 34px;
		width: 79px;
		padding: 6px 12px;
		font-size: 14px;
		line-height: 1.42857143;
		color: #555;
		background-color: #fff; 
		background-image: none;
		border: 1px solid ccc;
		border-radius: 4px;
	}
	
	.form-group > div{
		margin-bottom: 5px;
	}
	
	textarea {
		resize: none;
	}
	#rightTop{
		display: flex;
	}
	 #rightTop > div > span{
		height: 26px;
		margin-top: 20px;
		margin-bottom: 10px;
		padding-top: 5px;
		cursor: pointer;
	} 
	
	h3#toYearMonth {
    	margin-right: auto;
   		margin-left: auto;
	}
	.font-red{
		color: #F05454;
	}
	
	.font-blue{
		color: rgb(62, 142, 218);
	}
	
	#bgYellow, #ver4{
		background-color: #FFFFD2;
	}
	
	#calendar > tbody > tr > td {
		height: 80px;
	}
	
	.scheduleInDiv{
		width: 100%;
		height: 60px;
	}
	
	.scheduleDiv{
		color: black;
		border-radius: 3px;
		font-size:9pt;
		text-align: left;
		cursor: pointer;
		padding-left: 5px; 
	}
	
	#ver1{
		/*blue*/
		background-color: #A8D8EA;
	}
	#ver2{
		/*purple*/
		background-color: #AA96DA;
	}
	#ver3{
		/*pink*/
		background-color: #fCBAD3;
	}
	
	.pointer{
		cursor:pointer;
	}
	
	.show {
		width: 138px;
		position: relative;
		margin-top: -85px;
	}
	
	.borderDiv{
		border: solid 3px gray;
		background-color: white;
	}
	
	.small-icon {
		line-height: 20px;
		height: 20px;
		width: 20px;
		pointer-events:auto;
		cursor: pointer;
	}
	
	#bgwhite{
		background-color: #f4f4f2;	
		color : black;
	}
</style>
<script type="text/javascript">
		var date;
		var nowYear;
		var nowMon;
		var nowDay;
		var year;
		var mon;
		var day;
		var hour;
		var min;

		// 사용자가 이벤트를 발생시킨 시간을 받아오는 함수
		function getTime() {
			date = new Date();
			nowYear = date.getFullYear();
			nowMon = date.getMonth() + 1;
			nowDay = date.getDate();
			year = date.getFullYear();
			mon = date.getMonth() + 1;
			day = date.getDate();
			hour = date.getHours();
			min = date.getMinutes();
		}

		$(document).ready(function() {
					today();
					addHour();
					addMin();
					getTime();
					getYearMonth();
					getCalendar();
					selectSchedule();

					// 달력 날짜 변경
					$("span").on("click", function() {
						
						var id = $(this).attr("id");

						if (id == "preYear") {
							if (year > 1) {
								year = year - 1;
							} else if (year == 0) {
								alert("년도를 확인해주세요.");
								return;
							}
							getYearMonth();
							getCalendar();
							selectSchedule();

						} else if (id == "preMonth") {
							if (mon == 1 && year > 1) {
								year = year - 1;
								mon = 12;
							} else if (mon != 1 && year >= 1) {
								mon = mon - 1;
							} else if (mon == 1 && year == 1) {
								alert("년도를 확인해주세요.");
								return;
							}
							getYearMonth();
							getCalendar();
							selectSchedule();

						} else if (id == "nextMonth") {
							if (mon == 12) {
								year = year + 1;
								mon = 1;
							} else if (mon != 12) {
								mon = mon + 1;
							}
							getYearMonth();
							getCalendar();
							selectSchedule();
						} else if (id == "nextYear") {
							year = year + 1;
							getYearMonth();
							getCalendar();
							selectSchedule();
						}
					});

					$("#sTitle").on("keyup", function() {
						if ($(this).val().length > 10) {
							$(this).val($(this).val().substring(0, 10));
						}
					});

					$("#sTitle_up").on("keyup", function() {
						if ($(this).val().length > 10) {
							$(this).val($(this).val().substring(0, 10));
						}
					});

					// 일정 추가
					$("#scheduleInsert").on("click",function() {
								var startStr = $("#startYMD").val() + " "
										+ $("#startHour").val() + ":"
										+ $("#startMin").val() + ":00";
								var endStr = $("#endYMD").val() + " "
										+ $("#endHour").val() + ":"
										+ $("#endMin").val() + ":00";

								$("#start_date").val(startStr);
								$("#end_date").val(endStr);

								if ($("#sTitle").val() == "") {
									alert("제목을 입력해주세요.");
									return;
								} else if ($("#startYMD").val() == "") {
									alert("시작일을 입력해주세요.");
									return;
								} else if ($("#endYMD").val() == "") {
									alert("종료일을 입력해주세요.");
									return;
								} else if ($("#sContent").val() == "") {
									alert("내용을 입력해주세요.");
									return;
								} else if ($("#start_date").val() > $("#end_date").val()) {
									alert("올바른 기간이 아닙니다.\n 시작일과 종료일을 확인해주세요.");
									return;
								}

								$("#scheduleInsertForm").submit();

							});

					$(document).on("click", ".scheduleInDiv > div > a", function() {
								var name = $(this).attr("data-arrmore");
								var state = $("#" + name).attr("class");

								if (state == "hide") {
									$("#" + name).attr("class", "show");
								} else if (state == "show") {
									$("#" + name).attr("class", "hide");
								}
							});

					$(document).on("click", ".small-icon", function() {
						var name = $(this).attr("data-arrmore");
						var state = $("#" + name).attr("class");

						if (state == "hide") {
							$("#" + name).attr("class", "show");
						} else if (state == "show") {
							$("#" + name).attr("class", "hide");
						}
					});

					$(document).on("mouseover", ".scheduleDiv", function() {
						$(this).attr("data-toggle", "modal");
					});

					$(document).on("mouseout", ".scheduleDiv", function() {
						$(this).attr("data-toggle", "tooltip");
					});

					$(document).on("click", ".scheduleDiv", function() {
						var params = {
							param : $(this).attr("data-value")
						}

						readSchedule(params);
					});

					$("#updateSchedule").on("click", function() {
						var params = {
							sId : $("#sId_up").val(),
							sTitle : $("#sTitle_up").val(),
							start_date : $("#start_date_up").val(),
							end_date : $("#end_date_up").val(),
							sContent : $("#sContent_up").val()
						}

						updateSchedule(params);
					});

					$("#deleteSchedule").on("click", function() {
						deleteSchedule();
					});
				});

		// 입력 폼에 자동으로 오늘 날짜 넣기
		function today() {
			var date = new Date();

			var yyyy = date.getFullYear();
			var mm = (date.getMonth() + 1);
			var dd = date.getDate();

			if (mm < 10) {
				mm = "0" + mm;
			}
			if (dd < 10) {
				dd = "0" + dd;
			}

			var str = yyyy + "-" + mm + "-" + dd;
			
			$("#startYMD").val(str);
			$("#endYMD").val(str);
		}
		// 입력 폼에 자동으로 시간넣기
		function addHour() {
			var str = "";
			for (var i = 0; i <= 23 ; i++) {
				if (i<10) {
					str = str + "<option value='0" + i + "'>0" + i + "</option>";	
				}
				else if (i>=10) {
					str = str + "<option value='" + i + "'>" + i + "</option>";
				}	
			}
			$("#startHour").html(str);
			$("#endHour").html(str);
		}
		// 입력 폼에 자동으로 분 넣기
		function addMin() {
			var str = "";
			for (var i = 0; i <= 59; i = i + 5) {
				if (i < 10) {
					str = str + "<option value='0" + i + "'>0" + i + "</option>";

				} else if (i >= 10) {
					str = str + "<option value='" + i + "'>" + i + "</option>";
				}
			}

			$("#startMin").html(str);
			$("#endMin").html(str);

		}
		
		// 년도, 월 뿌리는 함수
		function getYearMonth(){
			$("#toYearMonth").text(year + "년" + mon + "월");
		}
		
		// 날짜를 뿌리는 함수
		function getCalendar() {
			// 해당 달 1일의 요일을 받아옴
			var week = (new Date(year + "-" + mon + "-01")).getDay(); //-> 요일 반환 0~6
			// 해당 달 막일 받아옴
			var lastDay = (new Date(year, mon, 0)).getDate();	// 1~31일 반환
			var newLine = 0;	// 요일 라인 값 (세로)
			var str = "<tr>";
			
			
			// 해당 달의 1일인 요일보다 이전 요일이라면
			for(var i=0; i < week; i++) {
				str = str + "<td class='text-right'></td>";
				newLine++;
			}
			
			for(var i =1; i<=lastDay; i++){	// 1일부터 td 그리기 시작
				
				if(nowYear != year || nowMon != mon || i!= day) {
					if((new Date(year+"-"+mon+"-"+i)).getDay() == 6){ // 토요일
						str = str + "<td class='text-right font-blue'>" + i + "<div id='day" + i + "'class='scheduleInDiv'></div></td>";
					}else if ((new Date(year+"-"+mon+"-"+i)).getDay() == 0) { // 일요일
						str = str + "<td class='text-right font-red' >" + i + "<div id='day" + i + "'class='scheduleInDiv'></div></td>";
					}else {
						str = str + "<td class='text-right'>" + i + "<div id='day" + i + "'class='scheduleInDiv'></div></td>";
					}
				} else if (nowYear == year && nowMon == mon && i == day) {
					str = str + "<td id='bgYellow' class='text-right'>" + i + "<div id='day" + i + "' class= 'scheduleInDiv'></div></td>";
				}
				newLine++;
				// 일주일경과 -> 라인 값 리셋 후 개행
				if (newLine == 7 && i != lastDay){
					newLine = 0;
					str = str + "<tr></tr>";
				}
			}
			
			for(var i = newLine ; i<7; i++){
				str = str + "<td class='text-right'></td>";
			}
			
			str = str + "</tr>";
			
			$("#calendar > tbody").html(str);
			
		}
		
		// 달력을 다 그리고 나서 칸에 맞게 일정 넣기
		function selectSchedule() {
			var str = null;
			
			if(mon < 10){
				str ="0" + mon;
			} else {
				str = mon;
			}
			
			var param = year + "-" + str;
			var writer = '<c:out value="${loginUser.userName}"/>';
			var wId = '<c:out value="${loginUser.ID}"/>';
			var dpt_nm = '<c:out value="${loginUser.userTeam}"/>';
			
			//console.log(writer + dpt_nm);
			
			var params = {
				param : param,
				scd_sq : $("#scd_sq").val(),
				writer : writer,
				dpt_nm : dpt_nm,
				wId : wId
				
			}
			
			$.ajax({
				url : "selectSchedule.ap",
				type : "POST",
				dataType : "json",
				data : JSON.stringify(params),
				contentType : "application/json; charset=UTF-8",
				beforeSend : function() {
					
				},
				success : function(data) {
					//console.log(data);
					var arr = new Array(32); 
					var arrTemp = [];
					var str = "";
					var arrMore = [];
			        
					// 배열을 0으로 초기화 시킨다.
					for (var i = 0; i < arr.length; i++) {
					    arr[i] = 0;
					}
					
					
					
					$.each(data, function(idx, val) {
						// num : 몇일인지를 나타내는 변수
						// arr : 배열은 총 32칸이며 1일에 일정이 1개라면 arr[1]에는 int형 1이 들어있다.
						// arrTemp : 배열은 몇 개인지 알 수 없으며, arr배열의 값중 3이상인 값이 몇번째 arr에 들어있는지를 보관한다. 
						// startDay : 일정 시작일
						// endDay : 일정 종료일
						// subDay : 일정 종료일 - 일정 시작일
						// arrMore : more 클릭했을 때 출력시킬 내용
						
						// DB에서 조회한 일정 시작일과 일정 종료일을 변수에 넣는다.
						var startDay = new Date(val.start_date.substring(0, 10));
						var endDay = new Date(val.end_date.substring(0, 10));
						
						
						//console.log(startDay);
						//console.log(val.start_date);
						//console.log(val.end_date);
						
						// 만약, 일정 시작일이 지난달 이거나 일정 종료일이 다음달이면 이번달 시작일과 이번달 종료일로 변경한다. 
						if (mon != Number(startDay.getMonth() + 1)) {
							startDay = new Date(year + "-" + mon + "-" + "01");
							if (mon < 10) {
								startDay = new Date(year + "-0" + mon + "-" + "01");
							}
						}
						if (mon != Number(endDay.getMonth() + 1)) {
							endDay = new Date(year + "-" + mon + "-" + (new Date(year, mon, 0)).getDate().toString());
							if (mon < 10) {
								endDay = new Date(year + "-0" + mon + "-" + (new Date(year, mon, 0)).getDate().toString());
							}
						}
						
						// 종료일에서 시작일 빼기 계산식
						var subDay = ((endDay - startDay) / (60 * 60 * 24 * 1000) + 1);
						
						var num = Number((startDay.toString()).substring(8, 10));
						
						
						
						// 해당 일자에 일정이 3개 이하면 달력에 표시하고 4개 이상이면 3개까지만 출력하고 
						// 나머지는 arrTemp에 해당 일자가 있는지 조회하고 없으면 arrTemp 배열에 해당 날짜를 넣어라.
						for (var i=0; i<subDay; i++) {
							
							if (arr[num + i] < 3) {
								arr[num + i]++;
								if(arr[num + i] == 1){
									str = "<div class='scheduleDiv' id='ver1' data-toggle='tooltip' data-placement='top' title='" + val.stitle + "' data-value='" + val.sid + "' data-toggle='modal' data-target='#myModal'>" + (val.stitle.length<8?val.stitle:(val.stitle.substring(0, 8)+" ...")) + "</div>";
								}else if (arr[num + i] == 2) {
									str = "<div class='scheduleDiv' id='ver2' data-toggle='tooltip' data-placement='top' title='" + val.stitle + "' data-value='" + val.sid + "' data-toggle='modal' data-target='#myModal'>" + (val.stitle.length<8?val.stitle:(val.stitle.substring(0, 8)+" ...")) + "</div>";	
								}else if (arr[num + i] == 3){
									str = "<div class='scheduleDiv' id='ver3' data-toggle='tooltip' data-placement='top' title='" + val.stitle + "' data-value='" + val.sid + "' data-toggle='modal' data-target='#myModal'>" + (val.stitle.length<8?val.stitle:(val.stitle.substring(0, 8)+" ...")) + "</div>";	
								}
								$("#day" + (num + i)).append(str);
							}
							else if (arr[num + i] >= 3) {
								arr[num + i]++;
								if(arr[num + i] == 1){
									str = "<div class='scheduleDiv' id='ver1' data-toggle='tooltip' data-placement='top' title='" + val.stitle + "' data-value='" + val.sid + "' data-toggle='modal' data-target='#myModal'>" + (val.stitle.length<8?val.stitle:(val.stitle.substring(0, 8)+" ...")) + "</div>";
									}else if (arr[num] + i == 2) {
										str = "<div class='scheduleDiv' id='ver2' data-toggle='tooltip' data-placement='top' title='" + val.stitle + "' data-value='" + val.sid + "' data-toggle='modal' data-target='#myModal'>" + (val.stitle.length<8?val.stitle:(val.stitle.substring(0, 8)+" ...")) + "</div>";	
									}else if (arr[num + i] == 3){
										str = "<div class='scheduleDiv' id='ver3' data-toggle='tooltip' data-placement='top' title='" + val.stitle + "' data-value='" + val.sid + "' data-toggle='modal' data-target='#myModal'>" + (val.stitle.length<8?val.stitle:(val.stitle.substring(0, 8)+" ...")) + "</div>";	
									}else {
											str = "<div class='scheduleDiv' id='ver4' data-toggle='tooltip' data-placement='top' title='" + val.stitle + "' data-value='" + val.sid + "' data-toggle='modal' data-target='#myModal'>" + (val.stitle.length<8?val.stitle:(val.stitle.substring(0, 8)+" ...")) + "</div>";	
									}
								// arrTemp에 해당 일자가 있는지 조회하고 있으면 arrMore[j]에 추가하고 for문을 종료,
								// 없으면 arrTemp에 해당 날짜를 집어넣고 arrMore에는 그날의 내용을 넣음
								for (var j=0; j<arrTemp.length; j++) {
									if (arrTemp[j] == num) {
										arrMore[j] = arrMore[j] + str;
										return;
									}
								}
								arrTemp.push(num + i);
								
								var target = $("#day" + (num + i));
								var text = "";
								
								for (var i=0; i<target.length; i++) {
									text = text + target.eq(i).html();
								}
								arrMore.push(text + str);
							}
						}
						
					});
					
					// 예) 하루에 일정이 3개 이상인 날짜가 5개가 있다 : for문 5번 돎
					for (var i=0; i<arrTemp.length; i++) {
						var cnt = arr[arrTemp[i]] - 3;
						str = "<div class='text-right'><a class='pointer' data-arrmore='hide" + i + "'>+" + cnt + " more</a></div>";
						$("#day" + arrTemp[i]).append(str);
						str = "<div class='has-feedback' id='bgwhite'><div class='text-left'>" + year + "-" + mon + "-" + arrTemp[i] + "</div><span class='glyphicon glyphicon-remove form-control-feedback small-icon' data-arrmore='hide" + i + "'></span></div>";
						$("#day" + arrTemp[i]).append("<div id='hide" + i + "' class='hide' style='border-left : 3px solid #f4f4f2; border-bottom : 3px solid #f4f4f2; border-right : 3px solid #f4f4f2;'>" + str + arrMore[i] + "</div>");
					}
					
					// 툴팁 사용하기 위함
					$('[data-toggle="tooltip"]').tooltip();
				},
				error : function(request, status, error) {
					alert("list search fail :: error code: "
							+ request.status + "\n" + "error message: "
							+ error + "\n");
				}
			});
		}
		
		function readSchedule(params) {
			$.ajax({
				url:"readSchedule.ap",
				dataType:"json",
				type:"POST",
				contentType : "application/json; charset=UTF-8",
				data : JSON.stringify(params),
				beforeSend : function(){
					$("#sId_up").empty();
					$("#sTitle_up").empty();
					$("#writer_up").empty();
					$("#wId_up").empty();
					$("#start_date_up").empty();
					$("#end_date_up").empty();
					$("#sContent_up").empty();
				},
				success : function(data){
					console.log("readSchdule : " + data);
					$("#sId_up").val(data.sid);
					$("#sTitle_up").val(data.stitle);
					$("#writer_up").val(data.writer);
					$("#wId_up").val(data.wId);
					$("#start_date_up").val(data.start_date);
					$("#end_date_up").val(data.end_date);
					$("#sContent_up").val(data.scontent);
				},
				error : function(request, status, error) {
					alert("list search fail :: error code: " + request.status + "\n" + "error message: " + eror + "\n");
				}
			});
		}
		
		function updateSchedule(params){
			console.log("value : " +  $("#sId_up").val());
			var params = {
					param : $("#sId_up").val(),
					sTitle : $("#sTitle_up").val(),
					sContent : $("#sContent_up").val(),
					start_date : $("#start_date_up").val(),
					end_date : $("#end_date_up").val()
			}
			
			$.ajax({
				url: "updateSchedule.ap",
				dataType : "json",
				type: "POST",
				contentType: "application/json; charset=UTF-8",
				data : JSON.stringify(params),
				beforeSend : function(){
					
				},
				success:function(data){
					console.log("update : " + data);
					if(Number(data) == 1){
						window.location = "calendar.ap?scd_sq=" +$("#scd_sq").val();
					}else if (Number(data) != 1) {
						alert("일정 수정을 실패하였습니다.");
					}
				},
				error : function(request, status, error){
					alert("list search fail :: error code : " + request.status + "\n" + "error message : " + error + "\n");
				}
				
			});
		}
		
		function deleteSchedule(){
			var params = { 
					param : $("#sId_up").val()
			}
			
			$.ajax({
				url: "deleteSchedule.ap",
				dataType : "json",
				type : "POST",
				contentType : "application/json; charset=UTF-8",
				data : JSON.stringify(params),
				beforeSend : function(){
					
				},
				success : function(data) {
					if(Number(data) == 1){
						alert("일정 삭제하였습니다.");
						window.location = "calendar.ap?scd_sq="+$("#scd_sq").val();
					}else if (Number(data) != 1) {
						alert("일정 삭제를 실패하였습니다.");
					}
				},
				error : function(request, status, error) {
					alert("list search fail :: error code : " +  request.status + "\n" + "error message : " + error + "\n")
				}
				
			});
			
		}
		
	</script>
</head>
<body>
	<!-- msg 전달 받은 내용 있으면 alert 창 출력 -->
	<c:if test="${ !empty msg }">
		<script type="text/javascript">
			swal("","${msg}","error");
			<c:remove var="msg"/>
		</script>
	</c:if>
	<!-- jquery 충돌 때문에 include 못함 -->
	<nav id="side">
		
		<div id="profile">
			<span id="user" class="profile">${ loginUser.userTeam }, ${ loginUser.userName }님</span>
			<span ><a id="info" class="profile" href="#">개인정보</a></span>
			<a href="main.ap">
			<img id="logo" src="${ contextPath }/resources/images/ActivePlus_Logo.png" style="float:right;">
			</a>
		</div>
		<div class="sidenav">
			<c:url var="goSchd" value="calendar.ap">
				<c:param name="scd_sq" value="1"/>
			</c:url>
			<c:url var="goItem" value="itemList.ap"/>
			<c:url var="goMail" value="mail.ap"/>
			<c:url var="goTask" value="diagnosisList.ap"/>
			<a href="${ goSchd }">일정관리</a>
			<a href="${ goTask }">업무관리</a>
			<a href="${ goItem }">물품관리</a>
			<a href="#">게시판</a>
			<a href="#">메신저</a> 
			<a href="${ goMail }">메일</a>
		</div>
	</nav>

	<section>
		<div id="subMenu">
			<c:url var="cal1" value="calendar.ap">
				<c:param name="scd_sq" value="1" />
			</c:url>
			<c:url var="cal2" value="calendar.ap">
				<c:param name="scd_sq" value="2" />
			</c:url>
			<c:url var="cal3" value="calendar.ap">
				<c:param name="scd_sq" value="3" />
			</c:url>
			<a class="menu" href="${ cal1 }" style="color: #113f36;"> 원내 일정</a> <a
				class="menu" href="${ cal2 }">부서 일정</a> <a class="menu"
				href="${ cal3 }">개인 일정</a> <br> <br>
		</div>
		

		<%-- 일정 수정/삭제 Modal창 --%>
		<div id='myModal' class="modal fade" role="dialog">
			<div class="modal-dialog">

				<!-- Modal 내용 -->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">상세 일정</h4>
					</div>

					<div class="modal-body">
						<form>
							<c:choose>
								<%-- 일정 수정/삭제 Modal창 --%>
								<c:when test="${loginUser.userName eq '최나라'}">
									<div class="form-group">
										<input type="hidden" class="form-control" id="sId_up"
											name="sId_up" readonly="readonly">
									</div>
									<div class="form-group">
										<label for="title">일정명</label> <input type="text"
											class="form-control" id="sTitle_up" name="sTitle">
									</div>
									<div class="form-group">
										<label for="writer">작성자</label> <input type="text"
											class="form-control" id="writer_up" name="writer"
											readonly="readonly"> <input type="hidden"
											class="form-control" id="wId_up" name="wId"
											readonly="readonly">
									</div>
									<div class="form-group">
										<label for="start_date1">시작일</label> <input type="text"
											class="form-control" id="start_date_up"
											name="start_date">
									</div>
									<div class="form-group">
										<label for="end_date1">종료일</label> <input type="text"
											class="form-control" id="end_date_up"
											name="end_date">
									</div>
									<div class="form-group">
										<label for="content">상세내용</label>
										<textarea class="form-control" id="sContent_up"
											name="sContent">
								</textarea>
									</div>
								</c:when>
								<%-- 권한 없는 직원일 경우 --%>
								<c:otherwise>
									<div class="form-group">
										<input type="hidden" class="form-control" id="sId_up"
											name="sId_up" readonly="readonly">
									</div>
									<div class="form-group">
										<label for="title">일정명</label> <input type="text"
											class="form-control" id="sTitle_up" name="sTitle"
											readonly="readonly">
									</div>
									<div class="form-group">
										<label for="writer">작성자</label> <input type="text"
											class="form-control" id="writer_up" name="writer"
											readonly="readonly"> <input type="hidden"
											class="form-control" id="wId_up" name="wId"
											readonly="readonly">
									</div>
									<div class="form-group">
										<label for="start_date1">시작일</label> <input type="text"
											class="form-control" id="start_date_up"
											name="start_date" readonly="readonly">
									</div>
									<div class="form-group">
										<label for="end_date1">종료일</label> <input type="text"
											class="form-control" id="end_date_up"
											name="end_date" readonly="readonly">
									</div>
									<div class="form-group">
										<label for="content">상세내용</label>
										<textarea class="form-control" id="sContent_up"
											name="sContent" readonly="readonly">
								</textarea>
									</div>
								</c:otherwise>
							</c:choose>
						</form>
					</div>

					<div class="modal-footer">
						<c:choose>
							<c:when test="${loginUser.userName eq '최나라' }">
								<button type="button" id="updateSchedule"
									class="btn btn-default">수정</button>
								<button type="button" id="deleteSchedule"
									class="btn btn-default">삭제</button>
							</c:when>
							<c:otherwise>
								<button type="button" class="btn btn-default"
									data-dismiss="modal">닫기</button>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
		</div>

		<!-- 달력 부분 -->
		<div id="content">
			<div id="title" style="padding-top: 20px;">
				<h3>
					<c:choose>
						<c:when test="${scd_sq == 1 }">원내 일정</c:when>
						<c:when test="${ scd_sq == 2 }">부서 일정</c:when>
						<c:when test="${ scd_sq == 3 }">개인 일정</c:when>
					</c:choose>
				</h3>
				<c:choose>
					<c:when test="${ scd_sq == 1 }">원내 일정</c:when>
					<c:when test="${ scd_sq == 2 }">부서 일정</c:when>
					<c:when test="${ scd_sq == 3 }">개인 일정</c:when>
				</c:choose>
				을 추가하거나 수정할 수 있습니다.
			</div>

			<!-- 등록 관련 -->
			<div style="padding-top: 20px;">
				<div id="leftMenu" class="col-md-3">
					<div id="leftTop">
						<h4>
							<label>일정 등록</label>
						</h4>
					</div>
					<div id="leftBottom">
						<form action="insertSchedule.ap" method="post" id="scheduleInsertForm">
							<input type="hidden" id="scd_sq" name="scd_sq" value="${scd_sq }">
							<c:choose>
								<c:when test="${ scd_sq eq 1 }"><input type="hidden" id="scd_nm" name="scd_nm" value="1"></c:when>
								<c:when test="${ scd_sq eq 2 }"><input type="hidden" id="scd_nm" name="scd_nm" value="2"></c:when>
								<c:otherwise><input type="hidden" id="scd_nm" name="scd_nm" value="3"> </c:otherwise>
							</c:choose>
							<div class="form-group">
								<label for="scheduleTitle1">제목</label> 
								<input type="text" class="form-class" id="sTitle" name="sTitle" placeholder="제목">
							</div>
							<div class="form-group">
								<label for="writer1">작성자</label>
								<div>
								<input type="text" readonly name="writer" value="${ loginUser.userName }" >
								</div>
								<input type="hidden"  name="wId" value="${ loginUser.ID }" size="50">
								<input type="hidden"  name="dpt_nm" value="${ loginUser.userTeam }" size="50">						
								</div>
							<div class="form-group">
								<label for="scheduleStart1">시작일</label>
								<div>
									<input type="date" id="startYMD" class="form-control" />
								</div>

								<div>
									<select id="startHour" class="scheduleSelect">
										<option value="00">00</option>
									</select>시 
									<select id="startMin" class="scheduleSelect">
										<option value="00">00</option>
									</select>분
								</div>
								<input type="hidden" id="start_date" name="start_date" />
							</div>

							<div class="form-group">
								<label for="scheduleEnd1">종료일</label>
								<div>
									<input type="date" id="endYMD" class="form-control" />
								</div>
								<div>
									<select id="endHour" class="scheduleSelect">
										<option value="00">00</option>
									</select>시 <select id="endMin" class="scheduleSelect">
										<option value="00">00</option>
									</select>분
								</div>
								<input type="hidden" id="end_date" name="end_date" />
							</div>
							<div class="form-group">
								<label for="scheduleContent1">내용</label>
								<textarea rows="7" id="sContent" name="sContent" class="form-control" placeholder="내용을 입력해주세요."></textarea>
							</div>

							<button type="button" id="scheduleInsert" class="form-control btn-success">등록</button>
						</form>
					</div>
				</div>
				<div id="rightMenu" class="col-md-9">
					<div id="rightTop">
							<div class="col-md-4 text-right">
							<span id="preYear" class="glyphicon glyphicon-backward"></span>
							<span id="preMonth" class="glyphicon glyphicon-chevron-left"></span>
						</div>
						<div class="col-md-4 text-center">
							<h3 id="toYearMonth">년월자리</h3>
						</div>
						<div class="col-md-4 text-left">
							<span id="nextMonth" class="glyphicon glyphicon-chevron-right"></span>
							<span id="nextYear" class="glyphicon glyphicon-forward"></span>
						</div>	
					</div>
					<div id="rightBottom">
						<div></div>
						<div class="table-responsive">
							<table id="calendar" class="table table-bordered">
								<colgroup>
									<col width="14.28%" />
									<col width="14.28%" />
									<col width="14.28%" />
									<col width="14.28%" />
									<col width="14.28%" />
									<col width="14.28%" />
									<col width="14.28%" />
								</colgroup>
								<thead>
									<tr class="active">
										<th class="text-center font-red">일</th>
										<th class="text-center">월</th>
										<th class="text-center">화</th>
										<th class="text-center">수</th>
										<th class="text-center">목</th>
										<th class="text-center">금</th>
										<th class="text-center font-blue">토</th>
									</tr>
								</thead>
								<tbody>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	

</body>
</html>