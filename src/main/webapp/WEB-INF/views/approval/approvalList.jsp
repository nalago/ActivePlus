<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<link rel="stylesheet" href="${contextPath }/resources/approval/css/doc.css"/>
<link rel="stylesheet" href="${contextPath }/resources/approval/css/sign-table.css"/>
<link rel="stylesheet" href="${contextPath }/resources/approval/fontello/css/fontello.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<title>Insert title here</title>
<style>
#docListwrap{
        width: 1165px;
        height: 70%;
        float: right;
        display: inline-block;
        
    }

    #docList{
        margin-top:5%;
        margin-left: 13%;
        padding: 0;
        border: 1px solid black;
        border-radius: 5%;
        width: 80%;
    }
    #docList td,th{
        border: 1px solid black;
    }
	#docNo{
		width:10%;
	}
    #drftitle{
        width: 15%;
    }
    #drfname{
        width: 10%;
    }
    #drfdate{
        width: 20%;
    }
    #apvstatus{
        width: 10%;
    }
    .pagingwrap{
        text-align: center;
       
}
.paging{
    margin-left: 5px;
    width: 50px;
    height: 30px;
    background-color: white;
    font-weight: bold;
    color:black;
    text-decoration: none;
}
#modalwrap{
        display:none;
        top:0;
        left: 0;
        width: 100%;
        height: 100%;
        background: rgba(0,0,0,0.5);
        position: fixed;
       
}
#modal{
    width: 1200px;
        height: 650px;
        top:50%;
        left: 50%;
        transform: translate(-50%,-50%);
        background-color: #fff;
        position: fixed;
}
#modaltitle{
        
        width: 100%;
        height: 8%;
        background-color: #63ab68;
    }
    #modalcontent{
        width: 100%;
        height: 92%;
    }
    #modalclose{
        width: 3.5%;
        height: 5%;
        float: right;
        cursor: pointer;
    }
    #doc {
        top: 8%;
        left: 0%;
        width: 700px;
        height: 92%;
        overflow-y: scroll;
        display: inline-block;
        position: fixed;
    }
    #docmenu{
        top:8%;
        right: 0%;
        width: 30%;
        height: 92%;
        background-color: rgb(236, 228, 228);
        display: inline-block;
        position: fixed;
    }
    #doc_acceptButton, #doc_cancelButton{
        width: 177px;
        border: 0;
        border-radius: 5%;
    }

    #doc_acceptButton{
        color: snow;
        background-color: rgb(62, 142, 218) ;
    }
    #apvprocedure{
        border: 1px solid black;
        width: 100%;
        height: 35%;
    }
    #apvcomment{
        border: 1px solid black;
        width: 100%;
        height: 35%;
    }
    #apvfile{
        width: 100%;
        height: 23%;
        border: 1px solid black;
    }
    /* confirm */
    #confirmwrap{
        top:0;
        left: 0;
        width: 100%;
        height: 100%;
        background: rgba(0,0,0,0.5);
        position: fixed;
        display: none;
    }
    #confirm{
        width: 500px;
        height: 350px;
        top:50%;
        left: 50%;
        transform: translate(-50%,-50%);
        background-color: #fff;
        position: fixed;
        border-radius: 5px;
    }
    #confirmtitle{
        width: 100%;
        height: 10%;
        background-color: #63ab68;
    }
    #confirmcontent{
        margin-top: 110px;
        text-align: center;
    }
    #confirmOk, #confirmCancel{
        width: 110px;
        height: 50px;
        border: 0;
        border-radius: 8px;
        margin-top: 50px;
        font-weight: bold;    
        
    }
    #confirmOk{
        color: snow;
        background-color: rgb(62, 142, 218) ;
        margin-right: 20px;
    }
    #docList tbody tr:hover {
 	background-color:#63ab68;
 	cursor:pointer;
 	}
	#doc input[type="text"]{
 		border:0;
 	}
 	#doc input[type="text"]{
 		outline:none;
 	} 
</style>
</head>
<body>
<jsp:include page="../common/menubar.jsp"/>
<jsp:include page="popup/alert.jsp"/>
<c:if test="${ !empty msg }">
		<script>
			alert('${msg}');
		</script>
		<c:remove var="msg" scope="session"/>
