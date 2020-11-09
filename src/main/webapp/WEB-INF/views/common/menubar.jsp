<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- <script src="https://code.jquery.com/jquery-3.5.1.js" 
integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script> -->
<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }"
scope="application"/>
<meta charset="UTF-8">
<title>Active Plus</title>
<link rel="stylesheet" href="${ contextPath }/resources/css/basic.css"/>
<link rel="stylesheet" href="${contextPath}/resources/css/menubar.css"/>
</head>
<body>
		<c:url var="myinfo" value="myInfo.ap" scope="application"/>
		<c:url var="logOut" value="logOut.ap"/>
		<div id="profile">
			<c:if test="${ loginUser ne null }">
			<span id="user" class="profile">${ loginUser.category }, ${ loginUser.name }님</span>
			<span ><a id="info" class="profile" href="${ myinfo }">개인정보</a></span>
			<span ><a id="info" class="profile" href="${ logOut }">로그아웃</a></span>			
			</c:if>
			<a href="main.ap">
			<img id="logo" src="${ contextPath }/resources/images/ActivePlus_Logo.png" style="float:right;">
			</a>
		</div>
			<c:url var="goSchd" value="calendar.ap">
				<c:param name="scd_sq" value="1"/>
			</c:url>
			<c:url var="goItem" value="itemList.ap" scope="application">
        		<c:param name="i_div" value="1" />
        	</c:url>
			<c:url var="goMail" value="mail.ap" scope="application"/>
			<c:url var="goTask" value="diagnosisList.ap" scope="application"/>
			<c:url var="goApproval" value="approvalMain.ap" scope="application"/>
			<c:url var="goNotice" value="notice.ap" scope="application"/>
			<c:url var="goMessenger" value="messenger.ap" scope="application"/>
			<c:url var="goEmployeeSystem" value="goEmployeeSystem.ap" scope="application"/>
<aside id="sidebar" class="sidebar sidebar-default open" role="navigation">
    <!-- Sidebar header -->
    <div class="sidebar-header header-cover" style="background-image: url(https://2.bp.blogspot.com/-2RewSLZUzRg/U-9o6SD4M6I/AAAAAAAADIE/voax99AbRx0/s1600/14%2B-%2B1%2B%281%29.jpg);">
        <!-- Top bar -->
        <div class="top-bar"></div>
        <!-- Sidebar brand image -->
        <div class="sidebar-image">
            <img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/53474/atom_profile_01.jpg">
        </div>
        <!-- Sidebar brand name -->
        <a class="sidebar-brand" href="mailsend.ap">
            ${loginUser.email }
            <b class="caret"></b>
        </a>
    </div>

    <!-- Sidebar navigation -->
    <ul class="nav sidebar-nav">
        <li class="dropdown.show">
            <ul id="settings-dropdown" class="dropdown-menu.show">
                <li>
                    <a href="${ goSchd }" >
                        일정관리
                    </a>
                </li>
                <li>
                    <a href="${goApproval }" >
                        전자결재
                    </a>
                </li>
                <li>
                    <a href="${goItem }" >
                        물품관리
                    </a>
                </li>
                <li>
                    <a href="${goNotice }" >
                        게시판
                    </a>
                </li>
                <li>
                    <a href="${goMessenger }" >
                        메신저
                    </a>
                </li>
                <li>
                    <a href="${ goMail}" >
                        메일
                    </a>
                </li>
                <li>
                    <c:if test="${ loginUser.id eq 'admin' && loginUser.category eq 'master'}">
			<a href="${ goEmployeeSystem }" >인사관리</a>
			</c:if>
			<c:if test="${ loginUser.id ne 'admin' && loginUser.category ne 'master'}">
			<a href="#" id="employeeSys" >인사관리</a>
			</c:if>
                </li>
                
            </ul>
        </li>
       
    </ul>
    <!-- Sidebar divider -->
    <!-- <div class="sidebar-divider"></div> -->
    
    <!-- Sidebar text -->
    <!--  <div class="sidebar-text">Text</div> -->
</aside>
		
<script>
	$("#employeeSys").click(function(){
		if(confirm("권한이 없습니다."));
	});
	
	
</script>
</body>
</html>