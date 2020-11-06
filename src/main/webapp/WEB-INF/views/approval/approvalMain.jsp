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
        text-align:center;
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
    <jsp:include page="../common/menubar.jsp"/>
    <section>
            <jsp:include page="submenu/topMenu.jsp"/>
            
        <br><br><br><br>
        
        <div class="temporaryList Wrap">
            <h4 class="title">임시 저장 문서</h4>
            <div id="temporaryList">
				<c:if test="${ empty tempList }">
					<h3>저장 된 임시 문서가 없습니다.</h3>
				</c:if>
				<c:if test="${ !empty tempList }">
					<c:forEach var="d" items="${ tempList }" begin="0" end="5">
						<table>
							<tr>
								<td width="50">${ d.apvDocNo }</td>
								<td width="200">${ d.apvDocTitle }</td>
								<td width="200">${ d.apdCreateDate }</td>
							</tr>
						</table>
					</c:forEach>
				</c:if>
            </div>
        </div>

        <div class="expectedList Wrap">
            <h4 class="title">결재 예정 문서</h4>
            <div id="expectedList">
				<c:if test="${ empty apvList }">
					<h3>결재 예정 문서가 없습니다.</h3>
				</c:if>
				<c:if test="${ !empty apvList }">
					<c:forEach var="a" items="${ apvList }" begin="0" end="5">
						<table>
							<tr>
								<td width="50">${ a.apvDocNo }</td>
								<td width="200">${ a.apvDocTitle }</td>
								<td width="200">${ a.apdCreateDate }</td>
							</tr>
						</table>
					</c:forEach>
				</c:if>
            </div>
        </div>

        <div class="completeList Wrap">
            <h4 class="title">결재 완료 문서</h4>
            <div id="completeList">
				<c:if test="${ empty apvCompList }">
					<h3>결재 완료 문서가 없습니다.</h3>
				</c:if>
				<c:if test="${ !empty apvCompList }">
					<c:forEach var="co" items="${ apvCompList }" begin="0" end="5">
						<table>
							<tr>
								<td width="50">${ co.apvDocNo }</td>
								<td width="200">${ co.apvDocTitle }</td>
								<td width="200">${ co.apdCreateDate }</td>
							</tr>
						</table>
					</c:forEach>
				</c:if>
            </div>
        </div>
        

    </section>

    
</body>
</html>