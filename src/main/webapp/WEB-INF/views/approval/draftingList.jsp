<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<link rel="stylesheet" href="${contextPath }/resources/approval/fontello/css/fontello.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    
<title>Insert title here</title>
<style>

    #ListWrap{
        display: inline-block;
        width: 65%;
        height: 70%;
        margin-left: 50px;
        margin-top:100px;
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
    .docNo{
     width:10%;
    }
    .doctitle{
        width: 30%;
    }
    .doccontent{
        width: 60%;
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
 td{
 	cursor:pointer;
 }
 tbody tr:hover {
 	background-color:#63ab68;
 }
    
</style>
</head>
<body>
<jsp:include page="../common/menubar.jsp"/>
        <%-- <jsp:include page="submenu/topMenu.jsp"/> --%>
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
		<jsp:include page="popup/alert.jsp"/>
        <c:if test="${ !empty msg }">
		<script>
			alert('${msg}');
		</script>
		<c:remove var="msg" scope="session"/>
		</c:if>
            <script>
                $(function(){
                    $("#listButtonopen").on("click",function(){
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
            
           <div id="ListWrap">
               <br>
               <c:choose>
               	<c:when test="${ docType eq 'PRIVATE' }"><h3>개인 양식</h3></c:when>
               	<c:when test="${ docType eq 'personal' }"><h3>인사 양식</h3></c:when>
               	<c:when test="${ docType eq 'task' }"><h3>업무 양식</h3></c:when>
               	<c:when test="${ docType eq 'report' }"><h3>보고 양식</h3></c:when>
               	<c:when test="${ docType eq 'publicdoc' }"><h3>공통양식</h3></c:when>
               	<c:otherwise><h3>전체 양식</h3></c:otherwise>
               </c:choose>
               
               
               <br>
               <c:url var="docDetail" value="docDetail.ap">
               	<c:param name="docNo" value="${doc.docNo }"/>
               	<c:param name="page" value="${pi.currentPage }"/>
               </c:url>
                <table id="docList">
                <thead>
                    <tr>
                    	<th class="docNo">문서번호</th>
                        <th class="doctitle">양식명</th>
                        <th class="doccontent">설명</th>
                    </tr>
                 <thead>
                    <tbody>
                    <c:if test="${ empty dList }">
                    <tr>
                    	<td colspan="3">양식이 없습니다.</td>
                    <tr>
                    </c:if>
                    <c:if test="${ !empty dList }">
                    	<c:forEach var="d" items="${ dList }">
                    	<tr>
                    		<td>${d.docNo }</td>
                    		<td>${d.docTitle }</td>
                    		<td>${d.docExplantion }</td>
                    	<tr>
                    	</c:forEach>
                    </c:if>
                    </tbody>
                </table>
                <br><br>
                <div class="pagingwrap">
                <c:if test="${pi.currentPage <= 1 }">                
                	&lt;
                </c:if>
                <c:if test="${pi.currentPage < 1 }">
                	<c:url var="before" value="draftingList.ap">
                		<c:param name="page" value="${ pi.currentPage - 1 }"/>
                	</c:url>                
	                 <a class="paging" href="${ before }">&lt;</a>
                </c:if>
                <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                	<c:if test="${ p eq pi.currentPage }">
                	<font color="green" size="4">${ p }</font>
                	</c:if>
                	<c:if test="${ p ne pi.currentPage }">
                		<c:url var="pagination" value="draftingList.ap">
                			<c:param name="page" value="${ p }"/>
                		</c:url>
                		<a href="${pagination }">${ p }</a>
                	</c:if>
                </c:forEach>
                 <c:if test="${ pi.endPage <= pi.maxPage }">
                 	&gt;
                 </c:if>
                 <c:if test="${ pi.endPage < pi.maxPage }">
                 	<c:url var="after" value="draftingList.ap">
                 		<c:param name="page" value="${ pi.currentPage + 1 }"/>
                 	</c:url>
	                 <a class="paging" href="${ after }">&gt;</a>                 
                 </c:if>
             </div>
           </div>
           <script>
           		$(function(){
           			$("td").on("click", function(){
           				var docNo = $(this).parent().children().eq(0).text();
          				if(docNo.includes('없습니다.')){
          					return false;
          				}
           				location.href="selectDoc.ap?docNo="+docNo;
           			});
           		});
           </script>
    </section>

</body>
</html>