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
     #pridoc{
         width:80%;
         height: 93.5vh;
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

</style>
</head>
<body>
<jsp:include page="../common/menubar.jsp"/>
<section>
        <jsp:include page="submenu/topMenu.jsp"/>
            <script>
                $(function(){
                    $("#listButtonopen").on("click",function(){
                        console.log($("#doctypeList"));
                       $("#doctypeList").css("display","inline-block");
                       $(this).css("display","none");
    
                    });
                    $("#listButtonclose").on("click",function(){
                        $("#doctypeList").css("display","none");
                        $("#listButtonopen").css("display","inline-block");
                    });
                });
            </script>
            <jsp:include page="submenu/docTypeList.jsp"/>
                 <svg id="primenuopen" viewBox="0 0 15 15" class="bi bi-list" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd" d="M2.5 11.5A.5.5 0 0 1 3 11h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4A.5.5 0 0 1 3 7h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4A.5.5 0 0 1 3 3h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5z"/>
            </svg>
            
            <div id="primenuwrap">
                <svg id="primenuclose" viewBox="0 0 15 15" class="bi bi-list" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                    <path fill-rule="evenodd" d="M2.5 11.5A.5.5 0 0 1 3 11h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4A.5.5 0 0 1 3 7h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4A.5.5 0 0 1 3 3h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5z"/>
                </svg>
                <button id="docsavebutton" onclick="">저장</button>
                <button id="deletebutton">삭제</button>
                <hr>
                <textarea id="docexplanation" placeholder="새 양식"></textarea>
                <hr>
                <button id="explanationsave">양식 설명 등록</button>
                <hr>  
            </div>
            <div id="pridocwrap">
                <div id="pridoc">
                    <h4>&nbsp;개인 문서 양식 편집</h4>
                    <textarea id="prieditor"></textarea>
                    <script>
                        CKEDITOR.replace("prieditor",{
                            extraPlugins:"confighelper",
                            height:530
                        });
                    </script>
                </div>
            </div>
            <script>
                $(function(){
                    $("#primenuopen").on("click",function(){
                        var width = $("#primenuwrap").innerWidth();
                        var docwidth = $("#pridocwrap").innerWidth();
                       $("#primenuwrap").css("display","inline-block");
                       $(this).css("display","none");
                        $("#pridocwrap").css("width",docwidth-width+"px");
                    });
                    $("#primenuclose").on("click",function(){
                        var width = $("#primenuwrap").innerWidth();
                        console.log($("#pridocwrap").innerWidth);
                        $("#primenuwrap").css("display","none");
                        $("#primenuopen").css("display","inline-block");
                        $("#pridocwrap").css("width",$("#pridocwrap").innerWidth()+width+"px");
                    });
                });
            </script>
    </section>

</body>
</html>