<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<link rel="stylesheet" href="${contextPath }/resources/approval/css/base.css"/>
<link rel="stylesheet" href="${contextPath }/resources/approval/css/submenu.css"/>
<link rel="stylesheet" href="${contextPath }resources/fontello/css/fontello.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.48.4/codemirror.css" />
<link rel="stylesheet" href="https://uicdn.toast.com/editor/2.0.0/toastui-editor.min.css" />

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

    /* 문서 결재선 메뉴바 */
    #apvmenuwrap {
        width: 250px;
        height: 93.5vh;
        float: right;
        border: 1px solid black;
        padding: 1px;
    }
    #apvmenuclose, #drafting, #temporary{
        margin: 0;
        padding: 0;
        border: 0px;
    }

    #apvmenuclose,#apvmenuopen {
        width: 30px;
        height: 30px;
        cursor: pointer;
    }
    #apvmenuopen{
        float: right;
        display: none;
    }
    #drafting, #temporary{
        width: 103px;
        height: 35px;
        border-radius: 7px;
    }
    #drafting, #selectLine, #commentbutton{
        background-color: rgb(62, 142, 218);
    }
    #commentbutton{
        float: right;
        border-radius: 7px;
        border: 0;
    }
    #selectLine{
        width: 250px;
        height: 35px;
        border-radius: 7px;
        border: 0;
    }
    #apvprocedure{
        width: 240px;
        height: 170px;
        border: 1px solid black;
    }
    #comment{
        overflow-y: scroll;
        width: 245px;
        height: 100px;
    }
    #apvfile{
        display: none;
        
    }
    input[type="file"]+label:before{
      content:'\e801';
      font-family: fontello;
      float: right;
      width: 30px;
      height: 30px;
      cursor: pointer;
    }
    #filedelete{
        display: none;
    }
    input[type="button"]+label:before{
        width: 30px;
        height: 30px;
      content:'\e802';
      font-family: fontello;
      float: right;
      cursor: pointer;
    }
    #filedeletelabel, #apvfilelabel{
        display: inline;
        margin-right: 5px;
    }
    #apvfilelist{
        overflow-x: auto;
    }
    /* 문서 */
    #docwrap {
        width: 885px;
        height: 93.5vh;
        display: inline-block;
        float: right;
       
    }
    #doc{
        width: 700px;
        height: 100%;
        border: 1px solid lightgray;
        overflow-y: scroll;
    }
    .signaturewrap{
        padding: 0;
        width: 100px;
        height: 150px;
        float: right;
        display: inline-block;
    }
    .signature{
        margin: 0;
        padding: 0;
        text-align: center;
        width: 100%;
    }
    .sign{
        height: 60%;
        border: 1px solid black;
        border-bottom: 0px;
    }
    .name, .date, .job{
        height: 16%;
        border: 1px solid black;
    }
    .name, .job{
        border-bottom: 0px;
    }
    #sign_title{
        width: 80%;
        height: 50px;
        font-size: 20px;
        font-weight: 500;
        border: 0;
    }
    #job, #name, #sign_date{
        float: right;
        background-color: rgb(248, 248, 248);
        border: 0;
        box-sizing: content-box;
        margin-right: 5px;
        
    }
    #editor{
        width: 100%;
        height: 600px;
    }

    /* modal */
    #apvmodalwrap{
        top:0;
        left: 0;
        width: 100%;
        height: 100%;
        background: rgba(0,0,0,0.5);
        position: fixed;
        display: none;
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
        left: 46%;
    }
    #approverButton, #consensusButton{
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
    </style>
</head>
<body>
<div id="profile">
        <span id="user" class="profile">###님</span>
        <span ><a id="info" class="profile" href="#">개인정보</a></span>
        <a href="main.ap">
        <img id="logo" src="${ contextPath }/resources/images/ActivePlus_Logo.png" style="float:right;">
        </a>
    </div>
    <div class="sidenav">
			<c:url var="goCal" value="calendar.ap"/>
			<c:url var="goMail" value="mail.ap"/>
			<c:url var="goApproval" value="approvalMain.ap"/>
			<a href="${ goCal }">일정관리</a>
			<a href="${ goApproval }">전자결재</a>
			<a href="#">게시판</a>
			<a href="#">메신저</a> 
			<a href="${ goMail }">메일</a>
			<a href="#">인사관리</a>
		</div>
