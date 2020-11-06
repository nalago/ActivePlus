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
        <center><h1>${ Employee.id }회원 상세 보기</h1></center>
        <br><br>
        <div>
        <!--사진 및 기본 인적사항-->
        <input type="hidden" name="page" value="${ currentPage }">
		<input type="hidden" name="id" value="${ Employee.id }">
		<input type="hidden" name="renameFileName" value="${ Employee.renameFileName }">
		<input type="hidden" name="originalFileName" value="${ Employee.originalFileName }">
        <table id="table1" align="center" border="1" style="width:100%;">
        <!--1줄-->
        <tr id="tr1">
           <td rowspan="5" align="center" width="120" height="40" bgcolor="#ccffff"><a href="${ contextPath }/resources/buploadFiles/${ Employee.renameFileName }" download="${ Employee.originalFileName }">${ Employee.originalFileName }</a></td>
           <td align="center" bgcolor="#c4ffe1">성 명</td>
           <td align="center" bgcolor="#c4ffe1">한 글</td>
           <td width="225">${ Employee.name }</td>
           <td align="center" width="120" bgcolor="#c4ffe1">휴 대 폰</td>
           <td width="225">${ Employee.phone }</td>
        </tr>
        <tr>
           <td colspan="2" align="center" bgcolor="#c4ffe1">상태</td>
           <td colspan="3" >${ Employee.status }</td>
        </tr>
        <tr>
           <td colspan="2"  align="center" bgcolor="#c4ffe1">아이디</td>
           <td colspan="2">${ Employee.id }</td>
        </tr>
        <tr>
           <td colspan="2"  align="center" bgcolor="#c4ffe1">비밀번호</td>
           <td colspan="2">${ Employee.pwd }</td>
        </tr>
        
        <!--2줄-->
        <tr>
           <td colspan="2" align="center" bgcolor="#c4ffe1">생 년 월 일</td>
           <td colspan="3" >${ Employee.birth }</td>
        </tr>
        <tr>
           <td colspan="2" align="center" bgcolor="#c4ffe1">부 서</td>
           <td colspan="3" >${ Employee.category }</td>
        </tr>
        
        <!--3줄-->
        <tr>
           <!--<td></td>-->
           <td colspan="1" align="center" width="120" bgcolor="#c4ffe1">계 좌 번 호</td>
           <!--<td></td>-->
           <td>${ Employee.acc_no }</td>
        </tr>
        <tr>
           <td colspan="1" align="center" width="120" bgcolor="#c4ffe1">급 여</td>
           <!--<td></td>-->
           <td>${ Employee.salary }</td>
        </tr>
        
        <!--4줄-->
        <tr>
           <!--<td></td>-->
           <td colspan="2"  align="center" bgcolor="#c4ffe1">E-Mail</td>
           <!--<td></td>-->
           <td colspan="3" >${ Employee.email }</td>
           <!--<td></td>-->
           <!--<td></td>-->
        </tr>
        
        <!--5줄-->
        <tr>
           <td colspan="2" align="center" bgcolor="#c4ffe1">현 주 소</td>
           <td colspan="3">${ Employee.address }</td>
        </tr>
        <tr>
           <td colspan="2" align="center" bgcolor="#c4ffe1">입 사 일</td>
           <td colspan="3">${ Employee.hire_date }</td>
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
                    <td height="25">${ Employee.license }</td>
                    <td>${ Employee.license_no }</td>
                    <td>${ Employee.license_date }</td>
                </tr>
        </table>
        </div>
        <c:url var="eupView" value="eupView.ap">
        	<c:param name="id" value="${ Employee.id }"/>
        	<c:param name="page" value="${ currentPage }"/>
        </c:url>
        <button type="button" class="backlist" onclick="javascript:history.back();">목록으로</button>
        <button type="button" onclick="location.href='${ eupView }'">수정하기</button>
        <button id="deleteBtn" onclick="deleteBtn();">삭제하기</button>
    </div>
    
<script>
/* 	$("deleteBtn").click(function(){
		if(confirm("삭제하시겠습니까??")){
			$.ajax({
				url : 'edelete.ap',
				type : 'post',
				data : {
					Employee.id : ${ Employee.id }
				},
				success : function(data){
					alert("회원이 삭제되었습니다.");
				}
			})
		}
	}); */
	
	
	function deleteBtn(){
		if(confirm("정말 삭제하시겠습니까?")){
			location.href= ${ edelete }
		}else{
			return;
		}
		
		
	}
</script>
</body>
</html>