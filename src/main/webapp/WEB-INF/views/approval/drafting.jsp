<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<link rel="stylesheet" href="${contextPath }/resources/approval/css/base.css"/>
<link rel="stylesheet" href="${contextPath }/resources/approval/css/sign-table.css"/>
<link rel="stylesheet" href="${contextPath }/resources/approval/css/doc.css"/>
<link rel="stylesheet" href="${contextPath }/resources/approval/fontello/css/fontello.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script src="${contextPath }/resources/approval/ckeditor/ckeditor.js"></script>
<title>Insert title here</title>
<style>
    

    /* modal */
    #apvmodalwrap{
        top:0;
        left: 0;
        width: 100%;
        height: 100%;
        background: rgba(0,0,0,0.5);
        position: fixed;
        display:none;
    }

    #apvmodal{
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
    #modalclose{
        width: 3.5%;
        height: 50%;
        float: right;
        cursor: pointer;
    }
    #modalcontent{
        width: 100%;
        height: 92%;
    }
    #searchpersonwrap{
        width: 35%;
        height: 70%;
        background-color: rgba(10, 20, 15, 0.1);
        left: 7%;
        top:15%;
        display: inline-block;
        position: fixed;
        
    }
    #procedurewrap{
        width: 35%;
        height: 70%;
        background-color: rgba(10, 20, 15, 0.1);
        display: inline-block;
        position: fixed;
        right: 7%;
        top:15%;
    }
    #modalbuttonwrap{
        width: 100px;
        height: 100px;
        display: inline-block;
        position: fixed;
        top:25%;
        left: 45%;
    }
    #approverButton, #consensusButton{
    	width:120px;
        height: 35%;
        background-color: rgb(62, 142, 218);
        border: 0;
        border-radius: 5%;
    }
    #approverButton{
        margin-bottom: 5px;
    }

    #searchperson{
        width: 50%;
        margin-left: 75px;
    }
    #searchbutton{
        margin-bottom: 3px;
        width: 35px;
        height: 32px;
        border: 1px solid black;
        background-color:rgb(236, 228, 228);
        cursor: pointer;
    }
    #procedure, #person{
        margin-left: 10%;
        width: 80%;
        height: 80%;
        border: 1px solid black;
        overflow-y:scroll;
    }
    #enroll, #cancel{
        border: 0;
        width: 70px;
        height: 35px;
        display: inline-block;
        position: fixed;
        border-radius: 10%;
    }
    #cancel{
        bottom : 5%;
        right: 5%;
    }
    #enroll{
        background-color: rgb(62, 142, 218);
        bottom : 5%;
        right: 13%;
    }
    
    .procedureCancel{
    	border:0;
    	margin:0;
    	color:red;
    }
    .procedureCancel:focus{
    	outline:none;
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
   
    ul, li{
    	list-style:none;
    }
   
  	input[type='radio']{
  		visibility:hidden;
  	}
  	
  	
    #person label{
    	width:94%;
    }
    .procedureNames{
    	 background-color: rgba(10, 20, 15, 0);
    	 border:none;
    }
    input[type="text"]:focus{
    	outline:none;
    }
    #docform{
    	display:inline-block;
    	width:80%;
    	float:right;
    }
    #docwrap{
    	width:800px;
    }
    #docDiv{
    	display:none;
    }
    
    </style>
</head>
<body>
<jsp:include page="../common/menubar.jsp"/>
<section>
        <jsp:include page="submenu/topMenu.jsp"/>
            <jsp:include page="submenu/docTypeList.jsp"/>
       <form id="docform" action="drafting.ap"   method="post" enctype="multipart/form-data">
            <jsp:include page="submenu/apvMenu.jsp"/>
            <div id="docwrap">
                <div id="doc">
                <!-- 기안 문서 양식 예 -->
               	${ doc.docContent }
               	<textarea id="editor" name="draftContent">내용 입력</textarea>
               	</div>
               	<input type="text" id="docDiv" name="apvDocContent" readonly/>
                </div>
                <script>
                $(function(){
                    CKEDITOR.replace("editor",{
                    	
                    });
                })
                </script>
                <div id="confirmwrap">
            <div id="confirm">
                <div id="confirmtitle">
                    <h5>&nbsp;알림</h5>
                </div>
                <div id="confirmcontent">
                    <h4>기안하시겠습니까?</h4>
                    <input id="confirmOk" type="submit"/>
                    <button id="confirmCancel" type="button" onclick="closeconfirm();">취소</button>
                </div>
            </div>
        </div>
          </form>
        </section>
        <div id="apvmodalwrap">
            <div id="apvmodal">
                <div id="modaltitle">
                    <h4>결재선 지정
                        <svg id="modalclose"  viewBox="0 0 16 16" class="bi bi-x-circle" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd" d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                            <path fill-rule="evenodd" d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
                          </svg>
                    </h4>
                </div>
                <div id="modalcontent">
                    <div id="searchpersonwrap">
                        <h5>직원</h5>
                        <input id="searchperson" type="text">
                        <svg id="searchbutton" width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-search" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