<section>
        <div id="subMenu">
            <ul class="navi">
                <li>
                    <a class="menu" href="#">기안</a>
                    <ul>
                        <li><a class="menu" href="#">문서 양식</a></li>
                        <li><a class="menu" href="#">임시 문서</a></li>
                        <li><a class="menu" href="#">개인 양식</a></li>
                    </ul>
                </li>
                <li>
                    <a class="menu" href="#">결재</a>
                    <ul>
                        <li><a class="menu" href="#">결재 받을 문서</a></li>
                        <li><a class="menu" href="#">결재 예정 문서</a></li>
                        <li><a class="menu" href="#">결재 완료 양식</a></li>
                    </ul>
                </li>
            </ul>
            </div>
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
                /* 오른쪽 기안 관련 메뉴바 열고 닫기 */
                $(function(){
                    $("#apvmenuopen").on("click",function(){
                        var width = $("#apvmenuwrap").innerWidth();
                        var docwidth = $("#docwrap").innerWidth();
                       $("#apvmenuwrap").css("display","inline-block");
                       $(this).css("display","none");
                        $("#docwrap").css("width",docwidth-width+"px");
                    });
                    $("#apvmenuclose").on("click",function(){
                        var width = $("#apvmenuwrap").innerWidth();
                        console.log($("#docwrap").innerWidth);
                        $("#apvmenuwrap").css("display","none");
                        $("#apvmenuopen").css("display","inline-block");
                        $("#docwrap").css("width",$("#docwrap").innerWidth()+width+"px");
                    });
                });
            </script>
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
                                    <li><input type="checkbox" id="personal">
                                        <label for="personal">인사</label></li>
                                    <li><input type="checkbox" id="task">
                                        <label for="task">업무</label></li>
                                    <li><input type="checkbox" id="report">
                                        <label for="report">보고</label></li>
                                </ul>
                            </li>
                            <li><input type="checkbox" id="privatedoc">
                                <label for="privatedoc">개인양식</label></li>
                        </ul>
                    </nav>
                </div>
            </div>            
                    <svg id="listButtonopen" viewBox="0 0 15 15" class="bi bi-list" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd" d="M2.5 11.5A.5.5 0 0 1 3 11h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4A.5.5 0 0 1 3 7h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4A.5.5 0 0 1 3 3h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5z"/>
                    </svg>
                    <svg id="apvmenuopen" viewBox="0 0 15 15" class="bi bi-list" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd" d="M2.5 11.5A.5.5 0 0 1 3 11h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4A.5.5 0 0 1 3 7h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4A.5.5 0 0 1 3 3h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5z"/>
                    </svg>
                    
                    <div id="apvmenuwrap">
                        <svg id="apvmenuclose" viewBox="0 0 15 15" class="bi bi-list" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd" d="M2.5 11.5A.5.5 0 0 1 3 11h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4A.5.5 0 0 1 3 7h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4A.5.5 0 0 1 3 3h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5z"/>
                        </svg>
                        <button id="drafting" onclick="confirm();">기안</button>
                        <button id="temporary">임시저장</button>
                        <svg id="listButtonopen" viewBox="0 0 15 15" class="bi bi-list" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd" d="M2.5 11.5A.5.5 0 0 1 3 11h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4A.5.5 0 0 1 3 7h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4A.5.5 0 0 1 3 3h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5z"/>
                        </svg>
                        <hr>
                        <div id="apvline">
                            <button id="selectLine" onclick="openmodal();">결재선 지정</button>
                            <hr>
                            <h5>&nbsp;결재 순서</h5>
                            <div id="apvprocedure">
                                
                            </div><hr>
                            <h5>의견</h5>
                            <textarea id="comment"></textarea>
                            <button id="commentbutton">등록</button>
                            <br><br>
                            <hr>
                            <h5 style="display: inline-block;">첨부파일</h5>
                            <input type="button" id="filedelete">
                            <label for="filedelete" id="filedeletelabel"></label>
                            <input type="file" id="apvfile" 
                            onchange="showFileList(this.files, value);"
                            multiple>
                            <label for="apvfile" id="apvfilelabel"></label>
                            <div id="apvfilelist">
                                
                            </div>
                            <script>
                                function showFileList(files, n){
                                    var div = $("#apvfilelist");
                                    name = "";
                                    if(files.length > 1){
                                        for(var i = 0; i < files.length; i++){
                                            var file = files[i];
                                            
                                            var filenames = file.name;
                                            
                                            filename = filenames.split("\\");
                                            name += filename[filename.length-1];
                                            if(i <  files.length-1){
                                                name += ",";
                                            }
                                            div.html(name);
                                        }
                                    }else{
                                        var filename = name.split("\\");
                                        div.html(filename[filename.length-1]);
                                    }
                                    
                                }
                                
                                </script>
                </div>
            </div>
            <div id="docwrap">
                <div id="doc">
                    <div class="signaturewrap">
                        <div class="signature job">관리자</div>
                        <div class="signature sign"></div>
                        <div class="signature name">윤영관</div>
                        <div class="signature date"></div>
                    </div>
                    <br><br><br><br><br><br>
                    <hr>
                    &nbsp;
                    <input type="text" id="sign_title" placeholder="기안 제목">
                    <hr>&nbsp;
                    직위/직책 <input type="text" id="job" readonly placeholder="관리자">
                    <hr>&nbsp;
                    작성자명 <input type="text" id="name" readonly placeholder="윤영관">
                    <hr>&nbsp;
                    작성일 <input type="text" id="sign_date" readonly>
                    <hr>&nbsp;
                    기안 내용
                    <div id="editor"></div>
                </div>
                <script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
                <script>
                    const editor = new toastui.Editor({
                        el: document.querySelector("#editor"),
                        initialEditType: 'wisiwyg',
                        height: "300"
                       
                    });
                </script>
                </div>
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
        <div id="confirmwrap">
            <div id="confirm">
                <div id="confirmtitle">
                    <h5>&nbsp;알림</h5>
                </div>
                <div id="confirmcontent">
                    <h4>승인하시겠습니까?</h4>
                    <button id="confirmOk">OK</button>
                    <button id="confirmCancel" onclick="closeconfirm();">CANCEL</button>
                </div>
            </div>
        </div>
        <script>
            /* 모달창 열고 닫기 */
            function openmodal(){
                $("#apvmodalwrap").css("display","block");
            };
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
            $("#confirmwrap").css("display","block");
            }
            function closeconfirm(){
                $("#confirmwrap").css("display","none");
            }
        </script>
</body>
</html>