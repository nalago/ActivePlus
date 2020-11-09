<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
/* 문서 결재선 메뉴바 */
    #apvmenuwrap {
        width: 235px;
        height: 93.5vh;
        float: right;
        border: 1px solid black;
        padding: 1px;
    }
    #apvmenuclose, #drafting, #tempDocDelete{
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
    #drafting, #tempDocDelete{
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
    .apvprocedureNames{
    	border:0;
    	margin:0;
    }
    .apvprocedureNames:focus{
    	outline:none;
    }
    
</style>
<title>Insert title here</title>
</head>
<body>
<c:set var="d" value="${ tDoc }"/>
<svg id="apvmenuopen" viewBox="0 0 15 15" class="bi bi-list" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd" d="M2.5 11.5A.5.5 0 0 1 3 11h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4A.5.5 0 0 1 3 7h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4A.5.5 0 0 1 3 3h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5z"/>
                    </svg>
                    
                    <div id="apvmenuwrap">
                        <svg id="apvmenuclose" viewBox="0 0 15 15" class="bi bi-list" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd" d="M2.5 11.5A.5.5 0 0 1 3 11h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4A.5.5 0 0 1 3 7h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4A.5.5 0 0 1 3 3h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5z"/>
                        </svg>
                        <button id="drafting" type="button" onclick="confirm('기안하시겠습니까?');">기안</button>
                        <button id="tempDocDelete" type="button" onclick="confirm('삭제하시겠습니까?');">삭제</button>
                        <svg id="listButtonopen" viewBox="0 0 15 15" class="bi bi-list" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd" d="M2.5 11.5A.5.5 0 0 1 3 11h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4A.5.5 0 0 1 3 7h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4A.5.5 0 0 1 3 3h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5z"/>
                        </svg>
                        <hr>
                        <div id="apvline">
                            <button id="selectLine" type="button" onclick="openmodal();">결재선 지정</button>
                            <hr>
                            <h5>&nbsp;결재 순서</h5>
                            <div id="apvprocedure">
                            <c:set var="apdpath" value="${ fn:split(d.apdPath, ',') }"/>
                            <c:forEach var="path" items="${ apdpath }" >
                            	<input type='text' class='apvprocedureNames' name='apvprocedureNames' value='${ path }' readonly />
                            </c:forEach>
                            </div><hr>
                            <h5>의견</h5>
                            <textarea id="comment" name="comment"></textarea>
                            <br><br>
                            <hr>
                            <h5 style="display: inline-block;">첨부파일</h5>
                            <input type="button" id="filedelete">
                            <label for="filedelete" id="filedeletelabel"></label>
                            <input multiple="multiple" type="file" id="apvfile" name="apvfiles"
                            onchange="showFileList(this.files, value);"
                            multiple>
                            <label for="apvfile" id="apvfilelabel"></label>
                            <div id="apvfilelist">
                                <c:forEach var="at" items="${tempAt}">
									<a href="${ contextPath }/resources/approval/duploadFiles/${ at.renameFile }" download="${ at.originalFile }">${ at.originalFile }</a><br>
                                </c:forEach> 
                                </div>
                            <script>
                                function showFileList(files, n){
                                    var div = $("#apvfilelist");
                                    name = "";
                                    if(files.length >= 1){
                                        for(var i = 0; i < files.length; i++){
                                            var file = files[i];
                                            console.log(file);
                                            var filenames = file.name;
                                            console.log(filenames);
                                            
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
                                    console.log($("#apvfile"));
                                }
                                $(function (){
                                	$("#filedelete").on("click", function(){
                                		$("#apvfilelist").html("");
                                		$("#apvfile").attr("files","");
                                		$("#apvfile").val("");
                                	})
                                })
                                </script>
                </div>
            </div>
            <script>
            
            
            /* 모달창 열고 닫기 */
            function openmodal(){
                $("#apvmodalwrap").css("display","block");
            };
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
</body>
</html>