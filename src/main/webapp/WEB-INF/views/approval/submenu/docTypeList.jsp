<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    .tree label{
      cursor: pointer;
    }
    .tree label:before{
      content:'\f115';
      font-family: fontello;
    }
    
    
    .tree input[type="checkbox"] {
      display: none;
    }
    .tree input[type="checkbox"]:checked~ul {
      display: none;
    }
    .tree input[type="checkbox"]:checked+label:before{
      content:'\f114';
      font-family: fontello;
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
                            <li><input type="checkbox" id="publicdoc">
                                <label for="publicdoc">공통양식</label>
                                <ul>
                                    <li><input type="checkbox" id="personal" checked>
                                        <label for="personal">인사</label>
                                        <ul>
                                        	<li>휴가 신청서</li>
                                        	<li>병가 신청서</li>
                                        	<li>퇴직 신청서</li>
                                        </ul>
                                    </li>
                                    <li><input type="checkbox" id="task" checked>
                                        <label for="task">업무</label>
                                    </li>
                                    <li><input type="checkbox" id="report" checked>
                                        <label for="report">보고</label>
                                    </li>
                                </ul>
                            </li>
                            <li><input type="checkbox" id="privatedoc">
                                <label for="privatedoc">개인양식</label>
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
            </script>
</body>
</html>