<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
 integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
  crossorigin="anonymous"></script>
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
    
</style>
</head>
<body>
   <nav id="side">
      <jsp:include page="../common/menubar.jsp" />
   </nav>
   <div class="wrap">
        <center><h1>${ Employee.id }회원 수정하기</h1></center>
        <br><br>
        <div>
        <!--사진 및 기본 인적사항-->
        <form action="eupdate.ap" method="post" enctype="multipart/form-data">
        <input type="hidden" name="page" value="${ currentPage }">
		<input type="hidden" name="renameFileName" value="${ Employee.renameFileName }">
		<input type="hidden" name="originalFileName" value="${ Employee.originalFileName }">
        <table id="table1" align="center" border="1">
        <!--1줄-->
        <tr id="tr1">
           <td rowspan="5" align="center" width="120" height="40" bgcolor="#ccffff">
           	<div id="contentArea">
	           <img id="faceImg" style="width: 100%; object-fit:cover;" value="${ Attachment.renameFile }">
	        </div></td>
           <td align="center" bgcolor="#c4ffe1">성 명</td>
           <td align="center" bgcolor="#c4ffe1">한 글</td>
           <td width="225"><input type="text" name="name" style="width:100%;" value="${ Employee.name }" readonly></td>
           <td align="center" width="120" bgcolor="#c4ffe1">휴 대 폰</td>
           <td width="225"><input type="text" name="phone" placeholder="숫자와 -까지 입력하세요" style="width:100%;" value="${ Employee.phone }"></td>
        </tr>
        <tr>
           <td colspan="2" align="center" bgcolor="#c4ffe1">상태</td>
           <td colspan="3" ><input type="text" name="status" style="width:100%;" value="${ Employee.status }"></td>
        </tr>
        <tr>
           <td colspan="2"  align="center" bgcolor="#c4ffe1">아이디</td>
           <td colspan="2"><input type="text" name="id" style="width:100%;" value="${ Employee.id }" readonly></td>
        </tr>
        <tr>
           <td colspan="2"  align="center" bgcolor="#c4ffe1">비밀번호</td>
           <td colspan="2"><input type="password" name="pwd" style="width:100%;" value="${ Employee.pwd }"></td>
        </tr>
        
        <!--2줄-->
        <tr>
           <td colspan="2" align="center" bgcolor="#c4ffe1">생 년 월 일</td>
           <td colspan="3" ><input type="date" name="birth" style="width:100%;" value="${ Employee.birth }"></td>
        </tr>
        <tr>
           <td colspan="2" align="center" bgcolor="#c4ffe1">부 서</td>
           <td colspan="3" ><input type="text" name="category" style="width:100%;" value="${ Employee.category }"></td>
        </tr>
        
        <!--3줄-->
        <tr>
           <!--<td></td>-->
           <td colspan="1" align="center" width="120" bgcolor="#c4ffe1">계 좌 번 호</td>
           <!--<td></td>-->
           <td><input type="text" placeholder="계좌번호만 입력" name="acc_no" style="width:300%;" value="${ Employee.acc_no }"></td>
        </tr>
        <tr>
           <td colspan="1" align="center" width="120" bgcolor="#c4ffe1">급 여</td>
           <!--<td></td>-->
           <td><input type="text" name="salary" style="width:100%;" value="${ Employee.salary }"></td>
        </tr>
        
        <!--4줄-->
        <tr>
           <!--<td></td>-->
           <td colspan="2"  align="center" bgcolor="#c4ffe1">E-Mail</td>
           <!--<td></td>-->
           <td colspan="3" ><input type="email" name="email" style="width:100%;" value="${ Employee.email }"></td>
           <!--<td></td>-->
           <!--<td></td>-->
        </tr>
        
        <!--5줄-->
        <tr>
           <td colspan="2" align="center" bgcolor="#c4ffe1">현 주 소</td>
           <td colspan="3"><input type="text" name="address" style="width:100%;" value="${ Employee.address }"></td>
        </tr>
        <tr>
           <td colspan="2" align="center" bgcolor="#c4ffe1">입 사 일</td>
           <td colspan="3"><input type="date" name="hire_date" style="width:100%;" value="${ Employee.hire_date }"></td>
        </tr>
        </table>
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
                    <td height="25"><input type="text" name="license" style="width:100%;" value="${ Employee.license }"></td>
                    <td><input type="text" name="license_no" style="width:100%;" value="${ Employee.license_no }"></td>
                    <td><input type="date" name="license_date" style="width:100%;" value="${ Employee.license_date }"></td>
                </tr>
        	</table>
        <input type="submit" value="등록하기">
        <c:url var="goEmployeeSystem" value="goEmployeeSystem.ap">
        	<c:param name="id" value="${ Employee.id }"/>
        	<c:param name="page" value="${ currentPage }"/>
        </c:url>
        <button type="button" onclick="location.href='${ goEmployeeSystem }'">목록으로</button>
        </div>
        
        <div id="fileArea">
    	   <input type="file" id="thumbnailImg1" name="reloadFile"
        	onchange="loadImg(this,1)" > 
         </div>
        </form>
        </div>
    </div>
    
    
<script>
$(function(){
		$("#fileArea").hide();
		
		$("#contentArea").click(function(){
			$("#thumbnailImg1").click();
		});
	});
	function loadImg(value, num){
		
		if(value.files && value.files[0]){
			var reader = new FileReader();
			
			reader.onload = function(e){
				switch(num){
				case 1:
					$("#faceImg").attr("src", e.target.result);
					break;
				}
			}
			reader.readAsDataURL(value.files[0]);
		}
	}
</script>    
    
    
    
</body>
</html>