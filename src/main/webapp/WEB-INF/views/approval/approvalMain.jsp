<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
            <div id="submenu">
        	 <ul class="navi">
                <li>
                <c:url var="goDrafting" value="draftingList.ap"/>
                <c:url var="goPrivate" value="privateList.ap"/>
                <c:url var="goTemporary" value="temporaryList.ap"/>
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
        <!-- <br><br><br><br> -->
        
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