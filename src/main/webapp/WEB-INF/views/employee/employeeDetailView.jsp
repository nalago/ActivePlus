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
        width: 40%;
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
td{height:23.65px;}
table{border-collapse: collapse;}
</style>
</head>
<body>
   <nav id="side">
      <jsp:include page="../common/menubar.jsp" />
   </nav>
   <div class="wrap">
        <center><h1>${ Employee.id } 회원 상세 보기</h1></center>
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
           <td rowspan="4" align="center" width="120" height="40" bgcolor="lightgrey">
	           <div style="width:115.52px;height:150.68px;">
	           <c:forEach var="at" items="${ Attachment }">
               <c:if test="${ at.refTable eq  'Employee'}">
	           	<img id="faceImg" style="width: 100%; object-fit:cover;"src="${ contextPath }/resources/uploadFiles/employee/${ at.renameFile }">
	           </c:if>
             </c:forEach>
		       </div>
		   </td>
           <td align="center" bgcolor="lightblue">성 명</td>
           <!-- <td align="center" bgcolor="lightblue">한 글</td> -->
           <td width="225">&nbsp;${ Employee.name }</td>
           <td align="center" width="120" bgcolor="lightblue">휴 대 폰</td>
           <td width="225">&nbsp;${ Employee.phone }</td>
        </tr>
        <tr>
           <td colspan="2" align="center" bgcolor="lightblue">상태</td>
           <td colspan="3" >&nbsp;${ Employee.status }</td>
        </tr>
        <tr>
           <td colspan="2"  align="center" bgcolor="lightblue">아이디</td>
           <td colspan="2">&nbsp;${ Employee.id }</td>
        </tr>
        <tr>
           <td colspan="2"  align="center" bgcolor="lightblue">비밀번호</td>
           <td colspan="2">&nbsp;<input style="border:none;" type="password" value="${ Employee.pwd }" readonly></td>
        </tr>
        
        <!--2줄-->
        <tr>
           <td colspan="2" align="center" bgcolor="lightblue">생 년 월 일</td>
           <td colspan="3">&nbsp;${ Employee.birth }</td>
        </tr>
        <tr>
           <td colspan="2" align="center" bgcolor="lightblue">부 서</td>
           <td colspan="3" >&nbsp;${ Employee.category }</td>
        </tr>
        
        <!--3줄-->
        <tr>
           <!--<td></td>-->
           <td colspan="1" align="center" style="width:120px;" bgcolor="lightblue">계 좌 번 호</td>
           <!--<td></td>-->
           <td style="width:120px;" >&nbsp;${ Employee.acc_no }</td>
        </tr>
        <tr>
           <td colspan="1" align="center" width="120" bgcolor="lightblue">급 여</td>
           <!--<td></td>-->
           <td>&nbsp;${ Employee.salary }</td>
        </tr>
        
        <!--4줄-->
        <tr>
           <!--<td></td>-->
           <td colspan="2"  align="center" bgcolor="lightblue">E-Mail</td>
           <!--<td></td>-->
           <td colspan="3" >&nbsp;${ Employee.email }</td>
           <!--<td></td>-->
           <!--<td></td>-->
        </tr>
        
        <!--5줄-->
        <tr>
           <td colspan="2" align="center" bgcolor="lightblue">현 주 소</td>
           <td colspan="3">&nbsp;${ Employee.address }</td>
        </tr>
        <tr>
           <td colspan="2" align="center" bgcolor="lightblue">입 사 일</td>
           <td colspan="3">&nbsp;${ Employee.hire_date }</td>
        </tr>
        </table>
        </div>
        	<div>    
	            <table border="1" align="center" style="width: 100%;">
	                <tr>
	                    <td align="center" width="125"  height="25" bgcolor="lightblue">분야</td>
	                    <td align="center" width="125"  height="25" bgcolor="lightblue">직급</td>
	                </tr>
	                <tr align="center">
	                    <td height="25">&nbsp;${ MediTeam.field }</td>
	                    <td>&nbsp;${ MediTeam.grade }</td> 
	                </tr>
	        	</table>
        	</div>
        <!--경력--> 
        <div >    
            <table border="1" align="center" style="width: 100%;">
                <tr> 
                    <td colspan="3" align="center" bgcolor="lightblue">면허</td>
                </tr>
                <tr>
                    <td align="center" width="125"  height="25" bgcolor="lightblue">명칭</td>
                    <td align="center" width="125"  height="25" bgcolor="lightblue">인가번호</td>
                    <td align="center" width="125"  height="25" bgcolor="lightblue">인가년월일</td>
                </tr>
                <tr align="center">
                    <td height="25">&nbsp;${ Employee.license }</td>
                    <td>&nbsp;${ Employee.license_no }</td>
                    <td>&nbsp;${ Employee.license_date }</td>
                </tr>
        </table>
        </div>
   <div>
        		<table  border="1" align="center" style="width: 100%;">
        			<tr>
                        <td  align="center" width="125"  height="25" bgcolor="lightblue">전자 서명 이미지 첨부</td>
                    </tr>
                    <tr>
                        <td  align="center" style="height:100px;">
                            <div id="contentImgArea1" style="width:115.52px; height:150.68px; background-color:lightgrey;">
                            <c:forEach var="at" items="${ Attachment }">
              					<c:if test="${ at.refTable eq  'Approval'}">
                                	<img id="signImg" style="width: 100%; object-fit:cover;" src="${ contextPath }/resources/uploadFiles/employee/${ at.renameFile }">
                                </c:if>
             				</c:forEach>
                            </div>
                        </td>
                    </tr>
        		</table>
        	</div>
        	
        <c:url var="eupView" value="eupView.ap">
        	<c:param name="id" value="${ Employee.id }"/>
        	<c:param name="page" value="${ currentPage }"/>
        </c:url>
        
        <c:url var="edelete" value="edelete.ap"/>
        
        <button type="button" class="backlist" onclick="javascript:history.back();">목록으로</button>
        <button type="button" onclick="location.href='${ eupView }'">수정하기</button>
        <button id="deleteBtn">삭제하기</button>
    </div>
    
<script>
	/* $(document).ready(function(){
		$("deleteBtn").click(function(){
			if(confirm("삭제하시겠습니까?")){
				document.form1.action = "${edelete}";
				document.form1.submit();
			}
		})
	}); */
$("#deleteBtn").click(function(){
	
	var id = '${ Employee.id }';
		
        var chk = confirm("회원을 삭제 시키시겠습니까?");
        if (chk) {
            location.href='edelete.ap?id='+id;
        }
	});
		
</script>
</body>
</html>