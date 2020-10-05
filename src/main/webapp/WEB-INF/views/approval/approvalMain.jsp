<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${contextPath }/resources/approval/css/base.css"/>
<link rel="stylesheet" href="${contextPath }/resources/approval/css/submenu.css"/>
<title>Insert title here</title>
<style>
    .Wrap{
        width: 450px;
        height: 200px;
        display: inline-block;
        border: 1px solid black;
        margin-left: 150px;
    }
    .title{
        margin: 0;
        background-color: lightgray;
        text-align: center;
    }
    .completeList{
        margin-left: 450px;
        margin-top: 100px;
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
        <br><br><br><br>
        
        <div class="temporaryList Wrap">
            <h4 class="title">임시 저장 문서</h4>
            <div id="temporaryList">

            </div>
        </div>

        <div class="expectedList Wrap">
            <h4 class="title">결재 예정 문서</h4>
            <div id="expectedList">

            </div>
        </div>

        <div class="completeList Wrap">
            <h4 class="title">결재 완료 문서</h4>
            <div id="completeList">

            </div>
        </div>
        

    </section>

    
</body>
</html>