<path fill-rule="evenodd" d="M10.442 10.442a1 1 0 0 1 1.415 0l3.85 3.85a1 1 0 0 1-1.414 1.415l-3.85-3.85a1 1 0 0 1 0-1.415z"/>
<path fill-rule="evenodd" d="M6.5 12a5.5 5.5 0 1 0 0-11 5.5 5.5 0 0 0 0 11zM13 6.5a6.5 6.5 0 1 1-13 0 6.5 6.5 0 0 1 13 0z"/>
                        </svg>
                        <div id="person">
                            <!-- 직원정보 출력하는곳 -->
                            <ul> <h5>인사</h5>
                            <c:forEach var="e" items="${ eList }">
                            	<c:if test="${ e.department eq '인사' }">
                            		<li class="userName"><input type="radio" id="${e.userName}" name="userName" value="${ e.userName }">
                            		<label for="${ e.userName }" style=margin:0;>${ e.userName }</label>
                            		</li>
                            	</c:if>
                            </c:forEach>
                            </ul>
                        </div>
                    </div>
                    <div id="modalbuttonwrap">
                        <button id="approverButton">결재자 등록</button>
                        <button id="consensusButton">합의자 등록</button>
                    </div>
                    <div id="procedurewrap">
                        <h5>결재선</h5>
                        <div id="procedure">
                            <!-- 직원정보에서 결재자 or 합의자 등록하면 출력 -->
                        </div>
                    </div>
                    <button id="enroll">등록</button>
                    <button id="cancel" onclick="closemodal();">취소</button>
                </div>
            </div>
        </div>
        
        <script>
            /* 모달창 열고 닫기 */
            function openmodal(){
                $("#apvmodalwrap").css("display","block");
            };
            /* 결재선 등록 버튼 */
            $("#enroll").on("click", function(){
            	var procedureList = $("#procedure").children();
            	var apvprocedure = document.getElementById("apvprocedure");
            	
            	for(var i = 0; i < procedureList.length; i++){
            		console.log(procedureList[i].firstChild);
            		apvprocedure.insertAdjacentHTML("beforeend", "<input type='text' class='apvprocedureNames' name='apvprocedureNames' value='"+ (i+1) + " " 
            									+ procedureList[i].firstChild.value+"' readonly />");
            	}
            	
            	$("#apvmodalwrap").css("display","none");
            });
            
            /*취소버튼*/
            function closemodal(){
                $("#apvmodalwrap").css("display","none");
                
            }
            /* X 버튼 */
            $(function(){
                $("#modalclose").on("click",function(){
                    $("#apvmodalwrap").css("display","none");
                    
                });
            });
            /* confirm */
            function confirm(){
            	$("#confirmwrap").css("display", "block");
            	
            }
            function closeconfirm(){
                $("#confirmwrap").css("display", "none");
            }
            
            /* 결재선 직원 클릭 시 선택 효과 */
            $(function(){
            	$(".userName").on("click",function(){
            		$(".userName").css("background","");
            		$(this).css("background","#63ab68");
            	});
            });
            /* 결재선 지정 펑션 */
            $(function(){
            	$("#approverButton").on("click",function(){
            		var name = $('input[name="userName"]:Checked').val();
            		var procedure = document.getElementById('procedure');
            		var list = $("#procedure").children();
            		
            		for(var i = 0; i < list.length; i++){
            			
            		
            		if(list[i].id == "procedure"+name && name != undefined){
            			return;
            			procedure.insertAdjacentHTML("beforeend", "<div id='procedure"+name+"'><input type='text' id='apv"+name+"' class='procedureNames' name='procedureName' value='"+name+" (결재)' readonly>"+
						"<button id='"+name+"' class='procedureCancel'>X</button></div>");
            		}
            		}
            		 if(name != undefined){
            			
						procedure.insertAdjacentHTML("beforeend", "<div id='procedure"+name+"'><input type='text' id='apv"+name+"' class='procedureNames' name='procedureName' value='"+name+" (결재)' readonly>"+
								"<button id='"+name+"' class='procedureCancel'>X</button></div>");
            		 } 
            	});
            });
            
            /* 결재선 X 버튼 */
            $("#procedure").on('click',function(e){
            	if(e.target.classList.contains('procedureCancel')){
            		document.getElementById("procedure"+$(e.target).attr("id")).remove();
            	}
            });
            
            /* 합의자 지정 펑션 */
            $(function(){
            	$("#consensusButton").on("click",function(){
            		var name = $('input[name="userName"]:Checked').val();
            		var procedure = document.getElementById('procedure');
            		var list = $("#procedure").children();
            		
            		
            		for(var i = 0; i < list.length; i++){
            			
            		if(list[i].id == "procedure"+name && name != undefined){
            			
            			return;
            			procedure.insertAdjacentHTML("beforeend", "<div id='procedure"+name+"'><input type='text' id='con"+name+"' class='procedureNames' name='procedureName' value='"+name+" (합의)' readonly>"+
						"<button id='"+name+"' class='procedureCancel'>X</button></div>");
            		}
            		}
            		 if(name != undefined){
            			
						procedure.insertAdjacentHTML("beforeend", "<div id='procedure"+name+"'><input type='text' id='con"+name+"' class='procedureNames' name='procedureName' value='"+name+" (합의)' readonly>"+
								"<button id='"+name+"' class='procedureCancel'>X</button></div>");
            		 }
            	});
            });
            
            /* 직원리스트에서 검색한 이름만 보여주는 펑션 */
            $(function(){
            	$("#searchperson").keyup(function(){
            		var searchName = $(this).val();
            		
            		$("#person > ul > li").hide();
            		
            		var temp = $("#person > ul > li > label:contains('"+ searchName +"')");
            		
            		console.log($(temp).parent());
            		
            		$(temp).parent().show();
            	})
            });
            
            docform.onsubmit = function(){
            	/* 문서의 기본 div 내용 */
            	var docContent = document.getElementById("docContent").innerHTML;
            	/* 문서 div 내용 담을 input태그 */
            	var apvdocContent = document.getElementById("docDiv");
            	
            	/* 에디터 안의 내용 */
            	var editorText = CKEDITOR.instances.editor.getData();
            	apvdocContent.value = docContent+"///"+editorText;
            	
            	
            	return true;
            }
            
            
            
            
            
            
        </script>
</body>
</html>