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
</body>
</html>