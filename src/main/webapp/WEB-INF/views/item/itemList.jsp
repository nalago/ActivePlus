<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ActivePlus</title>
<link rel="stylesheet" href="${ contextPath }/resources/css/item/item.css"/>
<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
	a{
	 color: black;
	 text-decoration:none;;
	}
	
	#detail_table>tbody>tr>th{
		background-color:rgba(172,189,179,0.4);
	} 
	
	#img{
		width: 150px;
	}
	
	#center{
		height: 400px;
		text-align: center;
		vertical-align: middle;
	}

	.modal-footer {
  		  display: flex;
    	flex-flow: row-reverse;
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
        	<c:choose>
        		<c:when test="${ i_div == 1 }">
		            <a class="menu" href="${ itemList }" style="color:#113f36;">소모품 목록</a>
		            <a class="menu" href="${ mediList }" >의료품 목록</a>
	            </c:when>
	            <c:otherwise>
	                <a class="menu" href="${ itemList }" >소모품 목록</a>
		            <a class="menu" href="${ mediList }" style="color:#113f36;">의료품 목록</a>
	            </c:otherwise>
        	</c:choose>
            <br><br>
        </div>
        <br><br>
		
		<!-- 조회 / 수정 / 삭제 modal 내용 -->
		<div id = 'myModal' class="modal fade" role="dialog">
			<div class="modal-dialog">
				
				<!-- modal 내용 -->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">상세 조회</h4>
					</div>
					<div class="modal-body" >
						
						
							<table id="detail_table" class="table table-bordered">
								
								<tr>
									<td colspan="4" id="center"><img id="img" src="${contextPath}/resources/uploadFiles/item/no-photos.png"></td>
								</tr>
								<tr>
									<th colspan="1">제품명</th>
									<td colspan="3" id="i_name_k"></td>
									
								<tr>
								<tr>
									<th colspan="1">제품코드</th>
									<td colspan="3" id="i_id"></td>
								</tr>
								
								<tr>
									<th colspan="1" >분류</th>
									<td colspan="3" id="category"></td>
								</tr>
								<tr>
									<th width="25%">규격</th>
									<td width="25%" id="standard"></td>
									<th width="25%">단위</th>
									<td width="25%" id="unit"></td>
								</tr>
								<tr>
									<th  colspan="1">용도</th>
									<td colspan="3" id="perpose"></td>
								</tr>
								<c:if test="${i_div == 1}">
									<th colspan="1">성분 / 함량</th>
									<td colspan="3" id="material"></td>
								</c:if>
								<c:if test="${i_div == 2}">
									<tr>
										<th width="25%">급여정보</th>
										<td width="25%" id="insurance"></td>
										<th width="25%">전문/일반</th>
										<td width="25%" id="m_control"></td>
									</tr>
									<tr>
										<th colspan="1">성분 / 함량</th>
										<td colspan="3" id="material"></td>
									</tr>
									<tr>
										<th colspan="1">첨가제</th>
										<td colspan="3" id="add_m"></td>
									</tr>
									<tr>
										<th colspan="1">ATC-CODE</th>
										<td colspan="3" id="atc_code"></td>
									</tr>
									<tr>
										<th colspan="1">KPIC 약효분류</th>
										<td colspan="3" id="kpic"></td>
									</tr>
								</c:if>
								<tr>
									<th colspan="1">제조사</th>
									<td colspan="3" id="production"></td>
								</tr>
								<tr>
									<th colspan="1">대체물품</th>
									<td colspan="3" id="replacement"></td>
								</tr>
								<tr>
									<th colspan="1">재고량-적재위치</th>
									<td colspan="3" id="stock_location"></td>
								</tr>
								<tr>
									<th colspan="1">최종 수정일</th>
									<td colspan="3" id="modify_date"></td>
								</tr>
								<tr>
									<th width="25%">등록일자</th>
									<td width="25%" id="regist_date"></td>
									<th width="25%">등록자</th>
									<td width="25%" id="writer"></td>
								</tr>
								<tr>
									<th colspan="1">기타사항</th>
									<td colspan="3" id="note"><td>
								</tr>
								<c:if test="${loginUser.id eq '100215' }">
									<tr>
										<th width="25%">계약일자</th>
										<td width="25%" id="contract_date"></td>
										<th width="25%">단가</th>
										<td width="25%" id="price"></td>
									</tr>
								</c:if>
							</table>
		
						    
					</div>						
				
					
					<div class="modal-footer">
						<button type="button" class="btn btn-default" 
									data-dismiss="modal">닫기</button>		
							
							<%-- 물품 수정/삭제 --%>							
							<c:choose>
								<c:when test="${loginUser.name eq '최나라' }">
									<form action="itemUpdateView.ap" method="get" >
										<input type="hidden" class="form-control" id="i_no" name="i_no" readonly="readonly">
										<input type="submit" value="수정" class="btn btn-success" id="updateItem"/>		
									</form>
									<form action="itemDelete" method="get" >
										<input type="hidden" class="form-control" id="i_no" name="i_no" readonly="readonly">
										<input type="submit" value="삭제" class="btn btn-danger" id="deleteItem">
									</form>
								</c:when>
								<c:otherwise>
									<button class="btn btn-success" id="iOrderWish">발주요청</button>
								</c:otherwise>
							</c:choose>
										
						
					</div>
					</div>
				</div>
			</div>
		
		
        <div id="searchArea">
        	<c:choose>
       			<c:when test="${i_div == 1 }"><h3 id="subMenuName">소모품 재고 목록</h3></c:when>
       			<c:when test="${i_div == 2 }"><h3 id="subMenuName">의약품 재고 목록</h3></c:when>
       		</c:choose>
            <!--물품 검색분류-->
            <div id="searchBox">
            	<form id="rightTop" class="form-inline" onsubmit="false;">
                소모품 검색
	                <select id="search_condition" name="search_condition">
	                	<option value="1">물품명</option>
	                	<option value="2">분류</option>
	                	<option value="3">적재위치</option>
	                	<option value="4">구매처</option>
	                </select>
                    <div class="input-group">
                    	<input type="text" id="keyword" class="form-control" placeholder="Search"> 
                    	<div class="input-group-btn" style="padding-left: 10px;">
                    		<button type="button" class="btn btn-default" id="search" >
                    			<i class="glyphicon glyphicon-search"></i>
                    		</button>
                    	</div>
                    </div>      
                  </form>
                <br>
            </div>
            
            <!-- 물품 정렬-->
            <div id="sortItem">
            	<form action="iSort.ap" name="sortItem">
            	정렬▲▽
            	<select id="sortCondition" name="sortCondition">
            		<option value="name"<c:if test="${sortCondition == 'name'}">selected</c:if>>품명순</option>
            		<option value="type"<c:if test="${sortCondition == 'type'}">selected</c:if>>타입별</option>
            		<option value="location"<c:if test="${sortCondition == 'location'}">selected</c:if>>창고별</option>
            		<option value="maker"<c:if test="${sortCondition == 'maker'}">selected</c:if>>판매처별</option>
            		<option value="enroll"<c:if test="${sortCondition == 'enroll'}">selected</c:if>>최신순</option>
            	</select>
            	<button class="btn">정렬</button>
            	</form>
            </div>
            <br><br>
        </div>
        
        <div id="func">
        	<c:if test="${loginUser.id eq '100215'}"><!-- 직급으로 구분할 예정 -->
        		<c:url var="iRecentDel" value="iRecentDel.ap" scope="application"/>
        		<a href="iRecentDel" style="color:#ACBDB3">최근 삭제된 품목</a>
        		<form action="iAdd.ap" method="get" >
        		<input type="hidden" name="i_div" value="${i_div }">
        		<input type="submit" value="+ 신규 등록" class="btn_L" style="float: right">
        		<!-- <button  class="btn_L" onclick="location.href='iAdd.ap'">+ 물품 신규 등록</button> -->
        		</form>
        	</c:if>
        	<button class="btn_L" id="excelBtn">⇩엑셀 다운로드</button>
        </div>
        
   		<br><br>
        <div id="tableArea"  align="center">
        	<input type="hidden" name="i_div" id="i_div" value="${i_div }">
        	<table width="90%" id="list" class="table.table-bordered">
        		<thead>
        			<tr>
        				<th><input type="checkbox" id="checkAll" name="checkAll" class="chack" value="all" ></th>
        				<c:choose>
        					<c:when test="${ i_div == 1}"><th>제품코드</th></c:when>
        					<c:otherwise><th>약품코드</th></c:otherwise>
        				</c:choose>
        				<th>분류</th>
        				<th>품명</th>
        				<th>단위</th>
        				<th>재고량</th>
        				<th>적재위치</th>
        				<th>제조처</th>
        				<th>등록일자</th>
        			</tr>
        		</thead>
        		<tbody >
        			<c:forEach items="${list}" var="i">
						<tr>
        					<th scope="row"><input type="checkbox" class="checkItem"></th>
        					<td><input type="hidden" name="sel_i_no" id="sel_i_no" value="${i.i_no }">${i.i_id}</td>
							<td>${i.category }</td>
							<td>${i.i_name_k}</td>
        					<td>${i.unit}</td>
							<td>${i.stock}</td>
							<td>${i.location }</td>
							<td>${i.production }</td>
							<td>${i.regist_date}</td>
						</tr>	        			
        			</c:forEach>
        		</tbody>
        	</table>
        	<br><br><br>
        </div>
        
        <!-- pagingArea -->
        <div id="pageIndexList" class="text-center">
        	${pageIndexList }
        </div>
     
        <div id="btnArea" style="margin-left: 20px">
        	선택 품목
      		<button class="btn_L" id="iOrderWish">발주요청</button>
      		<c:if test="${ loginUser.name eq '최나라' }">
        		<button class="btn_L" id="deleteBtn" onclick="location.href='iDelete.ap'">삭제</button><!-- 특정 직급 이상만 노출 -->
        	</c:if>
        </div>
        
        <div id="pageArea">
        
        </div>
    </section>
	
	<script type="text/javascript">
		var checkAll = $("#checkAll");
		
		checkAll.on("click", function() {
			if(checkAll.prop("checked")){
				$("input[type=checkbox]").prop("checked",true);
			}else {
				$("input[type=checkbox]").prop("checked",false);
			}
		});
		
		$("#iOrderWish").click(function() {
			var checked = $('input:checkbox[name="checkMedi"]:checked');
			
			if (checked.length == 0) {
				alert("선택된 항목이 없습니다.");
			} else {
				var result = confirm(checked.length + "개의 품목을 발주 희망에 담아놨습니다! \n 확인하시겠습니까?")

				if (result)
					location.replace = "iOrderWish.ap";
			}
		});
		
		$(document).ready(function() {
			// ajax 페이징 처리
			$(document).on("click", "#pageIndexListAjax > li > a", function(){
				var params = { 
						search_condition : $("#search_condition").val(),
						keyword : $("#keyword").val(),
						page : $(this).attr("data-page"),
						i_div : $("#i_div").val()
				};
				itemListSearch(params);
			})
			
			// 게시글 검색
			$("#search").on("click",function(){
				if($("#keyword").val() == ""){
					alert("검색어를 최소 1글자 이상 입력해주세요.");
					return;
				} else if ($("#keyword").val() != "") 
					var params ={
						search_condition : $("#search_condition").val(),
						keyword : $("#keyword").val(),
						i_div : $("#i_div").val()
					};
					
				
					itemListSearch(params);
			});
		
		});
		
		function itemListSearch(params) {
			$.ajax({
				url : "itemListSearch.ap",
				type : "POST",
				dataType : "json",
				data : JSON.stringify(params),
				contentType : "application/json; charset=UTF-8",
				beforeSend : function() {
					$("#list > tbody").empty();
					$("#pageIndexList").empty();
				},
				
				success : function(data) {
					var itemList = data.itemList;
					var pageIndexListAjax = data.pageIndexListAjax;
					
					console.log(itemList);
					var tbody = $("#list > tbody");
						if(itemList.length > 0){
							$.each(itemList, function (idx, val) {
								
								tbody.append($('<tr>').append($('<th scope="row">', {html : '<input type="checkbox" class="checkItem">' }))
													.append($('<td>', {text : val.i_id}))
													.append($('<td>', {text : val.category}))
													.append($('<td>', {text : val.i_name_k}))
													.append($('<td style= "text-align : center;">', {text : val.unit}))
													.append($('<td style= "text-align : center;">', {text : val.stock}))
													.append($('<td>', {text : val.production}))
													.append($('<td>', {text : val.regist_date})));
								
									
								
							});
							$("#pageIndexList").html(pageIndexListAjax);
						}else {
							alert("일치하는 항목이 없습니다.");
							tbody.append($('<tr>').append($('<th colspan="9">', {text : "일치하는 항목이 없습니다."})));
							$("#pageIndexList").html(pageIndexListAjax);
						}
						
					
				},
				error : function(request, status, error){
					console.log("list search fail :: error code: "
							+ request.status + "\n" + "error message: "
							+ error + "\n");
					alert("검색에 실패하였습니다.");
				}
				
			});
		}
		      
		$(function() {
			$("#list").find("td").css("cursor","pointer").mouseenter(function() {
				$(this).attr("data-toggle", "modal");
			}).mouseout(function() {
				$(this).attr("data-toggle", "tooltip");
			}).click(function() {
				var i_no = $("#sel_i_no").val() ;
				detailItem(i_no);
				
			});
		})
		
		function detailItem(i_no) {
			$.ajax({
				url : "detailItem.ap",
				dataType : "json",
				type : "POST",
				contentType : "application/json; charset=UTF-8",
				data : JSON.stringify(i_no),
				beforeSend : function() {
					$("#i_name_k").empty();
					$("#i_id").empty();
					$("#category").empty();
					$("#standard").empty();
					$("#unit").empty();
					$("#perpose").empty();
					$("#material").empty();
					$("#add_m").empty();
					$("#insurance").empty();
					$("#production").empty();
					$("#replacement").empty();
					$("#stock_location").empty();
					$("#regist_date").empty();
					$("#writer").empty();
					$("#note").empty();
					$("#contract_date").empty();
					$("#price").empty();
					
				},
				success : function(data){
					var item = data.item;
					var img = data.img;
					var pdf = data.pdf;
					/* if(data.img != null && data.pdf !=null){
						img = data.img;
						 pdf = data.pdf;
					}else if(data.img != null && data.pdf == null){
						img = data.img;
					}else if(data.img == null && data.pdf != null){
						pdf = data.pdf;
					} */
					console.log("readitem : " + item);
					console.log(img);
					console.log("readpdf : " + pdf);
					
					
					$('div.modal').modal();
					if(img!=null){
						var rename = img.renameFile;
						console.log(rename);
						$("#img").attr('src',function(){
							return '${contextPath}/resources/uploadFiles/item/image/' + rename;
						}).css("width","300px");
						
					}
					$("#i_no").attr("value",item.i_no);
					$("#i_name_k").text(item.i_name_k);
					$("#i_id").text(item.i_id);
					$("#standard").text(item.standard);
					$("#unit").text(item.unit);
					$("#perpose").text(item.perpose);
					$("#material").text(item.material);
					$("#add_m").text(item.add_m);
					$("#m_control").text(item.m_control);
					$("#insurance").text(item.insurance);
					$("#production").text(item.production);
					$("#replacement").text(item.replacement);
					$("#material").text(item.material);
					$("#kpic").text(item.kpic);
					$("#atc_code").text(item.atc_code);
					$("#category").text(item.category_k);
					$("#stock_location").text(item.stock+"-"+item.location);
					$("#regist_date").text(item.regist_date);
					$("#writer").text(item.writer);
					$("#note").text(item.note);
					$("#contract_date").text(item.contract_date);
					$("#price").text(item.price);
				},
				error : function(request, status, error){
					alert("상세조회 실패");
					console.log("detail item fail :: error code: " + request.status + "\n" + "error message: " + error + "\n");
					
				}
			});
		}
	</script>
</body>
</html>