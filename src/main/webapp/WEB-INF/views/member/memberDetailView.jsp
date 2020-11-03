<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .wrap{
        width: 50%;
        margin: auto;
        font-size: 12px;
    }
    #tr1{
        height: auto;
    }
    #table1{
        
    }
    .wrap div{
    width:auto;
    height:auto;
    }
    #div1{
    width:100%;	
    }
    
</style>
</head>
<body>
   <nav id="side">
      <jsp:include page="../common/menubar.jsp" />
   </nav>
   <div class="wrap">
        <center><h1>${ member.id }회원 수정하기</h1></center>
        <br><br>
        <div>
        <!--사진 및 기본 인적사항-->
        <input type="hidden" name="page" value="${ currentPage }">
		<input type="hidden" name="id" value="${ member.id }">
		<input type="hidden" name="renameFileName" value="${ member.renameFileName }">
		<input type="hidden" name="originalFileName" value="${ member.originalFileName }">
        <table id="table1" align="center" border="1" style="width:100%;">
        <!--1줄-->
        <tr id="tr1">
           <td rowspan="5" align="center" width="120" height="40" bgcolor="#ccffff"><a href="${ contextPath }/resources/buploadFiles/${ member.renameFileName }" download="${ member.originalFileName }">${ board.originalFileName }</a></td>
           <td align="center" bgcolor="#c4ffe1">성 명</td>
           <td align="center" bgcolor="#c4ffe1">한 글</td>
           <td width="225">${ member.name }</td>
           <td align="center" width="120" bgcolor="#c4ffe1">휴 대 폰</td>
           <td width="225">${ member.phone }</td>
        </tr>
        <tr>
           <td colspan="2" align="center" bgcolor="#c4ffe1">상태</td>
           <td colspan="3" >${ member.status }</td>
        </tr>
        <tr>
           <td colspan="2"  align="center" bgcolor="#c4ffe1">아이디</td>
           <td colspan="2">${ member.id }</td>
        </tr>
        <tr>
           <td colspan="2"  align="center" bgcolor="#c4ffe1">비밀번호</td>
           <td colspan="2">${ member.pwd }</td>
        </tr>
        
        <!--2줄-->
        <tr>
           <td colspan="2" align="center" bgcolor="#c4ffe1">생 년 월 일</td>
           <td colspan="3" >${ member.birth }</td>
        </tr>
        <tr>
           <td colspan="2" align="center" bgcolor="#c4ffe1">부 서</td>
           <td colspan="3" >${ member.category }</td>
        </tr>
        
        <!--3줄-->
        <tr>
           <!--<td></td>-->
           <td colspan="1" align="center" width="120" bgcolor="#c4ffe1">계 좌 번 호</td>
           <!--<td></td>-->
           <td>${ member.acc_no }</td>
        </tr>
        <tr>
           <td colspan="1" align="center" width="120" bgcolor="#c4ffe1">급 여</td>
           <!--<td></td>-->
           <td>${ member.salary }</td>
        </tr>
        
        <!--4줄-->
        <tr>
           <!--<td></td>-->
           <td colspan="2"  align="center" bgcolor="#c4ffe1">E-Mail</td>
           <!--<td></td>-->
           <td colspan="3" >${ member.email }</td>
           <!--<td></td>-->
           <!--<td></td>-->
        </tr>
        
        <!--5줄-->
        <tr>
           <td colspan="2" align="center" bgcolor="#c4ffe1">현 주 소</td>
           <td colspan="3">${ member.address }</td>
        </tr>
        <tr>
           <td colspan="2" align="center" bgcolor="#c4ffe1">입 사 일</td>
           <td colspan="3">${ member.hire_date }</td>
        </tr>
        </table>
        </div>
        <!--경력--> 
        <div >    
            <table border="1" align="center" style="width: 100%;">
                <tr> 
                    <td colspan="3" align="center" bgcolor="#c4ffe1">면허</td>
                </tr>
                <tr>
                    <td align="center" width="125"  height="25" bgcolor="#c4ffe1">명칭</td>
                    <td align="center" width="125"  height="25" bgcolor="#c4ffe1">인가번호</td>
                    <td align="center" width="125"  height="25" bgcolor="#c4ffe1">인가년월일</td>
                </tr>
                <tr align="center">
                    <td height="25">${ member.license }</td>
                    <td>${ member.license_no }</td>
                    <td>${ member.license_date }</td>
                </tr>
        </table>
        </div>
        <c:url var="mupView" value="mupView.ap">
        	<c:param name="id" value="${ m.id }"/>
        	<c:param name="page" value="${ currentPage }"/>
        </c:url>
        <button type="button" class="backlist" onclick="javascript:history.back();">목록으로</button>
        <button type="button" onclick="location.href='${ mupView }'">수정하기</button>
        <button onclick="location.href='${ mdelete }'">삭제하기</button>
    </div>
</body>
</html>