<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<link rel="stylesheet" href="${contextPath }/resources/approval/css/base.css"/>
<link rel="stylesheet" href="${contextPath }/resources/approval/css/submenu.css"/>
<link rel="stylesheet" href="${contextPath }/resources/approval/fontello/css/fontello.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script src="${contextPath }/resources/approval/ckeditor/ckeditor.js"></script>
<title>Insert title here</title>
<style>
	#primenuwrap{
        width: 250px;
        height: 93.5vh;
        float: right;
        border: 1px solid black;
        padding: 1px;
      
     }
     #primenuopen, #primenuclose{
         width: 30px;
         height: 30px;
         cursor: pointer;
     }
     #primenuopen{
         float: right;
         display: none;
     }
     #docsavebutton, #deletebutton{
        width: 103px;
        height: 35px;
        border-radius: 7px;
        border: 0;
     }
     #docsavebutton{
        background-color: rgb(62, 142, 218);
     }
     #pridocwrap{
     	width:880px;
     	float:right;
        height: 70.5vh;
        margin:0;
     }
     #pridoc{
     	width:800px;
     }
     
     #docexplanation{
         width: 100%;
         height: 30%;
         resize: none;
     }
     ::placeholder{
         color:black;
     }
     #explanationsave{
        width: 100%;
        height: 30px;
        border: 1px solid lightgrey;
        background-color: whitesmoke;
        border-radius: 7px;
     }
     #priDocForm{
     	width:85%;
     	float:right;
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
    #priDocTitle{
    	width:500px;
    	height:50px;
    	font-size:25px;
    }
    #priDocContent{
    	display:none;
    }
    
</style>
</head>
<body>
<jsp:include page="../common/menubar.jsp"/>
<section>
        <jsp:include page="submenu/topMenu.jsp"/>
            
            <jsp:include page="submenu/docTypeList.jsp"/>
            <form id="priDocForm" method="post">
                 <svg id="primenuopen" viewBox="0 0 15 15" class="bi bi-list" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd" d="M2.5 11.5A.5.5 0 0 1 3 11h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4A.5.5 0 0 1 3 7h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4A.5.5 0 0 1 3 3h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5z"/>
            </svg>
            <div id="primenuwrap">
                <svg id="primenuclose" viewBox="0 0 15 15" class="bi bi-list" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                    <path fill-rule="evenodd" d="M2.5 11.5A.5.5 0 0 1 3 11h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4A.5.5 0 0 1 3 7h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4A.5.5 0 0 1 3 3h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5z"/>
                </svg>
                <button type="button" id="docsavebutton">저장</button>
                <button type="button" id="deletebutton">삭제</button>
                <hr>
                <textarea id="docexplanation" name="docexplanation" placeholder="양식 설명">${ priDoc.docExplantion }</textarea>
                <hr>
            </div>
            <div id="pridocwrap">
                <div id="pridoc">
                    <h4>&nbsp;개인 문서 양식 편집</h4>
                    <input type="text" id="priDocTitle" name="priDocTitle" placeholder="문서 제목 입력" value="${ priDoc.docTitle }"/>
                    <input type="text" id="priDocContent" name="priDocContent"/>
                    <textarea id="prieditor">${ priDoc.docContent }</textarea>
                    <script>
                        CKEDITOR.replace("prieditor",{
                            extraPlugins:"confighelper",
                            height:480
                        });
                    </script>
                </div>
            </div>
		<div id="confirmwrap">
			<div id="confirm">
				<div id="confirmtitle">
					<h5>&nbsp;알림</h5>
				</div>
				<div id="confirmcontent">
					<h4></h4>
					<input id="confirmOk" type="submit"/>
					<button id="confirmCancel" type="button" onclick="closeconfirm();">취소</button>
				</div>
			</div>
		</div>
           </form>
		<jsp:include page="popup/alert.jsp"/>
		<script>
			$(function() {
				$("#primenuopen").on("click", function() {
					$("#primenuwrap").css("display", "inline-block");
					$(this).css("display", "none");
					$("#pridocwrap").css("margin-right", "");

				});
				
			$("#primenuclose").on("click",function() {
							$("#primenuwrap").css("display", "none");
							$("#primenuopen").css("display", "inline-block");
							$("#pridocwrap").css("margin-right",
									$("#primenuwrap").innerWidth() - "36");
						});
			});
			
			/* 저장 버튼 */
			$("#docsavebutton").on("click", function(){
				confirm('저장하시겠습니까?');
			});
			/* 삭제 버튼 */
			$("#deletebutton").on("click", function(){
				confirm('삭제하시겠습니까?');
			});
			
			window.confirm = function(message){
				$("#confirmwrap").css("display","block");
				var confirmContent = $("#confirmcontent");
                var confirmMsg = confirmContent.children().eq(0);
                confirmMsg[0].innerHTML = message;
                
                if(message.includes("저장")){
                	$("#priDocForm").attr("action","priDocSave.ap");
                	$("#confirmOk").on("click", function () {
                        return true;
                    });
                }
                if(message.includes("삭제")){
                	console.log($("#priDocForm"));
                	$("#priDocForm").attr("action","deletePriDoc.ap");
                	$("#confirmOk").on("click", function () {
                        return true;
                    });
                }
			}
			
			function closeconfirm(){
                $("#confirmwrap").css("display", "none");
            }
			
			priDocForm.onsubmit = function(){
				var editorText = CKEDITOR.instances.prieditor.getData();
				
				var docContent = document.getElementById("priDocContent");
				docContent.value = editorText;
				
				console.log(docContent);
				
				return true;
			}
		</script>
    </section>

</body>
</html>