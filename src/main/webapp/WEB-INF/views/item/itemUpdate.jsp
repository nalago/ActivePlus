<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ActivePlus</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
<link rel="stylesheet" href="${ contextPath }/resources/css/item/itemDetail.css"  type="text/css">

<style type="text/css">

	#Detail_Area{
		margin-top : -30px;
		width: 85%;
		margin-left: auto;
		margin-right: auto;
	}
	
	td{
		padding-bottom: 2px;
		padding-top: 2px;
	}
	
	#photoArea{
		margin-left : auto;
		margin-right: auto;
		width: 420px;
		height: 420px;
	
	}
	
	
	#addPhoto{
		margin-top:6%;
		width: 120px;
		height: 120px;
	}
	
	
	.index{
		text-align: center;
		font-weight: bold;
		background: rgba(99,171,104,0.4);
	}
	
	.memo{
		padding-left: 60px;	
	}
	
	
	
	#btnArea{
		margin-inline-start: auto;
    	position: relative;
		
	}
	input#enrollItem, #back {
   		 margin-top: 20px;
	}
	
	.filebox label {
	  display: inline-block;
	  padding: 10px 20px;
	  color: black;
	  line-height: normal;
	  vertical-align: middle;
	  background-color: rgba(99,171,104,0.4);
	  cursor: pointer;
	  border-radius: .25em;
	  -webkit-transition: background-color 0.2s;
	  transition: background-color 0.2s;
	  margin-top:10%;
	  height:40px;
	  font-weight:bold;
	  font-size:15px;
	  text-align: center;
	}
	
	.filebox label:hover {
	  background-color: #6ed36e;
	}
	
	.filebox label:active {
	  background-color: #367c36;
	}
	
	.filebox input[type="file"] {
	  position: absolute;
	  width: 1px;
	  height: 1px;
	  padding: 0;
	  margin: -1px;
	  overflow: hidden;
	  clip: rect(0, 0, 0, 0);
	  border: 0;
	}
	div#wrap_btn {
    	display: flex;
	}
	
	.pdfbox input[type="file"] {
		position: absolute;
		width: 0;
		height: 0;
		padding: 0;
		overflow: hidden;
		border: 0;
		}
		
	.pdfbox label {
		display: inline-block;
		padding: 10px 20px;
		color: #999;
		vertical-align: middle;
		background-color: #fdfdfd;
		cursor: pointer;
		border: 1px solid #ebebeb;
		border-radius: 5px;
	}
		
		/* named upload */
	.pdfbox .upload-name {
		display: inline-block;
		  height: 35px;
		  font-size:7px; 
		  padding: 0 10px;
		vertical-align: middle;
		background-color: #f5f5f5;
		  border: 1px solid #ebebeb;
		  border-radius: 5px;
		
	}
