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
    
<title>Insert title here</title>
<style>
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
    
    #ListWrap{
        display: inline-block;
        width: 65%;
        height: 70%;
        margin-left: 50px;
        position: absolute;
        border: 1px solid black;
    }
    #docList{
        width: 100%;
        border: 1px solid black;
        border-radius: 3px;
    }
    #docList *{
        padding: 0;
        margin: 0;
        border: 1px solid black;
    }
    .doctitle{
        width: 30%;
    }
    .doccontent{
        width: 70%;
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
                <c:url var="goDrafting" value="draftingMain.ap"/>
                    <a class="menu" href="${goDrafting }">기안</a>
                    <ul>
                        <li><a class="menu" href="${goDrafting }">문서 양식</a></li>
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
           <div id="ListWrap">
               <br>
               <h3>공통 양식</h3>
               <br>
                <table id="docList">
                    <tr>
                        <th class="doctitle">양식명</th>
                        <th class="doccontent">설명</th>
                    </tr>
                    <tr>
                        <td class="doctitle">휴가신청서</td>
                        <td class="doccontent">휴가 작성 양식</td>
                    </tr>
                </table>
                <br><br>
                <div class="pagingwrap">
                 <a class="paging" href="#"><</a>
                 <a class="paging" href="#">1</a>
                 <a class="paging" href="#">2</a>
                 <a class="paging" href="#">></a>
             </div>
           </div>
    </section>

</body>
</html>