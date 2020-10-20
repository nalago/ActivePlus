<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/* 문서 양식 리스트 메뉴바 */
    #doctypeList{
        width: 200px;
        height: 93.5vh;
        display: inline-block;
        background-color: rgb(236, 228, 228);
    }
    #listButtonclose, #listButtonopen{
        width: 30px;
        height: 30px;
        float: right;
        cursor: pointer;
    }
    #listButtonopen{
        float: none;
        position: absolute;
        margin-top: 3px;
        display: none;
    }
    #listTop{
        margin-top: 3px;
        margin-left: 3px;
    }
   

    .tree{
      color:#393939;
    }
    .tree, .tree ul{
      list-style: none;
      padding-left:17px;
    }
    .tree *:before{
      width:17px;
      height:17px;
      display:inline-block;
    }
    .tree ul li a:before{
    	content:'\f115';
    	font-family:fontello;
    }
    
    .tree input[type="checkbox"] {
      display: none;
    }
    .tree input[type="checkbox"]:checked~ul {
      display: none;
    }
    .tree input[type="checkbox"]:checked{
      content:'\f114';
      font-family: fontello;
    }
    label{
    	cursor:pointer;
    }
    a{
    	text-decoration:none;
    	color:black;
    }
    a:hover{
    	text-decoration:none;
    	color:green;
    }
    input[type="radio"] {
    	position:hidden;
    }
    
</style>
</head>
<body>
<div id="doctypeList">
                <div id="listTop">
                        <svg id="listButtonclose" viewBox="0 0 15 15" class="bi bi-list" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd" d="M2.5 11.5A.5.5 0 0 1 3 11h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4A.5.5 0 0 1 3 7h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4A.5.5 0 0 1 3 3h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5z"/>
                        </svg>
                    <h5>문서 카테고리</h5>
                </div>
                <hr>
                <div id="treewrap">
                    <nav class="tree">
                        <ul>
                        <c:url var="docTypeList" value="docTypeList.ap">
                        	<c:param name="page" value="${ pi.currentPage }"/>
                        </c:url>
                            <li><a id="publicdoc" href="${ docTypeList }&docType=publicdoc">
                            <label for="publicdoc">공통양식</label>
                            </a>
                            
                                <ul>
                                    <li>
                                    <a href="${docTypeList}&docType=personal">
                                    	인사
                                    </a>
                                    </li>
                                    <li>
                                    <a href="${docTypeList }&docType=task">
                                    	업무
                                    </a>
                                    </li>
                                    <li>
                                    <a href="${docTypeList }&docType=report">
                                    	보고
                                    </a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                            	<a href="${docTypeList }&docType=privatedoc">
                            		개인양식
                            	</a>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>            
                    <svg id="listButtonopen" viewBox="0 0 15 15" class="bi bi-list" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd" d="M2.5 11.5A.5.5 0 0 1 3 11h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4A.5.5 0 0 1 3 7h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4A.5.5 0 0 1 3 3h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5z"/>
                    </svg>
            <script>
            $(function(){
                /* 왼쪽 문서양식 메뉴바 열고 닫기 */
                $("#listButtonopen").on("click",function(){
                    var listwidth = $("#doctypeList").innerWidth();
                    var docwidth = $("#docwrap").innerWidth();
                   $("#doctypeList").css("display","inline-block");
                   $(this).css("display","none");
                    $("#docwrap").css("width",docwidth-listwidth+"px");
                });
                $("#listButtonclose").on("click",function(){
                    var listwidth = $("#doctypeList").innerWidth();
                    var docwidth = $("#docwrap").innerWidth();
                    $("#doctypeList").css("display","none");
                    $("#listButtonopen").css("display","inline-block");
                    $("#docwrap").css("width",docwidth+listwidth+"px");
                });
            });
            
            $("input[type='checkbox']").on("click",function(){
            	var docType = this.id;
            	console.log(this);
            	
            });
            
            /* $("input[type='checkbox']").on("click",function(){
            	console.log(this.id);
            	$.ajax({
            		url:"docTypeList.ap",
            		type:"post",
            		data:{docType:this.id},
            		datatype:"json",
            		success: function(data){
            			console.log(data.docTypeList);
            			var $tbody = $("#docList tbody");
            			$tbody.html("");
            			
            			for(var i in data.docTypeList){
            				var $tr = $("<tr>");
            				
            				var $dTitle = $("<td>").text(data.docTypeList[i].docTitle);
            				var $dExplantion = $("<td>").text(data.docTypeList[i].docExplantion);
            				console.log(data.docTypeList[i].docTitle);
            				
            				$tr.append($dTitle);
            				$tr.append($dExplantion);
            				
            				$tbody.append($tr);
            			}
            			
            		},
            		error:function(e){
            			console.log(e);
            		}
            	});
            }); */
            
            
            </script>
</body>
</html>