</c:if>
		<section>
		<div id="submenu">
        	 <ul class="navi">
                <li>
                <c:url var="goDrafting" value="draftingList.ap"/>
                <c:url var="goPrivate" value="privateList.ap"/>
                <c:url var="goTemporary" value="temporaryList.ap"/>
                    <a class="menu" href="${goDrafting }">기안</a>
                    <ul>
                        <li><a class="menu" href="${goDrafting }">문서 양식</a></li>
                        <li><a class="menu" href="${goTemporary }">임시 문서</a></li>
                        <li><a class="menu" href="${goPrivate }">개인 양식</a></li>
                    </ul>
                </li>
                <li>
                <c:url var="goApprovalObtain" value="approvalObtainList.ap"/>
                <c:url var="goApproval" value="approvalList.ap"/>
                <c:url var="goApprovalComplete" value="approvalCompleteList.ap"/>
                    <a class="menu" href="${goApprovalObtain }">결재</a>
                    <ul>
                        <li><a class="menu" href="${goApprovalObtain }">결재 받을 문서</a></li>
                        <li><a class="menu" href="${goApproval }">결재 예정 문서</a></li>
                        <li><a class="menu" href="${goApprovalComplete }">결재 완료 양식</a></li>
                    </ul>
                </li>
            </ul>
        </div>
            <jsp:include page="submenu/docTypeList.jsp"/>
            
            <div id="docListwrap">
                <h4>결재 예정 문서</h4>
                <table id="docList">
                <thead>
                    <tr>
                    	<th id="docNo">문서번호</th>
                        <th id="doctitle">문서명</th>
                        <th id="drfname">기안자</th>
                        <th id="drfdate">기안일</th>
                        <th id="apvstatus">상태</th>
                    </tr>
                 </thead>
                 <tbody>
                 <c:if test="${ empty apList }">
                    <tr>
                    	<td colspan="6">결재된 문서가 없습니다.</td>
                    </tr>
                  </c:if>
                  <c:if test="${ !empty apList }">
                  		<c:forEach var="a" items="${ apList }">
                    		<tr>
                    			<td>${a.apvDocNo }</td>
                    			<td>${a.apvDocTitle }</td>
                    			<td>${a.EName }</td>
                    			<td>${a.apdCreateDate }</td>
                    			<td>
                    				<c:choose>
                    					<c:when test="${ a.apvDocStatus == 1 }">
                    						대기
                    					</c:when>
                    					<c:when test="${ a.apvDocStatus == 2 }">
                    						심사
                    					</c:when>
                    					<c:when test="${ a.apvDocStatus == 3 }">
                    						반려
                    					</c:when>
                    					<c:when test="${ a.apvDocStatus == 4 }">
                    						결재완료
                    					</c:when>
                    				</c:choose>
                    			</td>
                    		</tr>
                    	</c:forEach>
                  </c:if>
                    
                 </tbody>
                </table>
                <br><br>
                <div class="pagingwrap">
                <c:if test="${pi.currentPage <= 1 }">                
                	&lt;
                </c:if>
                <c:if test="${pi.currentPage < 1 }">
                	<c:url var="before" value="approvalList.ap">
                		<c:param name="page" value="${ pi.currentPage - 1 }"/>
                	</c:url>                
	                 <a class="paging" href="${ before }">&lt;</a>
                </c:if>
                <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                	<c:if test="${ p eq pi.currentPage }">
                	<font color="green" size="4">${ p }</font>
                	</c:if>
                	<c:if test="${ p ne pi.currentPage }">
                		<c:url var="pagination" value="approvalList.ap">
                			<c:param name="page" value="${ p }"/>
                		</c:url>
                		<a href="${pagination }">${ p }</a>
                	</c:if>
                </c:forEach>
                 <c:if test="${ pi.endPage <= pi.maxPage }">
                 	&gt;
                 </c:if>
                 <c:if test="${ pi.endPage < pi.maxPage }">
                 	<c:url var="after" value="approvalList.ap">
                 		<c:param name="page" value="${ pi.currentPage + 1 }"/>
                 	</c:url>
	                 <a class="paging" href="${ after }">&gt;</a>                 
                 </c:if>
             </div>
            </div>

    </section>
    <form id="apvForm" method="post">
    <div id="modalwrap">
        <div id="modal">
            <div id="modaltitle">
                <h4>
                    <svg id="modalclose"  viewBox="0 0 16 16" class="bi bi-x-circle" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd" d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                        <path fill-rule="evenodd" d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
                      </svg>
                </h4>
            </div>
            <div id="modalcontent">
                <div id="doc">
                	<!-- 결재문서 양식 예 -->
                </div>
                <div id="docmenu">
                    <!--승인 버튼 -->
                    <button id="doc_acceptButton" type="button">
                        <svg width="40px" color="snow" viewBox="0 0 16 16" class="bi bi-file-earmark-check" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                            <path d="M4 0h5.5v1H4a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1V4.5h1V14a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2z"/>
                            <path d="M9.5 3V0L14 4.5h-3A1.5 1.5 0 0 1 9.5 3z"/>
                            <path fill-rule="evenodd" d="M10.854 7.146a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 1 1 .708-.708L7.5 9.793l2.646-2.647a.5.5 0 0 1 .708 0z"/>
                        </svg>
                        승인
                    </button>
                    <!--반려 버튼-->
                    <button id="doc_cancelButton" type="button">
                        <svg width="40px" color="gray" viewBox="0 0 16 16" class="bi bi-file-earmark-x" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                            <path d="M4 0h5.5v1H4a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1V4.5h1V14a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2z"/>
                            <path d="M9.5 3V0L14 4.5h-3A1.5 1.5 0 0 1 9.5 3z"/>
                            <path fill-rule="evenodd" d="M6.146 7.146a.5.5 0 0 1 .708 0L8 8.293l1.146-1.147a.5.5 0 1 1 .708.708L8.707 9l1.147 1.146a.5.5 0 0 1-.708.708L8 9.707l-1.146 1.147a.5.5 0 0 1-.708-.708L7.293 9 6.146 7.854a.5.5 0 0 1 0-.708z"/>                            
                        </svg>
                        반려
                    </button>
                    <div id="apvprocedure">
                        결재 순서
                    </div>
                    <div id="apvcomment">
                        의견
                    </div>
                    <div id="apvfile">
                        첨부파일
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="confirmwrap">
        <div id="confirm">
            <div id="confirmtitle">
                <h5>&nbsp;알림</h5>
            </div>
            <div id="confirmcontent">
                <h4>승인하시겠습니까?</h4>
                <button id="confirmOk">OK</button>
                <button id="confirmCancel">CANCEL</button>
            </div>
        </div>
    </div>
        </form>
 
    <script>
    function closeconfirm(){
        $("#confirmwrap").css("display", "none");
    }
   		var confirmStatus = false;
        /* modal창 닫기 */
        $(function(){
            $("#modalclose").on("click",function(){
                $("#modalwrap").css("display","none");
            });
        });
        /* 컨펌창 닫기*/
        $(function(){
            $("#confirmCancel").on("click",function(){
                $("#confirmwrap").css("display","none");
            });
        });
        function openmodal(){
            $("#modalwrap").css("display","block");
        };
        
        /* 합의 or 결재 버튼 클릭 시 */
        $(function(){
        	$("#doc_acceptButton").on("click", function(){
        		if(confirmStatus == true){
        			
        		if(this.innerText.includes("합의")){
        			confirm("합의하시겠습니까?");
        		}
        		if(this.innerText.includes("결재")){
        			confirm("결재하시겠습니까?");
        		}
        		}else{
        			alert("아직 결재할 수 없습니다.");
        		}
        	});
        });
        /* 반려 버튼 클릭 시 */
        $(function(){
        	$("#doc_cancelButton").on("click", function(){
        		if(confirmStatus == true){
        		if(this.innerText.includes("반려")){
        			confirm("반려하시겠습니까?");
        		}
        		}else{
        			alert("아직 결재할 수 없습니다.");
        		}
        			
        	});
        });
        
        
        /* 수정 해야됨 */
        window.confirm = function(message){
        	var apvprocedureNames = document.getElementsByName('apvprocedureNames');
            $("#confirmwrap").css("display","block");
            var confirmContent = $("#confirmcontent");
            var confirmMsg = confirmContent.children().eq(0);
            confirmMsg[0].innerHTML = message;
           	var apvDocNo = $("#apvDocNo").html();
           	var apvResult = 0;
           	if(message.includes("합의")){
           		apvResult = 1;
           		$("#confirmOk").on("click", function () {
           			$("#apvForm").attr("action","approval.ap?apvResult="+apvResult+"&&apvDocNo="+apvDocNo);
                   	return true;
                });
           	}
           	if(message.includes("결재")){
           		apvResult = 1;
           		$("#confirmOk").on("click", function () {
           			$("#apvForm").attr("action","approval.ap?apvResult="+apvResult+"&&apvDocNo="+apvDocNo);
           		
                   	return true;
                });
           	}
           	if(message.includes("반려")){
           		console.log($("#apvComment").text() == "");
           		if($("#apvComment").text() == ""){
           			alert("반려 사유를 적어주십시오.");
           			closeconfirm();
           		}
           		apvResult = 2;
           		$("#confirmOk").on("click", function () {
           			$("#apvForm").attr("action","approval.ap?apvResult="+apvResult+"&&apvDocNo="+apvDocNo);
                   	return true;
                });
           	}
        }
        
     // 문서 보여주기 
        $(function(){
   			$("td").on("click", function(){
   				var apvDocNo = $(this).parent().children().eq(0).text();
   				console.log(apvDocNo);
   				if(apvDocNo.includes("결재")){
   					return false;
   				}
   				var apvprocedure = document.getElementById("apvprocedure");
   				var apvfile = document.getElementById("apvfile");
   				var apvcomment = document.getElementById("apvcomment");
   				
   				apvprocedure.innerHTML = "결재순서";
   				apvfile.innerHTML = "첨부파일";
   				apvcomment.innerHTML = "의견";
   				
   				  $.ajax({
   					url:"selectApprovalObtainDoc.ap",
   					data:{apvDocNo:apvDocNo},
   					dataType:"json",
   					success:function(data){
   						openmodal();
   		   				showDocContent(apvDocNo);
   		   				$("#modaltitle h4 span").remove();
   		   				$("#modaltitle h4").prepend("<span id='apvDocNo'>"+apvDocNo+"</span>");
   		   				var job = document.getElementById("job");
   		   				var name = document.getElementById("name");
   		   				
   						var $aList = data.aList;
   						var $atList = data.atList;
   						var $signList = data.signList;
   						var apvType;
   						var apvResult;
   						if(!(Array.isArray($aList) && $aList.length === 0)){
   								for(var i = 0; i < $aList.length; i++){
   										if($aList[i].apvType == 0){
   											apvType = "(기안)";
   										}else if($aList[i].apvType == 1){
   											apvType = "(합의)";
   										}else if($aList[i].apvType == 2){
   											apvType = "(결재)";
   										}
   										 if($aList[i].apvResult == 0){
   											apvResult = "대기";
   										}else if($aList[i].apvResult == 1){
   											apvResult = "승인";
   										}else if($aList[i].apvResult == 2){
   											apvResult = "반려";	
   										}
   									apvprocedure.innerHTML += "<br>"+ 
   										i +" "+$aList[i].empId + " " + $aList[i].eName + 
   										apvType + apvResult;
   									
   									console.log("의견 : "+ ($aList[i].apvComment == undefined));
   									if(!$aList[i].apvComment == undefined){
   										apvcomment += aList[i].eName + ": " + $aList[i].apvComment;
   									}
   								}
   							
   						}
   						
   						if(!(Array.isArray($atList)&& $atList.length === 0)){
   							for(var i = 0; i < $atList.length; i++){
   								apvfile.innerHTML += "<br>"+
   									"<a href='${contextPath}/resources/uploadFiles/employee/"+$atList[i].renameFile+"' download='"+$atList[i].originalFile+"'>"+$atList[i].originalFile+"</a>";
   							}
   							
   							
   							
   						}
   						
   						if(!(Array.isArray($signList)&& $signList.length === 0)){
   							var $tableBody = $("#sign-table tBody");
   							$tableBody.html("");
   								var $trJob = $("<tr>")
   							for(var i = 0; i < $aList.length; i++){
   								console.log($signList[i]);
   								if(job != undefined){
   									
   								job.value = $signList[0].jobGrade;
   								}
   								var $job = $("<td class='sign job'>");
   								$job.text($signList[i].jobGrade);
   								$trJob.append($job);
   							}
   								var $trSign = $("<tr>")
   							for(var i = 0; i < $aList.length; i++){
   								var $sign = $("<td class='signature'>");
   								if($aList[i].apvStep == 0){
   									$sign.html("<img class='signature' src='${contextPath}/resources/approval/images/"+$signList[i].rename+"'>");
   								}else if($aList[i].apvResult != 0){
   									$sign.html("<img class='signature' src='${contextPath}/resources/approval/images/"+$signList[i].rename+"'>");
   								}else{
   									$sign.text("");
   								}
   								
   								$trSign.append($sign);
   							}
   								var $trName = $("<tr>")
   							for(var i = 0; i < $aList.length; i++){
   								var $name = $("<td class='sign name'>");
   								if(name != undefined){
   									
   								name.value = $aList[0].eName;
   								}
   								$name.text($aList[i].eName);
   								$trName.append($name);
   							}
   								var $trDate = $("<tr>")
   							for(var i = 0; i < $aList.length; i++){
   								var $comp = $("<td class='sign date'>");
   								$comp.text($aList[i].apvCompDate);
   								$trDate.append($comp);
   							}
   							$tableBody.append($trJob);
   							$tableBody.append($trSign);
   							$tableBody.append($trName);
   							$tableBody.append($trDate);
   						}
   						
   					},
   					error:function(e){
   						console.log("error"+e);
   					}
   				}); 
   				
   			});
   		});
        
        function showDocContent(apvDocNo){
        	var doc = document.getElementById("doc");
        	
        	<c:forEach var='ap' items='${apList}'>
        		if(apvDocNo == '${ap.apvDocNo}'){
        			doc.innerHTML = '${ap.apvDocContent}';
        			$("#doc").children('input').attr('readonly', true);
        			$("#start_date").attr('readOnly', true);
        			$("#end_date").attr('readOnly', true);
        			$("#apvcomment").html("의견<br><textarea id='apvComment' name='apvComment'></textarea>");
        			$("#apvComment").css({'overflow-y':'scroll', 'width':'100%', 'height':'90%', 'resize':'none'});
					console.log('${ap}');
        			var title = document.getElementById("apvDocTitle") || document.getElementById("sign_title");
        			if(title != undefined){
        				title.value = '${ap.apvDocTitle}';
        				console.log(title.attributes);
        				title.style.fontSize = "x-large";
        				title.style.textAlign = "center";
        			}
        			var date = document.getElementById("sign_date");
        			if(date != undefined){
        				date.value = '${ap.apdCreateDate}';
        				
        			}
        			var result = document.getElementById("doc_acceptButton");
        			if(${ap.apvType == 1}){
        				result.innerHTML = '<svg width="40px" color="snow" viewBox="0 0 16 16" class="bi bi-file-earmark-check" fill="currentColor" xmlns="http://www.w3.org/2000/svg"><path d="M4 0h5.5v1H4a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1V4.5h1V14a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2z"/><path d="M9.5 3V0L14 4.5h-3A1.5 1.5 0 0 1 9.5 3z"/><path fill-rule="evenodd" d="M10.854 7.146a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 1 1 .708-.708L7.5 9.793l2.646-2.647a.5.5 0 0 1 .708 0z"/></svg>'+"합의";
        			}else if(${ap.apvType == 2}){
        				result.innerHTML = '<svg width="40px" color="snow" viewBox="0 0 16 16" class="bi bi-file-earmark-check" fill="currentColor" xmlns="http://www.w3.org/2000/svg"><path d="M4 0h5.5v1H4a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1V4.5h1V14a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2z"/><path d="M9.5 3V0L14 4.5h-3A1.5 1.5 0 0 1 9.5 3z"/><path fill-rule="evenodd" d="M10.854 7.146a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 1 1 .708-.708L7.5 9.793l2.646-2.647a.5.5 0 0 1 .708 0z"/></svg>'+"결재";
        			}
        			console.log(result.innerText);
        			
        			if(${ap.apvStep == ap.apdStep}){
        				confirmStatus = true;
        			}
        			
        			
        		}
        	</c:forEach>
        }
        
    </script>

</body>
</html>