<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="subMenu">
            <ul class="navi">
                <li>
                <c:url var="goDrafting" value="draftingList.ap"/>
                <c:url var="goPrivate" value="privateList.ap"/>
                <c:url var="goTemporary" value="temporary.ap"/>
                    <a class="menu" href="${goDrafting }">기안</a>
                    <ul>
                        <li><a class="menu" href="${goDrafting }">문서 양식</a></li>
                        <li><a class="menu" href="${goTemporary }">임시 문서</a></li>
                        <li><a class="menu" href="${goPrivate }">개인 양식</a></li>
                    </ul>
                </li>
                <li>
                <c:url var="goApprovalObtain" value="approvalObtainList.ap"/>
                <c:url var="goApproval" value="approvalList.ap"/>
                <c:url var="goApprovalComplete" value="approvalCompleteList.ap"/>
                    <a class="menu" href="${goApprovalObtain }">결재</a>
                    <ul>
                        <li><a class="menu" href="${goApprovalObtain }">결재 받을 문서</a></li>
                        <li><a class="menu" href="${goApproval }">결재 예정 문서</a></li>
                        <li><a class="menu" href="${goApprovalComplete }">결재 완료 양식</a></li>
                    </ul>
                </li>
            </ul>
            </div>
</body>
</html>