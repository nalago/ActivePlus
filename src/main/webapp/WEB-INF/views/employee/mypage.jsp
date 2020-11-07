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
        <center><h1>${ loginUser.id } 님의 개인정보 페이지 입니다.</h1></center>
        <br><br>
        <div>
        <!--사진 및 기본 인적사항-->
        <input type="hidden" name="page" value="${ currentPage }">
		
        <table id="table1" align="center" border="1" style="width:100%;">
        <!--1줄-->
        <tr id="tr1">
           <td rowspan="5" align="center" width="120" height="40" bgcolor="#ccffff">
	           <div style="width:115.52px;height:150.68px;">
		           <img src="${ contextPath }/resources/uploadFiles/employee/${ loginUser.renameFileName }" style="width: 115.52px; height:150.68px; object-fit:cover;">
		       </div>
		   </td>
           <td align="center" bgcolor="#c4ffe1">성 명</td>
           <td align="center" bgcolor="#c4ffe1">한 글</td>
           <td width="225">${ loginUser.name }</td>
           <td align="center" width="120" bgcolor="#c4ffe1">휴 대 폰</td>
           <td width="225">&nbsp;${ loginUser.phone }</td>
        </tr>
        <tr>
           <td colspan="2" align="center" bgcolor="#c4ffe1">상태</td>
           <td colspan="3" >${ loginUser.status }</td>
        </tr>
        <tr>
           <td colspan="2"  align="center" bgcolor="#c4ffe1">아이디</td>
           <td colspan="2">&nbsp;${ loginUser.id }</td>
        </tr>
        <tr>
           <td colspan="2"  align="center" bgcolor="#c4ffe1">비밀번호</td>
           <td colspan="2">&nbsp;${ loginUser.pwd }</td>
        </tr>
        
        <!--2줄-->
        <tr>
           <td colspan="2" align="center" bgcolor="#c4ffe1">생 년 월 일</td>
           <td colspan="3" >&nbsp;${ loginUser.birth }</td>
        </tr>
        <tr>
           <td colspan="2" align="center" bgcolor="#c4ffe1">부 서</td>
           <td colspan="3" >&nbsp;${ loginUser.category }</td>
        </tr>
        
        <!--3줄-->
        <tr>
           <!--<td></td>-->
           <td colspan="1" align="center" width="120" bgcolor="#c4ffe1">계 좌 번 호</td>
           <!--<td></td>-->
           <td>&nbsp;${ loginUser.acc_no }</td>
        </tr>
        <tr>
           <td colspan="1" align="center" width="120" bgcolor="#c4ffe1">급 여</td>
           <!--<td></td>-->
           <td>&nbsp;${ loginUser.salary }</td>
        </tr>
        
        <!--4줄-->
        <tr>
           <!--<td></td>-->
           <td colspan="2"  align="center" bgcolor="#c4ffe1">E-Mail</td>
           <!--<td></td>-->
           <td colspan="3" >&nbsp;${ loginUser.email }</td>
           <!--<td></td>-->
           <!--<td></td>-->
        </tr>
        
        <!--5줄-->
        <tr>
           <td colspan="2" align="center" bgcolor="#c4ffe1">현 주 소</td>
           <td colspan="3">&nbsp;${ loginUser.address }</td>
        </tr>
        <tr>
           <td colspan="2" align="center" bgcolor="#c4ffe1">입 사 일</td>
           <td colspan="3">&nbsp;${ loginUser.hire_date }</td>
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
                    <td height="25">&nbsp;${ loginUser.license }</td>
                    <td>&nbsp;${ loginUser.license_no }</td>
                    <td>&nbsp;${ loginUser.license_date }</td>
                </tr>
        </table>
        </div>
        <c:url var="eupView" value="eupView.ap">
        	<c:param name="id" value="${ loginUser.id }"/>
        	<c:param name="page" value="${ currentPage }"/>
        </c:url>
        
        <c:url var="main" value="main.ap"/>
        
        <button type="button" class="backlist" onclick="${ main }">메인으로</button>
        <button type="button" onclick="location.href='${ eupView }'">수정하기</button>
        <!-- <button id="deleteBtn" onclick="deleteBtn();">삭제하기</button> -->
    </div>
    
   
    
<!-- <script>
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
</script> -->
</body>
</html>