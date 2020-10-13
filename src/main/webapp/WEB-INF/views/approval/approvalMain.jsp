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

	#temporaryList{
		text-align:center;
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
				<c:if test="${ empty tempDocList }">
					<h3>저장 된 임시 문서가 없습니다.</h3>
				</c:if>
				<c:if test="${ !empty tempDocList }">
					<c:forEach var="d" items="${ tempDocList }" begin="0" end="5">
						<table>
							<tr>
								<td width="50">${ d.apvDocNo }</td>
								<td width="200">${ d.apvDocTitle }</td>
								<td width="200">${ d.apvCreateDate }</td>
							</tr>
						</table>
					</c:forEach>
				</c:if>
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