</style>
</head>
<body>
<!-- 메뉴바 include -->
	<nav id="side">
		<jsp:include page="../common/menubar.jsp"/>
	</nav>
	
	<section>
        <div id="subMenu">
        	<c:url var="itemList" value="itemList.ap" scope="application">
        		<c:param name="i_div" value="1" />
        	</c:url>
        	<c:url var="mediList" value="itemList.ap" scope="application">
        		<c:param name="i_div" value="2"/>
        	</c:url>
        	<c:url var="orderWish" value="orderWish.ap" scope="application"/>
        	<c:url var="orderCheck" value="orderCheck.ap" scope="application"/>
            <a class="menu" href="${ itemList }" style="color:#113f36;">소모품 목록</a>
            <a class="menu" href="${ mediList }" >의료품 목록</a>
            <br><br>
        </div>
        <br><br>
	<div id="Detail_Area">
		
		<form action="updateItem.ap" method="post" onsubmit="return validate()" enctype="multipart/form-data" autocomplete="off">
		<table id="tableArea" class="table table-bordered">
			<tr>
				<th id="title" colspan="7" style="border-bottom: 3px solid #ACBDB3;" >
					<div id="wrap_btn">
						<div>
							<h2>제품 수정하기</h2>-${i.i_name_k}
						</div>
						
						<div id="btnArea" >
			      			<input type="submit" class="btn" id="updateBtn" value="수정하기" style="margin-top: 20px;">
			      			<button class="btn" id="back" onclick="javascript:history.back()" style="margin-top: 20px;">뒤로가기</button>
			        		<br><br>
			        	</div>
			        </div>
		        </th>
			</tr>
			<tr>
				<c:choose>
					<c:when test="${i.i_div == 1 }">
						<td rowspan="13" colspan="3">
					</c:when>
					<c:otherwise>
						<td rowspan="16" colspan="3">
					</c:otherwise>
				</c:choose>
					<div id="photoArea">
						<div class="filebox">
 							<label for="i_image">사진 업로드</label>
 							<input type="hidden" id="up_img" value="${ img.originalFile }" name="up_img">
							 <input type="file" id="i_image" name="i_image" accept="image/*" onchange="setThumbnail(this);"/> 
							 <div id="image_container">
							 	<c:if test="${ !empty img  }">
							 		<img id="file1" src="${contextPath }/resources/uploadFiles/item/image/${img.renameFile}">
							 	</c:if>
							 	<img id="LoadImg" style="visibility: hidden;">
							 </div>
						</div>
						<div class="pdfbox">
							<label for="i_pdf">제품설명서 업로드</label>
							<input type="hidden" id="up_pdf" value="${ pdf.originalFile }" name="up_pdf">
							<input type="file" id="i_pdf" name="i_pdf" accept=".pdf" />
							<c:choose>
								<c:when test="${!empty pdf }">
									<input class="upload-name" value="${contextPath }/resources/uploadFiles/item/pdf/${pdf.renameFile }">
								</c:when>
								<c:otherwise>
									<input class="upload-name" value="pdf만 업로드 가능합니다.">
								</c:otherwise>
							</c:choose>
						</div>
						<br><br>
					</div>
				</td>
				<td colspan="1" class="index">제품명</td>
				<td colspan="3" >
					<input type="text" id="i_name_k" class="form-control" name="i_name_k"  value="${ i.i_name_k }" size="30" required="required" readonly="readonly">
					<input type="hidden" id="i_div" name="i_div" value="${ i.i_div }">
					<input type="hidden" id="i_no" name="i_no" value="${ i.i_no }">
					<input type="hidden" id="emp_id" name="emp_id" value="${ loginUser.id }">
				</td>
			<tr>
			<tr>
				<td class="index" colspan="1">제품코드</td>
				<td colspan="3" ><input type="text" required="required" class="form-control" name="i_id" value="${i.i_id }" id="i_id" readonly="readonly"><div id="check"></div></td>
			</tr>
			<tr>
				<td class="index" colspan="1">분류</td>
					<td colspan="3">
						<c:choose>
							<c:when test="${ i.i_div == 1 }">
								<select id="category" name="category" class="form-control">
									<option value="">분류를 선택하세요</option>
									<option value="1">거즈 | 솜류</option>
								    <option value="2">종류별 붕대</option>
								    <option value="3">주사기 | 수액세트 | 주사바늘</option>
								    <option value="4">반창고 | 드레싱</option>
								    <option value="5">스크린트 | 부목</option>
								    <option value="6">카데타 외 기타의료소모품</option>
								    <option value="7">소독 | 위생용품</option>
								    <option value="8">오피스용품</option>
								    <option value="9">초음파 | 엑스레이</option>
								    <option value="10">수술기구 | 수술용품</option>
								    <option value="11">환자복 | 검진복</option>
								    <option value="12">유니폼 | 간호사신발</option>
								    <option value="13">환자용침대 | 마사지배드</option>
								    <option value="14">PVC카트 | 보관함</option>
								    <option value="15">멸균기 | 병원비품 | 약재용품</option>
								    <option value="16">인체모형 | 실습교구</option>
								    <option value="17">기타</option>
								</select>
							</c:when>
							<c:otherwise>
								<select id="category" name="category" class="form-control">
									<option value="">분류를 선택하세요</option>
									<option value="100">A소화기관 및 대사</option>
									<option value="101">B혈액 및 조혈기관</option>
									<option value="102">C심혈관계</option>
									<option value="103">D피부계</option>
									<option value="104">G비뇨생식기계 및 성호르몬</option>
									<option value="105">H전신용 호르몬 제제(성호르몬, 인슐린제외)</option>
									<option value="106">J전신용 항감염제</option>
									<option value="107">L항악성 종양제 및 면역조절제</option>
									<option value="108">M근골격계</option>
									<option value="109">N신경계</option>
									<option value="110">P항기생충제,살충제 및 방충제</option>
									<option value="111">R호흡기계</option>
									<option value="112">S감각기관</option>
									<option value="113">V기타제제</option>
									
								</select>
							</c:otherwise>
						</c:choose>
					</td>
			</tr>
			<tr>
				<td class="index" colspan="1">입고 단위</td>
				<td colspan="3">
					<select id="unit" name="unit" class="form-control">
						<option value="none">단위를 선택해주세요.</option>
						<option value="box">box</option>
						<option value="ea">ea</option>
						<option value="bottle">병</option>
					</select>
				</td>
			</tr>
			<tr>
				<td class="index" colspan="1">규격</td>
				<td colspan="3"><input type="text" class="form-control" id="standard" name="standard" value="${ i.standard }" required="required"></td>
			</tr>
			<tr>
				<td class="index" colspan="1">성분 / 함량</td>
				<td colspan="3"><input type="text" name="material" id="material" class="form-control" value="${ i.material }" required="required"></td>
			</tr>
			<c:if test="${ i.i_div == 2 }">
				<tr>
					<td class="index" colspan="1">급여정보</td>
					<td colspan="3"><input type="text" name="insurance" class="form-control" id="insurance" value="${ i.insurance }" required="required"></td>
				</tr>
				<tr>
					<td class="index" colspan="1">전문 / 일반</td>
					<td colspan="3"><select id="m_control" name="m_control" class="form-control">
										<option value="none">전문/일반</option>
											<option value="전문">전문</option>
											<option value="일반">일반</option>
									</select></td>
				</tr>
				<tr>
					<td class="index" colspan="1">ATC-CODE</td>
					<td colspan="3"><input type="text" name="atc_code" id="atc_code" class="form-control"  value="${ i.atc_code}" readonly="readonly"  required="required"></td>
				</tr>
			</c:if>
			<tr>
				<td class="index" colspan="1">단가</td>
				<td colspan="3"><input type="text" name="price" id="price" class="form-control" value="${ i.price }" required="required"></td>
			</tr>
			<tr>
				<td class="index" colspan="1">수량</td>
				<td colspan="3"><input type="text" name="stock" id="stock" class="form-control" value="${ i.stock }" required="required"></td>
			</tr>
			<tr>
				<td class="index" colspan="1">보관위치</td>
				<td colspan="3"><input type="text" name="location" id="location"  class="form-control" value="${ i.location }" required="required"></td>
			</tr>
			<tr>
				<td class="index" colspan="1">제조사</td>
				<td colspan="3"><input type="text" name="production" id="production" class="form-control" value="${ i.production }" required="required"></td>
			</tr>
			<tr>
				<td class="index" colspan="1">계약 일자</td>
				<td colspan="3"><input type="date" name="contract_date" id="contract_date" readonly="readonly" value="${ i.contract_date }" class="form-control" required="required"></td>
			</tr>
			<tr>
				<td class="index" colspan="1">대체물품</td>
				<td  colspan="3" ><input type="text" id="replacement" name="replacement" class="form-control" value="${ i.replacement }"><div id="replace"></div></td>
			</tr>
			<c:if test="${ i.i_div == 2 }">
				<tr>
					<td class="index" colspan="3" style="border-bottom-style: none;">첨가제</td>
					<td class="index" colspan="4" style="border-bottom-style: none; border-left:1px solid #ACBDB3;" >KPIC 약효분류</td>
				</tr>
				<tr>
					<td class="memo" colspan="3"><textarea id="add_m" name="add_m" class="form-control" rows="10" cols="60" >${i.add_m }</textarea></td>
					<td class="memo" colspan="4" style="border-left: 1px solid #ACBDB3"><textarea  class="form-control"rows="10" cols="80" id="kpic" name="kpic" readonly="readonly">${i.kpic}</textarea></td>
				</tr>
				
			</c:if>
			
			<tr>
				<td class="index" colspan="3" style="border-bottom-style: none;" id="per">참고사항</td>
				<td class="index" colspan="4" style="border-bottom-style: none; border-left:1px solid #ACBDB3;" id="etc">용도</td>
			</tr>
			<tr>
				<td class="memo" colspan="3"><textarea rows="10" cols="60"  class="form-control" id="note" name="note"  placeholder="기타 참고할 만한 내용을 작성하세요">${i.note}</textarea></td>
				<td class="memo" colspan="4" style="border-left: 1px solid #ACBDB3"><textarea  id="perpose" name="perpose"  rows="10" cols="80"  class="form-control" placeholder="용도를 작성하세요.">${i.perpose }</textarea></td>
			</tr>
		</table>
		</form>
		<br>	
		
		<div></div>
		
	</div>
	</section>
	
	<script type="text/javascript">
		//제품 코드 존재 확인
		$("#i_id").blur(function() {
			if($("#i_id").val().trim() != ""){
			var param = {
				i_id : $("#i_id").val().trim(),
				i_div : $("#i_div").val().trim()
			};
			$.ajax({
				url : "iIdCheck.ap" ,
				type:'POST' ,
				dataType : "json",
	            contentType: "application/json; charset=UTF-8",
				data : JSON.stringify(param),
				success : function(data) {
					if(data == 0) {
						$("#check").text("등록 가능한 품목입니다.").css("color", "rgb(62, 142, 218)");
						$("#enrollItem").attr("disabled", false);	
					}else{
						$("#check").text("등록 불가한 품목입니다.").css("color","#F05454");
						$("#enrollItem").attr("disabled", true);						
					}
				}, error: function() {
					console.log("제품코드중복체크 에러");
				}
			});
			}
		});
		
		$("#replacement").blur(function() {
			if($("#replacement").val().trim() != ""){
			var param = {
					i_id : $("#replacement").val().trim(),
					i_div : $("#i_div").val().trim()
				};
			$.ajax({
				url : "iIdCheck.ap" ,
				type:'POST' ,
				dataType : "json",
	            contentType: "application/json; charset=UTF-8",
				data : JSON.stringify(param),
				success : function(data) {
					if(data == 0) {
						$("#replace").text("대체 불가한 품목입니다.").css("color","#F05454");
						$("#enrollItem").attr("disabled", true);	
					}else{
						$("#replace").text("대체 가능한 품목입니다.").css("color", "rgb(62, 142, 218)");
						$("#enrollItem").attr("disabled", false);	
											
					}
				}, error: function() {
					console.log("제품코드중복체크 에러2");
				}
			});
			}
		});
		
		function setThumbnail(value) { 
			if(value.files && value.files[0]){
				var reader = new FileReader();
				reader.onload = function(e){
					$("#file1").hide();
					$("#LoadImg").attr('src', e.target.result).css("visibility","visible");
				}
				reader.readAsDataURL(value.files[0]);
			}
		}
		
		$(document).ready(function(){ 
			/* var password = prompt("수정하시려면 비밀번호를 입력해주세요.");
			if(password == null){
				alert("수정 권한이 없습니다.");
				location = "javascript:history.back()";
			}else {
				var pw = '<c:out value ="${loginUser.pwd}"/>';
				if(password != pw){
					alert("수정 권한이 없습니다.");
					location = "javascript:history.back()";
				}
			} */
			
			 var category = '<c:out value ="${i.category}"/>';
			 var unit = '<c:out value ="${i.unit}"/>';
			var m_control = '<c:out value ="${i.m_control}"/>';
			
			$("#category option[value='"+category+"']").attr("selected", true);
			$("#unit option[value='"+unit+"']").attr("selected", true);
			$("#m_control option[value='"+m_control+"']").attr("selected", true);

			
			
			console.log("cate : " + category);
			
			  var fileTarget = $('#i_pdf'); 
			  fileTarget.on('change', function(){ // 값이 변경되면
			      var cur=$(".pdfbox input[type='file']").val();
			    $(".upload-name").val(cur);
			  }); 
			}); 

		
		function validate() {
			// 카테고리 옵션 선택 누락시
			if($("#category").val()==""){
				alert('분류를 선택해주세요.');
				return false;
			}
			if($("#unit").val()==""){
				alert('단위를 선택해주세요.');
				return false;
			}
			
			var go = confirm("이대로 수정하시겠습니까?");
			if(go == false){
				return false;
			}else{
				
			}
			
			var num = /^[0-9]*$/;
			var price = $("#price").val(); 
			var stock = $("#stock").val();
			if(!price.test(num)){
				alert("단가는 숫자로만 적으세요.")
				price.focus();
				return false;
			}
			if(!stock.test(num)){
				alert("입고 수량은 숫자로만 적으세요.");
				stock.focus();
				return false;
			}
			
			return true;
		}
		
		
	</script>
	
</body>
</html>