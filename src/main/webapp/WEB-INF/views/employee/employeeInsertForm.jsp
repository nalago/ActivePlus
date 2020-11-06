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
    
</style>
</head>
<body>
   <nav id="side">
      <jsp:include page="../common/menubar.jsp" />
   </nav>
   <div class="wrap">
        <center><h1>회원 등록 페이지</h1></center>
        <br><br>
        <div>
        <!--사진 및 기본 인적사항-->
        <form action="einsert.ap" method="post" enctype="multipart/form-data">
        <table id="table1" align="center" border="1">
        <!--1줄-->
        <tr id="tr1">
           <td rowspan="5" align="center" width="120" height="40" bgcolor="#ccffff"><input style="width:60%;" type="file" name="uploadFile"></td>
           <td align="center" bgcolor="#c4ffe1">성 명</td>
           <td align="center" bgcolor="#c4ffe1">한 글</td>
           <td width="225"><input type="text" name="name" style="width:100%;"></td>
           <td align="center" width="120" bgcolor="#c4ffe1">휴 대 폰</td>
           <td width="225"><input type="text" name="phone" placeholder="숫자와 -까지 입력하세요" style="width:100%;"></td>
        </tr>
        <tr>
           <td colspan="2" align="center" bgcolor="#c4ffe1">상태</td>
           <td colspan="3" ><input type="text" name="status" style="width:100%;"></td>
        </tr>
        <tr>
           <td colspan="2"  align="center" bgcolor="#c4ffe1">아이디</td>
           <td colspan="2"><input type="text" name="id" style="width:100%;"></td>
        </tr>
        <tr>
           <td colspan="2"  align="center" bgcolor="#c4ffe1">비밀번호</td>
           <td colspan="2"><input type="password" name="pwd" style="width:100%;"></td>
        </tr>
        
        <!--2줄-->
        <tr>
           <td colspan="2" align="center" bgcolor="#c4ffe1">생 년 월 일</td>
           <td colspan="3" ><input type="date" name="birth" style="width:50%;"></td>
        </tr>
        <tr>
           <td colspan="2" align="center" bgcolor="#c4ffe1">부 서</td>
           <td colspan="3" ><input type="text" name="category" style="width:100%;"></td>
        </tr>
        
        <!--3줄-->
        <tr>
           <!--<td></td>-->
           <td colspan="1" align="center" width="120" bgcolor="#c4ffe1">계 좌 번 호</td>
           <!--<td></td>-->
           <td><input type="text" placeholder="계좌번호만 입력" name="acc_no" style="width:300%;"></td>
        </tr>
        <tr>
           <td colspan="1" align="center" width="120" bgcolor="#c4ffe1">급 여</td>
           <!--<td></td>-->
           <td><input type="text" name="salary" style="width:100%;"></td>
        </tr>
        
        <!--4줄-->
        <tr>
           <!--<td></td>-->
           <td colspan="2"  align="center" bgcolor="#c4ffe1">E-Mail</td>
           <!--<td></td>-->
           <td colspan="3" ><input type="email" name="email" style="width:100%;"></td>
           <!--<td></td>-->
           <!--<td></td>-->
        </tr>
        
        <!--5줄-->
        <tr>
           <td colspan="2" align="center" bgcolor="#c4ffe1">현 주 소</td>
           <td colspan="3"><input type="text" name="address" style="width:100%;"></td>
        </tr>
        <tr>
           <td colspan="2" align="center" bgcolor="#c4ffe1">입 사 일</td>
           <td colspan="3"><input type="date" name="hire_date" style="width:100%;"></td>
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
                    <td height="25"><input type="text" name="license" style="width:100%;"></td>
                    <td><input type="text" name="license_no" style="width:100%;"></td>
                    <td><input type="date" name="license_date" style="width:100%;"></td>
                </tr>
        </table>
        </div>
        <input type="submit" value="등록하기">
        <button onclick="location.href='${ goMemberSystem }'">목록으로</button>
        </form>
    </div>
</body>
</html>